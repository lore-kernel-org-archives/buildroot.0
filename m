From: Joel Stanley <joel@jms.id.au>
Date: Tue, 5 Jul 2016 22:34:58 +0930
Subject: [Buildroot] [PATCH 5/5] binutils: fix build of 2.26 when
 makeinfo is not available
In-Reply-To: <1467712019-24632-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1467712019-24632-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1467712019-24632-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CACPK8XdKsV33bgBR=k6XXW47y_mnF2jkd=1Zo1K_k54ggjFiBA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Jul 5, 2016 at 7:16 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> The 2.26 binutils tarball has incorrect timestamps for the .info files,
> so binutils build system tries to regenerate them with makeinfo. In
> order to avoid depending on host-texinfo, we simply touch the .info
> files so that their timestamp is newer than the corresponding source
> files.

Nice. We were hitting this too[1], and I spent today looking at it. I
just sent a patch. but if you prefer your method then please ignore.

The other solutions we found were to add MAKEINFO=true to the command
line, or to do what the ARC toolchain guys did and modify the check in
all of the makefiles.

[1] https://github.com/open-power/op-build/issues/507
[2] http://patchwork.ozlabs.org/patch/644726/

Cheers,

Joel

>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/binutils/binutils.mk | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
> index 33aaf85..50a3531 100644
> --- a/package/binutils/binutils.mk
> +++ b/package/binutils/binutils.mk
> @@ -33,6 +33,17 @@ BINUTILS_DEPENDENCIES += host-flex host-bison host-texinfo
>  HOST_BINUTILS_DEPENDENCIES += host-flex host-bison host-texinfo
>  endif
>
> +# The .info files in the 2.26 tarball have an incorrect timestamp, so
> +# binutils tries to re-generate them. In order to avoid the dependency
> +# on host-texinfo, we simply update the timestamps.
> +ifeq ($(BR2_BINUTILS_VERSION_2_26_X),y)
> +define BINUTILS_FIXUP_INFO_TIMESTAMPS
> +       find $(@D) -name '*.info' -exec touch {} \;
> +endef
> +BINUTILS_POST_PATCH_HOOKS += BINUTILS_FIXUP_INFO_TIMESTAMPS
> +HOST_BINUTILS_POST_PATCH_HOOKS += BINUTILS_FIXUP_INFO_TIMESTAMPS
> +endif
> +
>  # When binutils sources are fetched from the binutils-gdb repository,
>  # they also contain the gdb sources, but gdb shouldn't be built, so we
>  # disable it.
> --
> 2.7.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
