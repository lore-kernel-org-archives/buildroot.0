From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 15 Jun 2020 12:21:19 +0200
Subject: [Buildroot] [PATCH v2] package/dbusbroker: new package
In-Reply-To: <CADYdroPBJBr4psh4YLM+Er--SEF_1hCUd0Drqizcv3mjM2+eJw@mail.gmail.com>
References: <20200610232428.201616-1-nolange79@gmail.com>
 <20200612053155.GU13972@scaer>
 <CADYdroP2X5Q1hgO27YPh9uNCF=LZQSxtW1L+kd0bDGLjPDLqcQ@mail.gmail.com>
 <20200614131013.GO2346@scaer>
 <CADYdroPBJBr4psh4YLM+Er--SEF_1hCUd0Drqizcv3mjM2+eJw@mail.gmail.com>
Message-ID: <20200615102119.GY2346@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Norbert, All,

On 2020-06-14 23:30 +0200, Norbert Lange spake thusly:
> Am So., 14. Juni 2020 um 15:10 Uhr schrieb Yann E. MORIN
> <yann.morin.1998@free.fr>:
[--SNIP--]
> > So you are very welcome to have re-spun this new iteration. :-)
> As said, I have trouble with the ML flow, seems like the commit should then
> include the whole discussion as otherwise no one is able to follow?

I guess that's what the post-commit history (all that is after the ---
line) is for: keep a track of the changes between the various iteration
of a patch (if I understood your isue correctly).

[--SNIP--]
> > OK, I knew that would have been systemd doing the uid-drop, by I'd still
> > like the info appear somewhere (so that we do not later question this in
> > light of the original dbus package which defines one).
> Not sure if we got some communication issues. The setting does
> something (drop privileges),
> while I originally considered the launcher ignoring the Xml key.
> I guess you could tweak the systemd service to use a Dynamic user,
> but I won't touch that for now.

So I did some testing:

  - without the <user> entry in system.conf, the launcher and the
    message bus are running as root.

  - with a <user> entry in system.conf (and the correct user in
    /etc/passwd and /etc/group), the launcher and the message bus are
    running as non-root with the specified user, and systemd is working
    happily.

So, I would like we do use a non-root user for dbus-broker, like we do
for the original dbus.

I'll add that when I re-submit later tonight.

[--SNIP--]
> > And explain in the commit log that the launcher needs systemd, and that
> > without the launcher there is no point in dbus-broker.
> Seems to be the best option for now IMHO. Revisit the launcher-less option
> once you have something to test.

Agreed.

[--SNIP--]
> dbus/broker should be enabled by default with systemd, but with some way
> that the user still can disable those. Dunno what's the correct to do
> this in buildroot,
> add a line to dbus  'default y if BR2_PACKAGE_SYSTEMD'?

We can revisit that in a later patch (I've seen and started to apply
your otehr series, which conclusion is to indeed drop the dbus
requirement; let's see that happen there, not here).

[--SNIP--]
> > If you agree, then I'll try to merge your new submission with your
> > comments into my series and re-spin it soon-ish, if that's OK with you.
> You doing the work, and I get to nag? Deal ;)

My pleasure! ;-)

Thanks for the discusion and the explanations. New iteration pending by
the end of the day (hopefully).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
