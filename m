From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 12 Jan 2015 23:13:36 +0100
Subject: [Buildroot] [PATCH v2 2/4] dtc: bump version to 1.4.1
In-Reply-To: <20150112210703.240c3518@free-electrons.com>
References: <1421000166-24963-1-git-send-email-ps.report@gmx.net>
 <1421000166-24963-2-git-send-email-ps.report@gmx.net>,
 <20150112210703.240c3518@free-electrons.com>
Message-ID: <trinity-2d851b21-4f44-408c-8752-cc84688cc5f4-1421100815924@3capp-gmx-bs16>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

> Gesendet: Montag, 12. Januar 2015 um 21:07 Uhr
> Von: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> An: "Peter Seiderer" <ps.report@gmx.net>
> Cc: buildroot at busybox.net
> Betreff: Re: [Buildroot] [PATCH v2 2/4] dtc: bump version to 1.4.1
>
> Dear Peter Seiderer,
> 
> On Sun, 11 Jan 2015 19:16:04 +0100, Peter Seiderer wrote:
> > Patch 0001-separate-lib-install.patch is no longer needed,
> > original Makefile already contains separate install-lib target.
> > 
> > Adjust 0002-extra-cflags.patch.
> > 
> > Add hash file.
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> > Changes v1 -> v2:
> >   - delete additional invalid comment
> 
> This patch breaks the build, when building only the libfdt and not the
> programs:
> 
> >>> dtc 1.4.1 Installing to staging directory
> /usr/bin/make -j5 -C /home/thomas/projets/buildroot/output/build/dtc-1.4.1 DESTDIR=/home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot PREFIX=/usr install-lib
> make[1]: Entering directory '/home/thomas/projets/buildroot/output/build/dtc-1.4.1'
> 	CHK version_gen.h
> 	 CC util.o
> 	 CC srcpos.o
> 	 CC convert-dtsv0-lexer.lex.o
> 	 CC dtc.o
> 	 CC checks.o
> 	 CC data.o
> 	 CC flattree.o
> 	 CC fstree.o
> 	 CC livetree.o
> 	 CC dtc-lexer.lex.o
> 	 CC treesource.o
> 	 CC dtc-parser.tab.o
> 	 CC fdtdump.o
> 	 CC fdtget.o
> 	 CC fdtput.o
> 	 LD fdtdump
> 	 LD convert-dtsv0
> 	 LD fdtget
> 	 LD dtc
> /usr/bin/ld: libfdt/libfdt.a(fdt.o): Relocations in generic ELF (EM: 40)
> libfdt/libfdt.a: error adding symbols: File in wrong format
> collect2: error: ld returned 1 exit status
> Makefile:236: recipe for target 'fdtget' failed
> make[1]: *** [fdtget] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make[1]: Leaving directory '/home/thomas/projets/buildroot/output/build/dtc-1.4.1'
> 
> This is due to the fact that the install-lib target depends on all.
> When building only libfdt, we do "make libfdt" during the build step,
> and then "make install-lib" during the install step, and this triggers
> the build of the DTC programs, due to the dependency on the all target.
> Unfortunately, since we don't pass CC, LD and al. at install time, this
> doesn't work.
> 
> So I would suggest to just build everything (i.e plain "make" for the
> build), and then use install-lib.
> 

Many thanks for testing (and failure analysis), will try your suggestion
and respin the patchset...

Regards,
Peter

> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> 
