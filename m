From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 10 Jun 2013 23:11:11 +0200
Subject: [Buildroot] [PATCH] boost: only the iostreams library requires
	bzip2
In-Reply-To: <51B61E0B.6020209@carallon.com> (Will Wagner's message of "Mon,
 10 Jun 2013 19:42:19 +0100")
References: <51B61E0B.6020209@carallon.com>
Message-ID: <87sj0p4qog.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Wagner <will_wagner@carallon.com> writes:

 Will> Signed-off-by: Will Wagner <will_wagner@carallon.com>
 Will> ---
 Will>  package/boost/Config.in |    4 ++++
 Will>  package/boost/boost.mk  |    6 +++++-
 Will>  2 files changed, 9 insertions(+), 1 deletions(-)

 Will> diff --git a/package/boost/Config.in b/package/boost/Config.in
 Will> index 5c65b2f..fbe99d0 100644
 Will> --- a/package/boost/Config.in
 Will> +++ b/package/boost/Config.in
 Will> @@ -18,6 +18,9 @@ config BR2_PACKAGE_BOOST

 Will>  if BR2_PACKAGE_BOOST

 Will> +config BR2_PACKAGE_BOOST_REQUIRES_BZIP2
 Will> +	bool
 Will> +
 Will>  config BR2_PACKAGE_BOOST_CHRONO
 Will>  	bool "boost-chrono"

 Will> @@ -43,6 +46,7 @@ config BR2_PACKAGE_BOOST_GRAPH_PARALLEL

 Will>  config BR2_PACKAGE_BOOST_IOSTREAMS
 Will>  	bool "boost-iostreams"
 Will> +	select BR2_PACKAGE_BOOST_REQUIRES_BZIP2

You should just move the 'select BR2_PACKAGE_BZIP2' here.

 Will>  config BR2_PACKAGE_BOOST_LOCALE
 Will>  	depends on BR2_USE_WCHAR
 Will> diff --git a/package/boost/boost.mk b/package/boost/boost.mk
 Will> index d11f378..c733b89 100644
 Will> --- a/package/boost/boost.mk
 Will> +++ b/package/boost/boost.mk
 Will> @@ -12,7 +12,7 @@ BOOST_INSTALL_STAGING = YES

 Will>  TARGET_CC_VERSION = $(shell $(TARGET_CC) -dumpversion)

 Will> -BOOST_DEPENDENCIES = bzip2 zlib
 Will> +BOOST_DEPENDENCIES = zlib

 Will>  BOOST_FLAGS =

 Will> @@ -48,6 +48,10 @@ else
 Will>  BOOST_FLAGS += --without-icu
 Will>  endif

 Will> +ifeq ($(BR2_PACKAGE_BOOST_REQUIRES_BZIP2),y)

And change this to BR2_PACKAGE_BOOST_IOSTREAMS (unless we have reason to
expect other parts of boost will need it as well in the future, but
that's probable unlikely).

 Will> +BOOST_DEPENDENCIES += bzip2
 Will> +endif
 Will> +
 Will>  BOOST_OPT += toolset=gcc \
 Will>  	     threading=multi \
 Will>  	     variant=$(if $(BR2_ENABLE_DEBUG),debug,release) \
 Will> -- 
 Will> 1.7.2.5


 Will> _______________________________________________
 Will> buildroot mailing list
 Will> buildroot at busybox.net
 Will> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
