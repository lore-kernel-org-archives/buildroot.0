From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 Dec 2017 17:43:34 +0100
Subject: [Buildroot] [PATCH 1/1] Add TCF Agent package
In-Reply-To: <CADYdroNk1S1Qugd_fiz7uyhZ2boN5jL+PZvMQBQqwTzbwm6cmQ@mail.gmail.com>
References: <20171114145442.16734-1-norbert.lange@andritz.com>
 <20171129224524.1f8022b4@windsurf.home>
 <CADYdroOSHBypUB1gDLZxDptrvmKG1QeqBRuQTFcg_ZwqJC9zhg@mail.gmail.com>
 <20171130135004.54a455c9@windsurf.home>
 <20171130212424.GA2759@scaer>
 <CADYdroNk1S1Qugd_fiz7uyhZ2boN5jL+PZvMQBQqwTzbwm6cmQ@mail.gmail.com>
Message-ID: <20171201164334.GA5966@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Norbet, All,

On 2017-12-01 09:40 +0100, Norbert Lange spake thusly:
> 2017-11-30 22:24 GMT+01:00 Yann E. MORIN <yann.morin.1998@free.fr>:
> > On 2017-11-30 13:50 +0100, Thomas Petazzoni spake thusly:
> >> On Thu, 30 Nov 2017 12:08:17 +0100, Norbert Lange wrote:
> >> > -   [ ! -r /etc/default/$DAEMON_NAME ] || . /etc/default/$DAEMON_NAME
> >> > This scheme is used to be able to execute that script with 'sh -e'
> >> > [ -r /etc/default/$DAEMON_NAME ] && . /etc/default/$DAEMON_NAME would
> >> > fail if there is no such file (which is no error)
> >> >
> >> > Please tell me if I should still use the later line.
> >>
> >> Interesting reason. Please keep your original proposal then. The
> >> ejabberd package is already using this construct. However, all other
> >> packages are using the && construct.
> >>
> >> Unless Yann has a better suggestion for this ?
> >
> > I think we should write down those rules about startup scripts and their
> > configuration files.
> 
> Yes, maybe some helper scripts like https://packages.debian.org/sid/lsb-base
> would be a good resource for templates and cut down most of the
> repetition aswell.

I think a simple template in the manual would be enough.

> > But back on topic for Norbert's use-case. I usually do like he did, but
> > I find it hackish nonetheless. I really prefer positive logic anyway,
> > like so:
> >
> >     if [ -r /etc/default/foo.config ]; then
> >         . /etc/default/foo.config
> >     fi
> >
> > Yes, that's three lines instead of one, but who cares, really?
> >
> > However, Norbert's excuse only stands for script that are 'set -e' (i.e.
> > they exit as soon as a command exits with a non-zero return code.
> 
> There is no excuse (I have no problem using your solution),

Sorry, I did not meant 'excuse' as something that was an bad reason, but
in a more neutral sense...

> but old experiences, preferences and habits like running scripts
> with set -e and the "shortcut logic" required - try until one of the
> statements is true.
> The if will disable exit-on-error, so that's different to both lines.
> 
> Btw. I was under the impression that buildroot tries to be as small as possible,
> and therefore uses its own init scripts instead the ones from upstream packages.

There is no causality; only correlation. We usually provide our own
startup scripts not because of size, but because the upstream ones make
strong assumptions about running on a desktop-like or server-like
system, and do not work with Busybox init for example.

And startup script are relatively small, when compared to the rest of
the system. Also, they comress very easily. So it is usually not worth
optimising them for size that much.

(and besides, using three lines instead of one is only in fact using
only just a few more bytes, which is what counts in the end).

Regards,
Yann E. MORIN.

> > But this is not the case of the startup script. So if we would really
> > want to make it a single line, then positive logic would still to be
> > preferred:
> >
> >     [ -r /etc/default/foo.config ] && . /etc/default/foo.config
> 
> Ok.
> Norbert
> >
> > Regards,
> > Yann E. MORIN.
> >
> > --
> > .-----------------.--------------------.------------------.--------------------.
> > |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> > | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> > | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> > | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> > '------------------------------^-------^------------------^--------------------'

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
