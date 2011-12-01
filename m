From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 1 Dec 2011 12:49:14 +0100
Subject: [Buildroot] RFC dependencies: checking minimum make version
Message-ID: <CAAXf6LW__qfNLx-9jPsx+B_t9MMw4Uinti6+PrP7GzY+1X5mVg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

The buildroot Makefile uses constructs like:

ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
include toolchain/toolchain-buildroot.mk
else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
include toolchain/toolchain-external.mk
else ifeq ($(BR2_TOOLCHAIN_CTNG),y)
include toolchain/toolchain-crosstool-ng.mk
endif

which is supported from 3.81 onwards.
This means that make 3.80 will give a syntax error, even though the
toolchain/dependencies/dependencies.sh checks for minimal make version
(in fact, this script never gets a chance to run).

To fix this, and detect old make versions gracefully, I see following solutions:
1. Adapt our Makefiles to be make 3.80 compatible, by e.g. adapting
the above construct. This is not a waterproof solution, as a similar
but different problem may arise in the future.

2. Check for the make version in make instead of in shell, e.g. with
the following pattern: (adopted from
http://www.jgc.org/blog/cookbook-sample.pdf)
need := 3.81
ok := $(filter $(need),$(firstword $(sort $(MAKE_VERSION) $(need))))
ifeq (,$(ok))
$(error make too old!)
endif

This will not work when make 10.x comes out because of the sort trick,
but otherwise should work fine. This code should be included as early
as possible in the Makefile.


What do you think?

Thanks,
Thomas
