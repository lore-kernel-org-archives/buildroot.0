From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 May 2017 15:20:52 +0200
Subject: [Buildroot] [PATCH] package/protobuf: needs gcc >= 4.5
In-Reply-To: <20170507131652.22322-1-romain.naour@gmail.com>
References: <20170507131652.22322-1-romain.naour@gmail.com>
Message-ID: <20170507152052.011081f0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  7 May 2017 15:16:52 +0200, Romain Naour wrote:

> diff --git a/package/protobuf-c/Config.in b/package/protobuf-c/Config.in
> index a32e6cd..6f916c5 100644
> --- a/package/protobuf-c/Config.in
> +++ b/package/protobuf-c/Config.in
> @@ -4,12 +4,14 @@ config BR2_PACKAGE_PROTOBUF_C
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	# host-protobuf only builds on certain architectures
>  	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> +	depends on BR2_HOST_GCC_AT_LEAST_4_5 # host-protobuf

You're adding a new dependency to protobuf-c, but protobuf-c is also
selected by a few packages:

package/collectd/Config.in:     select BR2_PACKAGE_PROTOBUF_C
package/riemann-c-client/Config.in:     select BR2_PACKAGE_PROTOBUF_C

You also need to propagate the dependency to these packages.

Generally speaking, when propagating new dependencies, you should not
only take care of first level reverse dependencies, but also
recursively take care of all reverse dependencies.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
