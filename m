From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 May 2016 15:56:43 +0200
Subject: [Buildroot] [PATCH] inputevent: add package
In-Reply-To: <20160530063545.GA31737@airbook.vandijck-laurijssen.be> (Kurt Van
 Dijck's message of "Mon, 30 May 2016 08:35:45 +0200")
References: <20160530063545.GA31737@airbook.vandijck-laurijssen.be>
Message-ID: <8760tv3azo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Kurt" == Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be> writes:

 > Inputevent is an input-device to ascii tranlator.
 > Its output is of the format 'TIME CODE VALUE' and it's easy
 > to pipe it into a shell script.

 > Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>

I see you are the author of this tool, but does this tool provide
anything more than evtest (besides perhaps a bit easier to parse
output)?

 > +################################################################################
 > +#
 > +# inputevent
 > +#
 > +################################################################################
 > +
 > +INPUTEVENT_VERSION = r8
 > +INPUTEVENT_SITE = git://github.com/kurt-vd/inputevent.git

We have a github macro to handle this (see E.G. input-event-daemon.mk
for an example).


> +INPUTEVENT_LICENSE = GPLv3
 > +INPUTEVENT_LICENSE_FILES = LICENSE
 > +
 > +define INPUTEVENT_CONFIGURE_CMDS
 > +	echo "PREFIX=/" > $(@D)/config.mk
 > +	echo "CFLAGS=$(TARGET_CFLAGS)" >> $(@D)/config.mk
 > +	echo "CPPFLAGS=-D_GNU_SOURCE $(TARGET_CPPFLAGS)" >> $(@D)/config.mk
 > +	echo "CXXFLAGS=$(TARGET_CXXFLAGS)" >> $(@D)/config.mk
 > +	echo "LDFLAGS=$(TARGET_LDFLAGS)" >> $(@D)/config.mk
 > +	echo "LDLIBS+=$(TARGET_LDLIBS)" >> $(@D)/config.mk
 > +	echo "CC=$(TARGET_CC)" >> $(@D)/config.mk
 > +	echo "CXX=$(TARGET_CXX)" >> $(@D)/config.mk
 > +	echo "LD=$(TARGET_LD)" >> $(@D)/config.mk
 > +	echo "AS=$(TARGET_AS)" >> $(@D)/config.mk
 > +
 > +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) clean

How about passing $(TARGET_CONFIGURE_OPTS) to make instead of writing
this config.mk?

Looking at the Makefile, I see it tries to figure out the version by
calling git. When this is built in a buildroot git checkout (and
inputevent is gotten from a github tarball) this will most likely use
version info from the Buildroot git repo which doesn't sound correct.

> +
 > +define INPUTEVENT_BUILD_CMDS
 > +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
 > +endef
 > +
 > +define INPUTEVENT_INSTALL_TARGET_CMDS
 > +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install DESTDIR="$(TARGET_DIR)"
 > +endef
 > +
 > +$(eval $(generic-package))
 > +#$(eval $(configmk-package))

Please don't leave commented out code in the files.

-- 
Bye, Peter Korsgaard
