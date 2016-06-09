From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jun 2016 00:35:03 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/freeswitch: enable video
 support
In-Reply-To: <1461445358-32052-1-git-send-email-bernd.kuhls@t-online.de>
References: <1461445358-32052-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160610003503.7ebe8f20@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 23 Apr 2016 23:02:38 +0200, Bernd Kuhls wrote:

> +# needed in addition for patch 0003 for cross-compiling libs/libvpx
> +ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
> +# host/opt/ext-toolchain/bin/ is not part of $PATH, instead of passing

And this is intentional, because you should never call binaries in
host/opt/ext-toolchain/bin/.

> +# GNU_TARGET_NAME we need to pass TOOLCHAIN_EXTERNAL_CROSS which stores
> +# the full path, needed to avoid build error with external toolchains,
> +# quote from compile log:
> +#    [AR] libvpx_g.a
> +# make[3]: x86_64-buildroot-linux-musl-ar: Command not found
> +# or
> +# make[3]: sparc64-buildroot-linux-gnu-ar: Command not found
> +FREESWITCH_MAKE_ENV += CROSS=$(TOOLCHAIN_EXTERNAL_CROSS)
> +else
> +FREESWITCH_MAKE_ENV += CROSS=$(GNU_TARGET_NAME)-
> +endif

Have you tried replacing this complicated stuff with just:

   FREESWITCH_MAKE_ENV += CROSS=$(TARGET_CROSS)

$(TARGET_CROSS) is already defined properly depending on
internal/external.

Could you check if that works and submit an updated version?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
