From: Simon van der Veldt <simon.vanderveldt@gmail.com>
Date: Sun, 17 Feb 2019 00:14:57 +0100
Subject: [Buildroot] [PATCH] linux: don't check hashes for user-supplied
 patches
In-Reply-To: <20190216183426.17548-1-yann.morin.1998@free.fr>
References: <20190216183426.17548-1-yann.morin.1998@free.fr>
Message-ID: <CAKDzfnqsQxZKDxgR=A-Vb3MgUheqwLpUV+qT8rtYEY9k3zyDWQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Feb 16, 2019 at 7:34 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> We have virtually no way to know the hashes for user-supplied patches,
> so we should just ignore them.
>
> Reported-by: Simon van der Veldt <simon.vanderveldt@gmail.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: Simon van der Veldt <simon.vanderveldt@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Peter Korsgaard <peter@korsgaard.com>
>
> ---
> Peter: this is a candidate for backporting to 2018.11.x and 2018.02.x
> ---
>  linux/linux.mk | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 8c21bad067..2b5d096e14 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -55,6 +55,9 @@ endif
>
>  LINUX_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
>
> +# We have no way to know the hashes for user-supplied patches.
> +BR_NO_CHECK_HASH_FOR += $(notdir $(LINUX_PATCHES))
> +
>  # We rely on the generic package infrastructure to download and apply
>  # remote patches (downloaded from ftp, http or https). For local
>  # patches, we can't rely on that infrastructure, because there might
> --
> 2.14.1
>

Did a test build with this patch applied and the kernel patches are
now correctly applied without failing the hash check :)
Thanks for the quick fix!

Simon
