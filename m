From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 9 Sep 2020 23:20:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/makedumpfile: fix build for
 powerpc target
In-Reply-To: <20200909164104.6246-1-egorenar-dev@posteo.net>
References: <20200909164104.6246-1-egorenar-dev@posteo.net>
Message-ID: <20200909232048.107b5922@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alexander,

On Wed,  9 Sep 2020 18:41:04 +0200
Alexander Egorenkov <egorenar-dev@posteo.net> wrote:

> Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>

Is there an autobuilder failure for this? If so, there should be a link
to it in your commit log. See for example this commit log:

  https://git.buildroot.org/buildroot/commit/?id=a85ae8b297fd0526f57fe99d73087dd840ea6219

> diff --git a/package/makedumpfile/0003-Makefile-fix-ARCH-for-TARGET-powerpc.patch b/package/makedumpfile/0003-Makefile-fix-ARCH-for-TARGET-powerpc.patch
> new file mode 100644
> index 0000000000..ba75463ec4
> --- /dev/null
> +++ b/package/makedumpfile/0003-Makefile-fix-ARCH-for-TARGET-powerpc.patch
> @@ -0,0 +1,28 @@
> +From 18acea4df1d02f0275606fa4e73292d7759bdf15 Mon Sep 17 00:00:00 2001
> +From: Alexander Egorenkov <egorenar-dev@posteo.net>
> +Date: Wed, 9 Sep 2020 18:35:05 +0200
> +Subject: [PATCH] Makefile: fix ARCH for TARGET powerpc
> +
> +TARGET 'ppc' and 'powerpc' shall result in ARCH 'powerpc32'.
> +
> +Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>

I'm not sure the best solution here is to patch makedumpfile. Indeed,
Buildroot's makedumpfile.mk is passing TARGET=$(BR2_ARCH), but there is
nothing that "forces" makedumpfile to understand the BR2_ARCH values.

So instead, I think we should have some logic in makedumpfile.mk that
calculates the correct TARGET values depending on the CPU architecture.
Something along the lines of:

ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
MAKEDUMPFILE_TARGET = ...
else ifeq ($(BR2_arm)$(BR2_armeb),y)
MAKEDUMPFILE_TARGET = ...
else ifeq ...
...
endif

Perhaps if for some architectures the BR2_ARCH value is OK, you could
finish this if sequence by:

else
MAKEDUMPFILE_TARGET = $(BR2_ARCH)
endif

and then of course, pass TARGET=$(MAKEDUMPFILE_TARGET)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
