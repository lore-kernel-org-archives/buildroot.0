From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 28 Feb 2020 21:25:52 +0100
Subject: [Buildroot] [PATCH] package/openrc: needs kmod
Message-ID: <20200228202552.14788-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

openrc provides scritps that have been written for the big-gun kmod, and
so use options unknown to the biusybox' provided applets:

  - Busybox modprobe does not have a "--first-time" option,
  - the "--verbose" option is just "-v",
  - the "--use-blacklist" option is just "-b". Also blacklist support is
    not selected in our default busybox configuration.

One of two options, is to "fix" or "adapt" openrc's scripts to busybox,
which means for the openrc package to go peek into files from the
busybox package, which is not nice, and can't work because that is not
available by the time we scan our Makefiles.

The other option, which this patch implements, is to just add a
dependency onto kmod and its tools.

Reported-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openrc/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/openrc/Config.in b/package/openrc/Config.in
index 796858f404..4691be63a2 100644
--- a/package/openrc/Config.in
+++ b/package/openrc/Config.in
@@ -3,6 +3,9 @@ config BR2_PACKAGE_OPENRC
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_INIT_OPENRC
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # kmod tools
+	select BR2_PACKAGE_KMOD # runtime
+	select BR2_PACKAGE_KMOD_TOOLS # runtime
 	select BR2_PACKAGE_NCURSES
 	help
 	  Init that works on top of pid 1 (for example
-- 
2.20.1
