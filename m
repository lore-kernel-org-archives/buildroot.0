From: Wade Berrier <wberrier@gmail.com>
Date: Tue, 2 Jul 2013 02:52:26 -0600
Subject: [Buildroot] [PATCH] system: only set the root password if it's not
	empty
Message-ID: <20130702085224.GA25620@berrier.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

No need to replace the password in etc/shadow with a blank password.

This also helps alleviate the situation when etc/shadow contains a password
which isn't meant to be blown away with a blank root password because mkpasswd
is non-functioning (rhel6).

This is somewhat of a workaround for distros (rhel6, and maybe fedora?) that
don't have a compatible mkpasswd.  They have grub-crypt, but it doesn't appear
to be as script friendly.

Signed-off-by: Wade Berrier <wberrier@gmail.com>
---
 system/system.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/system/system.mk b/system/system.mk
index 50c86ad..fa98532 100644
--- a/system/system.mk
+++ b/system/system.mk
@@ -57,7 +57,9 @@ TARGETS += target-generic-issue
 endif
 
 ifeq ($(BR2_ROOTFS_SKELETON_DEFAULT),y)
+ifneq ($(TARGET_GENERIC_ROOT_PASSWD),)
 TARGETS += target-root-passwd
+endif
 
 ifneq ($(TARGET_GENERIC_GETTY),)
 TARGETS += target-generic-getty-$(if $(BR2_PACKAGE_SYSVINIT),sysvinit,busybox)
-- 
1.7.9.5
