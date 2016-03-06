From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Mar 2016 15:07:01 +0100
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: improve inline asm
 handling for libpostproc
In-Reply-To: <1457262024-2160-1-git-send-email-bernd.kuhls@t-online.de>
References: <1457262024-2160-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160306150701.6caec643@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

On Sun,  6 Mar 2016 12:00:24 +0100, Bernd Kuhls wrote:

>  ifeq ($(BR2_PACKAGE_FFMPEG_POSTPROC),y)
>  FFMPEG_CONF_OPTS += --enable-postproc
> +# disable inline-asm on non-mmx Intel CPUs
> +ifeq ($(BR2_i386)$(BR2_X86_CPU_HAS_MMX),y)
> +FFMPEG_CONF_OPTS += --disable-inline-asm

On x86-64, BR2_i386 is false, but BR2_X86_CPU_HAS_MMX=y, so you will
disable inline-asm. Is this what you want?

Why isn't the condition simply:

ifeq ($(BR2_X86_CPU_HAS_MMX),)
FFMPEG_CONF_OPTS += --disable-inline-asm
endif

Which actually matches your comment: when you have a non-MMX capable
Intel CPU -> disable inline assembly.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
