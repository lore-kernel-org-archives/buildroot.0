From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 22 Feb 2014 21:56:57 +0100
Subject: [Buildroot] [git commit] Makefile: internally use absolute paths to
	BR2_EXTERNAL
Message-ID: <20140222210312.D37E79056B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5f5e5f2919c631ead7aee4e3546e9680d3e63ace
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Using a relative path for BR2_EXTERNAL, and using an external defconfig,
such as in (from a Buildroot top-dir):
    make O=.. BR2_EXTERNAL=.. foo_defconfig

is broken. It is unclear why the %_defconfig rule recurses in that case.

This patch internaly makes BR2_EXTERNAL canonical (ie. makes it an absolute
path), and checks the directory exists.

[Peter: s/relatively/relative/ as suggested by Thomas]
Reported-by: J??r??my Rosen <jeremy.rosen@openwide.fr>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Romain Naour <romain.naour@openwide.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 98d32c0..502991f 100644
--- a/Makefile
+++ b/Makefile
@@ -119,6 +119,11 @@ ifeq ($(BR2_EXTERNAL),)
   override BR2_EXTERNAL = support/dummy-external
   $(shell rm -f $(BR2_EXTERNAL_FILE))
 else
+  _BR2_EXTERNAL = $(shell cd $(BR2_EXTERNAL) >/dev/null 2>&1 && pwd)
+  ifeq ($(_BR2_EXTERNAL),)
+    $(error BR2_EXTERNAL='$(BR2_EXTERNAL)' does not exist, relative to $(TOPDIR))
+  endif
+  override BR2_EXTERNAL := $(_BR2_EXTERNAL)
   $(shell echo BR2_EXTERNAL ?= $(BR2_EXTERNAL) > $(BR2_EXTERNAL_FILE))
 endif
 
