From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Apr 2013 16:27:53 +0200
Subject: [Buildroot] [PATCH v6 4/7] arch: toolchain: Introduce binary
 format FLAT types.
In-Reply-To: <1366279592-9055-4-git-send-email-sonic.adi@gmail.com>
References: <1366279592-9055-1-git-send-email-sonic.adi@gmail.com>
 <1366279592-9055-4-git-send-email-sonic.adi@gmail.com>
Message-ID: <20130425162753.72991330@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sonic Zhang,

On Thu, 18 Apr 2013 18:06:29 +0800, Sonic Zhang wrote:
> From: Sonic Zhang <sonic.zhang@analog.com>
> 
> Just introduce the symbol and options in arch generic Config.in.
> Add FLAT types specific compiling flags into package makefile.
> 
> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>

You can now add my:

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

on this one.

> diff --git a/package/Makefile.in b/package/Makefile.in
> index a8bf36b..dd3bc7d 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -103,6 +103,17 @@ TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET
>  TARGET_CXXFLAGS = $(TARGET_CFLAGS)
>  TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
>  
> +ifeq ($(BR2_BINFMT_FLAT_SHARED),y)
> +TARGET_LDFLAGS += -mid-shared-library -mshared-library-id=0
> +TARGET_CFLAGS += -mid-shared-library -mshared-library-id=0
> +TARGET_CXXFLAGS += -mid-shared-library -mshared-library-id=0
> +endif
> +ifeq ($(BR2_BINFMT_FLAT_SEP_DATA),y)
> +TARGET_LDFLAGS += -msep-data
> +TARGET_CFLAGS += -msep-data
> +TARGET_CXXFLAGS += -msep-data
> +endif
> +

I had a discussion with Peter Korsgaard about this, and we've decided
to accept it as is, even though it should normally be part of the
external toolchain wrapper. But we haven't gotten to a nice and simple
solution for it, so let's do what you're proposing here.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
