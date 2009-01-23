From: QuickX <quickx@hotmail.com>
Date: Fri, 23 Jan 2009 15:06:42 -0800
Subject: [Buildroot] Some AT91SAM9261-EK Notes
In-Reply-To: <87ab9hkb7f.fsf@macbook.be.48ers.dk>
References: <BAY124-W491126D3265E8BD9DCF5DCD2CE0@phx.gbl><1232722423.5311.70.camel@elrond.atmel.com><BAY124-DS41A02756B01D8CBA35C29D2CF0@phx.gbl>
	<87ab9hkb7f.fsf@macbook.be.48ers.dk>
Message-ID: <BAY124-DS71A6FE16D4AA2E6DE33BAD2CF0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I was able to narrow down the problem a bit more.  It seems that the 
"UCLIBC_SUPPORT_AI_ADDRCONFIG" is what causes the Segfaults/Core Dumps, 
however, this option is only available if UCLIBC_USE_NETLINK is set.

Results: 0.9.30 (with 0.9.30 config, minus UCLIBC_SUPPORT_AI_ADDRCONFIG) 
works fine for dropbear and samba.


> What is the impact of doing that?
I'm not really sure of the impact.  From the uClibc-menuconfig help it 
states following if they are helpful.

UCLIBC_USE_NETLINK:
  ?
  ? In newer versions of Linux (2.4.17+), support was added for querying
  ? network device information via netlink rather than the old style
  ? ioctl's.  Most of the time, the older ioctl style is sufficient (and
  ? it is smaller than netlink), but if you find that not all of your
  ? devices are being returned by the if_nameindex() function, you will
  ? have to use the netlink implementation.
  ?
  ? Most people can safely answer N.

UCLIBC_SUPPORT_AI_ADDRCONFIG:
  ?
  ? The implementation of AI_ADDRCONFIG is aligned with the glibc
  ? implementation using netlink to query interfaces to find both
  ? ipv4 and ipv6 support. This is only needed if an application uses
  ? the AI_ADDRCONFIG flag.
  ?
  ? Most people can safely answer N. 
