From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 May 2016 22:38:00 +0200
Subject: [Buildroot] [PATCH v2] Fix for GIT cross-compilation.
In-Reply-To: <1463948975-21495-1-git-send-email-mc5686@mclink.it>
References: <1463948975-21495-1-git-send-email-mc5686@mclink.it>
Message-ID: <20160522223800.0adabe05@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 22 May 2016 22:29:35 +0200, Mauro Condarelli wrote:
> GIT configuration partially relies on system parameters retrieved
> using 'uname -?' directlly at make time.
> This does not mix well with cross compilation.
> This patch allows to feed canned uname results directly from git.mk.
> 
> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>

This one looks good. Have you submitted the Git patch to the upstream
Git project?


> +# git has make-time configuration based on uname; pass over specific
> +# values to be used in config.mak.uname unstead of `uname -#` output
> +GIT_MAKE_OPTS += \
> +	uname_S="Linux" \
> +	uname_M=$(BR2_ARCH) \
> +	uname_O="GNU/Linux" \
> +	uname_R=$(BR2_LINUX_KERNEL_VERSION) \
> +	uname_P="unknown" \
> +	uname_V="BuildRoot Linux $(patsubst "%",%,$(BR2_LINUX_KERNEL_VERSION))"

One small nit: Buildroot is written Buildroot, not BuildRoot.

A bigger issue is that you're using BR2_LINUX_KERNEL_VERSION, but
there's absolutely no guarantee that this variable will have a value.
It only has a value if you are building a Linux kernel with Buildroot,
which is not mandatory. I would rather suggest to use the kernel
headers version, since you're sure this one is always defined.

So, perhaps the BR2_TOOLCHAIN_HEADERS_AT_LEAST variable?

Also, don't do $(patsubst "%",%,...). Use $(call qstrip,...) instead.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
