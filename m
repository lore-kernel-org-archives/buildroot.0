From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Jun 2019 16:42:52 +0200
Subject: [Buildroot] [PATCH 26/27] package/sqlite: work around build
 timeout
In-Reply-To: <20190614210346.121013-27-giulio.benetti@micronovasrl.com>
References: <20190614210346.121013-1-giulio.benetti@micronovasrl.com>
 <20190614210346.121013-27-giulio.benetti@micronovasrl.com>
Message-ID: <20190620164252.399af7b6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Giulio,

On Fri, 14 Jun 2019 23:03:45 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> With Microblaze Gcc version 4.9 build hangs due to a bug discovered for
> Gcc 4.9 only. Since Gcc 4.9 is not maintaned anymore it doesn't make
> sense to report this bug in Gcc bugzilla and use
> BR2_TOOLCHAIN_HAS_GCC_BUG_. So let's check if we're building for
> Microblaze with Gcc version < 5.x and work around the bug forcing the
> use of -O0.

I've applied, but this patch had two issues, which I fixed before
applying. See below.

> +ifeq ($(BR2_microblaze)$(BR2_TOOLCHAIN_GCC_AT_LEAST_5),y)

This condition is incorrectly written: the way you wrote it, if the
architecture is *not* Microblaze, but BR2_TOOLCHAIN_GCC_AT_LEAST_5=y,
the condition will evaluate to true.

So basically this condition not only passes -O0 on Microblaze with gcc
< 5.x, but it also passes -O0 on all architectures other than
Microblaze that use gcc >= 5.x. Very bad!

The correct way is:

ifeq ($(BR2_microblaze):$(BR2_TOOLCHAIN_GCC_AT_LEAST_5),y:)

This really tests that BR2_microblaze=y and
BR2_TOOLCHAIN_GCC_AT_LEAST_5 is empty.

> +SQLITE_CFLAGS += -O0

Here, you completely leave TARGET_CFLAGS unused, which is not good, as
they were used before (in what is now the else condition).

So I changed to += $(TARGET_CFLAGS) -O0

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
