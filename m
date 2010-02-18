From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Feb 2010 22:02:03 +0100
Subject: [Buildroot] [git commit master] alsa-utils: force the variant of
	ncurses library
Message-ID: <20100218210248.61C26776A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1072cf190cb9ce2a0cd7269065bcc07922211998
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Two variants of the ncurses library exist: the normal one, and the
ncursesw one, which has support for wide char. Currently, Buildroot
only builds the normal variant (the second variant requires
--enable-widec while compiling ncurses).

Unfortunately, when libncursesw is installed on the host, the
configure script of alsa-utils finds /usr/bin/ncursesw5-config and
thinks that the target has this version. Unfortunately, as this is not
the case, it causes a configure failure when trying to link a sample
program against libpanelw (which is part of ncurses).

Therefore, we force the libncurses variant used by alsa-utils to the
normal variant.

Later on, if needed, support for the wide-char variant of the
libncurses library could be added.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/multimedia/alsa-utils/alsa-utils.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/alsa-utils/alsa-utils.mk b/package/multimedia/alsa-utils/alsa-utils.mk
index f98b9cd..99d85ce 100644
--- a/package/multimedia/alsa-utils/alsa-utils.mk
+++ b/package/multimedia/alsa-utils/alsa-utils.mk
@@ -39,6 +39,7 @@ $(ALSA_UTILS_DIR)/.configured: $(ALSA_UTILS_DIR)/.unpacked
 		--prefix=/usr \
 		$(ALSA_UTILS_CONFIGURE_OPTS) \
 		--disable-xmlto \
+		--with-curses=ncurses \
 	)
 	touch $@
 
-- 
1.6.3.3
