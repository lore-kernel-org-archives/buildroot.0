From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 9 May 2020 22:32:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/brltty: add host-gawk dependency
In-Reply-To: <87d07cx660.fsf@blind.guru>
References: <20200508162803.2151838-1-fontaine.fabrice@gmail.com>
 <20200508202653.GQ12536@scaer> <87d07cx660.fsf@blind.guru>
Message-ID: <20200509203217.GR12536@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mario, Fabrice, All,

On 2020-05-09 21:24 +0200, Mario Lang spake thusly:
> "Yann E. MORIN" <yann.morin.1998@free.fr> writes:
> > On 2020-05-08 18:28 +0200, Fabrice Fontaine spake thusly:
> >> host-gawk is used by brltty to build brlapi_constants.h, the build will
> >> fail if mawk is used instead of gawk
> >> 
> >> Fixes:
> >>  -
> >> http://autobuild.buildroot.org/results/4c77f03cbc7ab9e5ae9f24fe6eead1d76c50c743
> >> 
> >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> >
> > It seemed like a simple patch, but I can't reproduce the error with mawk
> > on my machine:
> >
> >     $ update-alternatives --get-selections |grep awk
> >     awk                            manual   /usr/bin/mawk
> >     $ awk --version
> >     awk: not an option: --version
> >     $ wget -O .config
> > http://autobuild.buildroot.org/results/4c77f03cbc7ab9e5ae9f24fe6eead1d76c50c743/config
> >     $ make olddefconfig
> >     $ make brltty
> >
> > Success...
> >
> > So, there is something else lurking in the darkness... :-/
> 
> Maybe... However, upstream indeed requires gawk (more or less by accident).
> This came up just recently while debugging a problem a user had.

So I did further research, and indeed it fails if awk is mawk, and gawk
is not installed on the system. Indeed, AC_PROG_AWK will actually search
for gawk, then mawk, then awk.

So my test above was flawed, as I stil did get gawk installed. I retried
on a system without gawk, and I could reproduce the error.

Patch applied to master, thanks.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
