From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Dec 2016 16:26:03 +0100
Subject: [Buildroot] Package not building automatically.
In-Reply-To: <be469460-df73-df24-c85b-614e8b2d572c@rd.bbc.co.uk>
References: <be469460-df73-df24-c85b-614e8b2d572c@rd.bbc.co.uk>
Message-ID: <20161201162603.1747cb41@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 1 Dec 2016 14:39:52 +0000, Samuel Hurst wrote:

> Apologies if this isn't the right place to ask this question.
> 
> I'm currently using Buildroot to build some images for Raspberry Pis to
> be used as demonstrators. However, I've been hitting an issue where
> Buildroot is not building certain packages unless I force them to build
> manually (i.e. make <package-name>, instead of just running make).
> 
> In this case, I'm trying to get a Google QUIC library to build from
> github. I'm wondering if it's something wrong with my Config.in and .mk
> files that I've created:
> 
> == package/libquic/Config.in ===========================================
> config BR2_PACKAGE_LIBQUIC
>     bool "libquic"
>     depends on BR2_TOOLCHAIN_HAS_THREADS
>     select BR2_PACKAGE_ICU
>     select BR2_PACKAGE_LIBEVENT
>     help
>         QUIC, a multiplexed stream transport over UDP
> 
> ========================================================================
> 
> == package/libquic/libquic.mk ==========================================
> #############################################################################
> #
> # QUIC Library
> #
> #############################################################################
> 
> LIBQUIC_VERSION = 8954789a056d8e7d5fcb6452fd1572ca57eb5c4e
> LIBQUIC_SITE_METHOD = git
> LIBQUIC_SITE = https://github.com/devsisters/libquic.git
> LIBQUIC_SOURCE = libquic-$(LIBQUIC_VERSION).tar.gz
> LIBQUIC_DEPENDENCIES = icu libevent
> LIBQUIC_INSTALL_STAGING = YES
> 
> $(eval $(cmake-package))
> ========================================================================
> 
> The package shows up in the menuconfig interface and it is selected
> (indeed, it is depended on by another package which does build as it
> should). Can anyone cast some light onto what I might be doing wrong?

Nothing looks wrong here. Are you sure that grep
BR2_PACKAGE_LIBQUIC .config shows that this package is enabled?

For a package to build, there's a few rules to respect:

 - the option must be named BR2_PACKAGE_<FOO>

 - the package must be in package/<foo>/<foo>.mk

 - the variables in foo.mk must be prefixed by <FOO>

All three conditions seem to be respected on what you're showing.

Unrelated, but the LIBQUIC_SOURCE variable is useless, since you have
specified LIBQUIC_SITE_METHOD = git. But that's definitely not the
reason why this package doesn't build.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
