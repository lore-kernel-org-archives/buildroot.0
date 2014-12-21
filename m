From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Dec 2014 22:01:44 +0100
Subject: [Buildroot] [git commit] package/ncurses: fix builds with both
	shared and static libs
Message-ID: <20141221210149.4EC5B805F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c56dc003c1ea6dd91e466f7714d05cd1a9452a20
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When both shared and static libs are enabled, we have two shell
constructs to run, but they are not properly separated, leading to build
failures like:

    ln -sf libncursesw.a /home/idnc_sk/IOLINUX/builds/micro-x86_64-corei7/
    output/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/lib/libcurse
    s.a for lib in libncurses libmenu libpanel libform; do ln -sf ${lib}w.
    so /home/idnc_sk/IOLINUX/builds/micro-x86_64-corei7/output/host/usr/x8
    6_64-buildroot-linux-uclibc/sysroot/usr/lib/${lib}.so; done
    /bin/bash: -c: line 0: syntax error near unexpected token `do'
    /bin/bash: -c: line 0: `ln -sf libncursesw.a /home/idnc_sk/IOLINUX/bui
    lds/micro-x86_64-corei7/output/host/usr/x86_64-buildroot-linux-uclibc/
    sysroot/usr/lib/libcurses.a for lib in libncurses libmenu libpanel lib
    form; do ln -sf ${lib}w.so /home/idnc_sk/IOLINUX/builds/micro-x86_64-c
    orei7/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/lib/${
    lib}.so; done'

As can be seen, there is a missing semi-colon ';' between the symlink
command and the for loop:

    ln -sf libncursesw.a [...]/libcurses.a for lib in [...]

Fix that by adding a semi-colon after each first shell constructs, to
properly separate the two. If the second one is not enabled (i.e. for a
static-only build), there is a trailing semi-colon, but that's perfectly
valid shell syntax.

Reported-by: idnc_sk on IRC
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ncurses/ncurses.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 47378f7..5f9e4bd 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -86,10 +86,10 @@ define NCURSES_LINK_PC
 endef
 
 NCURSES_LINK_TARGET_LIBS = \
-	$(if $(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),$(call NCURSES_LINK_LIBS_STATIC,$(TARGET_DIR))) \
+	$(if $(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),$(call NCURSES_LINK_LIBS_STATIC,$(TARGET_DIR));) \
 	$(if $(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),$(call NCURSES_LINK_LIBS_SHARED,$(TARGET_DIR)))
 NCURSES_LINK_STAGING_LIBS = \
-	$(if $(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),$(call NCURSES_LINK_LIBS_STATIC,$(STAGING_DIR))) \
+	$(if $(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),$(call NCURSES_LINK_LIBS_STATIC,$(STAGING_DIR));) \
 	$(if $(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),$(call NCURSES_LINK_LIBS_SHARED,$(STAGING_DIR)))
 
 NCURSES_LINK_STAGING_PC = $(call NCURSES_LINK_PC,$(STAGING_DIR))
