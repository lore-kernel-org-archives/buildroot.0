From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 25 Sep 2011 23:50:39 +0200
Subject: [Buildroot] [PATCHv2] package: add the poco C++ libraries
	collection
In-Reply-To: <bc337c3bfe93b6d50d40f042d53480f38a8dd0b8.1314792605.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Wed, 31 Aug 2011 15:11:20 +0300")
References: <bc337c3bfe93b6d50d40f042d53480f38a8dd0b8.1314792605.git.baruch@tkos.co.il>
Message-ID: <87mxdsxpe8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 Baruch> Add the C++ Portable Components libraries.

 Baruch> The Data/ODBC components is disabled because its dependency
 Baruch> (unixODBC) is not in Buildroot.

 Baruch> The Data/MySQL component is build tested only. It probably requires an
 Baruch> additional RPATH to actually run, because libmysqlclient resides in a
 Baruch> non-standard location under /usr/lib/mysql.

Thanks, a few comments:

 Baruch> diff --git a/package/poco/Config.in b/package/poco/Config.in
 Baruch> new file mode 100644
 Baruch> index 0000000..9de5328
 Baruch> --- /dev/null
 Baruch> +++ b/package/poco/Config.in
 Baruch> @@ -0,0 +1,56 @@
 Baruch> +config BR2_PACKAGE_POCO
 Baruch> +	bool "poco"
 Baruch> +	select BR2_PACKAGE_ZLIB
 Baruch> +	select BR2_PACKAGE_PCRE
 Baruch> +	depends on BR2_LARGEFILE

That's not enough. You (obviously) need C++ support, and WCHAR also
seems to be needed for the unicode stuff - E.G.:

select BR2_INSTALL_LIBSTDCPP
select BR2_USE_WCHAR

 Baruch> +	help
 Baruch> +	  The C++ Portable Components Libraries
 Baruch> +
 Baruch> +	  http://pocoproject.org
 Baruch> +
 Baruch> +comment "poco requires a toolchain with LARGEFILE support"
 Baruch> +	depends on !BR2_LARGEFILE

This should be extended to also cover C++ and WCHAR. This comment should
move down to the bottom of the file so the remaining sub options gets
properly indented.

With those changes it builds until it gets to the FPU stuff, which
breaks on (atleast) ARM:

.. -c src/FPEnvironment.cpp -o /home/peko/source/buildroot/output/build/poco-1.4.2/Foundation/obj/Linux/arm/release_shared/FPEnvironment.o
In file included from src/FPEnvironment_C99.cpp:37,
                 from src/FPEnvironment.cpp:48:
include/Poco/FPEnvironment_C99.h:56: error: 'FE_DOWNWARD' was not declared in this scope
include/Poco/FPEnvironment_C99.h:57: error: 'FE_UPWARD' was not declared in this scope

The FE_* macros afaik only supposed to be defined if the arch can
efficiently handle it, which isn't the case for ARM. fenv.h the
supporting functions are only enabled on uClibc if UCLIBC_HAS_FENV is
enabled in the .config, which it isn't for our uClibc defconfigs.

I'm not exactly sure how to fix this. Any ideas?
-- 
Bye, Peter Korsgaard
