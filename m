From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 15 Oct 2015 21:39:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: Disable rtmpdump
 support when PolarSSL is enabled
In-Reply-To: <1444935326-19634-1-git-send-email-bernd.kuhls@t-online.de>
References: <1444935326-19634-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151015193909.GA3659@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2015-10-15 20:55 +0200, Bernd Kuhls spake thusly:
> Using rtmpdump with PolarSSL breaks ffmpeg configure:
> /home/test/autobuild/instance-1/output/host/usr/mips64el-buildroot-linux-gnu/sysroot/usr/lib/librtmp.so: undefined reference to `havege_random'
> /home/test/autobuild/instance-1/output/host/usr/mips64el-buildroot-linux-gnu/sysroot/usr/lib/librtmp.so: undefined reference to `havege_init'
> 
> This problem could be fixed by enabling POLARSSL_HAVEGE_C:
> http://freetz.org/browser/trunk/make/libs/polarssl/patches/050-activate-havege-random-generator-needed-by-rtmpdump.polarssl.patch?rev=10797
> 
> This option is however accompanied by a warning in
> include/polarssl/config.h:
> 
>  * Warning: the HAVEGE random generator is dependent on timing and specific
>  *          processor traits. It is therefore not advised to use HAVEGE as
>  *          your applications primary random generator or primary entropy pool
>  *          input. As a secondary input to your entropy pool, it IS able add
>  *          the (limited) extra entropy it provides.
> 
> Since rtmpdump is not a vital part of ffmpeg it is save to disable
> rtmpdump support when PolarSSL is used.
> 
> Fixes
> http://autobuild.buildroot.net/results/ae0/ae0c4bab7975ed2ad77a9f9fd6a300d1327d56b9/
> http://autobuild.buildroot.net/results/45d/45dd9adbac449ce0ed66af5b4655b4d9b37faa62/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/ffmpeg/ffmpeg.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
> index f361970..41e648b 100644
> --- a/package/ffmpeg/ffmpeg.mk
> +++ b/package/ffmpeg/ffmpeg.mk
> @@ -246,7 +246,8 @@ else
>  FFMPEG_CONF_OPTS += --disable-libbluray
>  endif
>  
> -ifeq ($(BR2_PACKAGE_RTMPDUMP),y)
> +# rtmpdump is broken with polarssl
> +ifeq ($(BR2_PACKAGE_RTMPDUMP)$(BR2_PACKAGE_POLARSSL),y)

I think this is wrong: if rtmpdump=n and polarssl=y, then we'd enable
rtmpdump, which is definitely wrong. Maybe use something like:

    ifeq ($(BR2_PACKAGE_RTMPDUMP):$(BR2_PACKAGE_POLARSSL),y:)

Regards,
Yann E. MORIN.

>  FFMPEG_CONF_OPTS += --enable-librtmp
>  FFMPEG_DEPENDENCIES += rtmpdump
>  else
> -- 
> 2.6.1
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
