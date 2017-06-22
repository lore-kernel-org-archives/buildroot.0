From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Jun 2017 22:04:57 +0200
Subject: [Buildroot] [git commit] package/linuxconsoletools: always select a
	sub-option
Message-ID: <20170622200555.028C980AC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e9b47764839ca6120af673d1df34f5fbe89e6e09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch forces BR2_PACKAGE_LINUXCONSOLETOOLS_INPUTATTACH
to be selected if none of the other sub-options are
selected. This fixes build failures when using
'make randpackageconfig', where selecting
BR2_PACKAGE_LINUXCONSOLETOOLS without selecting any sub-option
would break in the 'install to target' phase.

Fixes:
http://autobuild.buildroot.net/results/94b/94bc050f291cc42a4fdcf02157320576feb03654/
http://autobuild.buildroot.net/results/f62/f62c5e8bd63d21211eb0e658c4e84135bd59b8cb/

And many more.

[Peter: add autobuilder references and wrap Config.in line]
Signed-off-by: Koen Martens <koen.martens@transport.alstom.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linuxconsoletools/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/linuxconsoletools/Config.in b/package/linuxconsoletools/Config.in
index d2b0117..7615027 100644
--- a/package/linuxconsoletools/Config.in
+++ b/package/linuxconsoletools/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_LINUXCONSOLETOOLS
 	bool "linuxconsoletools"
+	select BR2_PACKAGE_LINUXCONSOLETOOLS_INPUTATTACH if \
+	       !BR2_PACKAGE_LINUXCONSOLETOOLS_JOYSTICK && \
+	       !BR2_PACKAGE_LINUXCONSOLETOOLS_FORCEFEEDBACK
 	help
 	  Linuxconsoletools contains the inputattach utility
 	  to attach legacy serial devices to the Linux kernel
