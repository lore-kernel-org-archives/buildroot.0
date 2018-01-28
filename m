From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Jan 2018 21:47:21 +0100
Subject: [Buildroot] [git commit] package/systemd: Set fallback hostname
Message-ID: <20180128211141.592CF8557E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aebabb2780da4c5f85fec00b56f4690feb646073
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When BR2_TARGET_GENERIC_HOSTNAME is set, use the config option
--with-fallback-hostname to specify the fallback hostname to use
if none is configured in /etc/hostname.  This is useful in a
pristine installation with an empty /etc.

Signed-off-by: Chris Lesiak <chris.lesiak@licor.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/systemd.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index ef31a0f..b56c6c6 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -317,6 +317,11 @@ else
 SYSTEMD_CONF_OPTS += -Dhibernate=false
 endif
 
+SYSTEMD_FALLBACK_HOSTNAME = $(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
+ifneq ($(SYSTEMD_FALLBACK_HOSTNAME),)
+SYSTEMD_CONF_OPTS += --with-fallback-hostname=$(SYSTEMD_FALLBACK_HOSTNAME)
+endif
+
 define SYSTEMD_INSTALL_INIT_HOOK
 	ln -fs ../lib/systemd/systemd $(TARGET_DIR)/sbin/init
 	ln -fs ../bin/systemctl $(TARGET_DIR)/sbin/halt
