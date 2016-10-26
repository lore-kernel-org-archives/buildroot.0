From: Cyril Bur <cyrilbur@gmail.com>
Date: Wed, 26 Oct 2016 14:20:15 +1100
Subject: [Buildroot] [PATCH] kvm-unit-tests: Fix x86_64 to use host
 compiler
In-Reply-To: <20161025121528.7880d604@free-electrons.com>
References: <20161025054240.10957-1-cyrilbur@gmail.com>
 <20161025121528.7880d604@free-electrons.com>
Message-ID: <1477452015.708.5.camel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2016-10-25 at 12:15 +0200, Thomas Petazzoni wrote:
> Cyril,
> 
> Thanks for fixing this issue!
> 
> On Tue, 25 Oct 2016 16:42:40 +1100, Cyril Bur wrote:
> > diff --git a/package/kvm-unit-tests/kvm-unit-tests.mk
> > b/package/kvm-unit-tests/kvm-unit-tests.mk
> > index 7fd03ad..cdce1e4 100644
> > --- a/package/kvm-unit-tests/kvm-unit-tests.mk
> > +++ b/package/kvm-unit-tests/kvm-unit-tests.mk
> > @@ -4,20 +4,25 @@
> > ?#
> > ?##################################################################
> > ##############
> > ?
> > -KVM_UNIT_TESTS_VERSION = 0b04ed0610035792514fd8499eb4dacc185520d9
> > +KVM_UNIT_TESTS_VERSION = 9111ccab0bb42d93d9f2b84c9089b5790e763056
> 
> Is this bump related to using the host compiler on x86-64 ? I don't
> think it is, so it should be a separate patch. Or if it's related, it
> should be explained in the commit log.
> 
> > ?KVM_UNIT_TESTS_SITE = $(BR2_KERNEL_MIRROR)/scm/virt/kvm/kvm-unit-
> > tests.git
> > ?KVM_UNIT_TESTS_SITE_METHOD = git
> > ?KVM_UNIT_TESTS_LICENSE = LGPLv2
> > ?KVM_UNIT_TESTS_LICENSE_FILES = COPYRIGHT
> > ?
> > +#Use HOSTCC for x86_64 as we'll need to compile 32bit code
> > +#which buildroot cross compilers often can't do
> 
> Add one space after the # on each line.
> 
> > +ifeq ($(BR2_x86_64),y)
> > +KVM_UNIT_TESTS_ARCH = x86_84
> > +else
> > +KVM_UNIT_TESTS_CONF_OPTS = --cross-prefix="$(TARGET_CROSS)"
> > +endif
> > ?ifeq ($(BR2_arm),y)
> > ?KVM_UNIT_TESTS_ARCH = arm
> > ?else ifeq ($(BR2_i386),y)
> > ?KVM_UNIT_TESTS_ARCH = i386
> > ?else ifeq ($(BR2_powerpc64)$(BR2_powerpc64le),y)
> > ?KVM_UNIT_TESTS_ARCH = ppc64
> > -else ifeq ($(BR2_x86_64),y)
> > -KVM_UNIT_TESTS_ARCH = x86_84
> > ?endif
> 
> Please keep this sequence of ifeq / else ifeq / else ifeq / endif,
> and
> instead add:
> 
> # For all architectures but x86-64, use the cross-compiler. On x86-
> 64,
> # use the host compiler, since we need to build 32 bits binaries
> ifneq ($(BR2_x86_64),y)
> KVM_UNIT_TESTS_CONF_OPTS = --cross-prefix="$(TARGET_CROSS)"
> endif
> 
> Thanks,
> 

Thanks for the review,

I've addressed all these issues in v2

Cyril

> Thomas
