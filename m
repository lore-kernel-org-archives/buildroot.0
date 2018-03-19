From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Mar 2018 09:16:28 +0100
Subject: [Buildroot] time difference between kernel timestamp and uptime
In-Reply-To: <CAJ2oMh+EZn32ocjJerdpqGcQ0HVm7AiobLAuh_6wDu6jmOq9GA@mail.gmail.com>
 (Ran Shalit's message of "Mon, 19 Mar 2018 09:42:40 +0200")
References: <CAJ2oMh+EZn32ocjJerdpqGcQ0HVm7AiobLAuh_6wDu6jmOq9GA@mail.gmail.com>
Message-ID: <87muz4cwf7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ran" == Ran Shalit <ranshalit@gmail.com> writes:

 > Hello,
 > I am facing a time difference, between kernel timestamp, and uptime
 > command as following:

 > # uptime;  echo "hello" > /dev/kmsg;
 >  00:04:20 up 4 min,  load average: 0.00, 0.00, 0.00
 > # dmesg -c
 > [  258.487438] hello

 > There is about ~2-3 seconds difference.

This is more of a busybox question, but the time information from the
uptime applet (the 00:04:20) is the current wall time (realtime). Your
system probably doesn't have a battery backed RTC or uses NTP, so it
thinks it is running in 1970.

CONFIG_PRINTK_TIME uses local_clock() which is basically a fast hardware
clock that may drift relative to the wall clock.

There recently were some kernel patches to make it configurable what
clock printk should use, but I'm not sure they ever made it in the tree:

https://patchwork.kernel.org/patch/9861891/

 > Is there a way to resolve this time difference ?
 > Seems that busybox uptime can't be used with millisecond resolution,
 > so the difference is in seconds resolution (instead of milliseconds,
 > which would have been preferred). Is there any alternative for getting
 > boot time in millisecond format ? Should use the kernel printing
 > instead, for a better resolution >

For boot timing information the most important thing is that you can
correlate timestamps, so I would use the kernel printk buffer for it
all.

-- 
Bye, Peter Korsgaard
