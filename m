From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 03 Mar 2019 21:26:15 +0100
Subject: [Buildroot] [PATCH 1/1] package/systemd: fix "Timed out waiting
 for device /dev/console."
In-Reply-To: <20190303115413.GG2721@scaer> (Yann E. MORIN's message of "Sun, 3
 Mar 2019 12:54:13 +0100")
References: <20190303113052.9120-1-xruppen@gmail.com>
 <20190303115413.GG2721@scaer>
Message-ID: <87o96rk8m0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Xavier, All,
 > On 2019-03-03 12:30 +0100, Xavier Ruppen spake thusly:
 >> Buildroot built with systemd fails to open a login prompt on the
 >> serial port when /dev/console is specified as BR2_TARGET_GENERIC_GETTY_PORT
 >> (which is its default value):
 >> 
 >> systemd[1]: dev-console.device: Job dev-console.device/start timed out.
 >> systemd[1]: Timed out waiting for device /dev/console.
 >> systemd[1]: Dependency failed for Serial Getty on console.
 >> systemd[1]: serial-getty at console.service: Job serial-getty at console.service/start failed with result 'dependency'.
 >> systemd[1]: dev-console.device: Job dev-console.device/start failed with result 'timeout'.
 >> systemd[1]: Reached target Login Prompts.
 >> systemd[1]: Reached target Multi-User System.
 >> 
 >> According to this issue on Github [1], serial-getty at .service should
 >> not be instantiated on /dev/console, console-getty at .service should
 >> be used instead. This stems from the fact that there should be no
 >> dependency on /dev/console.
 >> 
 >> [1] https://github.com/systemd/systemd/issues/10914
 >> 
 >> Signed-off-by: Xavier Ruppen <xruppen@gmail.com>
 >> ---
 >> package/systemd/systemd.mk | 4 ++++
 >> 1 file changed, 4 insertions(+)
 >> 
 >> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
 >> index 7a46a50ed3..f378203e8d 100644
 >> --- a/package/systemd/systemd.mk
 >> +++ b/package/systemd/systemd.mk
 >> @@ -397,11 +397,15 @@ endef
 >> 
 >> ifneq ($(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)),)
 >> # systemd needs getty.service for VTs and serial-getty.service for serial ttys
 >> +# note that console-getty.service should be used on /dev/console as it should not have dependencies
 >> # also patch the file to use the correct baud-rate, the default baudrate is 115200 so look for that
 >> define SYSTEMD_INSTALL_SERVICE_TTY
 >> if echo $(BR2_TARGET_GENERIC_GETTY_PORT) | egrep -q 'tty[0-9]*$$'; \
 >> then \
 >> SERVICE="getty"; \
 >> +	elif echo $(BR2_TARGET_GENERIC_GETTY_PORT) | egrep -q 'console'; \
 >> +	then \
 >> +		SERVICE="console-getty"; \

 > Actually, I think we should check for 'console' first, and since this is
 > a literal, we do not need grep, just a test for equality:

 >     if [ $(BR2_TARGET_GENERIC_GETTY_PORT) = /dev/console ]; \

We don't specify the /dev/ part, so this should be just '= console'.

I was going to commit this, but then I noticed that there isn't a
console-getty at .service file, so this doesn't seem right:

ls -lah ../../../../lib/systemd/system/|grep getty
lrwxrwxrwx  1 peko peko   49 Mar  3 21:13 autovt at .service -> ../../../../usr/lib/systemd/system/getty at .service
-rw-r--r--  1 peko peko 1.1K Mar  3 21:13 console-getty.service
-rw-r--r--  1 peko peko 1.2K Mar  3 21:13 container-getty at .service
-rw-r--r--  1 peko peko  506 Dec 21 19:53 getty-pre.target
-rw-r--r--  1 peko peko 1.8K Mar  3 21:13 getty at .service
-rw-r--r--  1 peko peko  500 Dec 21 19:53 getty.target
-rw-r--r--  1 peko peko 1.5K Mar  3 21:13 serial-getty at .service

I guess we need to introduce a TARGET variable that is
$${SERVICE}.service for console-getty, and $${SERVICE}@.service for
everything else, but I know next to nothing about systemd, so I will let
someone who can actually test this send a patch.

Xavier, will you send an updated patch please?

-- 
Bye, Peter Korsgaard
