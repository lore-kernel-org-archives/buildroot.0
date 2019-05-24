From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 May 2019 23:12:17 +0200
Subject: [Buildroot] [PATCH v1] package/busybox: Avoid "can't create
 /proc/sys/kernel/hotplug" error
In-Reply-To: <20190524132548.GU9224@smile.fi.intel.com> (Andy Shevchenko's
 message of "Fri, 24 May 2019 16:25:48 +0300")
References: <20190523131444.36058-1-andriy.shevchenko@linux.intel.com>
 <87ftp5s0k6.fsf@dell.be.48ers.dk> <87pno8qol1.fsf@dell.be.48ers.dk>
 <20190524132548.GU9224@smile.fi.intel.com>
Message-ID: <87sgt3pnf2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andy" == Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:

 >> > But how can mdev work on such setups?

 > At least the script is used to initialize modules at the boot time.
 > What happens afterwards I didn't investigate. I have no such issues.

You mean the:

        # coldplug modules
        find /sys/ -name modalias -print0 | xargs -0 sort -u | tr '\n' '\0' | \
            xargs -0 modprobe -abq

That indeed does not depend on mdev working.


 >> To be clear, if mdev needs CONFIG_UEVENT_HELPER=y for hotplug
 >> notifications, then we should rather force that in linux/linux.mk and
 >> mention the dependency in the mdev help text rather than silently not
 >> having hotplug work.
 >> 
 >> I have marked this patch as changes requested in patchwork.

 > Kernel can be built outside of Buildroot. Still this needs to be fixed.

And just like all other packages that require specific kernel options
enabled, if you are not using Buildroot to build the kernel then you
have to ensure the kernel has the right config options enabled.

I am not sure what you mean exactly with "Still this needs to be
fixed". The only fix I can think of is what I mentioned above,
E.G. document the need for CONFIG_UEVENT_HELPER in the help text and
automatically enable it in linux.mk.

Expecting mdev to work sensible on a system without uevent helper
support isn't sensible, it is similar to having radvd (IPv6 router
advertising daemon) work on a system without IPv6.

-- 
Bye, Peter Korsgaard
