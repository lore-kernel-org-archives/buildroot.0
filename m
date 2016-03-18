From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 18 Mar 2016 23:22:52 +0100
Subject: [Buildroot] The best way to add a new group to /etc/group
In-Reply-To: <56EC70E4.9060007@mind.be>
References: <CALtfCQY_vSZ3PGxgqhAsEsVpir+5p76TfLhCdQYJZASsNnSDzA@mail.gmail.com>
 <20160318174359.GC3696@free.fr> <56EC70E4.9060007@mind.be>
Message-ID: <20160318222252.GA32171@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2016-03-18 22:19 +0100, Arnout Vandecappelle spake thusly:
> On 03/18/16 18:43, Yann E. MORIN wrote:
> >On 2016-03-18 10:38 +0100, ?scar G?mez Fuente spake thusly:
> >>I'm building a new package in buildroot and I would like to know the best
> >>way to add a new group.
> >>
> >>I have to add a new group called: test_group. In my system (with
> >>INIT_SYSV). I have a user called root and I have to add it to this group
> >>too.
> >>
> >>I've read the section "17.5.2. generic-package reference" in the buidroot
> >>manual and find this variable: NAMEPACKAGE_USERS that it's very interesting
> >>because automatically it adds the user you want and the uid and guid can be
> >>computed automatically, so is very useful.
> >>
> >>Does anyone know if there is something similar to add a group?
> >
> >Yes, it's simple: specify the username as just a plain dash '-', as
> >explained in the manual:
> >     https://buildroot.org/downloads/manual/manual.html#makeuser-syntax
> >
> >     ---8<---
> >     username is the desired user name (aka login name) for the user. It
> >     can not be root, and must be unique. If set to -, then just a group
> >     will be created.
> 
>  But as far as I know, there is no way to add users to a group, no?

I'm not sure to understand.

When adding a new user, you have to specify its primary group. There is
no way in UNIX to create a user that is not part of any group, so the
primary group is mandatory. So at least the user is part of that group.
There is nothing that prevents you from adding a user to an existing
group, or to create a brand new group for that user. In any case, you
have de facto added the user to its primary group.

Furthermore, when adding a user, you can also specify the additional
groups it will belong to (also explained in the manual).

Finally, defining the same user twice is in fact allowed. The manual is
not much clear about it, as it states that the user "must be unique."
What that means is that, when adding a user with a specific UID, it has
to be a unique combination. Some examples will better explain that:

Correct:
    FOO_USERS = foo - [...]
    BAR_USERS = foo - [...]

Correct:
    FOO_USERS = foo 1 [...]
    BAR_USERS = foo 1 [...]

Correct:
    FOO_USERS = foo - [...]
    BAR_USERS = foo 1 [...]

Not correct:
    FOO_USERS = foo 1 [...]
    BAR_USERS = foo 2 [...]

Similarly, the primary group must match for that user. Similarly, when
adding a group with a specific GID, it has to also be a unique GID.

What that means is that all definitions of a user must be "compatible",
and that all definitions of a group must be "compatible".

> So to
> add the root user to this new group, the only option is to explicitly update
> the groups file.

Indeed, it is not allowed to define the root user. We could allow that,
and ensure it gets UID zero, has primary group set to root and has GID
zero, as well as a few other similar sanity checks, so that it would be
possible to add the user root to any arbitrary groups.

And I doubt it is even sane to begin with... ;-/

However, root being root, it can become member of any group it pleases,
either by way of newgrp(1) in the shell, or programtaically with
setgid(2). So I fail to see what the issue here really is.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
