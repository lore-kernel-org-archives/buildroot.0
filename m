From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Apr 2020 22:56:39 +0200
Subject: [Buildroot] [PATCH 1/1] support/config-fragments/autobuild: add
 x86_64 glibc debug toolchain
In-Reply-To: <20200229003116.115081-1-james.hilliard1@gmail.com>
References: <20200229003116.115081-1-james.hilliard1@gmail.com>
Message-ID: <20200413225639.6beee8dd@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello James,

On Fri, 28 Feb 2020 17:31:16 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> This toolchain config helps to catch build issues that are only
> reproducible when building with a debug optimizations enabled.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Thanks for this proposal, but what you propose is not how we want to
deal with that. See below.

> diff --git a/support/config-fragments/autobuild/br-x86-64-internal-glibc-debug.config b/support/config-fragments/autobuild/br-x86-64-internal-glibc-debug.config
> new file mode 100644
> index 0000000000..7cf6238471
> --- /dev/null
> +++ b/support/config-fragments/autobuild/br-x86-64-internal-glibc-debug.config
> @@ -0,0 +1,5 @@
> +BR2_x86_64=y
> +BR2_OPTIMIZE_G=y

We already have some explicit randomization for BR2_OPTIMIZE_2 in
utils/genrandconfig, so we should probably extend that to include the
other optimization levels in the randomization, including
BR2_OPTIMIZE_G. Patches welcome.

> +BR2_ENABLE_DEBUG=y

We already have randomization for this option in utils/genrandconfig.

> +BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> +BR2_TOOLCHAIN_BUILDROOT_CXX=y

So the question is whether we want to add a x86-64/glibc internal
toolchain. We do already have an br-arm-internal-glibc.config, which
with the randomization of BR2_ENABLE_DEBUG=y already in place + the
randomization of BR2_OPTIMIZE_G=y that can easily be added, would be
suitable to test the cases you're pointing to.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
