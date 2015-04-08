From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  8 Apr 2015 18:57:19 +0200
Subject: [Buildroot] [PATCH 4/8 v4] support/download: add possibility to not
	fail on missing hash
In-Reply-To: <cover.1428512075.git.yann.morin.1998@free.fr>
References: <cover.1428512075.git.yann.morin.1998@free.fr>
Message-ID: <1f4a021bb2826f296ae7b2876f8ae8ab57cde349.1428512075.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In very constrained cases, it might be needed to not fail if a hash is
missing. This is notably the case for custom external toolchains to be
downloaded, because we do have a .hash file for external toolchains,
but we oviously can not have hashes for all existing cutom toolchains
(he, "custom"!).

So, add a way to avoid failing in that case.

Form the Makefile, we export the list of files for which not to check
the hash. Then, from the check-hash script, if no check was done, and
the file we were trying to match in in this exclusion list, we just exit
without error.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Arnout Vandecappelle <arnout@mind.be>

---
Changes v3 -> v4:
  - drop the magic value, use a list of excluded files  (Arnout)

Changes v1 -> v2:
  - fix typoes in commit log
---
 package/pkg-download.mk     | 3 +++
 support/download/check-hash | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index e274712..5b7c861 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -60,6 +60,9 @@ domainseparator = $(if $(1),$(1),/)
 # github(user,package,version): returns site of GitHub repository
 github = https://github.com/$(1)/$(2)/archive/$(3)
 
+# Expressely do not check hashes for those files
+export BR_NO_CHECK_HASH_FOR
+
 ################################################################################
 # The DOWNLOAD_* helpers are in charge of getting a working copy
 # of the source repository for their corresponding SCM,
diff --git a/support/download/check-hash b/support/download/check-hash
index d37f1cd..ca81f00 100755
--- a/support/download/check-hash
+++ b/support/download/check-hash
@@ -99,6 +99,11 @@ while read t h f; do
 done <"${h_file}"
 
 if [ ${nb_checks} -eq 0 ]; then
+    for f in ${BR_NO_CHECK_HASH_FOR}; do
+        if [ "${f}" = "${base}" ]; then
+            exit 0
+        fi
+    done
     printf "ERROR: No hash found for %s\n" "${base}" >&2
     exit 0
 fi
-- 
1.9.1
