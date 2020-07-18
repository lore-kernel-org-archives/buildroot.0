From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Jul 2020 22:43:25 +0200
Subject: [Buildroot] [git commit] package/systemd: remove SysV compatibility
 feature
Message-ID: <20200718203937.AE0CF87957@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=96f0d9969e6220154b39d9d80cda97998d41f670
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Systemd enables compatibility with SysV services and utmp by default,
none of which is needed for buildroot as the packages' .mk will install
only the files for the chosen init system.

Furthermore, SysV support requires a setup where *both* /etc/init.d and
/etc/rc.d exists (the latter for the usual /etc/rcN.d). However, in
Buildroot, the latter does not exist; so we would not be able to provide
a working SysV support anyway.

So, just forcibly disable SysV support.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
[yann.morin.1998 at free.fr:
  - expand commit log
  - disable utmp in its own patch
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/systemd/systemd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 570841ebe3..733d170193 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -22,6 +22,8 @@ SYSTEMD_PROVIDES = udev
 
 SYSTEMD_CONF_OPTS += \
 	-Drootlibdir='/usr/lib' \
+	-Dsysvinit-path= \
+	-Dsysvrcnd-path= \
 	-Dblkid=true \
 	-Dman=false \
 	-Dima=false \
