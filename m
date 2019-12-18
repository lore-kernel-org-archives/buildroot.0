From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Dec 2019 23:15:54 +0100
Subject: [Buildroot] [git commit] package/polkit: add polkitd user and
 appropriate permissions
Message-ID: <20191218220729.6DBF38C99C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2df6cf470397eae801e7f6ba9bfee88316a579b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The polkit daemon requires a polkitd user with permission to access the
following directories:
  - /etc/polkit-1
  - /usr/share/polkit-1

The /usr/bin/pkexec file must be owned by owned by root with the
permissions 4755 or else the error "pkexec must be setuid root" is
thrown when it's ran.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
