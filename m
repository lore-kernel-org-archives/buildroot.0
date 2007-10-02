From: Leonid <Leonid@a-k-a.net>
Date: Tue, 2 Oct 2007 10:22:23 -0700
Subject: [Buildroot] Using pre-built BUILDROOT toolchain as
	externaltoolchain.
In-Reply-To: <1191300706.3613.12.camel@aeglos.sweden.atmel.com>
References: <20071001211634.063E9A6823@busybox.net>
	<406A31B117F2734987636D6CCC93EE3C0246E9E8@ehost011-3.exch011.intermedia.net>
	<1191300706.3613.12.camel@aeglos.sweden.atmel.com>
Message-ID: <406A31B117F2734987636D6CCC93EE3C0246EB5B@ehost011-3.exch011.intermedia.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Ulf:

I probably didn't make myself clear enough what I'm trying to achieve or/and don't know some buildroot configuration options. I submitted all buildroot files to version manager (I use perforce). I put there ONLY files which are not created as result of compilation:

Config.in  docs         local     netcfg-aeglos.sh  package  toolchain
configs    host.config  Makefile  netcfg.sh         target   uncfg.sh

I also submit to perforce contents of download directory to save building time.

When someone checks all stuff out, he will be using one of two preconfigured defconfig files:

1) FULL_defconfig - builds everything, including toolchain. This mode will be used only by system administrator once a while (when toolchain is modified). Results of compilation (toolchain only or entire buildroot directory) will be placed on the server in the place which is visible for other users.

2) FS_ONLY_defconfig - uses previously built buildroot toolchain somehow and builds only filesystem. In particular, "make clean" in this scenario doesn't touch toolchain at all. 

It's not my requirement to use external toolchain but I thought that this is the simplest way to achieve my goal. However looks like it's not an easy thing to configure all parameters properly for external toolchain. May be external toolchain is overkill for my case - I don't need arbitrary toolchain, just buildroot's one. I only don't want "make" to build it and "make clean" to clean it.  

What's simplest way to do this job?

Thanks,

Leonid. 

-----Original Message-----
From: Ulf Samuelsson [mailto:ulf at atmel.com] 
Sent: Monday, October 01, 2007 9:52 PM
To: Leonid
Cc: buildroot at uclibc.org
Subject: Re: [Buildroot] Using pre-built BUILDROOT toolchain as externaltoolchain.

m?n 2007-10-01 klockan 19:34 -0700 skrev Leonid:
> Hi:
> 
> I want to build toolchain only once and then use it as external 
> toolchain (well, last is not important, I just don't want make 
> re-build all toolchain binaries again every time). I have compiled 
> buildroot and have got both toolchain and working filesystem (I'm 
> using ext2 filesystem, running in ramdisk).

You do not have to use "build_<arch>/staging_dir".

Why not have a separate buildroot tree, which builds the toolchain directly to the location where you want it to end up.
You probably want to create a tarball from this, to ensure you can recover real easy.


> 
> Then I have copied created toolchain to another directory and using
> "make menuconfig" switched to external toolchain and specified the
> toolchain path/prefix and have rebuilt buildroot. It builds all right
> but resulting file system lacks certain libraries which is to be
> expected since I didn't define what libraries shall be copied from
> external toolchain. Where I can get list of libraries, buildroot
> toolchain copies? What else should be defined to make whole scheme work?
> 
> Thanks,
> 
> Leonid.
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
-- 
Best Regards,
Ulf Samuelsson          mail:   ulf at atmel.com
Atmel Nordic AB
Box 2033, 174 52 Sundbyberg
Kavalleriv?gen 24, 174 58 Sundbyberg
Sweden
Tel:    +46 8 441 54 22 GSM:    +46 706 224457
