From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Jan 2014 00:44:48 +0100
Subject: [Buildroot] [PATCH 5/6] pkg-infra: add possiblity to check
	downloaded files against known hashes
In-Reply-To: <cover.1389569992.git.yann.morin.1998@free.fr>
References: <cover.1389569992.git.yann.morin.1998@free.fr>
Message-ID: <dc5d6ba62805a74ef57fc2c779e97a00056cbfa6.1389569992.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Some of the packages that Buildroot might build are sensitive pacakges,
related to security: openssl, dropbear, ca-certificates...

Some of those packages are download over plain http, because there is
no way to get them over a secure channel, such as https.

In these dark times of pervasive surveillance, the potential for harm
that a tampered package could generate, we may want to check the integrity
of those sensitive packages.

So, each package may now provide a list of hashes for all files that
needs to be downloaded, and Buildroot will just fail if any download file
does not match its known hash.

The choosen hash function is SHA1 since it is widely available, though
theoretical attacks have been devised (but no known practical attack is
known).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
Note: this is not a bullet-proof solution, since Buildroot may itself be
compromised. But if we eventually sign our releases, then we secure the
list of hashes at the same time. Only random snapshots from the repository
may be at risk of tampering, although this is highly doubtfull, given how
git stores its data.

Also, before we commit a list of hashes to the tree, we may want to
setup a chain-of-trust to validate that thos hashes are correct.
We may want to discuss this during our next developpers' day in
Brussels in February.

Note-2: The laternative to sha1 would be sha2 (256- or 512-bit), but
oldish "enterprise-class" distributions  may be missing them entirely.
sha256sum and sha512sum were added to coreutils in 2005-10-23, and RHEL5
seems to have them. But better be safe than sorry. If sha2 should be
considered instead of sha1, then it is very easy to switch now. Switching
later would require that we revalidate all packages that have hashes,
which could prove to be quite time-demanding if we have lots of
packages using hashes.
---
 docs/manual/adding-packages-directory.txt | 35 ++++++++++++++++++++++++++++
 package/pkg-download.mk                   | 15 ++++++++++--
 support/download/check-hash               | 38 +++++++++++++++++++++++++++++++
 3 files changed, 86 insertions(+), 2 deletions(-)
 create mode 100755 support/download/check-hash

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 754a145..c5a92bd 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -325,3 +325,38 @@ different way, using different infrastructures:
 
 Further formatting details: see xref:writing-rules-mk[the writing
 rules].
+
+The +.hash+ file
+~~~~~~~~~~~~~~~~
+[[adding-packages-hash]]
+
+Optionally, you can add a third file, named +libfoo.hash+, that contains
+the https://en.wikipedia.org/wiki/Sha-1[SHA1] hashes of the downloaded
+files for the +libfoo+ package.
+
+The hashes stored in that file are used to validate the integrity of the
+downloaded files.
+
+The format for this file matches the output of +sha1sum+, that is, each
+line contains:
+
+* the SHA1 hash
+* two spaces
+* the name fo the file
+
+Specific to +Buildroot+, the filenames should not contain any directory
+component, such as:
+
+----
+486fb55c3efa71148fe07895fd713ea3a5ae343a  libfoo-1.2.3.tar.bz2
+a045ff9ecaf8d5342daa4cd23a4084da65af49e1  libfoo-fix-blabla.patch
+f729372d25deddd6191864a48484d4d268fd23ec  libfoo-data.bin
+----
+
+If the +.hash+ file is present, and there is an entry for a downloaded
+file, the hash of the downloaded file must match the hash stored in the
++.hash+ file. If it does not match, this is considered an error, and
+Buildroot aborts.
+
+If the +.hash+ file is present, but there is no entry for a downloaded
+file, or if the +.hash+ file is missing, then no check is done.
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index f3354d1..5627850 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -58,6 +58,14 @@ domainseparator=$(if $(1),$(1),/)
 # github(user,package,version): returns site of github repository
 github = https://github.com/$(1)/$(2)/tarball/$(3)
 
+# Helper for checking a tarball's checksum
+# $(1): the basename of the tarball to check
+# $(2): the full path to the file to check
+define VERIFY_SHA256
+	support/download/check-hash $(1) $(2) \
+		$($(PKG)_DIR_PREFIX)/$($(PKG)_NAME)/$($(PKG)_NAME).hash
+endef
+
 ################################################################################
 # The DOWNLOAD_* helpers are in charge of getting a working copy
 # of the source repository for their corresponding SCM,
@@ -153,7 +161,8 @@ endef
 # to prepend the path with a slash: scp://[user@]host:/absolutepath
 define DOWNLOAD_SCP
 	test -e $(DL_DIR)/$(2) || \
-	$(SCP) '$(call stripurischeme,$(call qstrip,$(1)))' $(DL_DIR)/$(2)
+	$(SCP) '$(call stripurischeme,$(call qstrip,$(1)))' $(DL_DIR)/$(2) && \
+	$(call VERIFY_SHA256,$(DL_DIR)/$(2))
 endef
 
 define SOURCE_CHECK_SCP
@@ -195,6 +204,7 @@ endef
 define DOWNLOAD_WGET
 	test -e $(DL_DIR)/$(2) || \
 	($(WGET) -O $(DL_DIR)/$(2).tmp '$(call qstrip,$(1))' && \
+	 $(call VERIFY_SHA256,$(2),$(DL_DIR)/$(2).tmp) && \
 	 mv $(DL_DIR)/$(2).tmp $(DL_DIR)/$(2)) || \
 	(rm -f $(DL_DIR)/$(2).tmp ; exit 1)
 endef
@@ -209,7 +219,8 @@ endef
 
 define DOWNLOAD_LOCALFILES
 	test -e $(DL_DIR)/$(2) || \
-		$(LOCALFILES) $(call stripurischeme,$(call qstrip,$(1))) $(DL_DIR)
+		$(LOCALFILES) $(call stripurischeme,$(call qstrip,$(1))) $(DL_DIR) && \
+	$(call VERIFY_SHA256,$(DL_DIR)/$(2))
 endef
 
 define SOURCE_CHECK_LOCALFILES
diff --git a/support/download/check-hash b/support/download/check-hash
new file mode 100755
index 0000000..5cf708f
--- /dev/null
+++ b/support/download/check-hash
@@ -0,0 +1,38 @@
+#!/bin/sh
+set -e
+
+# Helper to check a file matches its known hash
+# Call it with:
+#   $1: the basename of the package's tarball
+#   $2: the full path to the file to check
+#   $3: the path of the file containing all the the expected hashes
+
+tarball="${1}"
+file="${2}"
+h_file="${3}"
+
+# Does the hash-file exist?
+if [ ! -f "${h_file}" ]; then
+    exit 0
+fi
+
+# Do we know a hash for that tarball?
+known=$( grep -E '^[[:xdigit:]]+[[:space:]]{2}'"${tarball}"'$$' "${h_file}" \
+         |cut -d ' ' -f 1
+       )
+if [ -z "${known}" ]; then
+    exit 0
+fi
+
+# Do the hashes match?
+hash=$( sha1sum "${file}" |cut -d ' ' -f 1 )
+if [ "${hash}" = "${known}" ]; then
+    exit 0
+fi
+
+printf "ERROR: %s has wrong SHA256\n" "${tarball}"
+printf "ERROR: expected: %s\n" "${known}"
+printf "ERROR: got     : %s\n" "${hash}"
+printf "ERROR: Incomplete download, or MITM attack\n"
+
+exit 1
-- 
1.8.1.2
