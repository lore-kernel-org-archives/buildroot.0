From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Oct 2015 00:02:23 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/ffmpeg: Disable rtmpdump
 support when PolarSSL is enabled
In-Reply-To: <1444938921-10025-1-git-send-email-bernd.kuhls@t-online.de>
References: <1444938921-10025-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151016000223.65fd40c3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Thu, 15 Oct 2015 21:55:21 +0200, Bernd Kuhls wrote:
> Using rtmpdump with PolarSSL breaks ffmpeg configure:
> /home/test/autobuild/instance-1/output/host/usr/mips64el-buildroot-linux-gnu/sysroot/usr/lib/librtmp.so: undefined reference to `havege_random'
> /home/test/autobuild/instance-1/output/host/usr/mips64el-buildroot-linux-gnu/sysroot/usr/lib/librtmp.so: undefined reference to `havege_init'

This indicates that polarssl doesn't provide all the symbols needed by
librtmp.

So the problem should not be fixed at the ffmpeg level, but at the
librtmp level: any other package that will try to link with librtmp
will have the same issue.


> diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
> index f361970..c37a8ac 100644
> --- a/package/ffmpeg/ffmpeg.mk
> +++ b/package/ffmpeg/ffmpeg.mk
> @@ -246,7 +246,8 @@ else
>  FFMPEG_CONF_OPTS += --disable-libbluray
>  endif
>  
> -ifeq ($(BR2_PACKAGE_RTMPDUMP),y)
> +# rtmpdump is broken with polarssl
> +ifeq ($(BR2_PACKAGE_RTMPDUMP):$(BR2_PACKAGE_POLARSSL),y:)
>  FFMPEG_CONF_OPTS += --enable-librtmp
>  FFMPEG_DEPENDENCIES += rtmpdump
>  else

The fix should be done in rtmpdump.mk, by disabling the possibility of
using polarssl as the crypto library. I guess it has to do with the API
change of PolarSSL (Gustavo ?).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
