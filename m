From: Lennart Ramberg <ramberg.lennart@gmail.com>
Date: Tue, 18 Nov 2014 20:31:22 +0100
Subject: [Buildroot] Init and Supervisor start. Help please.
In-Reply-To: <20141118161609.6057089f@free-electrons.com>
References: <CAEzGmjDXJ89vvGVfFBk4d3yJ3vbvjLA457yj6Gi_kYZYpct70Q@mail.gmail.com>
 <20141118161609.6057089f@free-electrons.com>
Message-ID: <CAEzGmjAGvbOFayr4yhce9P7oRdf+AySgLrDPd3eTq9d1UOmoqQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Thomas,

On Tue, Nov 18, 2014 at 4:16 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Lennart Ramberg,
>
> On Tue, 18 Nov 2014 15:01:38 +0100, Lennart Ramberg wrote:
>
> > How should supervisor be automatically started?
> > Is the below way to go (kiosk mode) in principle right?
> >
> > /boot/grub/grub.cfg:
> >
> > set default="0"
> > set timeout="5"
> >
> > menuentry "Buildroot" {
> >     linux /bzImage root=/dev/sda1 init=/usr/bin/supervisord
> > }
> >
> > Setting init=/myprogram worked as expected. But but experimenting
> > with letting supervisord start myprogram just caused kernel panic,
> > so maybe I'm heading the wrong way?
>
> Reading from http://supervisord.org/:
>
> """
> It shares some of the same goals of programs like launchd, daemontools,
> and runit. Unlike some of these programs, it is not meant to be run as
> a substitute for init as ?process id 1?. Instead it is meant to be used
> to control processes related to a project or a customer, and is meant
> to start like any other program at boot time.
> """
>
> So using supervisord as init doesn't seem to be the right thing to do.
> Instead, use another init (whichever you want), and then use
> supervisord to start/monitor your daemons/system services.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>

I see the light now :-)

I selected Busybox' init which will execute the script /etc/init.d/rcS
which will execute the script /etc/init.d/S99supervisord
which will start supervisord
which will start/monitor programs specified in /etc/supervisord.conf

Regards
Lennart
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141118/78e80d3c/attachment.html>
