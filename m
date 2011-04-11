From: =?ISO-8859-1?Q?Daniel_Nystr=F6m?= <daniel.nystrom@timeterminal.se>
Date: Mon, 11 Apr 2011 12:25:39 +0200
Subject: [Buildroot] Starting programs in the background at init time:
 stdin EOF problem
In-Reply-To: <BANLkTimN8OJvrnFvW=BeLrCsuTB6-7ZxDw@mail.gmail.com>
References: <BANLkTi=Vx9c7OJ0arjwmrr6=WcTYFUfpyA@mail.gmail.com>
	<BANLkTi=qUjcrhX92_WCRXyaCSNxwscDtPA@mail.gmail.com>
	<BANLkTimN8OJvrnFvW=BeLrCsuTB6-7ZxDw@mail.gmail.com>
Message-ID: <BANLkTi=PW70fZG+qqbztdY8GwYYF+F8pjA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Den 11 april 2011 11:53 skrev Thomas De Schampheleire
<patrickdepinguin+buildroot@gmail.com>:
> Hej Daniel!
>
> 2011/4/11 Daniel Nystr?m <daniel.nystrom@timeterminal.se>:
>> Hi Thomas!
>>
>> 2011/4/11 Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>:
>>> What is the recommended way to start programs in such an embedded
>>> environment?
>>
>> I'm using start-stop-daemon to perform similar tasks. Have you given
>> it a try? It can "daemonize" even non-daemons which is pretty nice for
>> e.g. GUI softwares.
>
> Thanks for the hint.
> I just gave it a try as follows:
> # start-stop-daemon ?-S -x ./shell ?--background
>
> Unfortunately, it seems to have the same problem. By daemonizing, the
> file descriptor stdin seems to be closed, so my test program loops
> forever (which I was able to visualize with strace).

When your program is daemonized, it per se looses it's stdin/stdout.
It sounds like a faulty design relying on those.

> I may need to adapt my program to not use stdio, but rather other
> filedescriptors. I suppose that they will not be impacted be
> foreground/background issues?

Fixing this design issue will probably help for future headaches as well.

> Where do you start start-stop-daemon from? Directly from inittab or
> from scripts in /etc/init.d?
> How do you start other programs automatically?

I'm starting them from /etc/init.d/. This is an example where it also
handles the PID file writing as well:

/sbin/start-stop-daemon --start --background --make-pidfile \
            --pidfile /var/run/myprogram.pid --exec /usr/bin/myprogram

And this will kill it the fair way:

/sbin/start-stop-daemon --stop --oknodo --pidfile /var/run/myprogram.pid
