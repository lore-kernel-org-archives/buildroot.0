From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 8 Jun 2019 22:16:44 +0200
Subject: [Buildroot] [PATCH v3,
 2/2] package/mpd: fix static build with tremor and vorbis
In-Reply-To: <20190601143456.23326-2-fontaine.fabrice@gmail.com>
References: <20190601143456.23326-1-fontaine.fabrice@gmail.com>
 <20190601143456.23326-2-fontaine.fabrice@gmail.com>
Message-ID: <2fab7725-7991-61c2-d5b7-2b3272d5b3a2@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01/06/2019 16:34, Fabrice Fontaine wrote:
> mpd can't be built statically with tremor and vorbis, build fails on:
> block.c:(.text+0x11c): multiple definition of `vorbis_block_init'
> /usr/lfs/v0/rc-buildroot-test/scripts/instance-2/output/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib/libvorbisidec.a(block.o):block.c:(.text+0x0): first defined here
> /usr/lfs/v0/rc-buildroot-test/scripts/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/7.4.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: Disabling relaxation: it will not work with multiple definitions
> /usr/lfs/v0/rc-buildroot-test/scripts/instance-2/output/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib/libvorbis.a(block.o): In function `_vorbis_block_alloc':
> 
> Fix this by making both options mutually exclusive
> 
> It should be noted that upstream removed the possibility to enable
> tremor and vorbis at the same time since version 0.21.6 and
> https://github.com/MusicPlayerDaemon/MPD/commit/c18cd941aaa4c16ac713bc4f1e16ada5281d689e
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/60c721a82ffd668bebf02d80bca83780d6cdb2f2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Both applied to master, thanks.

> ---
> Changes v2 -> v3 (after review of Thomas Petazzoni):
>  - Move drop of tremor select in a dedicated patch
>  - Remove BR2_SOFT_FLOAT dependency and make both options mutually
>    exclusive
> 
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Drop default and replace it by a dependency on BR2_SOFT_FLOAT or
>    !BR2_SOFT_FLOAT
> 
>  package/mpd/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/mpd/Config.in b/package/mpd/Config.in
> index 20a7421481..b8478c5b76 100644
> --- a/package/mpd/Config.in
> +++ b/package/mpd/Config.in
> @@ -134,6 +134,7 @@ config BR2_PACKAGE_MPD_TREMOR
>  	bool "tremor"
>  	select BR2_PACKAGE_LIBOGG
>  	select BR2_PACKAGE_TREMOR
> +	depends on !BR2_PACKAGE_MPD_VORBIS

 depends should come before select. check-package complained about this. Fixed
before applying.

 Regards,
 Arnout

>  	help
>  	  Enable vorbis input support.
>  	  Select this if you want to play back OGG files on softfloat
> 
