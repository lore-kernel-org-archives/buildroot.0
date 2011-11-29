From: Jeff Krasky <jeff.krasky@dspcg.com>
Date: Tue, 29 Nov 2011 08:43:10 -0600
Subject: [Buildroot] LIBFOO_SITE in .mk file
In-Reply-To: <20111129153619.4f080721@skate>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98>
 <201111281139.37028.minimod@morethan.org>
 <002701ccadfe$961b9430$0400a8c0@dspcgrnzks9p98>
 <201111281324.38619.minimod@morethan.org>
 <003601ccae04$ada02e80$0400a8c0@dspcgrnzks9p98>
 <003801ccae12$a7781190$0400a8c0@dspcgrnzks9p98>
 <003901ccae1b$2d82f950$0400a8c0@dspcgrnzks9p98>
 <20111129083710.1a83fad6@skate>
 <001201ccaea3$3ad7df70$0400a8c0@dspcgrnzks9p98>
 <20111129153619.4f080721@skate>
Message-ID: <001301ccaea5$37ec1f40$0400a8c0@dspcgrnzks9p98>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> I'll try to look at the EtherCAT build system, but I'm quite busy at
> the moment. The INSTALL file has some details, but to build within
> Buildroot, probably quite a few environment variables have to be passed.

Here are the contents of the INSTALL file:

----------------------------------------------------------------------------
---

This is the INSTALL file of the IgH EtherCAT Master.

$Id$

vim: set spelllang=en spell tw=78

----------------------------------------------------------------------------
---

Building and installing
=======================

The complete build and installation procedure is described in the respective
section of the documentation available from http://etherlab.org/en/ethercat.

----------------------------------------------------------------------------
---

For the impatient: The procedure mainly consists of calling

$ ./boostrap # to create the configure script, if downloaded from the repo

$ ./configure
$ make all modules

... and as root:

# make modules_install install
# depmod

... and linking the init script and copying the sysconfig file from
$PREFIX/etc
to the appropriate locations and customizing the sysconfig file.

# ln -s ${PREFIX}/etc/init.d/ethercat /etc/init.d/ethercat
# cp ${PREFIX}/etc/sysconfig/ethercat /etc/sysconfig/ethercat
# vi /etc/sysconfig/ethercat

Make sure, that the 'udev' package is installed, to automatically create the
EtherCAT character devices. The character devices will be created with mode
0660 and group root by default. If you want to give normal users reading
access, create a udev rule like this:

# echo KERNEL==\"EtherCAT[0-9]*\", MODE=\"0664\" >
/etc/udev/rules.d/99-EtherCAT.rules

Now you can start the EtherCAT master:

# /etc/init.d/ethercat start

Have a look at the examples/ subdirectory for some application examples.

Have fun!

----------------------------------------------------------------------------
---
