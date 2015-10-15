From: Mike Williams <mike@mikebwilliams.com>
Date: Thu, 15 Oct 2015 10:35:07 -0400
Subject: [Buildroot] [PATCH 2/2] ofono: fix missing systemd and dbus files
In-Reply-To: <1444919707-29869-1-git-send-email-mike@mikebwilliams.com>
References: <1444919707-29869-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <1444919707-29869-2-git-send-email-mike@mikebwilliams.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ofono's service file was not being installed when systemd was selected
as the init system.

Without ofono.conf in /etc/dbus-1/system.d, ofonod cannot take
its dbus name on the system bus and will fail to start with a
permission denied error.

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
---
 package/ofono/ofono.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index f1a63e2..43d16fd 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -16,7 +16,9 @@ OFONO_DEPENDENCIES = \
 	libcap-ng \
 	mobile-broadband-provider-info
 
-OFONO_CONF_OPTS = --disable-test
+OFONO_CONF_OPTS = --disable-test \
+	--with-dbusconfdir=/etc \
+	$(if $(BR2_INIT_SYSTEMD),--with-systemdunitdir=/usr/lib/systemd/system)
 
 # N.B. Qualcomm QMI modem support requires O_CLOEXEC; so
 # make sure that it is defined.
-- 
2.1.4
