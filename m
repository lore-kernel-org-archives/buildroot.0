From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 12 May 2015 23:13:03 +0300
Subject: [Buildroot] [RFC v1] rsyslog: fix xtensa/uclibc-ng postgresql
 linking problem
In-Reply-To: <1431460297-1278-1-git-send-email-ps.report@gmx.net>
References: <1431460297-1278-1-git-send-email-ps.report@gmx.net>
Message-ID: <20150512201303.GC2558@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Tue, May 12, 2015 at 09:51:37PM +0200, Peter Seiderer wrote:
> Add explicit linking with '-lm', fixes missing __isnan while postgresql
> configure detection.
> 
> Fixes [1]:
> 
> checking for pg_config... (cached) /home/seiderer/Work/zeiss/freescale-imx6/build_xtensa_001/host/usr/xtensa-buildroot-linux-uclibc/sysroot/usr/bin/pg_config
> checking for PQconnectdb in -lpq... no
> configure: error: in `/home/seiderer/Work/zeiss/freescale-imx6/build_xtensa_001/build/rsyslog-8.9.0':
> configure: error: PgSQL library is missing
> 
> From rsyslog-8.9.0/config.log:
> 
> configure:17859: checking for PQconnectdb in -lpq
> configure:17885: .../host/usr/bin/xtensa-linux-gcc -std=c99 -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mlongcalls -mtext-section-literals  -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c -lpq -L.../host/usr/xtensa-buildroot-linux-uclibc/sysroot/usr/lib
>     >&5
> .../host/usr/xtensa-buildroot-linux-uclibc/sysroot/usr/lib/libpq.so: undefined reference to `__isnan'
> 
> [1] http://autobuild.buildroot.net/results/e76/e769982e3131581b38698c109c9bc5215e3d5b11
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Similare patch(es) to fix the problem (plus additional -lpthread)
> from Yann E. MORIN and Bernd Kuhls:
> 
> https://patchwork.ozlabs.org/patch/460348/
> ---
>  package/rsyslog/rsyslog.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
> index 99e6eba..2998c9f 100644
> --- a/package/rsyslog/rsyslog.mk
> +++ b/package/rsyslog/rsyslog.mk
> @@ -48,6 +48,8 @@ ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
>  RSYSLOG_DEPENDENCIES += postgresql
>  RSYSLOG_CONF_OPTS += --enable-pgsql
>  RSYSLOG_CONF_ENV += ac_cv_prog_PG_CONFIG=$(STAGING_DIR)/usr/bin/pg_config
> +# fix libpq linking problem with xtensa/uclibc-ng toolchain
> +RSYSLOG_CONF_ENV += LIBS="-lm"

I have just sent a patch fixing the same issue by removing the libm dependency 
of libpq.so. Please see http://patchwork.ozlabs.org/patch/471526/.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
