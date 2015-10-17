From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Oct 2015 16:31:07 +0200
Subject: [Buildroot] [git commit] ofono: fix missing systemd and dbus files
Message-ID: <20151017143123.47B9B81D54@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7f237f06319dc1716aec620774e4106c53bce44b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Ofono's service file was not being installed when systemd was selected
as the init system.

Without ofono.conf in /etc/dbus-1/system.d, ofonod cannot take its
dbus name on the system bus and will fail to start with a permission
denied error.

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ofono/ofono.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index f1a63e2..7899750 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -16,7 +16,10 @@ OFONO_DEPENDENCIES = \
 	libcap-ng \
 	mobile-broadband-provider-info
 
-OFONO_CONF_OPTS = --disable-test
+OFONO_CONF_OPTS = \
+	--disable-test \
+	--with-dbusconfdir=/etc \
+	$(if $(BR2_INIT_SYSTEMD),--with-systemdunitdir=/usr/lib/systemd/system)
 
 # N.B. Qualcomm QMI modem support requires O_CLOEXEC; so
 # make sure that it is defined.
