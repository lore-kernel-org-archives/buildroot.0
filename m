From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Sep 2015 15:24:01 +0200
Subject: [Buildroot] [PATCH 2/3] Fix elf2flt build when LTO is enabled
In-Reply-To: <1441470809-23403-1-git-send-email-public.douglas.raillard@gmail.com>
References: <1441470809-23403-1-git-send-email-public.douglas.raillard@gmail.com>
Message-ID: <20150906152401.67d5df05@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Douglas RAILLARD,

On Sat,  5 Sep 2015 18:33:29 +0200, Douglas RAILLARD wrote:

> diff --git a/package/elf2flt/elf2flt.mk b/package/elf2flt/elf2flt.mk
> index 3fcada4..d028259 100644
> --- a/package/elf2flt/elf2flt.mk
> +++ b/package/elf2flt/elf2flt.mk
> @@ -21,6 +21,12 @@ HOST_ELF2FLT_CONF_OPTS = \
>  	--with-libiberty=$(HOST_BINUTILS_DIR)/libiberty/libiberty.a \
>  	--target=$(GNU_TARGET_NAME)
>  
> +

Unnecessary new line addition.

>  HOST_ELF2FLT_CONF_ENV = LIBS=-lz
>  
> +ifeq ($(BR2_GCC_ENABLE_LTO),y)
> +	HOST_ELF2FLT_CONF_ENV = LIBS="-lz -ldl"

Don't intend variables.

Also, please change this to:

HOST_ELF2FLT_LIBS = -lz

ifeq ($(BR2_GCC_ENABLE_LTO),y)
HOST_ELF2FLT_LIBS += -ldl
endif

HOST_ELF2FLT_CONF_ENV = LIBS="$(HOST_ELF2FLT_LIBS)"

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
