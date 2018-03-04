From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  4 Mar 2018 11:29:03 +0100
Subject: [Buildroot] [PATCH 1/4] support/dependencies: unbreak check for
 UTF-8 locale
In-Reply-To: <cover.1520159327.git.yann.morin.1998@free.fr>
References: <cover.1520159327.git.yann.morin.1998@free.fr>
Message-ID: <33170da034bc7e7d13f68fae924ce2192a11ee36.1520159327.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Although the UTF-8 locales in mainstream distributions all are suffixed
with just 'utf8', the nomenclature is a bit ambiguous with the way they
are to be specified with the various LC_* variables, suffixed there with
'UTF-8'.

Also, POSIX, ISO, and IEC do not enforce any specific suffix in LC_*
variables:
    http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap08.html#tag_08_02

    """
    If the locale value has the form:
        language[_territory][.codeset]

    it refers to an implementation-provided locale, where settings of
    language, territory, and codeset are implementation-defined.
    """

To avoid any confusion, use a regexp that is a bit more lax when
matching locales.

Also, quote the regexp, so that the '?' and '$' are not interpreted by
the shell.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/dependencies/dependencies.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 6698f21a7a..656cb09d42 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -200,7 +200,7 @@ if grep ^BR2_NEEDS_HOST_UTF8_LOCALE=y $BR2_CONFIG > /dev/null; then
 		echo "You need locale support on your build machine to build a toolchain supporting locales"
 		exit 1 ;
 	fi
-	if ! locale -a | grep -q -i utf8$ ; then
+	if ! locale -a | grep -q -i -E 'utf-?8$' ; then
 		echo
 		echo "You need at least one UTF8 locale to build a toolchain supporting locales"
 		exit 1 ;
-- 
2.14.1
