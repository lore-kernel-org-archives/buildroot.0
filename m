From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 6 Nov 2018 23:32:26 +0100
Subject: [Buildroot] [PATCH v1] libv4l: add missing bpf_common.h header
In-Reply-To: <CAPi7W833FdDxhQyXmJrTRAQgd2u-CFvyL_pqOTC9kdK+6AO8FA@mail.gmail.com>
References: <20181102190108.29507-1-ps.report@gmx.net>
 <20181103142810.7c8fe947@windsurf>
 <20181105215927.2d4bd31a@gmx.net>
 <CAPi7W833FdDxhQyXmJrTRAQgd2u-CFvyL_pqOTC9kdK+6AO8FA@mail.gmail.com>
Message-ID: <20181106233226.32d038f6@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Tue, 6 Nov 2018 21:01:31 +0100, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Dear Peter,
> Le lun. 5 nov. 2018 ? 21:59, Peter Seiderer <ps.report@gmx.net> a ?crit :
> >
> > Hello Thomas,
> >
> > On Sat, 3 Nov 2018 14:28:10 +0100, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> >  
> > > Hello,
> > >
> > > On Fri,  2 Nov 2018 20:01:08 +0100, Peter Seiderer wrote:  
> > > > Fixes [1] (for older toolchains not providing this header):
> > > >
> > > >     CC       keytable.o
> > > >   In file included from bpf.h:26:0,
> > > >                    from keytable.c:37:
> > > >   ../../include/linux/bpf.h:12:10: fatal error: linux/bpf_common.h: No such file or directory
> > > >    #include <linux/bpf_common.h>
> > > >             ^~~~~~~~~~~~~~~~~~~~
> > > >
> > > > [1] http://autobuild.buildroot.org/results/d22c0939eed4bc949f7eaeae7595d01ec45cc2cd
> > > >
> > > > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > > > ---
> > > >  .../0005-Add-missing-linux-bpf_common.h.patch | 80 +++++++++++++++++++
> > > >  1 file changed, 80 insertions(+)
> > > >  create mode 100644 package/libv4l/0005-Add-missing-linux-bpf_common.h.patch  
> > >
> > > Applied to master, thanks. Could you submit this upstream? Thanks!  
> >
> > Yes, just done, see [1]...  
> Thanks for submitting this patch however build failures remain on some
> architectures (ARM cortex a8 / a9 / arm926ej-s) with "old" kernel
> headers (3.13) :
> - http://autobuild.buildroot.org/results/b48/b48f9b284102d94b847a35ed1ca50a157fbcb1c9/build-end.log
> - http://autobuild.buildroot.org/results/339/3391705aca7022111ef743212b7cad57f0cdea9a/build-end.log
> 
> Build failures are raised because _NR_bpf is not defined:
> 
> bpf.c:48:4: error: #error __NR_bpf not defined. libbpf does not
> support your arch.
>  #  error __NR_bpf not defined. libbpf does not support your arch.
> 
> From my understanding, __NR_bpf should be normally defined by the
> kernel (when it is not too old).
> For example, __NR_bpf has been defined for m68k and powerpc since 3.18:
> - https://github.com/torvalds/linux/commit/f7bbd12a4b7e088f53f20dd31019984459699fb9
> - https://github.com/torvalds/linux/commit/fcbb539f279f7d854bd49819b889fea0612909f8
> The code in bpf.c only defines fallback for very few few
> architectures: i386, x86_64, aarch64, sparc and s390.
> 
> So finally, should we add a dependency on
> BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18 on a new
> BR2_PACKAGE_LIBV4L_KEYTABLE_BPF_PROTOCOLS option?

Or add a fallback value for arm (need to investigate the right value for it)...

Regards,
Peter

> >
> > Regards,
> > Peter
> >
> > [1] https://www.mail-archive.com/linux-media at vger.kernel.org/msg136103.html
> >  
> > >
> > > Thomas  
> >  
> Best Regards,
> 
> Fabrice
