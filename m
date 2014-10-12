From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 16:48:36 +0200
Subject: [Buildroot] [PATCH] linux-headers: allow use of headers from
	kernel "package" selected
In-Reply-To: <1413105548-13590-1-git-send-email-abrodkin@synopsys.com> (Alexey
 Brodkin's message of "Sun, 12 Oct 2014 11:19:08 +0200")
References: <1413105548-13590-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <87y4slwdh7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexey" == Alexey Brodkin <alexey.brodkin@gmail.com> writes:

 > From: Karoly Kasza <kaszak@gmail.com>
 > This is a re-work of http://patchwork.ozlabs.org/patch/346823/

 > In buildroot kernel headers used for building toolchain come from upstream
 > kernel sources (even though user may specify version, but not origin).

 > This change makes it possible to use exactly the same sources for both
 > headers during toolchain building and for kernel building itself.

 > Moreover if "kernel" is selected to be built by defaut its sources will
 > be used for kernel headers on toolchain build.

 > That way user might be sure that ABI mismatch won't happen between toolchain
 > and kernel.

 > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
 > Signed-off-by: Karoly Kasza <kaszak@gmail.com>

 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > ---
 >  package/linux-headers/Config.in.host   | 8 ++++++++
 >  package/linux-headers/linux-headers.mk | 7 +++++++
 >  2 files changed, 15 insertions(+)

 > diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
 > index 101136a..64d4b9e 100644
 > --- a/package/linux-headers/Config.in.host
 > +++ b/package/linux-headers/Config.in.host
 > @@ -5,6 +5,7 @@ comment "Kernel Header Options"
 
 >  choice
 >  	prompt "Kernel Headers"
 > +	default BR2_KERNEL_HEADERS_SAME_AS_KERNEL if BR2_LINUX_KERNEL
 >  	default BR2_KERNEL_HEADERS_3_17
 >  	help
 >  	  Select the version of kernel header files you wish to use.
 > @@ -69,6 +70,13 @@ choice
 
 >  	config BR2_KERNEL_HEADERS_VERSION
 >  		bool "Manually specified Linux version"
 > +
 > +	config BR2_KERNEL_HEADERS_SAME_AS_KERNEL
 > +		bool "Use Linux kernel specified for target"
 > +		depends on BR2_LINUX_KERNEL
 > +		help
 > +		  Use the Linux kernel specified for the target in
 > +		  the Kernel menu.

Thanks, but we also need to have the BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_XX
stuff working, so you need to show the version selection like we do for
BR2_KERNEL_HEADERS_VERSION (but probably with another description).

With that said, is this really helpful when you still need to provide
the kernel version for the _TOOLCHAIN_HEADERS_AT_LEAST_ stuff? The only
reason I can think of is if you have custom kernel which provides some
kind of extra userspace API (headers).

-- 
Peter Korsgaard 
