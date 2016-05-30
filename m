From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Mon, 30 May 2016 22:57:08 +0200
Subject: [Buildroot] [PATCH] inputevent: add package
In-Reply-To: <8760tv3azo.fsf@dell.be.48ers.dk>
References: <20160530063545.GA31737@airbook.vandijck-laurijssen.be>
 <8760tv3azo.fsf@dell.be.48ers.dk>
Message-ID: <20160530205708.GA17960@airbook.vandijck-laurijssen.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> 
>  > Inputevent is an input-device to ascii tranlator.
>  > Its output is of the format 'TIME CODE VALUE' and it's easy
>  > to pipe it into a shell script.
> 
>  > Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
> 
> I see you are the author of this tool, but does this tool provide
> anything more than evtest (besides perhaps a bit easier to parse
> output)?

The easier to parse output is helps to pipe it in scripts like:

	while read TIME TYPE VALUE; do
	case "$TYPE:$VALUE" in
	KEY_PLAY:0)
		mpc play
		;;
	esac

second, it supports to control such script as child,
making it easy to integrate in a service monitor that just
monitors the inputevent program, without the need to monitor
the child script.

So I combined evtest-like functionality with a focus on deployment,
integrating the tool in a functional system.

evtest is meant as an interactive tool or query a state.

I evalutated input-event-daemon and found that it distracts focus from the
overall functionality that I want. input-event-daemon is focused on
desktop-like systems, I target embedded systems that perform tasks
on GPIO inputs, who are delivered as input events.

Is it different enough?
If you look at how it integrates, then yes.
If you look at what it does, I agree that it appears very much alike.

> 
>  > +################################################################################
>  > +#
>  > +# inputevent
>  > +#
>  > +################################################################################
>  > +
>  > +INPUTEVENT_VERSION = r8
>  > +INPUTEVENT_SITE = git://github.com/kurt-vd/inputevent.git
> 
> We have a github macro to handle this (see E.G. input-event-daemon.mk
> for an example).

The first iterations of my patch didn't like the macro very well.
I forgot the precise reason.
I will re-evaluate now.

> 
> 
> > +INPUTEVENT_LICENSE = GPLv3
>  > +INPUTEVENT_LICENSE_FILES = LICENSE
>  > +
>  > +define INPUTEVENT_CONFIGURE_CMDS
>  > +	echo "PREFIX=/" > $(@D)/config.mk
>  > +	echo "CFLAGS=$(TARGET_CFLAGS)" >> $(@D)/config.mk
>  > +	echo "CPPFLAGS=-D_GNU_SOURCE $(TARGET_CPPFLAGS)" >> $(@D)/config.mk
>  > +	echo "CXXFLAGS=$(TARGET_CXXFLAGS)" >> $(@D)/config.mk
>  > +	echo "LDFLAGS=$(TARGET_LDFLAGS)" >> $(@D)/config.mk
>  > +	echo "LDLIBS+=$(TARGET_LDLIBS)" >> $(@D)/config.mk
>  > +	echo "CC=$(TARGET_CC)" >> $(@D)/config.mk
>  > +	echo "CXX=$(TARGET_CXX)" >> $(@D)/config.mk
>  > +	echo "LD=$(TARGET_LD)" >> $(@D)/config.mk
>  > +	echo "AS=$(TARGET_AS)" >> $(@D)/config.mk
>  > +
>  > +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) clean
> 
> How about passing $(TARGET_CONFIGURE_OPTS) to make instead of writing
> this config.mk?

Building outside of toplevel make, although I admit it is a bad reason.

I dropped autoconf long time ago, and use such config.mk includes, where
necessary. Is Target_CONFIGURE_OPTS available for non-autotools
packages?

> 
> Looking at the Makefile, I see it tries to figure out the version by
> calling git. When this is built in a buildroot git checkout (and
> inputevent is gotten from a github tarball) this will most likely use
> version info from the Buildroot git repo which doesn't sound correct.

Now that is a true problem.
I'll rework.

> 
> > +
>  > +define INPUTEVENT_BUILD_CMDS
>  > +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
>  > +endef
>  > +
>  > +define INPUTEVENT_INSTALL_TARGET_CMDS
>  > +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install DESTDIR="$(TARGET_DIR)"
>  > +endef
>  > +
>  > +$(eval $(generic-package))
>  > +#$(eval $(configmk-package))
> 
> Please don't leave commented out code in the files.

Ack, I totally agree.

Kind regards,
Kurt
