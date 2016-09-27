From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 27 Sep 2016 20:46:39 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2016-09-22
In-Reply-To: <20160927164145.41d6d6c4@free-electrons.com>
References: <20160923063043.9B0AD102740@stock.ovh.net>
 <CAKbGBLhk7nPvHr_X_=htCAuJp2CkrsH3_kPR5FOuArHahk+Wyw@mail.gmail.com>
 <20160927164145.41d6d6c4@free-electrons.com>
Message-ID: <20160927204639.7b704407@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello *,

On Tue, 27 Sep 2016 16:41:45 +0200, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
> (Added Waldemar + Buildroot ML in Cc)
> 
> On Thu, 22 Sep 2016 23:32:53 -0700, Steven Noonan wrote:
> > It looks like this failed because pthreads was broken somehow. Could
> > it be that the external toolchain didn't have libpthread or something?
> 
> Indeed, this seems like a uClibc issue. Waldemar, could you have a look
> (see below the reference to the autobuilder failure).
> 

Seems to be a similar failure as for the assimp package ([1]), linking with
-lpthread seems not enough, but linking with -pthread succeeds:

	$ build/powertop-2.7/src

	$ diff -u Makefile_orig Makefile
--- Makefile_orig       2016-09-27 20:38:09.358325072 +0200
+++ Makefile    2016-09-27 20:38:35.413247226 +0200
@@ -294,7 +294,7 @@
 LIBICONV = -liconv
 LIBINTL = 
 LIBNL_CFLAGS = -I<...>/build_arm_assimp_001/host/usr/arm-buildroot-uclinux-uclibcgnueabi/sysroot/usr/include/libnl3  
-LIBNL_LIBS = -L<...>/build_arm_assimp_001/host/usr/arm-buildroot-uclinux-uclibcgnueabi/sysroot/usr/lib -lpthread -lm -lnl-genl-3 -lnl-3 -lpthread -lm  
+LIBNL_LIBS = -L<...>/build_arm_assimp_001/host/usr/arm-buildroot-uclinux-uclibcgnueabi/sysroot/usr/lib -pthread -lm -lnl-genl-3 -lnl-3 -lpthread -lm  
 LIBOBJS =  ${LIBOBJDIR}strtod$U.o
 LIBS = -lpthread -lncurses -lintl
 LIBTOOL = $(SHELL) $(top_builddir)/libtool

	$ make
make  all-am
make[1]: Entering directory '/home/seiderer/Work/zeiss/freescale-imx6/build_arm_assimp_001/build/powertop-2.7/src'
  CXXLD    powertop
make[1]: Leaving directory '/home/seiderer/Work/zeiss/freescale-imx6/build_arm_assimp_001/build/powertop-2.7/src'

Regards,
Peter

[1] http://lists.busybox.net/pipermail/buildroot/2016-September/173004.html


> Thanks a lot!
> 
> Thomas
> 
> > 
> > On Thu, Sep 22, 2016 at 11:30 PM, Thomas Petazzoni
> > <thomas.petazzoni@free-electrons.com> wrote:
> > > Hello,
> > >
> > > This is the list of Buildroot build failures that occured on
> > > 2016-09-22, and for which you are a registered architecture developer
> > > or package developer. Please help us improving the quality of
> > > Buildroot by investigating those build failures and sending patches to
> > > fix them. Thanks!
> > >
> > > Build failures related to your packages:
> > >
> > >         m68k |                   powertop-2.7 | http://autobuild.buildroot.net/results/5c63959a89d5761fdefe3bfd36c8168dbe882dc9
> > >
> > > --
> > > http://autobuild.buildroot.net  
> 
> 
> 
