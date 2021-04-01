From: Maxim Kochetkov <fido_max@inbox.ru>
Date: Thu, 1 Apr 2021 07:53:10 +0300
Subject: [Buildroot] Problems with integration of package
In-Reply-To: <CAMwF3yws+TqD31uXGrFEvWUWmX02rQchksaUqmHhfv6qk0-QKA@mail.gmail.com>
References: <CAMwF3yws+TqD31uXGrFEvWUWmX02rQchksaUqmHhfv6qk0-QKA@mail.gmail.com>
Message-ID: <ef8c0910-9cdc-2caa-a411-0edecd1986b6@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make sure BR2_SYSTEM_ENABLE_NLS is enabled

Here is my minimal glibc based package:

################################################################################
#
# openscada
#
################################################################################ 

OPENSCADA_VERSION  = 0.9.3
OPENSCADA_SITE  = http://ftp.oscada.org/OpenSCADA/0.9
OPENSCADA_SOURCE  = openscada- $( OPENSCADA_VERSION ) .tar.xz
OPENSCADA_LICENSE  = GPL-3.0+
OPENSCADA_FILES  = COPYING
OPENSCADA_AUTORECONF  = YES
OPENSCADA_CONF_OPTS  = --disable-SQLite  \
                       --disable-MySQL  \
                       --disable-PostgreSQL  \
                       --disable-FireBird  \
                       --disable-SoundCard  \
                       --disable-VCAEngine  \
                       --disable-QTStarter  \
                       --disable-QTCfg  \
                       --disable-Vision  \
                       --disable-SNMP
OPENSCADA_DEPENDENCIES  = libopenssl gd
$( eval  $( autotools-package ))

----------------------
config BR2_PACKAGE_OPENSCADA
     bool "openscada"
     depends on BR2_INSTALL_LIBSTDCPP
     depends on BR2_SYSTEM_ENABLE_NLS
     select BR2_PACKAGE_LIBOPENSSL
     select BR2_PACKAGE_GD
     help
       The OpenSCADA
       OpenSCADA is an open implementation of SCADA (Supervisory
       Control And Data Acquisition) and HMI (Human-Machine Interface)
       systems.
       http://oscada.org/
--------------------------------


31.03.2021 17:01, ???? ??????? ?????:
> I try to integrate a package openscada, but have some problems with
> installing it.
> 
> I wrote Config.in and .mk file in dir package. Build is OK. But when
> package begins to install I had next error.
> 
> /usr/bin/mkdir -p
> '/home/vlad/work/stm/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib'
>   /bin/bash ../libtool   --mode=install /usr/bin/install -c   liboscada.la
> '/home/vlad/work/stm/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib'
>   /usr/bin/mkdir -p
> '/home/vlad/work/stm/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/openscada'
> fopen: No such file or directory
> 
> I undestand, that problem is with paths.
> 
> I tried to add next lines to .mk
> 
> OPENSCADA_INSTALL_STAGING = YES
> OPENSCADA_INSTALL_TARGET  = YES
>   OPENSCADA_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR)
>   OPENSCADA_INSTALL_TARGET_OPTS  = DESTDIR=$(TARGET_DIR)
> 
> After that, make package is OK. But I don't see binary in target/usr/bin
> directory and libtool doing nothing.
> 
> The build system of package is autotools.
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
