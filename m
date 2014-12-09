From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Dec 2014 23:59:28 +0100
Subject: [Buildroot] [PATCH v3] pkg-cmake.mk: Set CMAKE_SYSTEM_PROCESSOR.
In-Reply-To: <1416254561-12691-1-git-send-email-volker.krause@kdab.com>
References: <1416254561-12691-1-git-send-email-volker.krause@kdab.com>
Message-ID: <20141209235928.15c3181f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Volker Krause,

On Mon, 17 Nov 2014 21:02:41 +0100, Volker Krause wrote:
> This is rarely needed by packages, but convenient to have when it is.
> 
> Signed-off-by: Volker Krause <volker.krause@kdab.com>

Thanks, I've applied your patch, with a few changes (see below).

> +# CMAKE_SYSTEM_PROCESSOR should match uname -m
> +ifeq ($(BR2_ARM_CPU_ARMV4),y)
> +ARM_VARIANT = armv4
> +else ifeq ($(BR2_ARM_CPU_ARMV5),y)
> +ARM_VARIANT = armv5
> +else ifeq ($(BR2_ARM_CPU_ARMV6),y)
> +ARM_VARIANT = armv6
> +else ifeq ($(BR2_ARM_CPU_ARMV7A),y)
> +ARM_VARIANT = armv7
> +endif

The namespace of variables is global, and we don't want pkg-cmake.mk to
define a variable with a name as "global" as ARM_VARIANT. So I've
renamed this variable to CMAKE_SYSTEM_PROCESSOR_ARM_VARIANT.

> +
> +ifeq ($(BR2_arm),y)
> +CMAKE_SYSTEM_PROCESSOR = $(ARM_VARIANT)l
> +else ifeq ($(BR2_armeb),y)
> +CMAKE_SYSTEM_PROCESSOR = $(ARM_VARIANT)b
> +endif
> +
> +ifndef CMAKE_SYSTEM_PROCESSOR
> +CMAKE_SYSTEM_PROCESSOR = $(BR2_ARCH)
> +endif

I've changed this to the more logical (IMO):

ifeq ($(BR2_arm),y)
...
else ifeq ($(BR2_armeb),y)
...
else
... = $(BR2_ARCH)
endif

See:

  http://git.buildroot.net/buildroot/commit/?id=c1e41153e662c7d49d7e0d1bf5e7a953d784f849

For the result.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
