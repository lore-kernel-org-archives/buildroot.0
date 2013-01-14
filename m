From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 14 Jan 2013 14:45:05 +0100
Subject: [Buildroot] [PATCH] libelementary: only use libethumb if libedbus
	is available.
In-Reply-To: <87mwwdz9k2.fsf@dell.be.48ers.dk>
References: <87mwwdz9k2.fsf@dell.be.48ers.dk>
Message-ID: <1358171105-8786-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

libelementary uses the ethumb_client library, but that one is only built
if libedbus is available. So fixup the --enable/disable-ethumb according
to the selection of BR2_PACKAGE_LIBEDBUS.

Fixes e.g.
http://autobuild.buildroot.net/results/14ef98da6b0632e24514fef696fae9a650c90c96

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
I tested with the config from the autobuilder, but with the Sourcery
toolchain (because I couldn't find the external i686-wchar toolchain
for download). It still fails to build php, but that seems unrelated.
libelementary builds fine after this fix.
---
 package/efl/libelementary/libelementary.mk |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

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
-- 
1.7.10.4
