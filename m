From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 20 Aug 2015 08:26:52 +0000
Subject: [Buildroot] [PATCH] boost: fix build on ARC
In-Reply-To: <1440008812-13384-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1440008812-13384-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <4881796E12491D4BB15146FE0209CE646578420F@DE02WEMBXB.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> -----Original Message-----
> From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com]
> Sent: 19 ??????? 2015 ?. 21:27
> To: buildroot at uclibc.org
> Cc: Alexey Brodkin; Thomas Petazzoni
> Subject: [PATCH] boost: fix build on ARC
> 
> This commit adds a patch to Boost to make it use the eventfd() function provided by the C library when uClibc is used, rather than
> falling back to using directly the __NR_eventfd system call. This fixes the build on ARC, which doesn't define __NR_eventfd.
> 
> The original problem is that uClibc fakes to be glibc 2.2, which didn't had eventfd(), so Boost makes the system call manually. uClibc-ng,
> in its next release, will pretend to be glibc
> 2.10 (see
> http://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=4ff3a6c8eb91db71d6dc3d2932b66e848bd20ac3),
> which will also fix the problem, but requires bumping the uClibc version, rebuilding the external toolchains, and so on.
> 
> Ideally, Boost should be doing a compile test to detect if eventfd() is available or not, but the Boost build system is so brain-damage
> that doing so would require way too much effort.
> 
> Fixes:
> 
>   http://autobuild.buildroot.org/results/22b/22b710346d2cd78b7b51cdccd18d670bb6ac5d24/
>   and many similar build failures
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/boost/0004-fix-uclibc-eventfd.patch | 38 +++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/boost/0004-fix-uclibc-eventfd.patch
> 
> diff --git a/package/boost/0004-fix-uclibc-eventfd.patch b/package/boost/0004-fix-uclibc-eventfd.patch
> new file mode 100644
> index 0000000..1b7eb87
> --- /dev/null
> +++ b/package/boost/0004-fix-uclibc-eventfd.patch
> @@ -0,0 +1,38 @@
> +Use eventfd() function with uClibc
> +
> +The Boost eventfd code either directly makes the eventfd system call
> +using __NR_eventfd (when __GLIBC_MINOR is less than 8), or otherwise
> +uses the eventfd() function provided by the C library.
> +
> +However, since uClibc pretends to be glibc 2.2, the Boost eventfd code
> +directly uses the system call. While it works fine on most
> +architectures, it doesn't on ARC since __NR_eventfd is not defined on
> +this architecture. However, eventfd() is properly implemented.
> +
> +So, this patch adjusts the logic used by Boost to consider uClibc as a
> +C library providing the eventfd() function.
> +
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +
> +Index: b/boost/asio/detail/impl/eventfd_select_interrupter.ipp
> +===================================================================
> +--- a/boost/asio/detail/impl/eventfd_select_interrupter.ipp
> ++++ b/boost/asio/detail/impl/eventfd_select_interrupter.ipp
> +@@ -23,7 +23,7 @@
> + #include <sys/stat.h>
> + #include <sys/types.h>
> + #include <fcntl.h>
> +-#if __GLIBC__ == 2 && __GLIBC_MINOR__ < 8
> ++#if __GLIBC__ == 2 && __GLIBC_MINOR__ < 8 && !defined(__UCLIBC__)
> + # include <asm/unistd.h>
> + #else // __GLIBC__ == 2 && __GLIBC_MINOR__ < 8  # include
> +<sys/eventfd.h> @@ -46,7 +46,7 @@
> +
> + void eventfd_select_interrupter::open_descriptors()
> + {
> +-#if __GLIBC__ == 2 && __GLIBC_MINOR__ < 8
> ++#if __GLIBC__ == 2 && __GLIBC_MINOR__ < 8 && !defined(__UCLIBC__)
> +   write_descriptor_ = read_descriptor_ = syscall(__NR_eventfd, 0);
> +   if (read_descriptor_ != -1)
> +   {
> --
> 2.5.0

Even though it's good to have this patch for fixing Boost building I'm not sure
what this hack causes in runtime. Remember I mentioned these checks for
GLIBC version are spread all around their sources.

Anyways I see it is already applied so let's live with it for now.
And I assume once:
 [1] ARC switches from GitHub based uClibc  to uClibc-ng in Buildroot
 [2] uClibc-ng bumps to 1.0.6
we'll get rid of that patch, correct?

-Alexey
