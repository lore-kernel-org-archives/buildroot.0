From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Oct 2015 11:18:20 +0200
Subject: [Buildroot] [PATCH 2/2] Add package hackrf-tools
In-Reply-To: <1444546853-1505-2-git-send-email-jrspruitt@gmail.com>
References: <1444546853-1505-1-git-send-email-jrspruitt@gmail.com>
 <1444546853-1505-2-git-send-email-jrspruitt@gmail.com>
Message-ID: <20151011111820.21f6a115@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jason Pruitt,

On Sun, 11 Oct 2015 00:00:53 -0700, Jason Pruitt wrote:

> diff --git a/package/hackrf-tools/Config.in b/package/hackrf-tools/Config.in
> new file mode 100644
> index 0000000..71fced6
> --- /dev/null
> +++ b/package/hackrf-tools/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_HACKRF_TOOLS
> +	bool "hackrf-tools"
> +    depends on BR2_PACKAGE_LIBHACKRF && (BR2_SHARED_STATIC_LIBS || BR2_SHARED_LIBS)

Improper indentation. Besides that, if something doesn't build with
pure static libraries, we normally do:

	depends on !BR2_STATIC_LIBS

and add a comment:

comment "hackrf-tools needs a toolchain w/ dynamic library"
	depends on BR2_STATIC_LIBS

Regarding the "depends on BR2_PACKAGE_LIBHACKRF", it should be a
"select" instead:

	select BR2_PACKAGE_LIBHACKRF

and then you need to propagate the reverse dependencies of libhackrf:

	depends on BR2_TOOLCHAIN_HAS_THREADS

and of course keep a comment about this thread dependency. So the
comment above should in fact be:

comment "hackrf-tools needs a toolchain w/ threads, dynamic library"
	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS

However, this is all moot if you merge both packages into one, as
suggested in my review of the libhackrf package.

> +	help
> +	  Tools for interacting with and updating HackRF boards.
> +
> +	  https://github.com/mossmann/hackrf/host/hackrf-tools
> +

Unneeded empty new line.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
