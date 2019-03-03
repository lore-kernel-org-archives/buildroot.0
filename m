From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 03 Mar 2019 22:21:14 +0100
Subject: [Buildroot] [PATCH 1/1] package/systemd: fix "Timed out waiting
 for device /dev/console."
In-Reply-To: <20190303204826.GL2721@scaer> (Yann E. MORIN's message of "Sun, 3
 Mar 2019 21:48:26 +0100")
References: <20190303113052.9120-1-xruppen@gmail.com>
 <20190303115413.GG2721@scaer> <87o96rk8m0.fsf@dell.be.48ers.dk>
 <20190303204826.GL2721@scaer>
Message-ID: <87a7ibk62d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> I was going to commit this, but then I noticed that there isn't a
 >> console-getty at .service file, so this doesn't seem right:
 >> 
 >> ls -lah ../../../../lib/systemd/system/|grep getty
 >> lrwxrwxrwx 1 peko peko 49 Mar 3 21:13 autovt at .service ->
 >> ../../../../usr/lib/systemd/system/getty at .service
 >> -rw-r--r--  1 peko peko 1.1K Mar  3 21:13 console-getty.service

 >> -rw-r--r--  1 peko peko 1.2K Mar  3 21:13 container-getty at .service
 >> -rw-r--r--  1 peko peko  506 Dec 21 19:53 getty-pre.target
 >> -rw-r--r--  1 peko peko 1.8K Mar  3 21:13 getty at .service
 >> -rw-r--r--  1 peko peko  500 Dec 21 19:53 getty.target
 >> -rw-r--r--  1 peko peko 1.5K Mar  3 21:13 serial-getty at .service
 >> 
 >> I guess we need to introduce a TARGET variable that is
 >> $${SERVICE}.service for console-getty, and $${SERVICE}@.service for
 >> everything else, but I know next to nothing about systemd, so I will let
 >> someone who can actually test this send a patch.

 > Well, wecould make it simple, and use (pseudoc-ode):

 >     if console:
 >         SERVICE='console-getty'
 >     elif vt:
 >         SERVICE='getty@'
 >     else:
 >         SERVICE='serial-getty@'

 > No?

I don't think so, as we need both <name>@<target> and <target>:

	ln -fs ../../../../lib/systemd/system/$${SERVICE}@.service \
		$(TARGET_DIR)/etc/systemd/system/getty.target.wants/$${SERVICE}@$(BR2_TARGET_GENERIC_GETTY_PORT).service

So we either end up with no @ in the symlink name, or a double @@.

I don't know if that is problem or not for systemd.

-- 
Bye, Peter Korsgaard
