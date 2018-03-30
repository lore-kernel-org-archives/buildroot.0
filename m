From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 18:49:15 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] pkgconf: pkg-config.in:
 double quote $@
Message-ID: <20180330193200.EE3F681495@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=36718c0f99be2709ee8cc52f24dcafed4f5cc36a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

The shell expands "$@" as "$1" "$2" "$3"... while it expands $@ as $1 $2
$3. With the second form, we loses spaces in positional parameters.

As example, the following call

        pkg-config --cflags "one two" three

is wrapped as

        pkgconf --cflags one two three

while we are expecting

        pkgconf --cflags "one two" three

"$@" is really useful when writing wrappers. It passes the positional
arguments *as* they are given.

Double quote $@ to prevent from splitting elements.

Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit cc526b428bb6f1e35ce9165f94e6f2fd306a37c7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkgconf/pkg-config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkgconf/pkg-config.in b/package/pkgconf/pkg-config.in
index b9ce0935cc..9387931ff2 100644
--- a/package/pkgconf/pkg-config.in
+++ b/package/pkgconf/pkg-config.in
@@ -2,4 +2,4 @@
 PKGCONFDIR=$(dirname $0)
 DEFAULT_PKG_CONFIG_LIBDIR=${PKGCONFDIR}/../@STAGING_SUBDIR@/usr/lib/pkgconfig:${PKGCONFDIR}/../@STAGING_SUBDIR@/usr/share/pkgconfig
 DEFAULT_PKG_CONFIG_SYSROOT_DIR=${PKGCONFDIR}/../@STAGING_SUBDIR@
-PKG_CONFIG_LIBDIR=${PKG_CONFIG_LIBDIR:-${DEFAULT_PKG_CONFIG_LIBDIR}} PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR:-${DEFAULT_PKG_CONFIG_SYSROOT_DIR}} ${PKGCONFDIR}/pkgconf @STATIC@ $@
+PKG_CONFIG_LIBDIR=${PKG_CONFIG_LIBDIR:-${DEFAULT_PKG_CONFIG_LIBDIR}} PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR:-${DEFAULT_PKG_CONFIG_SYSROOT_DIR}} ${PKGCONFDIR}/pkgconf @STATIC@ "$@"
