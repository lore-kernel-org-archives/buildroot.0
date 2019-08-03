From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Aug 2019 10:44:03 +0200
Subject: [Buildroot] [PATCH v2 2/2] board/sifive: Add the HiFive Unleased
In-Reply-To: <20190722204447.7935-2-alistair.francis@wdc.com>
References: <20190722204447.7935-1-alistair.francis@wdc.com>
 <20190722204447.7935-2-alistair.francis@wdc.com>
Message-ID: <20190803104403.727906e6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alistair,

The commit title should have been:

	configs/hifive_unleashed: new defconfig

On Mon, 22 Jul 2019 13:44:47 -0700
Alistair Francis <alistair.francis@wdc.com> wrote:

> This patch adds support for the HiFive Unleashed board. This includes
> building the firmware, kernel and rootFS for the HiFive Unleased.
> 
> This patch includes a post-image.sh script and genimage.cfg file
> used to generate a sdcard image that can be dd-ed to an SD card.
> 
> The manual steps are useful even when genimage works as
> users won't always need to flash the entire SD card. For example a
> kernel update will only require one partition being updated manually via
> dd instead of a full reflash.

Documenting such manual steps is not very useful in readme.txt.
readme.txt is only meant as a very introductory document on how to use
the image produced by Buildroot. More advanced use-cases cannot all be
documented in readme.txt files, so I dropped that part from readme.txt.


>  N:	Alvaro G. M <alvaro.gamez@hazent.com>
> diff --git a/board/sifive/hifive_unleased/genimage.cfg b/board/sifive/hifive_unleased/genimage.cfg

The folder board/sifive/hifive_unleased/ had a typo: unleased ->
unleashed. This typo was also in the title of your commit.


> diff --git a/board/sifive/hifive_unleased/post-image.sh b/board/sifive/hifive_unleased/post-image.sh
> new file mode 100755
> index 0000000000..2051ee49cb
> --- /dev/null
> +++ b/board/sifive/hifive_unleased/post-image.sh
> @@ -0,0 +1,9 @@
> +#!/bin/sh
> +
> +# Script to generate a SD card image for the HiFive Unleashed.
> +
> +# We need to make sure that this is updated
> +make opensbi-rebuild

This is not necessary: at the end of a build, opensbi will have been
built after linux, so it's updated. It's only if you later change the
linux configuration again that you need to regenerate the opensbi
package. Buildroot only guarantees that a build output is correct for
completely clean builds, so I dropped this. This makes the
post-image.sh script useless, because we can use
support/scripts/genimage.sh.

I fixed those different aspects, and merged the patch. See the final
commit at:

  https://git.buildroot.org/buildroot/commit/?id=86531fae3e3c7ea59430cd0f86260d20fafa9b16

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
