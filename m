From: Michael S. Zick <minimod@morethan.org>
Date: Sun, 18 Dec 2011 07:53:49 -0600
Subject: [Buildroot] [Bug 4634] New: Bigendian binary is output even if
	it is configured to output little endian
In-Reply-To: <201112180733.12681.minimod@morethan.org>
References: <bug-4634-163@https.bugs.busybox.net/>
 <201112180733.12681.minimod@morethan.org>
Message-ID: <201112180753.51312.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun December 18 2011, Michael S. Zick wrote:
> On Sat December 17 2011, bugzilla at busybox.net wrote:
> > https://bugs.busybox.net/show_bug.cgi?id=4634
> > 
> >            Summary: Bigendian binary is output even if it is configured to
> >                     output little endian
> >            Product: buildroot
> >            Version: 2011.11
> >           Platform: PC
> >         OS/Version: Linux
> >             Status: NEW
> >           Severity: major
> >           Priority: P5
> >          Component: Other
> >         AssignedTo: unassigned at buildroot.uclibc.org
> >         ReportedBy: matusita at k-micro.com
> >                 CC: buildroot at uclibc.org
> >    Estimated Hours: 0.0
> > 
> > 
> > I set build options as below in "make menuconfig" to build root filesystem:
> >   Target Architecture (mipsel)
> >   Target Architecture Variant (mips 32r2)
> >   Toolcain-Toolchain type (External toolchain)
> >   Toolcain-Toolchain (CodeSourcery MIPS 2011.03)
> > 
> > I expected that little enfian binary will be output because "mipsel" is
> > selected. But it was big endian.
> > I confirmed it by objdump with "-f" option like below.
> > 
> >   % mips-linux-gnu-objdump -f busybox
> >     busybox:     file format elf32-tradbigmips      <-- Big endian !!!
> >     architecture: mips:isa32r2, flags 0x00000112:
> >     EXEC_P, HAS_SYMS, D_PAGED
> >     start address 0x00403f00
> > 
> > So, I saw following file:
> >   toolchain/toolchain-external/ext-tool.mk
> > 
> > And I understand that this script get libraries' location by calling
> > (prefix)-gcc with following options:
> >   -print-sysroot
> >   -print-file-name=libc.a
> > 
> > But as for this toolchain(CodeSourcery MIPS 2011.03), it is need to set "-EL"
> > option as well to get correct location of little endian libraries.
> > 
> 
> I think that the endian default is a gcc build-time option and some builders
> do select (or it defaults to) little endian.
> 
> But the CS toolchains do default to big endian.
> Too be more general purpose, perhaps there should also be a "knob" to pass
> -mno-mips16 since the gcc default is to produce mixed 16/32 (or 16/64) bit
> code and the mips16e decoder is not a core requirement.
> 
> http://openplayer.org/resource/tutorials/57-cs-multi-library-tour.html
> 
PS:
Another point -

The MIPS recommendation for code generation is to use:
-Os (the BR default) when compiling 'pure' code and to use:
-O2 when compiling mixed code (gcc defaults to mixed code).

Mike
> Mike
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 
