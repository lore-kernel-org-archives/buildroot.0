From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Apr 2010 16:58:37 +0200
Subject: [Buildroot] Question about external toolchain configuration
 "options"
In-Reply-To: <201004132051.48176.yann.morin.1998@anciens.enib.fr>
References: <hq2d7t$5ut$1@dough.gmane.org>
	<201004132051.48176.yann.morin.1998@anciens.enib.fr>
Message-ID: <20100414165837.453af3a1@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 13 Apr 2010 20:51:47 +0200
"Yann E. MORIN" <yann.morin.1998@anciens.enib.fr> wrote:

> To determine these 'options', we need to know the external toolchain location
> first. The external toolchain location is also specified in the menuconfig.
> 
> So there is no way to detect those values, and properly show/hide the
> affected packages.

Right.

> Then there is two solutions:
> - present toolchain 'options', and have proper package hidding, but implies
>   checking the user did not make a mistake in the toolchain 'options',
> or:
> - present all packages, and then check that selected packages are buildable.
> 
> buildroot choosed the first solution. It has the advantage of using the
> same package dependency rules as when using the built-in toolchain mechanism.

Exactly.

> Maybe the prompts should be reworked with smthg like (when external toolchain
> is selected):
>   [ ] Toolchain has IPv6
>   [ ] Toolchain has locales
> and so on...

This is what my toolchain-config-improvements branch does
(http://git.buildroot.net/~tpetazzoni/git/buildroot/log/?h=toolchain-config-improvements),
but Peter had comments when I submitted it and I have ideas for
improvements.

I think I'll use some hidden options like :

config BR2_TOOLCHAIN_HAS_IPV6
	bool

All the packages should depend o n BR2_TOOLCHAIN_HAS_* options. And
then, internal toolchains configuration would do something like:

config BR2_BUILDROOT_TOOLCHAIN_ENABLE_IPV6
	bool "Enable IPv6 support"
	select BR2_TOOLCHAIN_HAS_IPV6

while external toolchain configuration would do something like:

config BR2_EXTERNAL_TOOLCHAIN_HAS_IPV6
	bool "Toolchain has IPv6"
	select BR2_TOOLCHAIN_HAS_IPV6

What do you think of this ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
