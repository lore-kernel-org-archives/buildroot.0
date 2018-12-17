From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 17 Dec 2018 22:33:59 +0100
Subject: [Buildroot] [PATCH v2] package: dropbear: make PATH configurable
In-Reply-To: <CAGt4E5sQsXUYd-Aa6A7nHB7GnF18-MmRwve=JgDSUWwmP6WJyw@mail.gmail.com>
References: <20180309224149.20225-1-mmayer@broadcom.com>
 <20181216152603.GD2384@scaer>
 <CAGt4E5v655G7xF0sXUx7gb9ecfDC6UE+Jbx8jEK1_roKzFNKng@mail.gmail.com>
 <20181216184725.GA2951@scaer>
 <CAGt4E5sQsXUYd-Aa6A7nHB7GnF18-MmRwve=JgDSUWwmP6WJyw@mail.gmail.com>
Message-ID: <20181217213359.GA24194@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Markus, All,

On 2018-12-17 10:51 -0800, Markus Mayer spake thusly:
> On Sun, 16 Dec 2018 at 10:47, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > > Would it make sense to use the order /bin:/usr/bin:/sbin:/usr/sbin?
> > > Conceptually, that would make it pick up non-admin and non-system
> > > tools first. In reality, it likely wouldn't make a difference, because
> > > there won't be programs of the same name in a "bin" path and in an
> > > "sbin" path. But if there are, for whatever reason, it's nicer if it
> > > picks the one that will do "less damage" by default, unless explicitly
> > > told otherwise.
> > > Anyway, it's just a thought.
> >
> > Currently, system/skeleton/etc/profile contains /bin:/sbin:/usr/bin:/usr/sbin
> > so I'd suggest we keep that as the default for this new option.
> 
> Okay, I'll leave it as is.
> 
> > Cool thanks! Don't forget to Cc me on the resulting series, so I'm sure
> > not to miss it. (which does not mean you'll get a fast review, mind
> > you! :-/)
> 
> Looks like the main challenge will be to change etc/profile. Right
> now, it is being copied (rsynched) as is. That won't be possible
> anymore. It'll have to replace a place holder with the actual PATH as
> set in the new config option.
> 
> $ head system/skeleton/etc/profile
> export PATH=/bin:/sbin:/usr/bin:/usr/sbin
> 
> if [ "$PS1" ]; then
>     if [ "`id -u`" -eq 0 ]; then
>         export PS1='# '
>     else
>         export PS1='$ '
>     fi
> fi
> 
> Do you know of any examples in the Buildroot code where the "build"
> process has to modify a script and insert the value of a Buildroot
> config option? If this is already being done elsewhere, I'd like to
> use the same approach here if possible.

Use $(SED) to sed the file after it has been installed. See for example
pppd:
    https://git.buildroot.org/buildroot/tree/package/pppd/pppd.mk#n74

So, in SKELETON_INIT_COMMON_INSTALL_TARGET_CMDS, add a line something
like:
    $(SED) 's at PATH=.*$@PATH=$(BR2_SYSTEM_PATH)@' \
        $(TARGET_DIR)/etc/profile

And note in the commit log that BR2_SYSTEM_PATH is a kconfig string, so
it is already quoted, so we end up with a properly-quoted assignment.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
