From: John Keeping <john@metanate.com>
Date: Thu, 16 Nov 2017 17:03:16 +0000
Subject: [Buildroot] [PATCH] systemd: set time epoch for reproducible builds
Message-ID: <20171116170316.19081-1-john@metanate.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Systemd embeds a timestamp which is used to impose a minimum bound on
the system time during boot.  Normally this comes from stat'ing the NEWS
file included with the systemd source, but this makes the build
non-reproducible.  Pass in $SOURCE_DATE_EPOCH to use a deterministic
timestamp when reproducible builds are enabled.

Signed-off-by: John Keeping <john@metanate.com>
---
 package/systemd/systemd.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 9f286fd54b..d87c9d33dd 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -40,6 +40,11 @@ SYSTEMD_CONF_OPTS += \
 	--with-default-dnssec=no \
 	--without-python
 
+ifeq ($(BR2_REPRODUCIBLE),y)
+SYSTEMD_CONF_OPTS += \
+	--with-time-epoch=$(SOURCE_DATE_EPOCH)
+endif
+
 SYSTEMD_CFLAGS = $(TARGET_CFLAGS) -fno-lto
 
 # Override paths to a few utilities needed at runtime, to
-- 
2.15.0
