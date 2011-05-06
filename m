From: Ryan Whelan <rcwhelan@gmail.com>
Date: Thu, 5 May 2011 23:26:12 -0400
Subject: [Buildroot] Python 2.7 & uClibc?
In-Reply-To: <BANLkTi=9YD321w1zMbZacGx+8YbxoV-DCQ@mail.gmail.com>
References: <BANLkTi=CUm0qSidqqYk4AN4GSEPjcv0dsg@mail.gmail.com>
	<BANLkTinQr7tB+j_16AYGA+X3Hf==7jh0kg@mail.gmail.com>
	<201105052035.03978.yann.morin.1998@anciens.enib.fr>
	<BANLkTi=9YD321w1zMbZacGx+8YbxoV-DCQ@mail.gmail.com>
Message-ID: <BANLkTi=gHYKy4yzJBbUtrJJB3Uc24T5=qQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On May 5, 2011 2:44 PM, "Ryan Whelan" <rcwhelan@gmail.com> wrote:
>
>
>
> On Thu, May 5, 2011 at 2:35 PM, Yann E. MORIN <
yann.morin.1998@anciens.enib.fr> wrote:
>>
>> Ryan, All,
>>
>> On Thursday 05 May 2011 20:20:16 Ryan Whelan wrote:
>> > Is this something I should take up with a different group?
>> >
>> > I just tried compiling Python natively on a uClibc system and it
behaves the
>> > same way.  :(
>> >
>> > On Wed, May 4, 2011 at 9:57 AM, Ryan Whelan <rcwhelan@gmail.com> wrote:
>> >
>> > > I'm having a strange issue with Python built with buildroot.  I've
been
>> > > trying to write a Python based init for linux but I'm having an issue
with
>> > > the buildroot version of python.  When a child process dies (and
sends the
>> > > parent - PID 1) a SIGCHLD, init spawns another process which appers
to
>> > > intercept the signal.  If fact, its not just SIGCHLD, its also
SIGHUP.  I
>> > > haven't tested all the signals, but i wouldn't assume its limited to
these
>> > > 2.  This is a strange issue to try to articulate, but there is a
description
>> > > of the issue here (
>> > >
http://stackoverflow.com/questions/5844364/linux-blocking-signals-to-python-init
)
>> > >
>> > > In more detail,  If I run this script ( http://pastebin.com/bvMcrLjr) on
>> > > a linux machine with Python compiled against glibc it spawns 2
children
>> > > processes and a `ps fax` looks like this:
>> > >
>> > > \_ /usr/bin/python ./init
>> > >     \_ sleep 10
>> > >     \_ sleep 10
>> > >
>> > > As the children processes die, they are respawned and you can see
their
>> > > PIDs change.  However, when run with a Python compiled via buildroot,
when
>> > > the first child dies, we see this:
>> > >
>> > > \_ /usr/bin/python ./init
>> > >     \_ /usr/bin/python ./init
>> > >         \_ sleep 10
>> > >     \_ sleep 20
>> > >
>> > > and after the second child dies:
>> > >
>> > > \_ /usr/bin/python ./init
>> > >     \_ /usr/bin/python ./init
>> > >         \_ sleep 10
>> > >         \_ sleep 20
>> > >
>> > > After successive child deaths, there are no more init's spawned, just
that
>> > > 'extra' one (noted in the post on SO link)
>> > >
>> > > This doesn't happen with the python on any other (glibc) system I've
tested
>> > > on.  The issue is when this init script is running as actual PID 1,
the
>> > > children never get reaped, and become zombies.
>> > >
>> > > I'm not sure if I've made the issue clear, and I'm not sure if this
is the
>> > > place to mention it, but I thought i would start here.
>>
>> What version of uClibc?\
>
>
> I am using 0.9.31- I will try to enable NPTL and try with uClibc
0.9.32-rc2 and see if that works.  If its that simple, i will be so happy!
>
> Thanks for your feedback

With 0.9.32 RC alone it didn't change- but after trying with NPTL it fixed
the issue.

Thanks again!

>
>>
>>
>> AFAIK, uclibc-0.9.31 and before did not have NPTL, and implemented
threads
>> using the now-legacy LinuxThreads (aka LT). LT emulated threads using
>> multiple clone(2)d processes, and those mostly behaved like threads.
>>
>> The notable difference is that each threads was in fact a real process in
>> the eyes of the kernel, so that may be the cause of what you are
experiencing.
>>
>> Regards,
>> Yann E. MORIN.
>>
>> --
>>
.-----------------.--------------------.------------------.--------------------.
>> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
conspiracy: |
>> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
      |
>> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There
is no  |
>> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
conspiracy.  |
>>
'------------------------------^-------^------------------^--------------------'
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110505/2ff72253/attachment-0001.html>
