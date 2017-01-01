From: Baruch Siach <baruch@tkos.co.il>
Date: Sun,  1 Jan 2017 12:07:53 +0200
Subject: [Buildroot] [PATCH] alsa-utils: disable manpages generation from
	reStructured text
Message-ID: <aa4954d6b24aa8262aa80964c01abe78de42b9d0.1483265273.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The alsaucm man page rst source file is missing in the tarball. When rst2man
is detected on the host, build fails:

make[2]: *** No rule to make target 'alsaucm.1', needed by 'all-am'.  Stop.

Upstream added[1] the missing file to the tarball to fix this issue. But since
we don't need the manpage to begin with, just disable rst2man to shorten build
time by a few milliseconds.

[1] http://git.alsa-project.org/?p=alsa-utils.git;a=commitdiff;h=c6bdde171e1532f7b37333a5a746b6e662f12c53

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/alsa-utils/alsa-utils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 9113b8de62bf..a72191e9b2ef 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -23,6 +23,7 @@ ALSA_UTILS_CONF_ENV = \
 
 ALSA_UTILS_CONF_OPTS = \
 	--disable-xmlto \
+	--disable-rst2man \
 	--with-curses=$(if $(BR2_PACKAGE_NCURSES_WCHAR),ncursesw,ncurses)
 
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
-- 
2.11.0
