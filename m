From: Patrick Havelange <patrick.havelange@essensium.com>
Date: Fri, 14 Feb 2020 13:48:21 +0100
Subject: [Buildroot] [PATCH v2 04/10] support/download/dl-wrapper: rework
 backend parsing
In-Reply-To: <20200214124827.30767-1-patrick.havelange@essensium.com>
References: <20200214124827.30767-1-patrick.havelange@essensium.com>
Message-ID: <20200214124827.30767-4-patrick.havelange@essensium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The point of this modification is to be more generic in the way
the backends/options are parsed from the urls.
The '+' char serves as delimiter between the backends and the
actual url.
The '|' char serves as separator between the different
options or backends.
This will be useful later when more options or backends would be
needed.

pkg-generic.mk now passes the optional FOO_PKGMGR value in case a
package needs to use a second backend.

Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
---
 package/pkg-generic.mk      |  2 +-
 support/download/dl-wrapper | 34 ++++++++++++++++++++++------------
 2 files changed, 23 insertions(+), 13 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 268d999efb..a5038ebff4 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -541,7 +541,7 @@ ifndef $(2)_PATCH
 endif
 
 $(2)_ALL_DOWNLOADS = \
-	$$(if $$($(2)_SOURCE),$$($(2)_SITE_METHOD)+$$($(2)_SITE)/$$($(2)_SOURCE)) \
+	$$(if $$($(2)_SOURCE),$$($(2)_PKGMGR)$$($(2)_SITE_METHOD)+$$($(2)_SITE)/$$($(2)_SOURCE)) \
 	$$(foreach p,$$($(2)_PATCH) $$($(2)_EXTRA_DOWNLOADS),\
 		$$(if $$(findstring ://,$$(p)),$$(p),\
 			$$($(2)_SITE_METHOD)+$$($(2)_SITE)/$$(p)))
diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 3315bd410e..3f613bb622 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -21,8 +21,8 @@ export BR_BACKEND_DL_GETOPTS=":hc:d:o:n:N:H:ru:qf:e"
 
 main() {
     local OPT OPTARG
-    local backend output hfile recurse quiet rc
-    local -a uris
+    local backend backends_str output hfile recurse quiet rc backend2
+    local -a uris backends
 
     # Parse our options; anything after '--' is for the backend
     while getopts ":c:d:D:o:n:N:H:rf:u:q" OPT; do
@@ -85,18 +85,24 @@ main() {
     download_and_check=0
     rc=1
     for uri in "${uris[@]}"; do
-        backend_urlencode="${uri%%+*}"
-        backend="${backend_urlencode%|*}"
-        case "${backend}" in
-            git|svn|cvs|bzr|file|scp|hg) ;;
-            *) backend="wget" ;;
-        esac
+        urlencode=""
+        backend="wget"
+        backend2=""
+
+        # Extract the backends list, separated by '+' from the actual url
+        backends_str="${uri%%+*}"
+        # make an array out of it, backends are '|' separated
+        IFS='|' read -r -a backends <<< "${backends_str}"
+        # parse each of them, set flags and set the real backend
+        for b in "${backends[@]}" ; do
+            case "${b}" in
+                urlencode) urlencode="${b}" ;;
+                git|svn|cvs|bzr|file|scp|hg) backend="${b}" ;;
+                # insert here supported second backends) backend2="${b}" ;;
+            esac
+        done
         uri=${uri#*+}
 
-        urlencode=${backend_urlencode#*|}
-        # urlencode must be "urlencode"
-        [ "${urlencode}" != "urlencode" ] && urlencode=""
-
         # tmpd is a temporary directory in which backends may store
         # intermediate by-products of the download.
         # tmpf is the file in which the backends should put the downloaded
@@ -138,6 +144,10 @@ main() {
         # cd back to free the temp-dir, so we can remove it later
         cd "${OLDPWD}"
 
+        if [ -n "${backend2}" ] ; then
+	    support/download/${backend2} "${tmpf}" "${tmpd}" "${old_dl_dir}"
+        fi
+
         # Check if the downloaded file is sane, and matches the stored hashes
         # for that file
         if support/download/check-hash ${quiet} "${hfile}" "${tmpf}" "${output##*/}"; then
-- 
2.17.1
