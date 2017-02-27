From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Feb 2017 09:29:13 +0100
Subject: [Buildroot] [PATCH] vlc: workaround microblaze gcc internal
 compiler error
In-Reply-To: <20170227060725.GA27933@waldemar-brodkorb.de>
References: <20170227060725.GA27933@waldemar-brodkorb.de>
Message-ID: <20170227092913.55b940f6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 27 Feb 2017 07:07:25 +0100, Waldemar Brodkorb wrote:
> Override gcc optimization flags with -O0.
> 
> The workaround is not required for gcc6 anymore, but
> gcc6 is disabled for microblaze, because it breaks startup 
> of the system somehow. So the bug is not reported upstream.

If it's not required for gcc6, then perhaps we should add a
BR2_TOOLCHAIN_GCC_AT_LEAST_6 condition, so that this chunk gets a
chance to be removed at some point in the future.

> +# gcc bug internal compiler error: in merge_overlapping_regs, at regrename.c:304
> +ifeq ($(BR2_microblaze),y)

I.e.:

ifeq ($(BR2_microblaze):$(BR2_TOOLCHAIN_GCC_AT_LEAST_6),y:)

> +VLC_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -O0"
> +VLC_CONF_OPTS += --disable-optimizations
> +endif

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
