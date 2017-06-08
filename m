From: Jens Maus <mail@jens-maus.de>
Date: Thu,  8 Jun 2017 17:35:57 +0200
Subject: [Buildroot] [PATCH 2/2] package/nut: specify --with-user/group when
	building NUT
Message-ID: <20170608153557.30726-1-mail@jens-maus.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit fixes a problem where the NUT package couldn't be
used as a NUT server due to the fact that the default group for
nobody is "nogroup" and not "nobody" like the internal default
of NUT. Thus, when starting a NUT server daemon the daemon starts
with incorrect group permissions and generated some error messages.
This commit fixes this shortcoming by specifying --with-user/group
when running configure.

Signed-off-by: Jens Maus <mail@jens-maus.de>
---
 package/nut/nut.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/nut/nut.mk b/package/nut/nut.mk
index 332ccf907..ab8a17868 100644
--- a/package/nut/nut.mk
+++ b/package/nut/nut.mk
@@ -18,7 +18,9 @@ NUT_AUTORECONF = YES
 # since the default location (/var/state/ups) maybe readonly.
 NUT_CONF_OPTS = \
 	--with-altpidpath=/var/run/upsd \
-	--without-hal
+	--without-hal \
+	--with-user=nobody \
+	--with-group=nogroup
 
 # For uClibc-based toolchains, nut forgets to link with -lm
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
-- 
2.11.0
