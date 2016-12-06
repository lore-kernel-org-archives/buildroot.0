From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 06 Dec 2016 21:45:59 +0100
Subject: [Buildroot] How to log /dev/console directly on the device
In-Reply-To: <2251bf95-8406-dd6e-6728-ad43f49a6d0b@mind.be> (Arnout
 Vandecappelle's message of "Sun, 20 Nov 2016 12:22:49 +0100")
References: <CAGm1_ksb_gKjVwQ6S1AsnuREk439QTP9nbjRzhc7BMv7YY+y2Q@mail.gmail.com>
 <2251bf95-8406-dd6e-6728-ad43f49a6d0b@mind.be>
Message-ID: <87mvg8iy60.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 20-11-16 08:36, Yegor Yefremov wrote:
 >> I need to log the output from /dev/console to a file. The purpose is
 >> to find an application crash in a field. It is important to have all
 >> possible messages i.e. kernel messages and application messages.

 >  This is exactly what syslogd (or journald) is supposed to do. Both the kernel
 > and the applications send their messages to syslogd, and syslogd sends it to the
 > console and/or to a file.

 >  If you have your applications directly writing to /dev/console, there is really
 > nothing you can do short of hacking the kernel to do something with it. You
 > could take a look at netconsole, but IIRC that just sends printks to the
 > network, it doesn't actually redirect /dev/console.

That is not true. You can use ttyprintk (CONFIG_TTY_PRINTK in the
kernel) to get a tty device that outputs to the printk buffer
(E.G. dmesg) and then configure that as the console, either on the
kernel command line or at runtime with something like:

setconsole /dev/ttyprintk < /dev/console

-- 
Bye, Peter Korsgaard
