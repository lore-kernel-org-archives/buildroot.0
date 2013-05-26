From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 May 2013 17:54:44 +0200
Subject: [Buildroot] [PATCH] linux: add default defconfig
In-Reply-To: <1346598341-20434-1-git-send-email-arnout@mind.be>
References: <50435801.7050406@mind.be>
 <1346598341-20434-1-git-send-email-arnout@mind.be>
Message-ID: <20130526175444.57921f73@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Sun,  2 Sep 2012 17:05:41 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> Buildroot currently requires a defconfig to be supplied for the kernel:
> either a custom supplied one, or one from the kernel tree.  However,
> the kernel can (usually) also select a default defconfig, based on
> the architecture.  So make this option available to buildroot.
> 
> We also make this the default, so the user can compile a kernel with
> minimal effort.
> 
> Microblaze currently (linux-3.5) doesn't have a default defconfig.
> Older versions also lack it for some architectures (e.g. mips was
> introduced in 2.6.35) but that's nearly impossible to check for at
> buildroot level.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

I'm not sure I agree with this one. On many architectures, the default
defconfig doesn't necessarily make sense. For example, on ARM, the
default defconfig is versatile, which is very unlikely to match the
user's hardware.

In the current situation, if the user only enables the "Linux kernel",
he gets an error at build time telling him that building a kernel
without specifying a configuration is not possible. I think this is a
sane behavior that should be preserved.

With this patch, the user will enable "Linux kernel", not notice that
it should be configured, do the build, and then try to boot the kernel
on some hardware platform... and get something that doesn't work at all.

So I believe here that "compiling a kernel with minimal effort" is not
possible. You _have_ to select a configuration.

The only architecture on which I believe this would make sense are i386
and x86_64, because the kernel only provides one defconfig for each of
them. In this case, something like:

config BR2_LINUX_KERNEL_DEFCONFIG
        string "Defconfig name"
        depends on BR2_LINUX_KERNEL_USE_DEFCONFIG
+	default "i386" if BR2_i386
+	default "x86_64" if BR2_x86_64

would be sufficient. Even though some defconfig contain so many options
enabled that they take ages to build, and are a bit irrelevant to build
a kernel for an embedded system, but that's a different story.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
