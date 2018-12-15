From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 Dec 2018 12:00:35 +0100
Subject: [Buildroot] [PATCH v2 1/1] boot/systemd-boot: new package
In-Reply-To: <CADvTj4qfxJmefVR71juMxMdoV7+ua5Utt4cUGhPCnDXFUtBXDA@mail.gmail.com>
References: <1544787764-4537-1-git-send-email-james.hilliard1@gmail.com>
 <20181215085855.GA2625@scaer>
 <CADvTj4os44jtzrL=1uzQ83=xry2BJnJjKMPU-QgJaXi-tVNBoA@mail.gmail.com>
 <20181215102745.GB2625@scaer>
 <CADvTj4qfxJmefVR71juMxMdoV7+ua5Utt4cUGhPCnDXFUtBXDA@mail.gmail.com>
Message-ID: <20181215110035.GE2625@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2018-12-15 03:43 -0700, James Hilliard spake thusly:
> On Sat, Dec 15, 2018 at 3:27 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2018-12-15 02:12 -0700, James Hilliard spake thusly:
[--SNIP--]
> > > I did it this way so that it's clear that systemd-boot can be built
> > > without a systemd init system.
> >
> > There, _that_ is the reason for all this complexity.
> >
> > So, let me suggest two alternative options that avoid all this mess:
> >
> >  1- make systemd-boot available only for systemd-based init,
> >
> >  2- just do a systemd-boot package (in boot/) that is a whole package on
> >     its own, and just happens to build just the systemd-boot part of
> >     systemd.
> >
> > I would very much favour the first option, because it is very simple, as
> > it just requires a *few* tweaks in the existing sytemd.mk, i.e.
> > basically:
> >
> >     ifeq ($()BR2_PACKAGES_SYSTEMD_BOOT,y)
> >     SYSTEMD_CONF_OPTS += \
> >         -Defi=true \
> >         -Dgnu-efi=true \
> >         -Dcc-efi=blabla \
> >         [...]
> >     else
> >     SYSTEMD_CONF_OPTS += -Defi=false -Dgnu-efi=false
> >     endif
> it would also need the SYSTEMD_INSTALL_IMAGES_CMDS part.

Yes, obviously my code snippet was there just as a seed for a proper,
complete change...

> > Also, I wonder if it ever makes sense to provide systemd-boot to
> > non-systemd init systems to begin with.
> I think it does,

Yes, Peter provided a good use-case, indeed.

> systemd-boot is even designed to boot operating
> systems without systemd, including windows.

Aha, you almost got me there, I almost thought you were serious (in the
Buildroot context, I mean). ;-)

> > Baring that, option 2 is pretty simple as well. It's a separate package
> > that just happens to share its source code with another one, like we
> > have with mesa3d and mesa3d-headers (just as an example).
> I tried that approach first in my v1 patch, I abandoned it since

Yet, I think we should really go that route.

> systemd-boot needed to be built at the same time as the userspace
> tools for systems that have a systemd init system for the integration
> to work properly.

OK, so we need to think it a bit, then. Is it the boot part that needs
the userland part, of the userland that needs the boot part, of they
both need to know each other?

One option I can think of quickly, is that we could have a systemd-boot
package that is only available when systemd is not enabled, and an option
in systemd to install the boot part when systemd is enabled.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
