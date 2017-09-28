From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 28 Sep 2017 11:18:51 -0700
Subject: [Buildroot] [PATCH] pdbg: bump version to latest
In-Reply-To: <20170927021547.19421-1-joel@jms.id.au>
References: <20170927021547.19421-1-joel@jms.id.au>
Message-ID: <CAKmqyKODhJeyrG3kTXcLjx_NvHKNdmJnzM6k=HkDL1MfrMWO1g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 26, 2017 at 7:15 PM, Joel Stanley <joel@jms.id.au> wrote:
> I got this error when attempting to build:
>
>  aclocal: error: couldn't open directory 'm4': No such file or directory

When do you get this error?

>
> So we now have the post patch hook to ensure the m4 directory is
> present.

Why is this up to the builder to create this directory? Shouldn't it
be created by the packages make system?

>
> In addition, the package now sets a variable with the Git SHA1 so that
> the binary contians the expected output for --version.

Maybe that should be a separate patch?

Thanks,
Alistair

>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  package/pdbg/pdbg.hash | 2 +-
>  package/pdbg/pdbg.mk   | 9 ++++++++-
>  2 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/package/pdbg/pdbg.hash b/package/pdbg/pdbg.hash
> index 16bf58024c61..2aec71817770 100644
> --- a/package/pdbg/pdbg.hash
> +++ b/package/pdbg/pdbg.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256 8edabb9ae98ce3b1892b768f2ee5e779a00476b63cdcc6f905e8464a0b7d96a3 pdbg-90a7370a11e727f1482dea6ff2bd6aec20c64805.tar.gz
> +sha256 e0b81fc65eb83692c5c07d7ae109882cefebf663444b7ea804d0544451c1a72f pdbg-77158819158d1d7053a737ac090d04fdfbfe9265.tar.gz
> diff --git a/package/pdbg/pdbg.mk b/package/pdbg/pdbg.mk
> index 184de8650d37..0864a6de9cd8 100644
> --- a/package/pdbg/pdbg.mk
> +++ b/package/pdbg/pdbg.mk
> @@ -4,10 +4,17 @@
>  #
>  ################################################################################
>
> -PDBG_VERSION = 90a7370a11e727f1482dea6ff2bd6aec20c64805
> +PDBG_VERSION = 77158819158d1d7053a737ac090d04fdfbfe9265
>  PDBG_SITE = $(call github,open-power,pdbg,$(PDBG_VERSION))
>  PDBG_LICENSE = Apache-2.0
>  PDBG_LICENSE_FILES = COPYING
>  PDBG_AUTORECONF = YES
>
> +PDBG_MAKE_OPTS = "GIT_SHA1=\"${PDBG_VERSION}\""
> +
> +define PDBG_PATCH_M4
> +       mkdir -p $(@D)/m4
> +endef
> +PDBG_POST_PATCH_HOOKS += PDBG_PATCH_M4
> +
>  $(eval $(autotools-package))
> --
> 2.14.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
