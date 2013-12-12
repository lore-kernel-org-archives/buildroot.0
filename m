From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 13 Dec 2013 00:14:45 +0100
Subject: [Buildroot] [PATCH] Makefile: include BR2_EXTERNAL before other
	packages
In-Reply-To: <1386870727-25575-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Thu, 12 Dec 2013 18:52:07 +0100")
References: <1386870727-25575-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87txedzmoq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > BR2_EXTERNAL may contain packages that are "providers" of generic
 > functionalities, such as EGL/GLES/...

Ehh, do we want to support that? With the way we have implemented the
virtual jpeg/egl/.. whatever packages, the virtual package needs to know
about all the packages providing that functionality, so it can add the
implementation to it's dependencies (and complain if nothing is
enabled) - So to do it from BR2_EXTERNAL those external packages have to
mess with the variables of the virtual package (E.G. JPEG_DEPENDENCIES),
which isn't really nice (and is an implementation detail).

Is this position going to be the right place to include BR2_EXTERNAL for
everyone? E.G. you cannot use it to implement custom filesystem types.

If we put the include here, then it becomes very close to the
BR2_PACKAGE_OVERRIDE_FILE functionality (which gets included just
before) - Perhaps we should not have two features doing basically the
same?

Comments anybody?

 > So, BR2_EXTERNAL must be included before our built-in packages,
 > otherwise the dependencies and rules for our built-in packages
 > are evaluated too early.

 > David has reported that doing so fixes his use-case, but we should
 > still consider this as a stop-gap until we can come up with a proper
 > fix.

 > Remove a superfluous extra empty line at the same time.

 > Reported-by: David Corvoysier <david.corvoysier@orange.com>
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: David Corvoysier <david.corvoysier@orange.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 >  Makefile | 7 ++++---
 >  1 file changed, 4 insertions(+), 3 deletions(-)

 > diff --git a/Makefile b/Makefile
 > index d52182e..22b7c99 100644
 > --- a/Makefile
 > +++ b/Makefile
 > @@ -121,7 +121,6 @@ else
 >    $(shell echo BR2_EXTERNAL ?= $(BR2_EXTERNAL) > $(BR2_EXTERNAL_FILE))
 >  endif
 
 > -
 >  BUILD_DIR:=$(BASE_DIR)/build
 >  STAMP_DIR:=$(BASE_DIR)/stamps
 >  BINARIES_DIR:=$(BASE_DIR)/images
 > @@ -358,14 +357,16 @@ ifneq ($(PACKAGE_OVERRIDE_FILE),)
 >  -include $(PACKAGE_OVERRIDE_FILE)
 >  endif
 
 > +# Include BR2_EXTERNAL before other packages, as BR2_EXTERNAL
 > +# may contain packages that are "providers" for eg. EGL/GLES/...
 > +include $(BR2_EXTERNAL)/external.mk
 > +
 >  include $(sort $(wildcard package/*/*.mk))
 
 >  include boot/common.mk
 >  include linux/linux.mk
 >  include system/system.mk
 
 > -include $(BR2_EXTERNAL)/external.mk
 > -
 >  TARGETS+=target-finalize
 
 >  ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
 > -- 
 > 1.8.1.2

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
