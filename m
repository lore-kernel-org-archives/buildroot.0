From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Sep 2016 12:51:41 +0200
Subject: [Buildroot] [PATCH 1/2 v3] linux/tools: make it a real,
 separate package
In-Reply-To: <7af6b231b19828564aae1a098568e96e15843a62.1473171931.git.yann.morin.1998@free.fr>
References: <cover.1473171931.git.yann.morin.1998@free.fr>
 <7af6b231b19828564aae1a098568e96e15843a62.1473171931.git.yann.morin.1998@free.fr>
Message-ID: <20160922125141.0a1de244@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've applied, after doing a few changes, see below.

On Tue,  6 Sep 2016 16:29:14 +0200, Yann E. MORIN wrote:
> The kernel source tree also contains the sources for various userland
> tools, of which cpupower, perf or selftests.
> +################################################################################
> +#
> +# linux-tools
> +#
> +################################################################################
> +
> +# Vampirising sources from the kernel tree, so no source nor site specified.
> +# Instead, we directly build in the sources of the linux package. We can do
> +# that, because we're not building in the same location and the same files.
> +#
> +# So, all tools refer to $(LINUX_DIR) instead of #(@D).

Typo: $(@D) instead of #(@D)

> +# Include all our tools definitions.
> +#
> +# Note: our package infrastructure uses the full-path of the last-scanned
> +# Makefile to determine what package we're currently defining, using the
> +# last directory component in the path. As such, including other Makefile,
> +# like below, before we call one of the *-package macro is usally not
> +# working.
> +# However, since the files we include here are in the same directory as
> +# the current Makefile, we are OK. But this is a hard requirement: files
> +# included here *must* be in the same directory!
> +include $(sort $(wildcard linux/linux-tools/linux-ext-*.mk))

This include path is wrong, so I've changed it to:

include $(sort $(wildcard package/linux-tools/linux-tool-*.mk))

and in fact, I fixed it in the original commit, and then realized I
messed up, so I had to fix it again in a follow-up commit.

Thanks for doing this work. Glad to see this issues fixed!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
