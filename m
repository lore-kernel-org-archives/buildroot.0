From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Oct 2018 21:50:19 +0200
Subject: [Buildroot] [PATCH 1/1] vlc: fix build with libvorbis and tremor
In-Reply-To: <20181016150909.27272-1-fontaine.fabrice@gmail.com>
References: <20181016150909.27272-1-fontaine.fabrice@gmail.com>
Message-ID: <20181017215019.4b615e99@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 16 Oct 2018 17:09:09 +0200, Fabrice Fontaine wrote:
> Commit 550c42509c203891c47d934b058a19c2fa490973 "package/vlc: fix
> linking with tremor" fixed build with BR2_PACKAGE_TREMOR and without
> BR2_PACKAGE_LIBVORBIS. However, it breaks build if BR2_PACKAGE_TREMOR
> and BR2_PACKAGE_LIBVORBIS are both enabled.
> Indeed, by overiding VORBIS_LIBS by -lvorbisidec, link of
> codec/.libs/libvorbis_plugin_la-vorbis.o with -lvorbis
> failed because VORBIS_LIBS is normally used to save "-logg
> -lvorbis -lvorbisenc":
> PKG_ENABLE_MODULES_VLC([VORBIS], [], [ogg vorbis >= 1.1 vorbisenc >= 1.1], [Vorbis decoder and encoder], [auto])
> 
> So replace fourth patch by an upstreamable patch which uses pkg-config
> to set TREMOR_LIBS if tremor is found instead of "hacking" VORBIS_LIBS
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/85a7bb1996b78dee037d5900b124cbdf5b66a6ac
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...he-name-of-the-vorbis-and-ogg-librar.patch | 31 ------------
>  ...ld-use-pkg-config-to-get-tremor-libs.patch | 50 +++++++++++++++++++
>  package/vlc/vlc.mk                            |  1 -
>  3 files changed, 50 insertions(+), 32 deletions(-)
>  delete mode 100644 package/vlc/0004-Don-t-hardcode-the-name-of-the-vorbis-and-ogg-librar.patch
>  create mode 100644 package/vlc/0004-build-use-pkg-config-to-get-tremor-libs.patch

Many thanks for having investigated this problem, and found a fix that
indeed looks good. Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
