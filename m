From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 24 Apr 2007 08:46:17 +0200
Subject: [Buildroot] New version of AT91 Buildroot available
In-Reply-To: <003401c785ef$e2287a50$c81f1fac@silver>
References: <003401c785ef$e2287a50$c81f1fac@silver>
Message-ID: <462DA7B9.2080900@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Got some comment on this, so I updated the source
to use the mkimage built by the system and to download
mpfr from aldot's home page, since the main location is down.

Did not have time to fully test this.


Saw a bug report on zlib headers.
This is fixed in my version which copies the zlib header
to the toolchain_build_arm/linux/include

Have no ready patch, but I guess copying my package/zlib contents
should fix that problem.

-----------------------------

#!/bin/bash
TOPDIR=`pwd`
BUILDROOT=buildroot-atmel
BUILDROOT_VER=2007-04-22
BUILDROOT_SOURCE=${BUILDROOT}-${BUILDROOT_VER}.cpio.bz2
BUILDROOT_SITE=ftp://at91dist:distrib at 81.80.104.162/AT91_Third_Party_Design_Flow/Linux_Host/Source
DL_DIR=${TOPDIR}/Source
UNZIP=bzcat

function	prepare_directories()
{
	mkdir	-p	/tftpboot
	mkdir	-p	/usr/local/arm
	mkdir	-p	/usr/local/install/downloads
}

function	get_buildroot()
{
	if ! [ -d ${BUILDROOT} ] ; then
		mkdir -p ${DL_DIR}
		wget	-P ${DL_DIR}	${BUILDROOT_SITE}/${BUILDROOT_SOURCE}
		${UNZIP}	${DL_DIR}/${BUILDROOT_SOURCE} | cpio -idv
	fi
}

function	make_board()
{
	cd	${BUILDROOT}
	echo	"building board $1"
	make 	B=$1 board
	make	$2
	make	saveconfig
	cd	${TOPDIR}
}

function	make_all_boards()
{
	make_board	at91rm9200df	$1
	make_board	at91sam9260dfc	$1
	make_board	at91sam9261ek	$1
	make_board	at91sam9263ek	$1
}


prepare_directories
get_buildroot
make -C ${BUILDROOT} menuconfig
make_all_boards	source
make_all_boards



-- 
Best Regards,
Ulf Samuelsson
-------------- next part --------------
A non-text attachment was scrubbed...
Name: ulf.vcf
Type: text/x-vcard
Size: 301 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070424/bc9e6637/attachment.vcf 
