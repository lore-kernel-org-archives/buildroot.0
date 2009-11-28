From: Michael S. Zick <minimod@morethan.org>
Date: Sat, 28 Nov 2009 09:43:14 -0600
Subject: [Buildroot] BB update Was:  Build jobbing
In-Reply-To: <200911280935.57255.minimod@morethan.org>
References: <200911271522.58858.minimod@morethan.org>
	<200911280813.12919.minimod@morethan.org>
	<200911280935.57255.minimod@morethan.org>
Message-ID: <200911280943.16819.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat November 28 2009, Michael S. Zick wrote:
> On Sat November 28 2009, Michael S. Zick wrote:
> > On Sat November 28 2009, Peter Korsgaard wrote:
> > > >>>>> "Michael" == Michael S Zick <minimod@morethan.org> writes:
> > > 
> > > Hi,
> > > 
> > >  Michael> nand_{erase,lock,unlock) in BB-1.15.2 does not build.
> > > 
> > > I take it that you mean flash_eraseall / flash_unlock / flash_lock?
> > > 
> > > It works for me after 4e385ee7 - Could you update and try again?
> > > 
>

After disabling eject/eject-scsi support. . .
Looks like it has a dependency on jffs2:

  CC      miscutils/flash_lock_unlock.o
miscutils/flash_eraseall.c:15:28: error: mtd/jffs2-user.h: No such file or directory
miscutils/flash_eraseall.c: In function ?flash_eraseall_main?:
miscutils/flash_eraseall.c:52: error: storage size of ?cleanmarker? isn?t known
miscutils/flash_eraseall.c:83: warning: implicit declaration of function ?cpu_to_je16?
miscutils/flash_eraseall.c:83: error: ?JFFS2_MAGIC_BITMASK? undeclared (first use in this function)
miscutils/flash_eraseall.c:83: error: (Each undeclared identifier is reported only once
miscutils/flash_eraseall.c:83: error: for each function it appears in.)
miscutils/flash_eraseall.c:84: error: ?JFFS2_NODETYPE_CLEANMARKER? undeclared (first use in this function)
miscutils/flash_eraseall.c:86: warning: implicit declaration of function ?cpu_to_je32?
miscutils/flash_eraseall.c:86: error: invalid application of ?sizeof? to incomplete type ?struct jffs2_unknown_node?
miscutils/flash_eraseall.c:121: error: invalid application of ?sizeof? to incomplete type ?struct jffs2_unknown_node?
miscutils/flash_eraseall.c:52: warning: unused variable ?cleanmarker?
make[2]: *** [miscutils/flash_eraseall.o] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [miscutils] Error 2
make[1]: *** Waiting for unfinished jobs....


Mike 
> The build didn't get far enough to find out, it looks like it broke
> on the recent scsi commit:
> 
> In file included from miscutils/eject.c:20:
> /Builds/BLDRT/br-head/output/toolchain/linux/include/scsi/scsi.h:145: error: expected specifier-qualifier-list before ?u8?
> /Builds/BLDRT/br-head/output/toolchain/linux/include/scsi/scsi.h: In function ?scsi_varlen_cdb_length?:
> /Builds/BLDRT/br-head/output/toolchain/linux/include/scsi/scsi.h:156: error: ?struct scsi_varlen_cdb_hdr? has no member named ?additional_cdb_length?
> make[2]: *** [miscutils/eject.o] Error 1
> make[1]: *** [miscutils] Error 2
> make[1]: *** Waiting for unfinished jobs....
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
