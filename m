From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Fri, 30 Jul 2010 16:41:07 +0100
Subject: [Buildroot] Evaluation of make variables
In-Reply-To: <20100730103354.1c7f1a0f@surf>
References: <1280226977.22687.37.camel@dubciaranr1.verifone.com>
	<20100727134209.5fddfa7b@surf>
	<1280231693.22687.47.camel@dubciaranr1.verifone.com>
	<20100730103354.1c7f1a0f@surf>
Message-ID: <1280504467.17479.12.camel@dubciaranr1.verifone.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ar Aoine, 2010-07-30 ag 10:33 +0200, scr?obh Thomas Petazzoni:
> As we discussed in another thread (if I remember correctly), I'm not
> sure the gentargets infrastructure is appropriate for building the
> kernel and bootloaders. But definitely, some sort of infrastructure
> for building these would be good.
> 

It was actually your previous post in this thread, but I understand;
you're "a little" busy these days. ;-)

> > Is this an inherent limitation of the make syntax or specific to the
> > layout of the buildroot makefiles?
> 
> Inherent limitation of the make syntax. Try a simple test.mk file that
> does:
> 
> FOOBAR=y
> 
> define BARFOO
> ifeq ($(FOOBAR),y)
> 	echo "Hello World"
> endif
> endef
> 
> all:
> 	$(BARFOO)
> 
> it doesn't work, while:

Yes and I wouldn't expect it to work.  but if I leave the top part the
same and just change to:

all:
$(BARFOO)

i.e. don't indent the $(BARFOO) line, the thinking being that the
variable would just get textually replaced by its value.
make then gives a missing separator error and this is what I don't
understand.  What separator is expected?

Then we look at the definition of GENTARGETS_INNER, which is used in a
target rule and it includes ifeq, etc.  What's special about that?  I
presume it's the $(eval ...) that changes its context in some way.
