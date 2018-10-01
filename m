From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Oct 2018 20:55:35 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] acpid: use shutdown for
 poweroff, if available, not /sbin/poweroff
Message-ID: <20181001185449.B66728B2C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0ebec570387410bf478643a0e2c143db12d368b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

It's preferable to use "shutdown -hP now" to ensure that the runlevel is
known, preventing this message on the system console and log:

  WARNING: could not determine runlevel - doing soft poweroff
    (it's better to use shutdown instead of poweroff from the command line)

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ab842ce21df58e7731dae675e08894c6e9024e56)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/acpid/acpid.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/acpid/acpid.mk b/package/acpid/acpid.mk
index 2141a1a9e0..87378d8106 100644
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
 
