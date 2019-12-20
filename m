From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 20 Dec 2019 23:16:36 +0100
Subject: [Buildroot] [PATCH 1/1] puredata: new package
In-Reply-To: <CANhOOmj6MaLzh-q=AiKWqNWeNi1yLsd99hbofiag4+V4vFtjwg@mail.gmail.com>
References: <CANhOOmj6MaLzh-q=AiKWqNWeNi1yLsd99hbofiag4+V4vFtjwg@mail.gmail.com>
Message-ID: <dda9a84e-9d8b-6dec-ef2c-72eb1a3aa948@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jeremiah,

On 6/21/19 5:50 AM, Jeremiah Rose wrote:
>>From 2abea6b4935a7f9ad2889e3e1ec1e246283e9192 Mon Sep 17 00:00:00 2001
> From: Jeremiah Rose <jeremiah.aaron.rose@gmail.com>
> Date: Thu, 20 Jun 2019 01:01:07 +0000
> Subject: [PATCH 1/1] puredata: new package
> 
> Pure Data is an open source visual programming language for
> multimedia. This is the Pd Vanilla distribution.
> https://puredata.info/
> 
> Signed-off-by: Jeremiah Rose <jeremiah.aaron.rose@gmail.com>
> ---
>   DEVELOPERS                     |  3 +++
>   package/Config.in              |  1 +
>   package/puredata/Config.in     | 27 +++++++++++++++++++++++++++
>   package/puredata/puredata.hash |  2 ++
>   package/puredata/puredata.mk   | 35 +++++++++++++++++++++++++++++++++++
>   5 files changed, 68 insertions(+)
>   create mode 100644 package/puredata/Config.in
>   create mode 100644 package/puredata/puredata.hash
>   create mode 100644 package/puredata/puredata.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 32fa00f..d218eb4 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1120,6 +1120,9 @@ F: package/sl/
>   N: Jens Zettelmeyer <zettelmeyerj@gmail.com>
>   F: package/batctl/
> 
> +N: Jeremiah Rose <jeremiah.aaron.rose@gmail.com>
> +F: package/puredata/
> +
>   N: Jeremy Rosen <jeremy.rosen@openwide.fr>
>   F: package/fxload/
> 
> diff --git a/package/Config.in b/package/Config.in
> index 9628243..de98673 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -45,6 +45,7 @@ menu "Audio and video applications"
>    source "package/omxplayer/Config.in"
>    source "package/on2-8170-libs/Config.in"
>    source "package/opus-tools/Config.in"
> + source "package/puredata/Config.in"

Please swap 'pulseaudio' with 'puredata' following alphabetical order.

But most of all, please rebase this patch against master branch, 
otherwise it doesn't apply.

>    source "package/pulseaudio/Config.in"
>    source "package/sox/Config.in"
>    source "package/squeezelite/Config.in"
> diff --git a/package/puredata/Config.in b/package/puredata/Config.in
> new file mode 100644
> index 0000000..60edac9
> --- /dev/null
> +++ b/package/puredata/Config.in
> @@ -0,0 +1,27 @@
> +config BR2_PACKAGE_PUREDATA
> + bool "puredata"
> + depends on BR2_USE_MMU # fork()
> + depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
> +
> + select BR2_PACKAGE_ALSA_LIB
> + help
> +  Pure Data is an open source visual programming language for
> +  multimedia. This is the Pd Vanilla distribution.
> +
> +  https://puredata.info/
> +
> +if BR2_PACKAGE_PUREDATA
> +
> +config BR2_PACKAGE_PUREDATA_JACK
> + bool "JACK support for Pure Data"
> + depends on BR2_PACKAGE_JACK2
> + help
> +  JACK is a low-latency sound server
> +
> +  http://jackaudio.org/
> +
> +endif
> +
> +comment "puredata needs a toolchain w/ threads"
> + depends on BR2_USE_MMU
> + depends on !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/puredata/puredata.hash b/package/puredata/puredata.hash
> new file mode 100644
> index 0000000..f08afd3
> --- /dev/null
> +++ b/package/puredata/puredata.hash
> @@ -0,0 +1,2 @@
> +# No public hash available from github, this is a manually generated hash
> +sha256 0405aa7de53793ea0cb1ab3d93303018c5886616b89a2be3f4861251261c7341
>   0.49-0.tar.gz

Here I don't know if it is patchwork mbox failure or not. This ^^^ is on 
only one line? I think yes, otherwise it wouldn't build, can you check?

> diff --git a/package/puredata/puredata.mk b/package/puredata/puredata.mk
> new file mode 100644
> index 0000000..9abdc69
> --- /dev/null
> +++ b/package/puredata/puredata.mk
> @@ -0,0 +1,35 @@
> +################################################################################
> +#
> +# puredata
> +#
> +################################################################################
> +
> +PUREDATA_VERSION = 0.49-0
> +PUREDATA_SITE = https://github.com/pure-data/pure-data/archive
> +PUREDATA_SOURCE = $(PUREDATA_VERSION).tar.gz
> +PUREDATA_LICENSE = BSD-3-Clause
> +PUREDATA_LICENSE_FILES = LICENSE.txt

Please add corresponding hash for LICENSE.txt in .hash file.

> +PUREDATA_DEPENDENCIES = alsa-lib
> +PUREDATA_AUTORECONF = YES
> +
> +# Fix for toolchains using the musl libc
> +ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
> +PUREDATA_CONF_OPTS += CFLAGS="$(TARGET_CFLAGS) -D__off64_t=off64_t"
> +endif
> +
> +# Portaudio is for Mac/Windows cross compatibility, we don't need it
> +PUREDATA_CONF_OPTS += --disable-portaudio
> +
> +# Create the empty /m4/generated directory
> +# (In a normal puredata build, this would be done by autogen.sh)
> +define PUREDATA_POST_EXTRACT_FIXUP
> + mkdir -p $(@D)/m4/generated
> +endef
> +PUREDATA_POST_EXTRACT_HOOKS += PUREDATA_POST_EXTRACT_FIXUP
> +
> +ifeq ($(BR2_PACKAGE_PUREDATA_JACK),y)
> +PUREDATA_DEPENDENCIES += jack2
> +PUREDATA_CONF_OPTS += --enable-jack
> +endif
> +
> +$(eval $(autotools-package))
> 

This builds correctly after applying, so please send a v2 patch and I 
will check it again with test-pkg, maybe you can do the same before 
submitting.

Thank you
Best regards
-- 
Giulio Benetti
Benetti Engineering sas
