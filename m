From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Mar 2017 22:14:17 +0100
Subject: [Buildroot] [git commit] support/check-bin-arch: fix for filenames
	with spaces
Message-ID: <20170321211619.93F678262E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2f6c5e513cf6688f9343a25ac90138e9ad751eb5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Filenames with spaces will break the current for loop.

Fix that by using a while-read loop, fed with the list of files on
stdin, using process substitution.

Reported-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/check-bin-arch | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/support/scripts/check-bin-arch b/support/scripts/check-bin-arch
index 2c619ad..b3e2024 100755
--- a/support/scripts/check-bin-arch
+++ b/support/scripts/check-bin-arch
@@ -18,9 +18,11 @@ fi
 
 exitcode=0
 
-pkg_files=$(sed -r -e "/^${package},(.+)$/!d; s//\1/;" ${pkg_list})
+# Only split on new lines, for filenames-with-spaces
+IFS="
+"
 
-for f in ${pkg_files} ; do
+while read f; do
 	# Skip firmware files, they could be ELF files for other
 	# architectures
 	if [[ "${f}" =~ ^\./(usr/)?lib/firmware/.* ]]; then
@@ -43,10 +45,10 @@ for f in ${pkg_files} ; do
 		continue
 	fi
 
-	printf 'ERROR: architecture for %s is %s, should be %s\n' \
+	printf 'ERROR: architecture for "%s" is "%s", should be "%s"\n' \
 	       "${f}" "${arch}" "${arch_name}"
 
 	exitcode=1
-done
+done < <( sed -r -e "/^${package},\.(.+)$/!d; s//\1/;" ${pkg_list} )
 
 exit ${exitcode}
