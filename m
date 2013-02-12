From: John Stile <john@stilen.com>
Date: Tue, 12 Feb 2013 13:30:26 -0800
Subject: [Buildroot] post-build script calling another buildroot fails
Message-ID: <1360704626.13529.179.camel@genx>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am having a problem with one make buildroot calling another make
buildroot with a different configuration, via a post-build script.

One configuration is for NAND flash
Another  configuration is for NOR flash.
The NAND flash .config calls a post-build script.
The post-build scrip tries to make the NOR buildroot.

If I run the script from the command line it works.

The error when called from NAND buildroot make:
make[1]: Entering directory
`/home/jstile/svn_rmserver/buildroot-2011.11'
make[1]: *** No rule to make target `project_failsafe_defconfig'.  Stop.
make[1]: Leaving directory `/home/jstile/svn_rmserver/buildroot-2011.11'

Filesystem layout looks like this:
|
|-buildroot-2011.11/
| |-.config
| |-configs/project_failsafe_defconfig
| |-output/images/rootfs.jffs2
| \-post-build-script.bash
| 
|-failsafe/
| |-images/rootfs.jffs2

'buildroot-2011.11' is where I build my NAND system.
'failsafe' is where I build my NOR system.

From buildroot-2011.11 directory, I run 'make', which calls my
post-build-script.bash as the post-build script.

The post-build script:
#!/bin/bash
mkdir -p ../failsafe
cd ../failsafe
make -C ../buildroot-2011.11 O=$(pwd) project_failsafe_defconfig
make

The first make statement is the source of the error message.
