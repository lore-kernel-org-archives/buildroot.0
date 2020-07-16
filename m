From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Jul 2020 09:39:20 +0200
Subject: [Buildroot] Specifying march extensions for the toolchain
In-Reply-To: <CA+h8R2qy+s9z_DzYuNMyhfbxKvKQ8cJ5XBRA9w48HDn4eC7T4g@mail.gmail.com>
References: <CA+h8R2qy+s9z_DzYuNMyhfbxKvKQ8cJ5XBRA9w48HDn4eC7T4g@mail.gmail.com>
Message-ID: <20200716093920.3765363a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 15 Jul 2020 21:20:16 -0700
Christian Stewart <christian@paral.in> wrote:

> When using the Buildroot toolchain, the toolchain-wrapper is used,
> which specifies march=GCC_TARGET_ARCH.
> 
> When using armv8, GCC_TARGET_ARCH is as expected, "armv8a."
> 
> However, there are optional extensions to the instruction set - for
> example, one can specify "armv8a+crypto+crc" would enable the crypto,
> crc extensions.
> 
> Would the best way to specify extensions be:
> 
> BR2_TARGET_OPTIMIZATION="-march=armv8a+crypto+crc"
> 
> Or is there a better way to specify the march override, which inherits
> the BR2_ARCH value?

I think we would probably want to add some explicit Config.in options
in arch/Config.in.arm so that the user can declare what features are
supported by its particular AArch64 core. It is worth mentioning that
some features are already implicitly enabled depending on the CPU core
you select:

     ARCH value     Architecture   Includes by default
     --------------------------------------------------------------------------
     'armv8-a'      Armv8-A        '+fp', '+simd'
     'armv8.1-a'    Armv8.1-A      'armv8-a', '+crc', '+lse', '+rdma'
     'armv8.2-a'    Armv8.2-A      'armv8.1-a'
     'armv8.3-a'    Armv8.3-A      'armv8.2-a'
     'armv8.4-a'    Armv8.4-A      'armv8.3-a', '+fp16fml', '+dotprod'
     'armv8.5-a'    Armv8.5-A      'armv8.4-a', '+sb', '+ssbs', '+predres'
     'armv8.6-a'    Armv8.6-A      'armv8.5-a', '+bf16', '+i8mm'

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
