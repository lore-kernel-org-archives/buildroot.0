From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 12 Jan 2009 15:38:50 +0100
Subject: [Buildroot] arch support
In-Reply-To: <496B5427.6040103@sonycom.com> (Hamish Guthrie's message of "Mon\,
	12 Jan 2009 15\:31\:03 +0100")
References: <87ljtgj44z.fsf@macbook.be.48ers.dk> <496B5427.6040103@sonycom.com>
Message-ID: <87iqokh9mt.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hamish" == Hamish Guthrie <hamish.guthrie@sonycom.com> writes:

Hi,

 >> I just finished building the defconfigs for all the archs (uclibc
 >> 0.9.30 / kernel headers 2.6.28 / binutils 2.19 / gcc 4.3.2 except for
 >> avr32 which does it's own thing)
 >> 
 Hamish> I have been trying to build for various arch's (powerpc, mips, i386)
 Hamish> with the above toolchain selections, but always wind up with the
 Hamish> error:

 Hamish> configure: error: cannot compute suffix of object files: cannot compile
 Hamish> See `config.log' for more details.

 Hamish> during the gcc-4.3.2-initial stage of the build.

Strange - Are you building in a clean tree? What host are you using?

 Hamish> Are you building against HEAD?

Yes.

 Hamish> Would it be possible for you to send me your powerpc defconfig please?

It's simple rm .config, make menuconfig, select ppc and the correct
toolchain versions.

I use a script like this:

cat ~/bin/br-build-arch                                             ~
#!/bin/sh

[ -e Config.in ] || { echo Must be in buildroot dir >&2; exit 1; }

unset GREP_OPTIONS
rm -f .config
make menuconfig

ARCH=$(grep BR2_ARCH= .config|cut -f2 -d\")

# use download dir, gcc 4.3.2 and kernel headers 2.6.28
sed -i  -e 's~BR2_DL_DIR=.*$~BR2_DL_DIR="/var/lib/downloads"~' \
 -e 's~^.*BR2_GCC_VERSION_4_2_4.*$~# BR2_GCC_VERSION_4_2_4 is not set~' \
 -e 's~^.*BR2_GCC_VERSION_4_3_2.*$~BR2_GCC_VERSION_4_3_2=y~' \
 -e 's~^.*BR2_KERNEL_HEADERS_2_6_27.*~# BR2_KERNEL_HEADERS_2_6_27 is not set~' \
 -e 's~^.*BR2_KERNEL_HEADERS_2_6_28.*~BR2_KERNEL_HEADERS_2_6_28=y~' \
 .config
yes ''|make oldconfig
make O=/tmp/br/$ARCH 2>&1 | tee /tmp/br/$ARCH.log


Where /var/lib/downloads is my local download dir.

-- 
Bye, Peter Korsgaard
