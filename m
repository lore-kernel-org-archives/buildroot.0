From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Oct 2014 14:27:56 +0200
Subject: [Buildroot] [PATCH v6] package/nginx: new package
In-Reply-To: <1412505982-18274-1-git-send-email-s.martin49@gmail.com>
References: <1412505982-18274-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20141005142756.0604d6e5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun,  5 Oct 2014 12:46:22 +0200, Samuel Martin wrote:
> nginx module selection is, by default, the same as the one sets by
> the upstream configure script.
> 
> Patches improving the cross-compilation support have already been sent
> upstream for integration [1-5].
> 
> All these patches are needed because nginx uses its own handwritten
> build-system, which is cross-platform, but does not properly support
> cross-compilation.
> 
> Fixes bug: #3427 [6]
> 
> [1] http://mailman.nginx.org/pipermail/nginx-devel/2014-August/005722.html
> [2] http://mailman.nginx.org/pipermail/nginx-devel/2014-August/005724.html
> [3] http://mailman.nginx.org/pipermail/nginx-devel/2014-August/005725.html
> [4] http://mailman.nginx.org/pipermail/nginx-devel/2014-August/005723.html
> [5] http://mailman.nginx.org/pipermail/nginx-devel/2014-August/005726.html
> [6] https://bugs.uclibc.org/show_bug.cgi?id=3427
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Cc: Daniele Salvatore Albano <info@daccii.it>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Cc: Johan Oudinet <johan.oudinet@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>

Thanks, patch applied.

I have a couple of comments though, maybe to address as followup
patches:

 * Why is the package installing a logrotate file? I don't think any
   other Buildroot package does that. Maybe it's a good idea, but
   shouldn't it be conditional on whether a logrotate implementation is
   installed?

 * It might be good to add the hash file.

 * When running nginx, I get the following error/warnings:

nginx (526): undefined instruction: pc=76de93ac
Code: 00000000 f26ee1fe e12fff1e ee190f1d (e12fff1e) 
warning: process `nginx' used the deprecated sysctl system call with 1.33.

   It seems to run fine, though, but that's a bit scary. It happens
   with the following configuration:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2014.08.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_16=y
BR2_TOOLCHAIN_EXTERNAL_LARGEFILE=y
BR2_TOOLCHAIN_EXTERNAL_INET_IPV6=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
BR2_PACKAGE_NGINX=y
BR2_PACKAGE_NGINX_HTTP_CACHE=y
BR2_PACKAGE_NGINX_HTTP_SSL_MODULE=y
BR2_PACKAGE_NGINX_HTTP_SPDY_MODULE=y
BR2_PACKAGE_NGINX_HTTP_REALIP_MODULE=y
BR2_PACKAGE_NGINX_HTTP_ADDITION_MODULE=y
BR2_PACKAGE_NGINX_HTTP_XSLT_MODULE=y
BR2_PACKAGE_NGINX_HTTP_IMAGE_FILTER_MODULE=y
BR2_PACKAGE_NGINX_HTTP_SUB_MODULE=y
BR2_PACKAGE_NGINX_HTTP_DAV_MODULE=y
BR2_PACKAGE_NGINX_HTTP_FLV_MODULE=y
BR2_PACKAGE_NGINX_HTTP_MP4_MODULE=y
BR2_PACKAGE_NGINX_HTTP_GUNZIP_MODULE=y
BR2_PACKAGE_NGINX_HTTP_GZIP_STATIC_MODULE=y
BR2_PACKAGE_NGINX_HTTP_AUTH_REQUEST_MODULE=y
BR2_PACKAGE_NGINX_HTTP_RANDOM_INDEX_MODULE=y
BR2_PACKAGE_NGINX_HTTP_SECURE_LINK_MODULE=y
BR2_PACKAGE_NGINX_HTTP_DEGRADATION_MODULE=y
BR2_PACKAGE_NGINX_HTTP_STUB_STATUS_MODULE=y
BR2_PACKAGE_NGINX_MAIL=y
BR2_PACKAGE_NGINX_MAIL_SSL_MODULE=y
BR2_PACKAGE_NGINX_RTSIG_MODULE=y
BR2_PACKAGE_NGINX_SELECT_MODULE=y
BR2_PACKAGE_NGINX_POLL_MODULE=y

   Tested under Qemu vexpress.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
