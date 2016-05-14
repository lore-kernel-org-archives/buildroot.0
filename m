From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 May 2016 14:25:58 +0200
Subject: [Buildroot] [PATCH] Config.in: add -Og option
In-Reply-To: <1463183826-28562-1-git-send-email-martin@surround.io>
References: <1463183826-28562-1-git-send-email-martin@surround.io>
Message-ID: <20160514142558.70fb92f4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 13 May 2016 16:57:06 -0700, Martin Kelly wrote:
> -Og (introduced in GCC 4.8) lets you optimize for debugging experience,
> which can be useful for when you want optimized code that is nonetheless
> debuggable.
> 
> Signed-off-by: Martin Kelly <martin@surround.io>

Thanks for submitting this patch. I had never heard of -Og, but it
seems like a useful addition.

> +config BR2_OPTIMIZE_g
> +	bool "optimize debugging experience"
> +	select BR2_HOST_GCC_AT_LEAST_4_8

select? You can't select an option such as BR2_HOST_GCC_AT_LEAST_4_8.
How could Buildroot *force* the host machine to have gcc >= 4.8 ?

In addition, using BR2_HOST_GCC_AT_LEAST_4_8 is wrong here: what we
care about is the version of the *target* compiler, not the version of
the host compiler.

So this line should instead be:

	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8

> +	help
> +	  Optimize debugging experience. -Og enables optimizations that do not
> +	  interfere with debugging. It should be the optimization level of choice for
> +	  the standard edit-compile-debug cycle, offering a reasonable level of
> +	  optimization while maintaining fast compilation and a good debugging
> +	  experience. If you use multiple -O options, with or without level numbers,
> +	  the last such option is the one that is effective.

I believe some of those lines are too long. They should have a maximum
length of 72 characters.

Would you mind reworking your patch to address those two issues and
sending an updated version?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
