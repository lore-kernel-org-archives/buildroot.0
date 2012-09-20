From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 20 Sep 2012 14:49:57 +0200
Subject: [Buildroot] [git commit] fbdump: only build VGA16 support on
	x86/x86-64
Message-ID: <20120920133251.97697996B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9f996396d5ec8e6de6882695de970f24cfcfe59d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The VGA16 dumping feature probably doesn't make much sense on anything
else than x86 and x86-64, as it is accessing I/O ports that seem
PC-specific.

Moreover, some architectures such as SH4, do not have an
implementation of outw() in uClibc, but we quite certainly don't care
about VGA16 support for such architectures.

Fixes:

  http://autobuild.buildroot.org/results/e1c860830dd585830cf5ca5f935b81856e992334/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/fbdump/fbdump.mk |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/package/fbdump/fbdump.mk b/package/fbdump/fbdump.mk
index 3ca10bf..820ae96 100644
--- a/package/fbdump/fbdump.mk
+++ b/package/fbdump/fbdump.mk
@@ -9,4 +9,13 @@ FBDUMP_SITE:=http://www.rcdrummond.net/fbdump
 FBDUMP_LICENSE = GPLv2
 FBDUMP_LICENSE_FILES = COPYING
 
+# The VGA16 specific feature of fbdump doesn't make much sense outside
+# of the x86/x86-64 architectures, and causes build problems on some
+# architectures as outw() is not always available.
+ifeq ($(BR2_i386)$(BR2_x86_64),y)
+FBDUMP_CONF_OPT += --enable-vga16fb
+else
+FBDUMP_CONF_OPT += --disable-vga16fb
+endif
+
 $(eval $(autotools-package))
