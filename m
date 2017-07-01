From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 14:57:17 +0200
Subject: [Buildroot] [git commit] core: always pass full path to strip
	command
Message-ID: <20170701130455.2505581DA3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d5dcc76d9e5f9d22e881517ccc805dfd54499a74
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In some cases, passing STRIP=true is not sufficient to disable striping
altogether, as some (incorrectly generated?) configure scripts will
ignore a ${STRIP} that is not a full path.

This is the case, for example, for nmap, which ends up using the host
strip command when we pass STRIP=true:

    checking for arm-buildroot-linux-gnueabihf-strip... no
    checking for strip... /usr/bin/strip
    configure: WARNING: using cross tools not prefixed with host triplet
    [--SNIP--]
    /usr/bin/install -c -c -m 755 nping /home/ymorin/dev/buildroot/O/target/usr/bin/nping
    /usr/bin/strip -x /home/ymorin/dev/buildroot/O/target/usr/bin/nping
    /usr/bin/strip: Unable to recognise the format of the input file `/home/ymorin/dev/buildroot/O/target/usr/bin/nping'

We fix that by forcing a full path to the strip sommand when it is
disabled: STRIP=/bin/true

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 4a3eb26..c1dc714 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -207,7 +207,7 @@ TARGET_STRIP = $(TARGET_CROSS)strip
 STRIPCMD = $(TARGET_CROSS)strip --remove-section=.comment --remove-section=.note
 endif
 ifeq ($(BR2_STRIP_none),y)
-TARGET_STRIP = true
+TARGET_STRIP = /bin/true
 STRIPCMD = $(TARGET_STRIP)
 endif
 INSTALL := $(shell which install || type -p install)
