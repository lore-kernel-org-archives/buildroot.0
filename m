From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Jul 2016 11:53:31 +0200
Subject: [Buildroot] [PATCH] toolchain: add hidden symbol for PIE support
In-Reply-To: <20160709112030.GA25741@waldemar-brodkorb.de>
References: <20160709112030.GA25741@waldemar-brodkorb.de>
Message-ID: <20160711115331.65c8e054@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 9 Jul 2016 13:20:30 +0200, Waldemar Brodkorb wrote:
> uClibc-ng does not support PIE for some architectures as
> arc and m68k. It isn't implemented in the static linking case, too.
> With musl toolchains you might have static PIE support with little
> patching of gcc. Static linking for GNU libc isn't enabled in
> buildroot. Fixup any package using special treatment of PIE.
> (grep -ir pie package/*/*.mk)
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Thanks for doing this! One question below, though.

> +config BR2_TOOLCHAIN_SUPPORTS_PIE
> +	bool
> +	depends on !BR2_STATIC_LIBS && !BR2_arc && !BR2_m68k

Should this be:

	default y
	depends on !(BR2_STATIC_LIBS && BR2_TOOLCHAIN_USES_UCLIBC) &&
		!BR2_arc && !BR2_m68k

First, a "default y" otherwise I'm not sure the option is ever enabled.
And then, it's really only uClibc that doesn't support static PIE:

 * glibc doesn't do BR2_STATIC_LIBS=y builds, so it doesn't matter.

 * musl can support static PIE binaries, see the gcc patch I pointed to
   you recently about musl static PIE support.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
