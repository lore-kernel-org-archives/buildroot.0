From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 May 2016 10:04:25 +0200
Subject: [Buildroot] [PATCH] inputevent: add package
In-Reply-To: <20160530063606.GB31737@airbook.vandijck-laurijssen.be>
References: <20160530063606.GB31737@airbook.vandijck-laurijssen.be>
Message-ID: <20160531100425.5ae4d5db@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 30 May 2016 08:36:06 +0200, Kurt Van Dijck wrote:

> diff --git a/package/inputevent/Config.in b/package/inputevent/Config.in
> new file mode 100644
> index 0000000..44422a3
> --- /dev/null
> +++ b/package/inputevent/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_INPUTEVENT
> +	bool "inputevent"
> +	help
> +	  inputevent is a simple program that traces input events.
> +	  When piped to a another program or script, you get similar
> +	  functionality as input-event-daemon.

I certainly don't want to diminish the value of your contribution, but
I am wondering what is the usefulness of this program, if it
essentially does the same thing as existing programs?

Your description itself shows that it is the same as input-event-daemon
when piped into another program. And when not piped to another program,
my feeling is that it does the same job as evtest.

I'm happy with adding more and more packages in Buildroot, but we might
have to draw the line on which packages we want to accept, and maybe
ensure there are at least useful to more persons than just the
developer who wrote the program/library.

In any case, you should add the upstream URL of the project here in the
Config.in help text, separated from the rest of the description by an
empty line (see all other Config.in files for packages in Buildroot).

> diff --git a/package/inputevent/inputevent.mk b/package/inputevent/inputevent.mk
> new file mode 100644
> index 0000000..14a8d31
> --- /dev/null
> +++ b/package/inputevent/inputevent.mk
> @@ -0,0 +1,36 @@
> +################################################################################
> +#
> +# inputevent
> +#
> +################################################################################
> +
> +INPUTEVENT_VERSION = r8
> +INPUTEVENT_SITE = git://github.com/kurt-vd/inputevent.git

Please use the github macro, and add a hash file.

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

There is no variable named TARGET_LDLIBS in Buildroot.

> +	echo "CC=$(TARGET_CC)" >> $(@D)/config.mk
> +	echo "CXX=$(TARGET_CXX)" >> $(@D)/config.mk
> +	echo "LD=$(TARGET_LD)" >> $(@D)/config.mk
> +	echo "AS=$(TARGET_AS)" >> $(@D)/config.mk

This seems not needed, just pass all the necessary values in the
environment. Also, PREFIX should be /usr.

> +
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) clean

Not needed.

> +endef
> +
> +define INPUTEVENT_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)

Just do:

	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) PREFIX=/usr -C $(@D)

TARGET_CONFIGURE_OPTS contains the definition of CFLAGS, CPPFLAGS,
CXXFLAGS, CC, CXX, LD, AS and more.

> +endef
> +
> +define INPUTEVENT_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install DESTDIR="$(TARGET_DIR)"
> +endef
> +
> +$(eval $(generic-package))
> +#$(eval $(configmk-package))

This last line is not needed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
