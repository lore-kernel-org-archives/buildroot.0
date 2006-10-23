From: Itzhak Ben-Akiva <itzhakba@commtact.co.il>
Date: Mon, 23 Oct 2006 12:55:51 +0200
Subject: [Buildroot] Buildroot for PowerPC
In-Reply-To: <20061023094254.GA13298@aon.at>
References: <1161592912.5391.5.camel@benakiva-laptop>
	<20061023094254.GA13298@aon.at>
Message-ID: <1161600951.11223.6.camel@benakiva-laptop>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2006-10-23 at 11:42 +0200, Bernhard Fischer wrote:
> On Mon, Oct 23, 2006 at 10:41:52AM +0200, Itzhak Ben-Akiva wrote:
> >Hi all,
> >
> >I'm compiling buildroot (snapshot 22-Oct-2006) with the toolchain option
> >of gcc-4.1.1 binutils-2.17 and linux kernel header 2.6.18. The
> >compilation of the toolchain went without problem. However, when I get
> >to the compilation of busybox (snapshot 22-Oct-2006) it stops because a
> >missing file Rules.mak as we can see below. I see that the file
> >Rules.mak exists in busybox-1.2. Is it really a missing file problem or
> >a problem in the configuration? I mean, should buildroot really be
> >trying to edit (sed) this file?
> 
> vda change busybox's buildsystem. There is no Rules.mak anymore.
> 
So, something was left behind that is still trying to use Rules.mak

> Perhaps $(MAKE) -C (BUSYBOX_DIR) CROSS=$(CROSS)
> since we pickup CROSS for a long time now (even in 1.3.x and 1.2.x,
> IIRC).
> 
I set the variable CROSS_COMPILE in the Makefile file of busybox. It
went ok.

However, what burdens me is that somehow buildroot is trying the edit
Rules.mak for powerpc.

> HTH,
> >
> >bzcat /usr/local/buildroot/dl/busybox-snapshot.tar.bz2 | tar
> >-C /usr/local/buildroot/build_powerpc   -xf -
> ># if we have external syslogd, force busybox to use it
> >/usr/local/buildroot/toolchain_build_powerpc/bin/sed -i -e
> >"/#include.*busybox\.h/a#define
> >CONFIG_SYSLOGD" /usr/local/buildroot/build_powerpc/busybox/init/init.c
> ># Allow busybox patches.
> >toolchain/patch-kernel.sh /usr/local/buildroot/build_powerpc/busybox
> >package/busybox busybox\*.patch
> >touch /usr/local/buildroot/build_powerpc/busybox/.unpacked
> >cp
> >package/busybox/busybox.config /usr/local/buildroot/build_powerpc/busybox/.config
> >/usr/local/buildroot/toolchain_build_powerpc/bin/sed -i -e
> >"s,^CROSS.*,CROSS=/usr/local/buildroot/build_powerpc/staging_dir/bin/powerpc-linux-uclibc-\n\
> >
> >PREFIX=/usr/local/buildroot/build_powerpc/root,;" /usr/local/buildroot/build_powerpc/busybox/Rules.mak
> >/usr/local/buildroot/toolchain_build_powerpc/bin/sed: can't
> >read /usr/local/buildroot/build_powerpc/busybox/Rules.mak: No such file
> >or directory
> >
> >Thanks,
> >Itzhak
> 
> >_______________________________________________
> >buildroot mailing list
> >buildroot at uclibc.org
> >http://busybox.net/mailman/listinfo/buildroot
