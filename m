From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Jul 2012 10:01:51 +0200
Subject: [Buildroot] [PATCH] Added package v86d which provides a
 real-mode helper for uvesafb driver.
In-Reply-To: <1342495023-17145-1-git-send-email-golubovsky@gmail.com>
References: <1342495023-17145-1-git-send-email-golubovsky@gmail.com>
Message-ID: <20120717100151.3948f42e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 16 Jul 2012 23:17:03 -0400,
Dmitry <golubovsky@gmail.com> a ?crit :

> +define V86D_BUILD_CMDS
> +	$(MAKE) CC="$(TARGET_CC) -D__i386__" LD="$(TARGET_LD)" -C $(@D) all
> +endef

Can you try using $(TARGET_CONFIGURE_OPTS) instead, so that CFLAGS and
al. are also passed?

Something like:

	$(MAKE) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS) -D__i386__" -C $(@D) all

I'm a bit surprised by the -D__i386__, because this is normally defined
by the compiler. Why is it needed?

See:

thomas at skate:/tmp$ cat toto.c 
#ifdef __i386__
#error "You are on x86"
#elif defined(__x86_64__)
#error "You are on x86-64"
#elif defined(__arm__)
#error "You are on ARM"
#endif
thomas at skate:/tmp$ ~/x-tools/ia32-2012.03/bin/i686-pc-linux-gnu-gcc -c toto.c 
toto.c:3:2: error: #error "You are on x86"
thomas at skate:/tmp$ ~/x-tools/ia32-2012.03/bin/i686-pc-linux-gnu-gcc -m64 -c toto.c 
toto.c:5:2: error: #error "You are on x86-64"
thomas at skate:/tmp$ ~/x-tools/arm-2011.03/bin/arm-none-linux-gnueabi-gcc -c toto.c 
toto.c:7:2: error: #error "You are on ARM"

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
