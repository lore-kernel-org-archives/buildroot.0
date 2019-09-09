From: Matthew Weber <matthew.weber@collins.com>
Date: Mon, 9 Sep 2019 08:49:12 -0500
Subject: [Buildroot] [External] Re: [PATCH 07/11] package/busybox: fix
 applets runtime issue when building with clang cross-compiler
In-Reply-To: <4215a70e-1973-3e99-4aa4-28df7f576368@smile.fr>
References: <20190906090947.5476-1-romain.naour@smile.fr>
 <20190906090947.5476-8-romain.naour@smile.fr>
 <CANQCQpYDyAcV6HkabqzVOBVPAgs9GA=ZtfronrAV=r=nt9LYVQ@mail.gmail.com>
 <4215a70e-1973-3e99-4aa4-28df7f576368@smile.fr>
Message-ID: <CANQCQpbzt8JAWvHWV6+SHj87YZGCPH2i9GPayiXeqodbz2ZLVA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,

On Sat, Sep 7, 2019 at 3:02 AM Romain Naour <romain.naour@smile.fr> wrote:
>
> Hi Matt,
>
> Le 07/09/2019 ? 05:11, Matthew Weber a ?crit :
> > Romain,
> >
> > On Fri, Sep 6, 2019 at 4:10 AM Romain Naour <romain.naour@smile.fr> wrote:
> >>
> >> Apply a patch contributed by Luis Marques on the Busybox mailing list [1]
> >> fixing a runtime issue (segfault) when busybox is compiled by Clang.
> >>
> >> The patch disable the compiler optimizations for Clang/LLVM only.
> >>
> >> Without this patch, busybox segfault with several applets
> >> (login on aarch64 using Clang 8.0.1, init on x86_64 using Clang 9.0.0rc3)
> >>
> >> [1] https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.busybox.net_pipermail_busybox_2019-2DJune_087337.html&d=DwIDaQ&c=ilBQI1lupc9Y65XwNblLtw&r=y1sOV0GV8NZUkffv7oCRxs2Sd3nOBS-NxDM3NY8lOgs&m=gE7oHor6AQZYHYD00ApKk2X5MH2LVRR_EyXIt5jiU4A&s=VKnAVOuzWWTy3aWJijmMwPLpl9NkHk2zZ5nx7u0A-mA&e=
> >>
> >
> > Got a "crtbegin.o no such file or directory" error when I setup a
> > build using master with qemu_aarch64_virt_defconfig (updated for
> > prebuilt external toolchain and enabling clang as cross-compiler).
> > https://urldefense.proofpoint.com/v2/url?u=https-3A__paste.ubuntu.com_p_wxrmVTGVvp_&d=DwIDaQ&c=ilBQI1lupc9Y65XwNblLtw&r=y1sOV0GV8NZUkffv7oCRxs2Sd3nOBS-NxDM3NY8lOgs&m=gE7oHor6AQZYHYD00ApKk2X5MH2LVRR_EyXIt5jiU4A&s=8olVqcVp_os9SDrgZ_W2pw6WsPZiOXiJqkBAI8aqnAI&e=
>
> Thanks for testing the series :)
>
> Ok, the "crtbegin.o no such file or directory" error mean that realpath command
> failed. It failed because the GCC external toolchain was not installed when the
> realpath command is executed, this is due to :
>
> # Allow host-clang to be build as part of the toolchain
> ifeq ($(BR2_USER_HOST_CLANG_AS_CROSS_COMPILER),y)
> HOST_CLANG_ADD_TOOLCHAIN_DEPENDENCY = NO
> endif
>
> I fixed this issue by adding an explicit dependency on toolchain-external:
>
> # Help host-clang to find our external toolchain, use a relative path from the clang
> # installation directory to the external toolchain installation directory in
> order to
> # not hardcode the toolchain absolute path.
> # Install the GCC external toolchain before executing realpath command.
> ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
> HOST_CLANG_DEPENDENCIES += toolchain-external
> HOST_CLANG_CONF_OPTS += -DGCC_INSTALL_PREFIX:PATH=`realpath
> --relative-to=$(HOST_DIR)/bin/ $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)`
> endif
>
> I'll send a v2 shortly.
>
> >
> > From your comment earlier on irc that you tested with 9.0.1 (x86_64
> > and aarch64), I wonder if this error is a difference between building
> > with clang 8.0.1 and 9.
>
> No no, that's me breaking my own patch :p
>
> >
> > I was able to build compiler-rt & libfuzzer with your series applied
> > and pass a runtime test (system still cross compiled with gcc but
> > using "[01/11] package/clang: help host-clang to find our external
> > toolchain" to find the sysroot).  This was instead of using the -B
> > option when building libfuzzer as part of the runtime test.
>
> That's great :)
>
> I'll try to upstream the patch then. I think Clang doesn't like when the
> toolchain sysroot is relocated because it doesn't seem to take into account the
> GCC search patch.
>
> Maybe your libfuzzer may be added at the end of the series (with a dependency on
> Clang cross-compiler option)?

I think the current compiler RT run-time test case is still valid as
you could use the libfuzzer as a way to test the compiler-rt is
working when your primary system is built with GCC.  However you do
have a point that libfuzzer could be added as a package when
compiler-rt is enabled and Clang is the cross-compiler.  I think I'd
still have to keep a copy in the run-time test br2-external for the
test case?

Matt
