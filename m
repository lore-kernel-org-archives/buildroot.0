From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Mar 2015 22:03:51 +0100
Subject: [Buildroot] [PATCH v3 1/1] package/unixodbc: new package
In-Reply-To: <1426278306-21589-1-git-send-email-bernd.kuhls@t-online.de>
References: <1426278306-21589-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150313220351.5dce9aa3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Fri, 13 Mar 2015 21:25:06 +0100, Bernd Kuhls wrote:

> diff --git a/package/unixodbc/0001-fix-nopthread.patch b/package/unixodbc/0001-fix-nopthread.patch
> new file mode 100644
> index 0000000..45933e5
> --- /dev/null
> +++ b/package/unixodbc/0001-fix-nopthread.patch
> @@ -0,0 +1,39 @@
> +Fix pthread detection
> +
> +configure.in always calls AC_CHECK_COMP_OPT(pthread) which succeeds with the
> +toolchain used although it does not contain thread support:
> +
> +checking for mutex_lock in -lthread ... no
> +checking for pthread_mutex_lock in -lpthread... no
> +checking for pthread_mutex_lock in -lc... no
> +checking if compiler accepts -pthread... yes
> +checking for pthread_mutex_lock in -lc... no
> +checking for pthread_mutex_lock in -lpthread... no
> +
> +This positive configure check leads to
> +
> +    CFLAGS="$CFLAGS -pthread"
> +
> +in ./configure, line 15757 which causes a compilation bug
> +/home/br/br4/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.8.3/../../../../arm-buildroot-linux-uclibcgnueab
> +
> +using this defconfig
> +http://autobuild.buildroot.net/results/e86/e86e97ff7887f1bdc6bf913498392ff50f56ea88/defconfig
> +
> +This patch disables the freebsd-only code path. Patching configure directly
> +prevents the need for autoreconf.
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Hum, could we instead get a solution that could potentially be
upstreamed? Like using AC_CACHE_CHECK(), or something like that.

Also, any reason to patch configure directly? We normally don't do
that, and always prefer to patch configure.{in,ac}.

That being said, if you don't care about no-thread support in unixodbc,
I would personally be fine if you decided to add 'depends on
BR2_TOOLCHAIN_HAS_THREADS' in Config.in.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
