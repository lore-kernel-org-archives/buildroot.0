From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Dec 2016 15:38:16 +0100
Subject: [Buildroot] [git commit] support/dependencies: use the new kconfig
	option to check UTF8 locale
Message-ID: <20161204143830.CE676817E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=40685f6a51fcba41721e0b798393cb0b01dfe27b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, we require a host with an UTF-8 locale as soone as we build a
Buildroot toolchain with support for locales. This means that we do
erquire such a locale when building a toolchain with either uClibc,
glibc or musl.

However, glibc and musl do not require such a locale to be present.

Use the new option to check if an UTF8 locale is needed on the host,
rather than deriving that from toolchain settings.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/dependencies/dependencies.sh | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index e632a14..bfd6596 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -178,8 +178,7 @@ if test "${missing_progs}" = "yes" ; then
 	exit 1
 fi
 
-if grep ^BR2_TOOLCHAIN_BUILDROOT=y $BR2_CONFIG > /dev/null && \
-	grep ^BR2_ENABLE_LOCALE=y       $BR2_CONFIG > /dev/null ; then
+if grep ^BR2_NEEDS_HOST_UTF8_LOCALE=y $BR2_CONFIG > /dev/null; then
 	if ! which locale > /dev/null ; then
 		echo
 		echo "You need locale support on your build machine to build a toolchain supporting locales"
