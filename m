From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 31 Jul 2009 08:49:27 +0200
Subject: [Buildroot] x86_64 error2
In-Reply-To: <4A7270B7.3000308@renta.net>
References: <4A7270B7.3000308@renta.net>
Message-ID: <20090731084927.7bc8cfe1@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 31 Jul 2009 14:19:03 +1000,
Mark Constable <markc@renta.net> a ?crit :

> My Archlinux based hosts coreutils package installs "install"
> as /bin/install. Sure I can make a softlink, but shouldn't the
> buildroot procedure just use "install" from the $PATH?

Something like the patch below should fix it. If it does, please
confirm, I'll send out a pull request for this patch.

Sincerly,

Thomas

commit 1a2433b58e841f36790bd4015e1a19e5b9793d9a
Author: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date:   Fri Jul 31 08:48:03 2009 +0200

    makefile: don't hardcore install utility location
    
    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

diff --git a/package/Makefile.in b/package/Makefile.in
index 3dcdfe1..0829e8f 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -181,7 +181,7 @@ ifeq ($(BR2_STRIP_none),y)
 TARGET_STRIP=true -Not_stripping
 STRIPCMD=$(TARGET_STRIP)
 endif
-INSTALL=/usr/bin/install
+INSTALL=$(shell which install || type -p install)
 FLEX:=$(shell which flex || type -p flex)
 BISON:=$(shell which bison || type -p bison)


-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
