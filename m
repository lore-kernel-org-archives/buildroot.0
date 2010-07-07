From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Jul 2010 14:09:32 +0200
Subject: [Buildroot] [PATCH] linux: rebuild after reconfiguring kernel
In-Reply-To: <201007061130.52946.hartleys@visionengravers.com>
References: <201007061130.52946.hartleys@visionengravers.com>
Message-ID: <20100707140932.63e1eb19@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello!

On Tue, 6 Jul 2010 11:30:52 -0700
H Hartley Sweeten <hartleys@visionengravers.com> wrote:

> diff --git a/linux/linux.mk b/linux/linux.mk
> index 593a1b4..a014f55 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -139,6 +139,7 @@ linux26: host-module-init-tools $(LINUX26_DEPENDENCIES) $(LINUX26_DIR)/.stamp_in
>  
>  linux26-menuconfig linux26-xconfig linux26-gconfig: $(LINUX26_DIR)/.stamp_configured
>  	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) $(subst linux26-,,$@)
> +	$(Q)touch $@

Unless I'm missing something, this change is going to create a
linux26-menuconfig file or a linux26-xconfig file, which is not
correct, and is not going to retrigger the build step of the kernel.

We are already handling the fact that the kernel should be rebuilt when
its configuration is changed. This is done through the following
dependency :

$(LINUX26_DIR)/.stamp_compiled: $(LINUX26_DIR)/.stamp_configured $(LINUX26_DIR)/.config

So, when the kernel .config is changed, the build step is restarted.

Which exact issue are you facing ? Can you provide an example ?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
