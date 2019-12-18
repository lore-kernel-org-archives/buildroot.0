From: aduskett at gmail.com <aduskett@gmail.com>
Date: Wed, 18 Dec 2019 14:09:35 -0800
Subject: [Buildroot] [PATCH 1/1] package/polkit: add needed system changes
Message-ID: <20191218220935.49014-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

The polkit daemon requires a polkitd user with permission to access the
following directories:
  - /etc/polkit-1
  - /usr/share/polkit-1

The /usr/bin/pkexec file must be owned by owned by root with the permissions
4755 or else the error "pkexec must be setuid root" is thrown when it's ran.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/polkit/polkit.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index a98c138356..bc9e3580ab 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -29,4 +29,14 @@ else
 POLKIT_CONF_OPTS += --with-authfw=shadow
 endif
 
+define POLKIT_USERS
+	polkitd -1 polkitd -1 * - - - Polkit Daemon
+endef
+
+define POLKIT_PERMISSIONS
+	/etc/polkit-1 r 750 root polkitd - - - - -
+	/usr/share/polkit-1 r 750 root polkitd - - - - -
+	/usr/bin/pkexec f 4755 root root - - - - -
+endef
+
 $(eval $(autotools-package))
-- 
2.21.0 (Apple Git-122)
