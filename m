From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Feb 2018 08:51:38 +0100
Subject: [Buildroot] [PATCH 1/1] rustc: disable for ARMV7A with EABI
In-Reply-To: <20180226235226.62ad68b3@windsurf.lan> (Thomas Petazzoni's
 message of "Mon, 26 Feb 2018 23:52:26 +0100")
References: <20180226200421.18131-1-eric.le.bihan.dev@free.fr>
 <20180226235226.62ad68b3@windsurf.lan>
Message-ID: <87zi3uq391.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello,
 > On Mon, 26 Feb 2018 21:04:21 +0100, Eric Le Bihan wrote:
 >> The Rust project does not support armv7a EABI, only EABIHF [1]. So
 >> disable rustc for this ARM variant.

 > Are you sure ?

 >> [1] https://forge.rust-lang.org/platform-support.html

 > On this page, I see:

 > arm-unknown-linux-gnueabi 	? 	? 	? 	ARMv6 Linux
 > arm-unknown-linux-gnueabihf 	? 	? 	? 	ARMv6 Linux, hardfloat
 > armv7-unknown-linux-gnueabihf 	? 	? 	? 	ARMv7 Linux

 > The arm-unknown-linux-gnueabi variant should apply to ARMv7 as well.

Ok, but that is more of an improvement. It was still wrong that it tried
to download an ARMv7 EABI toolchain.

 > It looks like a better fix would be:

 > config BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 >         bool
 >         # The pre-built Rust standard library is only available for the
 >         # following architectures/ABIs, and is built against glibc.
 >         default y if BR2_i386
 >         default y if BR2_x86_64
 >         default y if BR2_aarch64
 > -       default y if BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5
 > +	default y if BR2_ARM_CPU_ARMV6 || BR2_ARM_CPU_ARMV7A

I agree that having positive logic would be nicer. It is a bit more
complicated than this as we also should handle ARMV8A cores in ARM mode
similar to how ve handle ARMV7A.

Care to send an updated patch on top of master doing that?

-- 
Bye, Peter Korsgaard
