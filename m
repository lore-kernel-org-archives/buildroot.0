From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 22:16:37 +0100
Subject: [Buildroot] [PATCH] ola: bump to 0.9.3
In-Reply-To: <1417661933-16775-1-git-send-email-simon.marchi@polymtl.ca>
References: <1417661933-16775-1-git-send-email-simon.marchi@polymtl.ca>
Message-ID: <20141207221637.3a6612bd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Simon Marchi,

On Wed,  3 Dec 2014 21:58:53 -0500, Simon Marchi wrote:
> This update requires a few changes. First, good news, the patches that you
> guys have submitted to OLA have been merged, so we can drop those.
> 
> Also, the project is now hosted on github.
> 
> Less good news: OLA now builds a small protoc wrapper (ola_protoc) that is
> built and executed at compile-time on the host. If we don't change anything,
> ola_protoc is built with the target toolchain and therefore can't run on the
> host. Explanation for ola_protoc is here [1].
> 
> To solve this, I created a package host-ola, which builds and provides an
> ola_protoc for the host. It tries to disable as much as possible of things
> that we won't need at configure time. Only ola_protoc is built and installed
> so it's not that long.
> 
> I have just built-tested this. I hope to be able to test the runtime within
> a few weeks on an ARM target.
> 
> I am still very noobish with Buildroot, so I'd like to have your comments about
> the choices that I've made. What would you do differently?

Thanks for this patch, it looks pretty good. See some comments below.

One first comment is that your commit log shouldn't contain 'personal'
messages such as "I am still very noobish with Buildroot, so I'd like
to have your comments about the choices that I've made. What would you
do differently?", those comments should appear after the "---" sign, so
that they don't get committed.


>  ################################################################################
>  
> -OLA_VERSION = 0.8.33
> -OLA_SITE = https://open-lighting.googlecode.com/files
> +

There's no need to add one more new line here.

> +OLA_VERSION = 0.9.3
> +OLA_SITE = $(call github,OpenLightingProject,ola,$(OLA_VERSION))
>  
>  OLA_LICENSE = LGPLv2.1+ (libola, libolacommon, Python bindings), GPLv2+ (libolaserver, olad, Python examples and tests)
>  OLA_LICENSE_FILES = LICENCE GPL LGPL
>  OLA_INSTALL_STAGING = YES
>  
> -# We modify configure.ac, so we need to autoreconf
> -OLA_AUTORECONF = YES
> -
>  # util-linux provides uuid lib
> -OLA_DEPENDENCIES = protobuf util-linux host-bison host-flex
> +OLA_DEPENDENCIES = protobuf util-linux host-bison host-flex host-ola
>  
>  OLA_CONF_OPTS = \
>  	ac_cv_have_pymod_google_protobuf=yes \
> @@ -24,7 +22,29 @@ OLA_CONF_OPTS = \
>  	--disable-unittests \
>  	--disable-root-check \
>  	--disable-java-libs \
> -	--disable-fatal-warnings
> +	--disable-fatal-warnings \
> +	--with-ola-protoc=$(HOST_DIR)/usr/bin/ola_protoc
> +
> +# When building the host part, disable as much as possible to speed up
> +# the configure step and avoid missing host dependencies.
> +HOST_OLA_CONF_OPTS = \
> +    --disable-all-plugins \
> +    --disable-slp \
> +    --disable-osc \
> +    --disable-uart \
> +    --disable-libusb \
> +    --disable-libftdi \
> +    --disable-http  \
> +    --disable-examples \
> +    --disable-unittests \
> +    --disable-doxygen-html \
> +    --disable-doxygen-doc

Indentation should use one tab on all those lines.

> +
> +# On the host side, we only need ola_protoc, so build and install this only.
> +HOST_OLA_MAKE = make protoc/ola_protoc

Maybe you could use:

HOST_OLA_MAKE_OPTS = protoc/ola_protoc

instead.

> +define HOST_OLA_INSTALL_CMDS
> +		$(INSTALL) -m 0755 $(@D)/protoc/ola_protoc $(HOST_DIR)/usr/bin

Only one tab needed for the indentation. And please use -D with a full
path, so:

	$(INSTALL) -D -m 0755 $(@D)/protoc/ola_protoc $(HOST_DIR)/usr/bin/ola_protoc

Can you resend a new version with those issues fixed?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
