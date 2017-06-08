From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jun 2017 21:54:46 +0200
Subject: [Buildroot] [PATCH v1 1/2] package/libv4l: upstream patches for
 noMMU platform
In-Reply-To: <1496830327-5235-2-git-send-email-hugues.fruchet@st.com>
References: <1496830327-5235-1-git-send-email-hugues.fruchet@st.com>
 <1496830327-5235-2-git-send-email-hugues.fruchet@st.com>
Message-ID: <20170608215446.3681e074@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 7 Jun 2017 12:12:06 +0200, Hugues Fruchet wrote:
> In order to build v4l2 utilities such as compliancy tools
> like v4l2-compliance or cec-compliance, v4-utils can now be
> built without dynamic libraries support.
> In that case the v4l-utils parts which depends on dynamic
> library support are not built:
>  - libv4l & libv4lconvert libraries
>  - libv4l plugins
>  - rds-ctl utility
>  - contrib test utilities
> The rest of utilities are built.
> 
> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>

Thanks a lot for those patches! It's mostly good, but I have a few
comments. First of all, both of your patches should be squashed into
just one, because they serve the same purpose: enabling libv4l on
nommu/static linking configurations.

> +From f0871b0e6b7f42ab93bbb1dc780e2621a05362f3 Mon Sep 17 00:00:00 2001
> +From: Hans Verkuil <hans.verkuil@cisco.com>
> +Date: Mon, 15 May 2017 15:13:00 +0200
> +Subject: [PATCH 4/9] configure.ac: clarify configure summary

Please generate the package/libv4l/ patch series with "git format-patch
-N" so  that the prefix is just [PATCH] and not [PATCH X/Y].

> +
> +Some of the texts are rather obscure and misleading. Fix those.
> +
> +Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>

Please add your SoB to the patches you are adding into Buildroot.

Those two comments are valid for all four patches.

> +# we patch configure.ac
> +define LIBV4L_RUN_BOOTSTRAP
> +	cd $(@D) && ./bootstrap.sh
> +endef
> +LIBV4L_PRE_CONFIGURE_HOOKS += LIBV4L_RUN_BOOTSTRAP

Please use:

LIBV4L_AUTORECONF = YES

instead. What you did does not work because it requires host-autoconf,
host-automake and host-libtool, and they are not added to the
dependencies. <pkg>_AUTORECONF = YES does all of that for you. Please
add a comment above this line that lists which patches required adding
AUTORECONF = YES, so we know when we can remove AUTORECONF = YES.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
