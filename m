From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 07 Apr 2015 01:15:52 +0200
Subject: [Buildroot] [PATCH 4/4] package/thrift: add dependency on
 host-autoconf-archive
In-Reply-To: <1428339450-2158-4-git-send-email-romain.naour@openwide.fr>
References: <1428339450-2158-1-git-send-email-romain.naour@openwide.fr>
 <1428339450-2158-4-git-send-email-romain.naour@openwide.fr>
Message-ID: <552313A8.4020207@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/04/15 18:57, Romain Naour wrote:
> The ax_cxx_compile_stdcxx_11 macro bundled in thrift package is
> brocken and out of date.
> Remove it and use the one provided by autoconf-archive package.
> 
> Related to:
> [thrift]
> http://autobuild.buildroot.net/results/21e/21e3fff1e0d714f94ac7e621289d1a59bc02a05f/build-end.log
> [host-thrift]
> http://autobuild.buildroot.net/results/b89/b89ffc2bff699eb10bb6abd92369a43d4900354d/build-end.log

 I fail to see what this really fixes... For both build failures, it failed
before this patch and it still fails after it... and it should fail since these
compilers indeed are not fully C++11 compliant (missing virtual overrides which
were added in gcc 4.7).

 Oh, I get it, it will now fail consistently, instead of failing depending on
whether host-autoconf-archive has been installed or not...

 But the stupid thing is, the build does succeed with these non-conforming
compilers, because thrift actually doesn't use that particular feature...

 So perhaps it's better to patch configure.ac and ax_cxx_compile_stdcxx_11.m4 to
give the macro a different name, so that we can still compile thrift with gcc 4.5.

 Still...


> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
> Now thrift will fail with non C++11 capable toolchains:
> checking whether /home/naourr/git/buildroot/test/thrift/host/usr/bin/powerpc-linux-gnu-g++ supports C++11 features by default... no
> checking whether /home/naourr/git/buildroot/test/thrift/host/usr/bin/powerpc-linux-gnu-g++ supports C++11 features with -std=c++11... no
> checking whether /home/naourr/git/buildroot/test/thrift/host/usr/bin/powerpc-linux-gnu-g++ supports C++11 features with -std=c++0x... no
> ---
>  .../0005-aclocal-remove-c-11-check-macro.patch     | 158 +++++++++++++++++++++
>  package/thrift/thrift.mk                           |   4 +-
>  2 files changed, 160 insertions(+), 2 deletions(-)
>  create mode 100644 package/thrift/0005-aclocal-remove-c-11-check-macro.patch
> 
> diff --git a/package/thrift/0005-aclocal-remove-c-11-check-macro.patch b/package/thrift/0005-aclocal-remove-c-11-check-macro.patch
> new file mode 100644
> index 0000000..19c0c86
> --- /dev/null
> +++ b/package/thrift/0005-aclocal-remove-c-11-check-macro.patch
> @@ -0,0 +1,158 @@
> +From bffbd147b123782fe0112f3672ba621d755eb706 Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@openwide.fr>
> +Date: Mon, 6 Apr 2015 18:35:12 +0200
> +Subject: [PATCH] aclocal: remove c++11 check macro
> +
> +The ax_cxx_compile_stdcxx_11 macro is brocken and out of date.
> +
> +Remove it and use the one provided by autoconf-archive package.

 This is not needed, autoreconf will pick up the newer version automatically.

[snip]

> diff --git a/package/thrift/thrift.mk b/package/thrift/thrift.mk
> index 409b04d..5d4c515 100644
> --- a/package/thrift/thrift.mk
> +++ b/package/thrift/thrift.mk
> @@ -8,8 +8,8 @@ THRIFT_VERSION = 0.9.2
>  THRIFT_SITE = http://www.us.apache.org/dist/thrift/$(THRIFT_VERSION)
>  THRIFT_DEPENDENCIES = host-pkgconf host-thrift boost libevent openssl zlib

 Missing dependency on host-autoconf-archive here.


 Regards,
 Arnout

>  THRIFT_INSTALL_STAGING = YES
> -HOST_THRIFT_DEPENDENCIES = host-bison host-boost host-flex host-libevent \
> -	host-openssl host-pkgconf host-zlib
> +HOST_THRIFT_DEPENDENCIES = host-autoconf-archive host-bison host-boost \
> +	host-flex host-libevent host-openssl host-pkgconf host-zlib
>  
>  THRIFT_CONF_OPTS = --with-sysroot=$(STAGING_DIR) \
>  	--with-boost \
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
