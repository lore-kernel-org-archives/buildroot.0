From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 27 Apr 2015 23:28:06 +0200
Subject: [Buildroot] [PATCH v1] qt: fix postgresql plugin configure
Message-ID: <trinity-68c62bd0-bc83-4f4e-9377-485c9b9bf00b-1430170086668@3capp-gmx-bs20>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, Apr 26, 2015 at 11:09:17PM +0200, Peter Seiderer wrote:
> Add additional -lpthread to fix postgresql plugin configure test.
> 
> Fixes [1]:
> 
>   PostgreSQL support cannot be enabled due to functionality tests!
>    Turn on verbose messaging (-v) to ./configure to see the final report.
>    If you believe this message is in error you may use the continue
>    switch (-continue) to ./configure to continue.
>   make: *** [/home/test/autobuild/instance-1/output/build/qt-4.8.6/.stamp_configured] Error 101
>   make: Leaving directory `/home/test/autobuild/instance-1/buildroot'
> 
> Verbose configure output:
> 
>   PostgreSQL auto-detection... ()
>   compiling psql.cpp
>   linking psql
>   .../host/usr/i686-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.so.1.0.0: warning: gethostbyname is obsolescent, use getnameinfo() instead.
>   .../host/usr/i686-buildroot-linux-uclibc/sysroot/usr/lib/libpq.so: undefined reference to `pthread_sigmask'
>   collect2: error: ld returned 1 exit status
>   Makefile:99: recipe for target 'psql' failed
>   gmake[2]: *** [psql] Error 1
>   PostgreSQL disabled.
> 
> [1] http://autobuild.buildroot.net/results/8c1/8c1e18a181f355ab8870c5d3d70cf9d757b6f225/
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/qt/qt.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/qt/qt.mk b/package/qt/qt.mk
> index d1615ae..8a762e8 100644
> --- a/package/qt/qt.mk
> +++ b/package/qt/qt.mk
> @@ -348,7 +348,10 @@ QT_CONFIGURE_OPTS += -qt-sql-odbc
>  QT_DEPENDENCIES += unixodbc
>  endif
>  ifeq ($(BR2_PACKAGE_QT_PSQL),y)
> -QT_CONFIGURE_OPTS += -qt-sql-psql -psql_config $(STAGING_DIR)/usr/bin/pg_config
> +# additional -lpthread needed for uclibc/libpq.so linking configure test
> +QT_CONFIGURE_OPTS += -qt-sql-psql \
> +     -psql_config $(STAGING_DIR)/usr/bin/pg_config \
> +     -lpthread
>  QT_DEPENDENCIES += postgresql
>  endif
>  ifeq ($(BR2_PACKAGE_QT_SQLITE_QT),y)
> -- 
> 2.1.4
> 
> 

Patch not needed if Max Filippov's patch 'package/postgresql: fix pthread flags detection' ([1])
is first applied. This patch fixes the qt-4.8.6 build failure too...

Regards,
Peter

[1] https://patchwork.ozlabs.org/patch/453567/
