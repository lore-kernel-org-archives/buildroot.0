From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Jan 2013 21:12:26 +0100
Subject: [Buildroot] Interesting "bug" with the Crosstool-NG backend
Message-ID: <20130109211226.12888f5d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This afternoon, I helped an user on the #buildroot IRC channel. He was
trying to use the Crosstool-NG backend, and had the following build
failure:

  http://pastebin.com/KPRj7XVU

So, it's trying to build the "make" package before anything else...

So I asked whether he was mistakenly running "make make", but he was
not.

I asked him to put online his configuration file:

  http://pastebin.com/srLmgkwy

As you can see BR2_PACKAGE_MAKE is not enabled.

So, I was wondering what could happen. And then, I saw:

BR2_TOOLCHAIN_CTNG_CONFIG="make ctng-menuconfig"

That's obviously wrong, it should be a configuration file. But in the
Crosstool-NG backend code, we have:

CTNG_CONFIG_FILE:=$(call qstrip,$(BR2_TOOLCHAIN_CTNG_CONFIG))
[...]
$(CTNG_DIR)/.config: $(CTNG_CONFIG_FILE) $(CONFIG_DIR)/.config
        $(Q)if [ ! -f $@ ];
[...]

So, the contents of $(BR2_TOOLCHAIN_CTNG_CONFIG) is used as a
dependency. So this gets expanded to:

<somelocation>/.config: make ctng-menuconfig <someotherlocation>/.config

And Buildroot tries to build the "make" package as a prerequisite of
building $(CTNG_DIR)/.config :-)

Fun, no?

I'm not sure we can/should do something about this, but I thought it
was interesting to tell you the story :-)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
