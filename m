From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Oct 2014 15:36:52 +0200
Subject: [Buildroot] [PATCH 1/2] package/systemd: fix getty setup
In-Reply-To: <1412863083-24764-1-git-send-email-dywi@mailerd.de>
 (=?utf-8?Q?=22Andr=C3=A9?=
 Erdmann"'s message of "Thu, 9 Oct 2014 15:58:02 +0200")
References: <1412863083-24764-1-git-send-email-dywi@mailerd.de>
Message-ID: <871tqdz9xn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andr?" == Andr? Erdmann <dywi@mailerd.de> writes:

 > When trying to run a buildroot system configured with
 > BR2_TARGET_GENERIC_GETTY_PORT="tty1" (x86_64), the boot process hangs
 > with the following message:
 >   "A start job is running for dev-tty1.device (<time> / 1min 30s)"

 > Replacing /etc/systemd/system/getty.target.wants/serial-getty at tty1.service
 > (linking to serial-getty@) with getty at tty1.service (-> getty@) fixes the issue.

 > This patch adds a check that "detects" the tty type by removing digits at the
 > end of BR2_TARGET_GENERIC_GETTY_PORT and comparing the resulting base name.
 > An instance of getty at service gets created if the name matches "tty",
 > otherwise serial-getty@ gets instantiated (as before).

 > So, tty1,tty2,... are created as links getty at tty1.service -> getty@,
 > while ttyS0, ttyAMA0, ... are created as instances of serial-getty at .

 > Signed-off-by: Andr? Erdmann <dywi@mailerd.de>
 > ---
 > Notes:
 > "ifeq (,$(filter ...))" instead of "ifeq (tty,...)" allows to extend the list
 > of getty@ candidates without much effort. Not sure if there are any other than
 > "tty", though. Probably not, because getty at service refuses to start if
 > /dev/tty0 is not present.
 > ---
 >  package/systemd/systemd.mk | 17 ++++++++++++++++-
 >  1 file changed, 16 insertions(+), 1 deletion(-)

 > diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
 > index face849..fec96d0 100644
 > --- a/package/systemd/systemd.mk
 > +++ b/package/systemd/systemd.mk
 > @@ -183,12 +183,27 @@ define SYSTEMD_USERS
 >  	systemd-network -1 systemd-network -1 * - - - Network Manager
 >  endef
 
 > -define SYSTEMD_INSTALL_SERVICE_TTY
 > +define SYSTEMD_DISABLE_SERVICE_TTY1
 >  	rm -f $(TARGET_DIR)/etc/systemd/system/getty.target.wants/getty at tty1.service
 > +endef
 > +
 > +# strip_tty_name :: str -> str
 > +#  removes digits at the end of the given str; ttyS0 => ttyS, tty1 => tty
 > +SYSTEMD_STRIP_TTY_NAME = $(shell \
 > +	printf "%s" "$(call qstrip,$(1))" | sed -e 's=[0-9][0-9]*$$==' )
 > +
 > +ifeq (,$(filter tty,$(call SYSTEMD_STRIP_TTY_NAME,$(BR2_TARGET_GENERIC_GETTY_PORT))))

Thanks, but I don't really like this implementation. I find the
following easier to read + it is more efficient as it only gets to run
during the install step and not whenever systemd.mk is parsed (no matter
if it is enabled or not):

# systemd needs getty.service for VTs and serial-getty.service for serial ttys
define SYSTEMD_INSTALL_SERVICE_TTY
	if echo $(BR2_TARGET_GENERIC_GETTY_PORT) | egrep -q 'tty[0-9]*$$'; \
	then \
		SERVICE="getty"; \
	else \
		SERVICE="serial-getty"; \
	fi; \
	ln -fs ../../../../lib/systemd/system/$${SERVICE}@.service \
		$(TARGET_DIR)/etc/systemd/system/getty.target.wants/$${SERVICE}@$(BR2_TARGET_GENERIC_GETTY_PORT).service
endef

So committed with that change, thanks.

-- 
Bye, Peter Korsgaard
