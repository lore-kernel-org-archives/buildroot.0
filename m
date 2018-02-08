From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Feb 2018 22:24:44 +0100
Subject: [Buildroot] [PATCH 1/1] libcpprestsdk: fix building as a static
 library
In-Reply-To: <20180206165950.10154-1-aduskett@gmail.com>
References: <20180206165950.10154-1-aduskett@gmail.com>
Message-ID: <20180208222444.097c5da8@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  6 Feb 2018 11:59:50 -0500, Adam Duskett wrote:
> zlib must be put after OpenSSL when building as a static library or else
> OpenSSL will be unable to find zlib specific functions.
> 
> Put the search for zlib below the search for OpenSSL to
> ensure that zlib links after OpenSSL.
> 
> Fixes:
> http://autobuild.buildroot.net/results/1df528254468a5ece2f6fe37b3401e68737beed1
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  .../0004-fix-static-library-linking.patch          | 56 ++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 package/libcpprestsdk/0004-fix-static-library-linking.patch
> 
> diff --git a/package/libcpprestsdk/0004-fix-static-library-linking.patch b/package/libcpprestsdk/0004-fix-static-library-linking.patch
> new file mode 100644
> index 0000000000..e904bb96c1
> --- /dev/null
> +++ b/package/libcpprestsdk/0004-fix-static-library-linking.patch
> @@ -0,0 +1,56 @@
> +From cefe8da037e0c2bb97dc1cb4d7ff43e7123feabf Mon Sep 17 00:00:00 2001
> +From: Adam Duskett <aduskett@gmail.com>
> +Date: Tue, 6 Feb 2018 11:34:49 -0500
> +Subject: [PATCH] fix static library linking
> +
> +zlib must be put after OpenSSL when building as a static library or else
> +OpenSSL will be unable to find zlib specific functions.
> +
> +Put the search for zlib below the search for OpenSSL to
> +ensure that zlib links after OpenSSL.
> +
> +Upstream status: submitted
> +https://github.com/Microsoft/cpprestsdk/pull/688
> +
> +Signed-off-by: Adam Duskett <aduskett@gmail.com>

This is in fact not really the correct fix. The correct fix is to use
pkg-config, which already takes care of recursive dependencies when
linking statically.

cpprestsdk shouldn't have to know that openssl internally uses zlib. In
fact, it is just an accident that cpprestsdk also needs zlib for other
reasons. It could very well be that cpprestsdk only needed openssl, and
had no reason to know about zlib.

Can we use pkg-config instead ? CMake has good support for pkg-config,
so it is quite easy to use.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
