From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Aug 2017 12:00:46 +0200
Subject: [Buildroot] [PATCH 1/2] alsa-lib: add patch to fix incorrect
 code dependency
In-Reply-To: <20170811212103.24433-1-thomas.petazzoni@free-electrons.com>
References: <20170811212103.24433-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170812100046.GB3021@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-08-11 23:21 +0200, Thomas Petazzoni spake thusly:
> This commit adds a patch to alsa-lib that fixes an incorrect code
> dependency: some code built when MIDI support is enabled is
> unconditionally referencing code that is built when SEQ support is
> enabled, both options being independent.
> 
> This causes build failures such as:
> 
> /home/buildroot/buildroot-test/instance-1/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libasound.a(pcm_dmix.o): In function `snd_pcm_dmix_sync_ptr':
> pcm_dmix.c:(.text+0x83c): warning:
> /home/buildroot/buildroot-test/instance-1/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libasound.a(rawmidi_symbols.o):(.data+0x4): undefined reference to `_snd_module_rawmidi_virt'
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/5964e7028c31a8f75b38a27270410f0b3c5c8422/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Minor nit, below...

> ---
>  ...-rawmidi_symbols.c-use-rawmidi_virt-only-.patch | 50 ++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 package/alsa-lib/0005-src-rawmidi-rawmidi_symbols.c-use-rawmidi_virt-only-.patch
> 
> diff --git a/package/alsa-lib/0005-src-rawmidi-rawmidi_symbols.c-use-rawmidi_virt-only-.patch b/package/alsa-lib/0005-src-rawmidi-rawmidi_symbols.c-use-rawmidi_virt-only-.patch
> new file mode 100644
> index 0000000..df04cea
> --- /dev/null
> +++ b/package/alsa-lib/0005-src-rawmidi-rawmidi_symbols.c-use-rawmidi_virt-only-.patch
> @@ -0,0 +1,50 @@
> +From da16e18f03fc63e1206b93d6a719b177d4f4bb99 Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Date: Fri, 11 Aug 2017 22:33:01 +0200
> +Subject: [PATCH] src/rawmidi/rawmidi_symbols.c: use rawmidi_virt only when
> + available
> +
> +src/rawmidi/Makefile.am only brings rawmidi_virt.c into the build when
> +BUILD_SEQ is defined (i.e when --enable-seq is passed). However,
> +rawmidi_symbols.c unconditionally refers to _snd_module_rawmidi_virt,
> +defined in rawmidi_virt.c.
> +
> +This causes a link failure when BUILD_SEQ is disabled. For example
> +when linking ffmpeg against alsa-lib:
> +
> +/home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libasound.a(pcm_dmix.o): In function `snd_pcm_dmix_sync_ptr':
> +pcm_dmix.c:(.text+0x83c): warning:
> +/home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libasound.a(rawmidi_symbols.o):(.data+0x4): undefined reference to `_snd_module_rawmidi_virt'
> +collect2: error: ld returned 1 exit status
> +
> +To fix this, we make sure that rawmidi_symbols.c only uses
> +_snd_module_rawmidi_virt when available.
> +
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Upstream status?

Regards,
Yann E. MORIN.

> +---
> + src/rawmidi/rawmidi_symbols.c | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/src/rawmidi/rawmidi_symbols.c b/src/rawmidi/rawmidi_symbols.c
> +index cdc06d7..6473433 100644
> +--- a/src/rawmidi/rawmidi_symbols.c
> ++++ b/src/rawmidi/rawmidi_symbols.c
> +@@ -21,11 +21,15 @@
> + #ifndef PIC
> + 
> + extern const char *_snd_module_rawmidi_hw;
> ++#ifdef BUILD_SEQ
> + extern const char *_snd_module_rawmidi_virt;
> ++#endif
> + 
> + static const char **snd_rawmidi_open_objects[] = {
> + 	&_snd_module_rawmidi_hw,
> ++#ifdef BUILD_SEQ
> + 	&_snd_module_rawmidi_virt
> ++#endif
> + };
> + 	
> + void *snd_rawmidi_open_symbols(void)
> +-- 
> +2.9.4
> +
> -- 
> 2.9.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
