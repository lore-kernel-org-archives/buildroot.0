From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Jan 2013 16:32:40 +0100
Subject: [Buildroot] [git commit] libelementary: only use libethumb if
	libedbus is available.
Message-ID: <20130114153605.54E549A0E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dfe780994bb7fac4418a931478f732b29a09c34a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libelementary uses the ethumb_client library, but that one is only built
if libedbus is available. So fixup the --enable/disable-ethumb according
to the selection of BR2_PACKAGE_LIBEDBUS.

Fixes e.g.
http://autobuild.buildroot.net/results/14ef98da6b0632e24514fef696fae9a650c90c96

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/efl/libelementary/libelementary.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/efl/libelementary/libelementary.mk b/package/efl/libelementary/libelementary.mk
index f63f0dc..f20a35d 100644
--- a/package/efl/libelementary/libelementary.mk
+++ b/package/efl/libelementary/libelementary.mk
@@ -18,7 +18,9 @@ LIBELEMENTARY_DEPENDENCIES = libeina libevas libecore libedje host-libedje \
 LIBELEMENTARY_CONF_OPT = --with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
 			 --with-eet-eet=$(HOST_DIR)/usr/bin/eet
 
-ifeq ($(BR2_PACKAGE_LIBETHUMB),y)
+# libethumb_client is only built when ethumbd is built.
+# ethumbd is only built if edbus is built.
+ifeq ($(BR2_PACKAGE_LIBETHUMB)$(BR2_PACKAGE_LIBEDBUS),yy)
 LIBELEMENTARY_DEPENDENCIES += libethumb
 LIBELEMENTARY_CONF_OPT += --enable-ethumb
 else
