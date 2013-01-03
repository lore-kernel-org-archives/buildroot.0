From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Jan 2013 11:23:06 +0100
Subject: [Buildroot] [PATCH 2/3] Add Perf tools support
In-Reply-To: <CAPDLWs-otw90dvsw7oVra=-+oNJZ0-SeiXE1CoXh1WUxNhq2vQ@mail.gmail.com>
References: <CAPDLWs-otw90dvsw7oVra=-+oNJZ0-SeiXE1CoXh1WUxNhq2vQ@mail.gmail.com>
Message-ID: <20130103112306.0d0ef1c6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Kaiwan Billimoria,

On Thu, 3 Jan 2013 13:20:39 +0530, Kaiwan Billimoria wrote:

> + # FIXME: Where should we place the perf kernel patch? Online?
> + # Temporarily, at least, it's under linux/
> + BR2_LINUX_KERNEL_PATCH += "$(HOST_DIR)/../../linux/perf.patch"

No, we don't modify BR2 variables.

> +all:

Arggh, this is *horrible*. Why do you believe you are allowed to
overload the "all" target?

> +	$(info Building Perf...)
> +	$(TARGET_MAKE_ENV) $(MAKE) ARCH=$(ARCH)
> CROSS_COMPILE=$(TARGET_CROSS) NO_LIBELF=1 -C $(LINUX_DIR)/tools/perf

This should be part of LINUX_BUILD_CMDS

> +	# Perf: Copy the perf binary executable to the target rootfs
> +	cp -f $(LINUX_DIR)/tools/perf/perf $(TARGET_DIR)/usr/sbin

This should be part of LINUX_INSTALL_TARGET_CMDS

And doing that will help you solve the problem you mentioned in your
cover letter ("the 'perf' binary executable is being built after the
root filesystem is tar-red").

That said, I am not sure we want this thing in linux/linux.mk. Maybe
I'd prefer a package/perf/perf.mk, which depends on BR2_LINUX_KERNEL
and re-uses the source code extracted in $(LINUX_DIR).

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
