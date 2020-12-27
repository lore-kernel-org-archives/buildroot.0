From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Dec 2020 21:04:04 +0100
Subject: [Buildroot] [PATCH v3] package/rt-tests: add support to build
 without numactl
In-Reply-To: <20201227191349.GA18184@arbad>
References: <20201227191349.GA18184@arbad>
Message-ID: <20201227210404.4b602523@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 27 Dec 2020 20:13:50 +0100
Andreas Klinger <ak@it-klinger.de> wrote:

> -	select BR2_PACKAGE_NUMACTL
> +	select BR2_PACKAGE_NUMACTL if BR2_PACKAGE_NUMACTL_ARCH_SUPPORTS

In fact, I disagree with Baruch: if numactl is an optional dependency,
it really should be optional. So this line in Config.in would not be
needed.

> +ifeq ($(BR2_PACKAGE_NUMACTL_ARCH_SUPPORTS),y)

And change this to:

ifeq ($(BR2_PACKAGE_NUMACTL),y)

>  RT_TESTS_DEPENDENCIES = numactl
> +else
> +RT_TESTS_MAKE_OPTS += NUMA=0
> +endif

This way, numactl is only used by rt-tests if numactl is enabled.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
