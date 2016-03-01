From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Mar 2016 09:47:19 +0100
Subject: [Buildroot] [PATCH] linux: don't add to toolchain dependency
In-Reply-To: <20160224150409.0113e34c@free-electrons.com> (Thomas Petazzoni's
 message of "Wed, 24 Feb 2016 15:04:09 +0100")
References: <1456141244-624-1-git-send-email-gustavo@zacarias.com.ar>
 <20160222131901.3baa956e@free-electrons.com>
 <56CCF17D.2030508@mind.be> <56CDA9DE.4000900@zacarias.com.ar>
 <20160224150409.0113e34c@free-electrons.com>
Message-ID: <87mvqimvoo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

>> So it's not as innocent as you think.

 > I agree. In the end, I believe the mistake is to have linux-headers
 > depends on linux.

 > I continue to believe that it's much easier to duplicate in
 > linux-headers the 10-20 lines of linux.mk logic that infer the
 > _SOURCE/_SITE/_VERSION from the BR2_LINUX_KERNEL_* variables.

 > Yes, it means we will extract the kernel sources twice, but when you're
 > building an internal toolchain, this is really negligible.

 > And this way, we break the dependency from linux-headers on linux, and
 > the problem is solved.

 > Something along the lines of (quickly tested) of the following patch.
 > Yes, we duplicate logic, but we don't change this logic every day, so
 > maybe it's acceptable.

Yes, I think this is the safest solution for 2016.02.

 > diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
 > index 6339280..ad31e55 100644
 > --- a/package/linux-headers/linux-headers.mk
 > +++ b/package/linux-headers/linux-headers.mk
 > @@ -9,14 +9,63 @@
 
 >  ifeq ($(BR2_KERNEL_HEADERS_AS_KERNEL),y)
 
 > -LINUX_HEADERS_VERSION = none
 > -LINUX_HEADERS_SOURCE =
 > +LINUX_HEADERS_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
 > +
 > +# Compute LINUX_SOURCE and LINUX_SITE from the configuration

This should be LINUX_HEADERS_SOURCE/SITE ;)

> +ifeq ($(BR2_LINUX_KERNEL_CUSTOM_TARBALL),y)
 > +LINUX_HEADERS_TARBALL = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
 > +LINUX_HEADERS_SITE = $(patsubst %/,%,$(dir $(LINUX_HEADERS_TARBALL)))
 > +LINUX_HEADERS_SOURCE = $(notdir $(LINUX_HEADERS_TARBALL))
 > +BR_NO_CHECK_HASH_FOR += $(LINUX_HEADERS_SOURCE)
 > +else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_LOCAL),y)
 > +LINUX_HEADERS_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_LOCAL_PATH))
 > +LINUX_HEADERS_SITE_METHOD = local
 > +else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_GIT),y)
 > +LINUX_HEADERS_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
 > +LINUX_HEADERS_SITE_METHOD = git
 > +else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_HG),y)
 > +LINUX_HEADERS_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
 > +LINUX_HEADERS_SITE_METHOD = hg

It's a bit painful to git/hg clone a kernel tree twice, so I've added

LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.gz

To both of these so the download infrastructure knows it is the same
data and doesn't try to do it twice.

> +else
 > +LINUX_HEADERS_SOURCE = linux-$(LINUX_VERSION).tar.xz

This should really be LINUX_HEADERS_VERSION to not rely on the internal
linux.mk symbols.

Other than that I have verified that this logic is identical with the
code in linux.mk after s/LINUX_HEADERS_/LINUX_.

Committed, thanks.

-- 
Bye, Peter Korsgaard
