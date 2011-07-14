From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 14 Jul 2011 12:28:39 +0200
Subject: [Buildroot] [git commit] linux: add support for 3.x and -rc
	versions
In-Reply-To: <1310632596.2068.3.camel@sven> (Sven Neumann's message of "Thu,
 14 Jul 2011 10:36:36 +0200")
References: <20110711214654.9E4738A482@busybox.osuosl.org>
 <1310632596.2068.3.camel@sven>
Message-ID: <87ipr5cg14.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

Hi,

 Sven> I've updated to latest git today and ran into this error:

 Sven> linux/linux.mk:26: *** Recursive variable `LINUX_SITE' references itself
 Sven> (eventually).  Stop.

Interesting, I haven't seen that here. What make version are you using?
I just built qemu_arm_versatile_defconfig with make 3.81 without any
problems. Could you post your config, please?

 Sven> For now I've solved this by the following (somewhat inelegant) change:

I think we can simply replace one of the '=' with a := to break the
loop, but would like to be able to reproduce it first.


 Sven> I also think that the logic for selecting a custom tarball is wrong.
 Sven> Shouldn't this rather be changed like this:

 Sven> diff --git a/linux/linux.mk b/linux/linux.mk
 Sven> index 88fe6dd..35a228a 100644
 Sven> --- a/linux/linux.mk
 Sven> +++ b/linux/linux.mk
 Sven> @@ -6,7 +6,7 @@
 Sven>  LINUX_VERSION=$(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
 
 Sven>  # Compute LINUX_SOURCE and LINUX_SITE from the configuration
 Sven> -ifeq ($(LINUX_VERSION),custom)
 Sven> +ifeq ($(BR2_LINUX_KERNEL_CUSTOM_TARBALL),y)
 Sven>  LINUX_TARBALL = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))

As far as I can see those should be equivalent as LINUX_VERSION is:

default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL

-- 
Bye, Peter Korsgaard
