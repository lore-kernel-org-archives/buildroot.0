From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 5 Sep 2016 11:37:14 +0200
Subject: [Buildroot] Error with OVERRIDE_SRCDIR in 2016.08
In-Reply-To: <CAHb0ztmgZ9sMB0OxF5D7DYmZaU4vekUDcyxp96Ws+w84ZM_R+Q@mail.gmail.com>
References: <CAHb0ztmgZ9sMB0OxF5D7DYmZaU4vekUDcyxp96Ws+w84ZM_R+Q@mail.gmail.com>
Message-ID: <20160905093714.GC5553@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jeff, All,

On 2016-09-05 18:39 +1000, Jeff Gray spake thusly:
> I'm having a problem after upgrading from 2016.05 to 2016.08. I have a
> number of local applications that I install from BR2_EXTERNAL. This used to
> work fine in 2016.05, but now I get messages like this when making
> buildroot (showing one example and using the macro for clarity):
> $(BR2_EXTERNAL)/package/svp/gpio/gpio.mk:18: *** GPIO_SITE cannot be empty
> when GPIO_SOURCE is not.  Stop.

Well, there you missed a little tiny thing from the manual:

  * LIBFOO_SOURCE may contain the name of the tarball of the package, which
    Buildroot will use to download the tarball from LIBFOO_SITE. If
    HOST_LIBFOO_SOURCE is not specified, it defaults to LIBFOO_SOURCE. If
    none are specified, then the value is assumed to be
    libfoo-$(LIBFOO_VERSION).tar.gz.

Notice the part about "If none are specified, then the value is assumed
to be libfoo-$(LIBFOO_VERSION).tar.gz" ? ;-)

So in your case, you must define GPIO_SOURCE to empty:

    GPIO_SOURCE =

Regards,
Yann E. MORIN.

> I have placed the package files at $(BR2_EXTERNAL)/package/svp/gpio/ and
> the source files at $(BR2_EXTERNAL)/src/gpio
> 
> My gpio.mk file is:
> --------------
> GPIO_VERSION = 1.0
> GPIO_OVERRIDE_SRCDIR = $(BR2_EXTERNAL)/src/gpio/
> define GPIO_BUILD_CMDS
> $(MAKE) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)" -C $(@D)
> endef
> define GPIO_INSTALL_TARGET_CMDS
> $(INSTALL) -m 0755 -D $(@D)/gpio $(TARGET_DIR)/usr/bin/gpio
> endef
> $(eval $(generic-package))
> ---------------
> 
> I have a $(BR2_EXTERNAL)/Config.in that contains lines like this:
> source "$BR2_EXTERNAL/package/svp/gpio/Config.in"
> ... and a $(BR2_EXTERNAL)/external.mk that contains this:
> include $(sort $(wildcard $(BR2_EXTERNAL)/package/svp/*/*.mk))
> 
> Can anyone think of a cause for the error message? Has the way this sort of
> project is configured changed? I looked through the manual and couldn't see
> anything. I checked that the output/.br-external is the same for both
> versions.

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
