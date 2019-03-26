From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Mar 2019 14:57:08 +0100
Subject: [Buildroot] [PATCH v6 3/5] boot/opensbi: new package
In-Reply-To: <20190320230422.13592-3-alistair.francis@wdc.com>
References: <20190320230422.13592-1-alistair.francis@wdc.com>
 <20190320230422.13592-3-alistair.francis@wdc.com>
Message-ID: <20190326145708.6f8946e4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 20 Mar 2019 23:05:21 +0000
Alistair Francis <Alistair.Francis@wdc.com> wrote:

> OpenSBI is a much improved alternative to BBL (riscv-pk). Add OpenSBI
> support to buildroot.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

I have applied, but after doing a few changes for things that were not
completely correct. See below.

> +OPENSBI_VERSION = v0.3
> +OPENSBI_SITE = $(call github,riscv,opensbi,$(OPENSBI_VERSION))
> +OPENSBI_LICENSE = BSD-2-Clause
> +OPENSBI_LICENSE_FILES = COPYING.BSD
> +OPENSBI_INSTALL_IMAGES = YES

This is only really needed when OPENSBI_PLAT != "", so I've moved this
statement inside the appropriate condition.

I've added OPENSBI_INSTALL_TARGET = NO, because we're not installing
anything to target.

But more importantly, I've added OPENSBI_INSTALL_STAGING = YES, without
which your OPENSBI_INSTALL_STAGING_CMDS is never called. I'm not sure
how you tested this, but it clearly couldn't work as is.

> +# Install libsbi.a in the host lib dir so it can be linked in the future.

The library is not installed in host dir. So I've changed this to
rather explain why we install in usr/share/opensbi and not in usr/lib.

Applied with those issues fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
