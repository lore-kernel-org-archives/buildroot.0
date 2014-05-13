From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 May 2014 16:04:03 +0200
Subject: [Buildroot] [PATCH 0/1] Fix redundant usage of -mcpu and
 -march/-mtune
In-Reply-To: <1399989494-21343-1-git-send-email-kaszak@gmail.com>
References: <1399989494-21343-1-git-send-email-kaszak@gmail.com>
Message-ID: <20140513160403.6f7b1369@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Karoly Kasza,

Thanks for your report!

On Tue, 13 May 2014 15:58:13 +0200, Karoly Kasza wrote:

> I've been using the Linaro external toolchain in the latest GIT to generate ARM
> code. I've found that when using this external compiler, Buildroot
> compulsorily specifies the -mcpu and -march switches to GCC, which is redundant
> (-march and -mtune can be concluded from -mcpu, see
> http://gcc.gnu.org/onlinedocs/gcc/ARM-Options.html )
> While most of the time this only generates a warning, mmc-utils can not be
> compiled this way and probably other packages suffer from this as well.

Which mmc-utils problem have you seen? I've just tried building the
following configuration:

BR2_arm=y
BR2_cortex_a8=y
BR2_ARM_EABIHF=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_MMC_UTILS=y

And it just built fine, and uses a Linaro toolchain.

> I recommend altering toolchain/toolchain-external/toolchain-external.mk,
> so it won't supply redundant GCC switches.

The potential problem I see is that the code you're changing is used
for *all* architectures, but the change you're making has only been
made with ARM specificities in mind. Does ignoring -march and -mtune
when -mcpu is defined also works for all other architectures?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
