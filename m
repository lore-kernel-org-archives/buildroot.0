From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Oct 2011 10:02:17 +0200
Subject: [Buildroot] Configuring QMake project issue
In-Reply-To: <4EA66561.3000002@visionsystems.de>
References: <4EA66561.3000002@visionsystems.de>
Message-ID: <20111025100217.4be45d40@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 25 Oct 2011 09:29:37 +0200,
Yegor Yefremov <yegor_sub1@visionsystems.de> a ?crit :

> I followed your instructions on how to integrate own small project
> into BR. This is Qt project based on a *.pro file. My *.mk looks like
> this:
> 
> VSGUITEST_VERSION = 1.0
> VSGUITEST_SITE_METHOD = local
> 
> define VSGUITEST_EXTRACT_CMDS
>         cp -a $(TOPDIR)/package/vscom/vsguitest/src/* $(@D)/
> endef

If you use _SITE_METHOD = local, then you don't need the custom
_EXTRACT_CMDS.

Just do:

 _SITE_METHOD = local
 _SITE = $(TOPDIR)/package/vscom/vsguitest/src/

> define VSGUITEST_CONFIGURE_CMDS
>         $(QT_QMAKE) $(@D)/vsguitest.pro
> endef

This should be:

	(cd $(@D); $(QT_QMAKE) vsguitest.pro)

otherwise:

> My problem is, that after source code copy qmake generates Makefile
> directly in BR's root and overwrites the main Makefile. With
> QSerialDevice I haven't experienced such problems. What can I do
> about this?

This is because in your _CONFIGURE_CMDS, qmake gets executed inside the
Buildroot top directory.

> P.S. what about adding QMake project type in addition to CMake type?

So far, we don't have any package using Qmake inside the tree, which is
why we don't have a package infrastructure for them. So either we could
document how to create Qmake package (which is quite easy), or we could
add a package infrastructure for them.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
