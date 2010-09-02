From: Mitch Davis <mjd+buildroot@afork.com>
Date: Fri, 3 Sep 2010 09:46:15 +1000
Subject: [Buildroot] RFC: Getting rid of old-style hooks
In-Reply-To: <20100902161058.4ea7d8df@surf>
References: <20100902161058.4ea7d8df@surf>
Message-ID: <AANLkTind8dB_urC0OS_4eip1sUkchbRd1g8Nynsprram@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Sep 3, 2010 at 12:10 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> (Sorry, long presentation, the question is at the end)
>
> I've started working on getting rid of the old-style hooks, i.e the
> hooks defined this way :

> However, I have a question concerning these new style hooks. Since we
> can't use make conditionals inside variable definitions, it is not
> possible to write:

Is it possible to avoid conditional defines altogether by using
computed variable names?

I am not an expert in this and I admit I haven't read your email
entirely or understand completely the problem you're trying to solve,
but in general, conditional makefile fragments can be replaced by code
using computed variable names.

I will take this as an example:

> define FOOBAR_REMOVE_STUFF
> ? ? ? ?rm $(TARGET_DIR)/usr/bin/foo
> ifneq($(FOOBAR_INSTALL_BAR),y)
> ? ? ? ?rm $(TARGET_DIR)/usr/bin/bar
> endif
> endef

I'm not an expert at this, but what about something like:

FOOBAR_INSTALL_BAR_y := rm $(TARGET_DIR)/usr/bin/bar

define FOOBAR_REMOVE_STUFF
       rm $(TARGET_DIR)/usr/bin/foo
       $(FOOBAR_INSTALL_BAR_$(FOOBAR_INSTALL_BAR))
endef

This is just a proof of concept which ignores the question of whether
this is what you want to do.  And the variable names I've picked are
quite clumsy.

This also might mean you don't need to use defines.  Instead, you can
put these commands into a variable.

Hmm, water's quite deep here, I'll swim back to shore now :-)

Mitch.
