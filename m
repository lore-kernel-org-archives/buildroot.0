From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Sep 2018 21:10:10 +0200
Subject: [Buildroot] [git commit] acpid: use shutdown for poweroff,
 if available, not /sbin/poweroff
Message-ID: <20180910190927.766DE83B75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab842ce21df58e7731dae675e08894c6e9024e56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's preferable to use "shutdown -hP now" to ensure that the runlevel is
known, preventing this message on the system console and log:

  WARNING: could not determine runlevel - doing soft poweroff
    (it's better to use shutdown instead of poweroff from the command line)

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/acpid/acpid.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/acpid/acpid.mk b/package/acpid/acpid.mk
index 33e87cf50a..48fe005e5e 100644
--- a/package/acpid/acpid.mk
+++ b/package/acpid/acpid.mk
@@ -15,9 +15,15 @@ define ACPID_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S02acpid
 endef
 
+ifeq ($(BR2_INIT_SYSV)$(BR2_INIT_SYSTEMD),y)
+ACPID_POWEROFF_CMD = /sbin/shutdown -hP now
+else
+ACPID_POWEROFF_CMD = /sbin/poweroff
+endif
+
 define ACPID_SET_EVENTS
 	mkdir -p $(TARGET_DIR)/etc/acpi/events
-	printf "event=button[ /]power\naction=/sbin/poweroff\n" \
+	printf 'event=button[ /]power\naction=%s\n' '$(ACPID_POWEROFF_CMD)' \
 		>$(TARGET_DIR)/etc/acpi/events/powerbtn
 endef
 
