From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Mar 2013 10:56:29 +0100
Subject: [Buildroot] [PATCH V6] nodejs: new package
In-Reply-To: <CAKduhSuoWX9o=OF2hTuiC=k--cVFen6bga+XUebfQsdGbq4Jew@mail.gmail.com>
References: <1362706276-11111-1-git-send-email-daniel.price@gmail.com>
 <CAKduhSuoWX9o=OF2hTuiC=k--cVFen6bga+XUebfQsdGbq4Jew@mail.gmail.com>
Message-ID: <20130308105629.45bb99c2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Daniel Price,

On Fri, 8 Mar 2013 01:32:23 -0800, Daniel Price wrote:
> Just as a quick followup to this patch: Thomas had previously
> commented about the call to qstrip at: "NODEJS_MODULES_LIST= $(call
> qstrip,\".
> 
> I wanted to say that I have tested this both ways and again found that
> it was necessary to qstrip the whole thing.  You can better appreciate
> why with a trivial example makefile as follows.  Some other buildroot
> recipes use other mechanisms like string concatenation of a series of
> variables, but that seemed more ugly to me than this method.
> 
> -------------8<-------------8<------------------
> TEST = $(FOO) $(BAR) $(BAZ)
> 
> ifneq ($(TEST),)
> define MORESTUFF
>         @echo "as seen by ifneq, TEST was not empty"
> endef
> endif
> 
> all:
>         @echo "number of characters in TEST:"
>         @echo "$(TEST)" | wc -c
>         $(MORESTUFF)
> -------------8<-------------8<------------------
> 
> So in order to make this work as intended, one needs to qstrip $(TEST)
> to collapse out whitespace.  I believe that this is because whitespace
> which trails a variable is preserved, and so in this example $(TEST)
> has two spaces in it.

Hum, indeed. But that's because qstrip uses strip. However, testing
your simple example with qstrip doesn't work (unless I'm doing
something wrong, of course) :

-------------8<-------------8<------------------
qstrip=$(strip $(subst ",,$(1))) #"

TEST = $(call qstrip,$(FOO) $(BAR) $(BAZ))

ifneq ($(TEST),)
define MORESTUFF
	@echo "as seen by ifneq, TEST was not empty"
endef
endif

all:
	@echo -n "number of characters in TEST: "
	@echo -n "$(TEST)" | wc -c
	$(MORESTUFF)
-------------8<-------------8<------------------

Shows:

-------------8<-------------8<------------------
$ make -f bleh.mk 
number of characters in TEST: 1
as seen by ifneq, TEST was not empty
-------------8<-------------8<------------------

If I replace TEST = $(call qstrip,...) by TEST = $(strip ...) then it
works.

I'm confused.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
