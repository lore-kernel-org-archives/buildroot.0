From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jun 2016 18:38:39 +0200
Subject: [Buildroot] [git commit] package/php: fix date.timezone
Message-ID: <20160612164002.F293381E3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=30e572df3142f7c149befa9f49730c4d8d4479ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In 5f37843a (php.ini: set date.timezone), the configured timezone was
used as the default for PHP.

However, BR2_TARGET_LOCALTIME is a string, so is quoted, so it is never
empty, so the check for emptynessnever matches.

Fix that by q-stripping the value before testing it. Note however that
we do not q-strip it before storing it in the php.ini file, because it
has to be q-stripped in there.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Floris Bos <bos@je-eigen-domein.nl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php/php.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index 2997b1b..8dc70f0 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -32,9 +32,10 @@ ifeq ($(BR2_STATIC_LIBS)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
 PHP_STATIC_LIBS += -lpthread
 endif
 
-ifeq ($(BR2_TARGET_LOCALTIME),)
+ifeq ($(call qstrip,$(BR2_TARGET_LOCALTIME)),)
 PHP_LOCALTIME = UTC
 else
+# Not q-stripping this value, as we need quotes in the php.ini file
 PHP_LOCALTIME = $(BR2_TARGET_LOCALTIME)
 endif
 
