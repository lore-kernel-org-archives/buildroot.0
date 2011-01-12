From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 12 Jan 2011 17:02:02 +0100
Subject: [Buildroot] /dev/ttyprinkt usage in BR
In-Reply-To: <4D2DCC0D.30409@visionsystems.de> (Yegor Yefremov's message of
	"Wed, 12 Jan 2011 16:43:09 +0100")
References: <4D2DCC0D.30409@visionsystems.de>
Message-ID: <87wrmaxg91.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegor_sub1@visionsystems.de> writes:

 Yegor> As of kernel 2.6.37 there is a new pseudo tty device
 Yegor> /dev/ttyprinkt, that can make user output through pritnk()
 Yegor> routine. How can it be used in BR? What entries should
 Yegor> /etc/inittab contain to redirect the console output to
 Yegor> /dev/ttyprinkt?

I haven't used it yet, but I guess the only thing you have to do to get
all console output though it is to use devtmpfs (or add the device node
in device_table.txt), and tell init to use it as console. Looking at the
busybox init code, I see it gets the console device from the CONSOLE or
console environment variables, so you would just have to add
CONSOLE=/dev/ttyprintk to the kernel commandline.

Using console=/dev/ttyprintk will probably cause strange behaviour as
that presumably creates a loop, where every kernel message is sent back
in and reprinted.

But again, completely untested.

-- 
Bye, Peter Korsgaard
