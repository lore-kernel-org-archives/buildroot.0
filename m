From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 7 Nov 2018 20:05:51 +0100
Subject: [Buildroot] [PATCH v1] libv4l: add missing bpf_common.h header
In-Reply-To: <87h8gsbz8o.fsf@dell.be.48ers.dk>
References: <20181102190108.29507-1-ps.report@gmx.net>
 <20181103142810.7c8fe947@windsurf>
 <20181105215927.2d4bd31a@gmx.net>
 <CAPi7W833FdDxhQyXmJrTRAQgd2u-CFvyL_pqOTC9kdK+6AO8FA@mail.gmail.com>
 <87h8gsbz8o.fsf@dell.be.48ers.dk>
Message-ID: <CAPi7W814qXc6DEGPm1c0z5oq4TGp66-xwcep-5t+OCL8fqCJaQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter,
Le mer. 7 nov. 2018 ? 17:59, Peter Korsgaard <peter@korsgaard.com> a ?crit :
>
> >>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
>
> Hi,
>
>  > Thanks for submitting this patch however build failures remain on some
>  > architectures (ARM cortex a8 / a9 / arm926ej-s) with "old" kernel
>  > headers (3.13) :
>  > - http://autobuild.buildroot.org/results/b48/b48f9b284102d94b847a35ed1ca50a157fbcb1c9/build-end.log
>  > - http://autobuild.buildroot.org/results/339/3391705aca7022111ef743212b7cad57f0cdea9a/build-end.log
>
>  > Build failures are raised because _NR_bpf is not defined:
>
>  > bpf.c:48:4: error: #error __NR_bpf not defined. libbpf does not
>  > support your arch.
>  >  #  error __NR_bpf not defined. libbpf does not support your arch.
>
>  > From my understanding, __NR_bpf should be normally defined by the
>  > kernel (when it is not too old).
>  > For example, __NR_bpf has been defined for m68k and powerpc since 3.18:
>  > - https://github.com/torvalds/linux/commit/f7bbd12a4b7e088f53f20dd31019984459699fb9
>  > - https://github.com/torvalds/linux/commit/fcbb539f279f7d854bd49819b889fea0612909f8
>  > The code in bpf.c only defines fallback for very few few
>  > architectures: i386, x86_64, aarch64, sparc and s390.
>
> But the fallback only fixes setups with older kernel headers than the
> runtime kernel, which is IMHO fairly rare in Buildroot - Unless the tool
> works correctly when the bpf syscall fails.
>
>  > So finally, should we add a dependency on
>  > BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18 on a new
>  > BR2_PACKAGE_LIBV4L_KEYTABLE_BPF_PROTOCOLS option?
>
> The BPF_PROTOCOLS conditional seems to be about using clang to compile
> bdf byte code, which is not directly the code that is failing here.
>
> If it is easy to disable bpf support completely, then that is probably
> the nicest solution, otherwise I am fine with depending on 3.18, that is
> after all almost 4 years old by now.
Thanks for your feedback, I will add a --without-libelf option to configure.ac.
>
> --
> Bye, Peter Korsgaard
Best Regards,

Fabrice
