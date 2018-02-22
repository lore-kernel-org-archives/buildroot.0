From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Thu, 22 Feb 2018 17:49:04 -0500
Subject: [Buildroot] [PATCH v2 1/2] pkgconf: pkg-config.in: double quote $@
Message-ID: <20180222224905.28618-1-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---

Changes since v1:
 - improve commit message.

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
-- 
2.16.1
