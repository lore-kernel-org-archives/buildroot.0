From: Diego A. Fons <diegofons@apexar.com>
Date: Mon, 23 Apr 2007 15:41:42 -0300
Subject: [Buildroot] New version of AT91 Buildroot available
In-Reply-To: <1177318904.4872.67.camel@elrond.sweden.atmel.com>
References: <1177318904.4872.67.camel@elrond.sweden.atmel.com>
Message-ID: <462CFDE6.7040307@apexar.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ulf Samuelsson escribi?:

>If anyone wants to see how it works in practice,
>then running the attached script will download my
>new buildroot, and build a complete set of functions
>to get a board running with Linux.
>
>
>It will build
>at91-bootstrap-2.3 with my private additions
>u-boot-1.2.0    with my private additions
>linux-2.6.20.4    maxim + experimental patches
>rootfs (jffs2)
>rootfs (ext2)
>
>for the following configurations:
>at91rm9200df*      at91rm9200ek running from dataflashcard
>at91sam9260dfc    at91sam9260ek running from dataflashcard
>at91sam9261ek*    at91sam9261 running from internal dataflash
>at91sam9263ek    at91sam9263ek running from dataflashcard
>
>Only the two boards marked '*' have been run on actual H/W yet,
>the other two boards will be tested when I get my boards back.
>
>Don't try to get support for these things from Atmel
>since they do not know anything about the internals.
>
>The stuff is also available at:
>www.at91.com 
>in the AT91 Buildroot project.
>--------------------------------------------------------------
>
>#!/bin/bash
>TOPDIR=`pwd`
>BUILDROOT=buildroot-atmel
>BUILDROOT_VER=2007-04-22
>BUILDROOT_SOURCE=${BUILDROOT}-${BUILDROOT_VER}.cpio.bz2
>BUILDROOT_SITE=ftp://at91dist:distrib at 81.80.104.162/AT91_Third_Party_Design_Flow/Linux_Host/Source
>DL_DIR=${TOPDIR}/Source
>UNZIP=bzcat
>
>function	prepare_directories()
>{
>	mkdir	-p	/tftpboot
>	mkdir	-p	/usr/local/arm
>	mkdir	-p	/usr/local/install/downloads
>}
>
>function	get_buildroot()
>{
>	if ! [ -d ${BUILDROOT} ] ; then
>		mkdir -p ${DL_DIR}
>		wget	-P ${DL_DIR}	${BUILDROOT_SITE}/${BUILDROOT_SOURCE}
>		${UNZIP}	${DL_DIR}/${BUILDROOT_SOURCE} | cpio -idv
>	fi
>}
>
>function	make_board()
>{
>	cd	${BUILDROOT}
>	echo	"building board $1"
>	make 	B=$1 board
>	make	$2
>	make	saveconfig
>	cd	${TOPDIR}
>}
>
>function	make_all_boards()
>{
>	make_board	at91rm9200df	$1
>	make_board	at91sam9260dfc	$1
>	make_board	at91sam9261ek	$1
>	make_board	at91sam9263ek	$1
>}
>
>
>prepare_directories
>get_buildroot
>make -C ${BUILDROOT} menuconfig
>make_all_boards	source
>make_all_boards
>
>
>  
>
>------------------------------------------------------------------------
>
>_______________________________________________
>buildroot mailing list
>buildroot at uclibc.org
>http://busybox.net/mailman/listinfo/buildroot
>
Hi,

I'was testing de script and i got this error:

checking for iconv_open... no
checking for libiconv_open in -liconv... no
checking for iconv_open in -liconv... no
configure: error: *** No iconv() implementation found in C library or 
libiconv
make: *** 
[/home/dfons/buildroot_atmel/buildroot-atmel/build_arm_small/glib-2.12.9/.configured] 
Error 1

Is it possible that uClib 0.9.28.3 doesn't have an iconv() implementation?

Regards,
Diego A. Fons.
