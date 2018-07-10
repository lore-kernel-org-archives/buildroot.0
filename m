From: Hollis Blanchard <hollis_blanchard@mentor.com>
Date: Tue, 10 Jul 2018 09:46:03 -0700
Subject: [Buildroot] [PATCH] ncurses: make host-ncurses use host terminfo
Message-ID: <5f7fe697b92ac0145674.1531241163@cveaol6qa08.wv.mentorg.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

# HG changeset patch
# User Hollis Blanchard <hollis_blanchard@mentor.com>
# Date 1531239381 25200
#      Tue Jul 10 09:16:21 2018 -0700
# Node ID 5f7fe697b92ac0145674a6c96aad0f787b4bae32
# Parent  d71314cdccf1993ccdb05cddb16a5491f0bf723e
ncurses: make host-ncurses use host terminfo

Host GDB suffers a serious problem: pressing backspace (or ^W ^U or any other
"delete" key) results in a plain space being printed instead, making the
command prompt almost completely unusable.

That's because it's using host-ncurses, which embeds a path for the terminfo
database into the library itself. That path ends up being something like
/home/hollisb/buildroot.git/output/host/share/terminfo, which obviously doesn't
generally exist other hosts. ('relocate-sdk.sh' cannot and does not edit
binaries like libncurses.so.6, so doesn't resolve this problem.)

/usr/share/terminfo is a far better path to use, since it almost certainly
exists on the host. Theoretically, it could be from a different ncurses version
with incompatible terminfo database format, but this doesn't seem to be a
problem in practice. (Future patches could address the theoretical problem if
it actually appears in real life.)

This change allows buildroot's host gdb, which uses ncurses 6.x, to work on
RHEL5, RHEL6, and RHEL7, which all provide terminfo from ncurses 5.x.

Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -153,6 +153,7 @@ HOST_NCURSES_CONF_OPTS = \
 	--without-cxx \
 	--without-cxx-binding \
 	--without-ada \
+	--with-default-terminfo-dir=/usr/share/terminfo \
 	--without-normal
 
 $(eval $(autotools-package))
