From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jan 2016 21:58:33 +0100
Subject: [Buildroot] [PATCH] dt: new package
In-Reply-To: <1453840823-24345-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1453840823-24345-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <20160126215833.1afdb8dc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo,

On Tue, 26 Jan 2016 17:40:23 -0300, gustavo.zacarias at free-electrons.com
wrote:

> +# uClibc doesn't provide POSIX AIO
> +ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),)
> +DT_AIO_FLAG = -DAIO
> +endif

I think this one should rather be:

ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
...
endif

> +define DT_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/$(DT_SUBDIR) -f Makefile.linux \
> +	CC="$(TARGET_CC)" \
> +	CFLAGS="$(TARGET_CFLAGS) -std=c99 $(DT_AIO_FLAG) -DMMAP -D__linux__ -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -DTHREADS -DSCSI" \
> +	LDFLAGS="$(TARGET_LDFLAGS)" \
> +	OS=linux

Can you use TARGET_CONFIGURE_OPTS here instead ?

Maybe something like:

DT_CFLAGS = \
	-std=c99 \
	$(DT_AIO_FLAG) \
	-DMMAP \
	-D__linux__ \
	-D_GNU_SOURCE \
	-D_FILE_OFFSET_BITS=64 \
	-DTHREADS \
	-DSCSI

and then:

	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/$(DT_SUBDIR) -f Makefile.linux \
		$(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS) $(DT_CFLAGS)" \
		OS=linux

What do you think ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
