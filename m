From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Aug 2017 15:26:39 +0200
Subject: [Buildroot] [git commit] package/xen: fix build with gcc7
Message-ID: <20170819140119.06FE97FDBB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fb1ad31e61e4e38ef06d49390516a0a3a062324d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/f9553c1669bd05acee3ccea76e36c2474e534d8c/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Thomas: improve patch, reformatted with Git and better commit log.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-xc_dom_arm-add-missing-variable-initiali.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/xen/0003-tools-libxc-xc_dom_arm-add-missing-variable-initiali.patch b/package/xen/0003-tools-libxc-xc_dom_arm-add-missing-variable-initiali.patch
new file mode 100644
index 0000000..e8d4b32
--- /dev/null
+++ b/package/xen/0003-tools-libxc-xc_dom_arm-add-missing-variable-initiali.patch
@@ -0,0 +1,41 @@
+From d4eece000391583a6e32a225d7eb5b573a5c5565 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sat, 19 Aug 2017 15:22:58 +0200
+Subject: [PATCH] tools/libxc/xc_dom_arm: add missing variable initialization
+
+The variable domctl.u.address_size.size may remain uninitialized if
+guest_type is not one of xen-3.0-aarch64 or xen-3.0-armv7l. And the
+code precisely checks if this variable is still 0 to decide if the
+guest type is supported or not.
+
+This fixes the following build failure with gcc 7.x:
+
+xc_dom_arm.c:229:31: error: 'domctl.u.address_size.size' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+     if ( domctl.u.address_size.size == 0 )
+
+Patch originally taken from
+https://www.mail-archive.com/xen-devel at lists.xen.org/msg109313.html.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Thomas: improved commit log, reformatted with Git.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ tools/libxc/xc_dom_arm.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/tools/libxc/xc_dom_arm.c b/tools/libxc/xc_dom_arm.c
+index e7d4bd0..e669fb0 100644
+--- a/tools/libxc/xc_dom_arm.c
++++ b/tools/libxc/xc_dom_arm.c
+@@ -223,6 +223,8 @@ static int set_mode(xc_interface *xch, domid_t domid, char *guest_type)
+ 
+     domctl.domain = domid;
+     domctl.cmd    = XEN_DOMCTL_set_address_size;
++    domctl.u.address_size.size = 0;
++
+     for ( i = 0; i < ARRAY_SIZE(types); i++ )
+         if ( !strcmp(types[i].guest, guest_type) )
+             domctl.u.address_size.size = types[i].size;
+-- 
+2.9.4
+
