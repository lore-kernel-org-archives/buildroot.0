From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Jan 2015 09:29:44 +0100
Subject: [Buildroot] [PATCH] toolchain: Use the correct target name
In-Reply-To: <54B843D7.1030602@dawncrow.de>
References: <54B843D7.1030602@dawncrow.de>
Message-ID: <20150116092944.06e31910@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andr? Hentschel,

On Thu, 15 Jan 2015 23:48:55 +0100, Andr? Hentschel wrote:
> When using an external toolchain we need to use the toolchain prefix
> for the staging directory and e.g. for configure.
> 
> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
> ---
> This fixes cross compiling Wine (not yet upstream because of that).
> 
>  package/Makefile.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 2055f00..0a00c7e 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -36,7 +36,11 @@ $(error BR2_TOOLCHAIN_BUILDROOT_VENDOR cannot be 'unknown'. \
>  endif
> 
>  # Compute GNU_TARGET_NAME
> +ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
>  GNU_TARGET_NAME = $(ARCH)-$(TARGET_VENDOR)-$(TARGET_OS)-$(LIBC)$(ABI)
> +else
> +GNU_TARGET_NAME = $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))
> +endif

I am not sure we want to do this actually. There is nothing that forces
the toolchain to have the same prefix as the host tuple. Except Wine
and its original build system.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
