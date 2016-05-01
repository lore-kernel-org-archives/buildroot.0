From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 May 2016 22:59:50 +0200
Subject: [Buildroot] [PATCH] package/luajit: luajit.pc: return the path
 to host-luajit from the Buildroot package
In-Reply-To: <1462135800-10581-1-git-send-email-romain.naour@gmail.com>
References: <1462135800-10581-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160501225950.7bdfbbd4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 May 2016 22:50:00 +0200, Romain Naour wrote:
> The luajit.pc file is manually generated in the luajit Makefile, so it give a wrong
> path for host-luajit.
> 
> $ host/usr/bin/pkgconf --cflags luajit
> /usr/include/luajit-2.0
> 
> It should be:
> $ host/usr/bin/pkgconf --cflags luajit
> [...]output/host/usr/include/luajit-2.0
> 
> Add a port install hook to fix luajit.pc for host-luajit.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>

That's the wrong solution. The proper solution is:

diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 623bfcc..81a2660 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -66,13 +66,13 @@ LUAJIT_POST_INSTALL_TARGET_HOOKS += LUAJIT_INSTALL_SYMLINK
 
 # host-efl package needs host-luajit to be linked dynamically.
 define HOST_LUAJIT_BUILD_CMDS
-       $(MAKE) PREFIX="/usr" BUILDMODE=dynamic \
+       $(MAKE) PREFIX="$(HOST_DIR)/usr" BUILDMODE=dynamic \
                TARGET_LDFLAGS="$(HOST_LDFLAGS)" \
                -C $(@D) amalg
 endef
 
 define HOST_LUAJIT_INSTALL_CMDS
-       $(MAKE) PREFIX="/usr" DESTDIR="$(HOST_DIR)" LDCONFIG=true -C $(@D) install
+       $(MAKE) PREFIX="$(HOST_DIR)/usr" LDCONFIG=true -C $(@D) install
 endef
 
 $(eval $(generic-package))

Indeed, for host packages, the prefix should be $(HOST_DIR)/usr.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
