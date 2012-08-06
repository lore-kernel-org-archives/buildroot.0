From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Aug 2012 14:50:30 +0200
Subject: [Buildroot] [PATCH 2/2] buildroot:package: Avoids prefix
 absolute compiler path when external toolchain path is empty.
In-Reply-To: <1344251847-7709-2-git-send-email-sonic.adi@gmail.com>
References: <1344251847-7709-1-git-send-email-sonic.adi@gmail.com>
 <1344251847-7709-2-git-send-email-sonic.adi@gmail.com>
Message-ID: <20120806145030.68102835@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 6 Aug 2012 19:17:26 +0800,
Sonic Zhang <sonic.adi@gmail.com> a ?crit :

> From: Sonic Zhang <sonic.zhang@analog.com>
> 
> Current external compiler is always prefixed by he customer path.
> When external toolchain path is left empty, this patch avoids prefix absolute path.
> 
> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
> ---
>  package/Makefile.in |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 6fad224..ecbdc00 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -101,8 +101,13 @@ TARGET_LDFLAGS=$(call qstrip,$(BR2_TARGET_LDFLAGS))
>  ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_CTNG),y)
>  TARGET_CROSS=$(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-
>  else
> +TOOLCHAIN_EXTERNAL_LOCATION=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH))
> +ifeq ($(TOOLCHAIN_EXTERNAL_LOCATION),)
> +TARGET_CROSS=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))-
> +else
>  TARGET_CROSS=$(HOST_DIR)/usr/bin/$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))-
>  endif
> +endif

I am sorry but this is not correct. It will lead to packages calling
directly the compiler without going through our external toolchain
wrapper, which is mandatory to ensure that the correct sysroot (and
other flags) are passed correctly.

Passing an empty BR2_TOOLCHAIN_EXTERNAL_PATH works just fine for me if
the toolchain binaries are in the PATH.

Could you explain in more details what you are trying to achieve here?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
