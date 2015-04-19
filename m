From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Apr 2015 14:44:57 +0200
Subject: [Buildroot] [PATCH 4/7 v5] support/download: add possibility to not
	fail on missing hash
In-Reply-To: <cover.1429447148.git.yann.morin.1998@free.fr>
References: <cover.1429447148.git.yann.morin.1998@free.fr>
Message-ID: <942ffe13728f4ab40af2ab19d9fe9a256647bcfa.1429447148.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In very constrained cases, it might be needed to not fail if a hash is
missing. This is notably the case for custom external toolchains to be
downloaded, because we do have a .hash file for external toolchains,
but we obviously can not have hashes for all existing custom toolchains
(he, "custom"!).

So, add a way to avoid failing in that case.

From the Makefile, we export the list of files for which not to check
the hash. Then, from the check-hash script, if no check was done, and
the file we were trying to match in in this exclusion list, we just exit
without error.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Arnout Vandecappelle <arnout@mind.be>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
Changes v4 -> v5:
  - micro-optimisation, use case-esac instead of a for-loop  (Arnout)
  - typoes  (Arnout)

Changes v3 -> v4:
  - drop the magic value, use a list of excluded files  (Arnout)

Changes v1 -> v2:
  - fix typoes in commit log
---
 package/pkg-download.mk     | 3 +++
 support/download/check-hash | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index e274712..1fc23c4 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -60,6 +60,9 @@ domainseparator = $(if $(1),$(1),/)
 # github(user,package,version): returns site of GitHub repository
 github = https://github.com/$(1)/$(2)/archive/$(3)
 
+# Expressly do not check hashes for those files
+export BR_NO_CHECK_HASH_FOR
+
 ################################################################################
 # The DOWNLOAD_* helpers are in charge of getting a working copy
 # of the source repository for their corresponding SCM,
diff --git a/support/download/check-hash b/support/download/check-hash
index 678a7ef..1280322 100755
--- a/support/download/check-hash
+++ b/support/download/check-hash
@@ -99,6 +99,12 @@ while read t h f; do
 done <"${h_file}"
 
 if [ ${nb_checks} -eq 0 ]; then
+    case " ${BR_NO_CHECK_HASH_FOR} " in
+    " ${base} ")
+        # File explicitly has no hash
+        exit 0
+        ;;
+    esac
     printf "ERROR: No hash found for %s\n" "${base}" >&2
     exit 0
 fi
-- 
1.9.1
