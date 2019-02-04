From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Feb 2019 21:54:55 +0100
Subject: [Buildroot] [PATCH] toolchain: add variadic MI thunk support
 flag
In-Reply-To: <20190125233452.6316-1-jcmvbkbc@gmail.com>
References: <20190125233452.6316-1-jcmvbkbc@gmail.com>
Message-ID: <20190204215455.40d0ee29@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 25 Jan 2019 15:34:52 -0800
Max Filippov <jcmvbkbc@gmail.com> wrote:

> GCC uses thunk functions to adjust the 'this' pointer when calling
> C++ member functions in classes derived with multiple inheritance.
> Generation of thunk functions requires support from the compiler
> back end. In the absence of that support target-independent code
> in the C++ front end is used to generate thunk functions, but it
> does not support vararg functions.
> 
> Support for this feature is currently missing in or1k and xtensa
> toolchains.
> 
> Add flag BR2_TOOLCHAIN_SUPPORTS_VARIADIC_MI_THUNK that indicates
> presence of this feature in the toolchain. Add dependency to packages
> that require this feature to be built.
> 
> Fixes:
> http://autobuild.buildroot.net/results/c9e660c764edbd7cf0ae54ab0f0f412464721446/
> http://autobuild.buildroot.net/results/9a3bf4b411c418ea78d59e35d23ba865dd453890/
> 
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>

Thanks for providing this patch!

> diff --git a/package/libtorrent-rasterbar/Config.in b/package/libtorrent-rasterbar/Config.in
> index aa986f2388e0..e9a1a40fb9b1 100644
> --- a/package/libtorrent-rasterbar/Config.in
> +++ b/package/libtorrent-rasterbar/Config.in
> @@ -1,6 +1,7 @@
> -comment "libtorrent-rasterbar needs a toolchain w/ C++, threads, wchar, gcc >= 4.8"
> +comment "libtorrent-rasterbar needs a toolchain w/ C++, threads, wchar, variadic MI thunks, gcc >= 4.8"

Actually, because the user can't do anything about variadic MI thunk
support, there is not much point in mentioning it in the comment. So
I've removed that from the comment...

>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
> -		!BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> +		!BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
> +		!BR2_TOOLCHAIN_SUPPORTS_VARIADIC_MI_THUNK

... and changed this to:

	depends on BR2_TOOLCHAIN_SUPPORTS_VARIADIC_MI_THUNK

so that the Config.in comment does not show up (just like the package
doesn't show up) on architectures where the toolchain does not have
variadic MI thunk support.

Applied with this change. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
