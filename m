From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Jun 2014 14:17:32 +0200
Subject: [Buildroot] [PATCH] uclibc: enable multiple jobs for building
In-Reply-To: <1403870844-15258-1-git-send-email-abrodkin@synopsys.com> (Alexey
 Brodkin's message of "Fri, 27 Jun 2014 16:07:24 +0400")
References: <1403870844-15258-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <87bntelf6r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:

 > For some reason uClibc got built with only 1 job (MAKE1).
 > Compilation with multiple jobs on modern multi-threaded host CPUs allows to save
 > significant amount of time on toolchain building.

 > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

 > Cc: Anton Kolesov <akolesov@synopsys.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 >  package/uclibc/uclibc.mk | 6 +++---
 >  1 file changed, 3 insertions(+), 3 deletions(-)

 > diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
 > index b42fe55..3957960 100644
 > --- a/package/uclibc/uclibc.mk
 > +++ b/package/uclibc/uclibc.mk
 > @@ -484,7 +484,7 @@ endef
 
 >  ifeq ($(BR2_UCLIBC_INSTALL_TEST_SUITE),y)
 >  define UCLIBC_BUILD_TEST_SUITE
 > -	$(MAKE1) -C $(@D)/test \
 > +	$(MAKE) -C $(@D)/test \
 >  		$(UCLIBC_MAKE_FLAGS) \
 >  		ARCH_CFLAGS=-I$(STAGING_DIR)/usr/include \
 >  		UCLIBC_ONLY=1 \
 > @@ -494,13 +494,13 @@ endef
 >  endif
 
 >  define UCLIBC_BUILD_CMDS
 > -	$(MAKE1) -C $(@D) \
 > +	$(MAKE) -C $(@D) \

The use of MAKE1 for uClibc dates back 10 years:

commit 8e5fb3fb4ab09b4dc04fe7cb3f7becce6514117b
Author: Eric Andersen <andersen@codepoet.org>
Date:   Sat Dec 11 13:01:10 2004 +0000

    Add initial BR2_JLEVEL support, with some exceptions for apps that
    have broken 'make -j' support

So it could very well have been fixed upstream since then. How have you
tested it?

-- 
Bye, Peter Korsgaard 
