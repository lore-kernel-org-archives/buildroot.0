From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jun 2020 22:57:15 +0200
Subject: [Buildroot] [PATCH v1 2/3] package/iwd: add basic configuration
 file
In-Reply-To: <20200614210740.0d39d95d@gmx.net>
References: <20200612232433.18442-1-ps.report@gmx.net>
 <20200612232433.18442-2-ps.report@gmx.net>
 <20200614095628.GJ2346@scaer> <20200614210740.0d39d95d@gmx.net>
Message-ID: <20200614205715.GN2346@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2020-06-14 21:07 +0200, Peter Seiderer spake thusly:
> On Sun, 14 Jun 2020 11:56:29 +0200, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > On 2020-06-13 01:24 +0200, Peter Seiderer spake thusly:
[--SNIP--]
> > > +	select BR2_PACKAGE_OPENRESOLV if !BR2_INIT_SYSTEMD
> > I think this is preferable to use BR2_PACKAGE_SYSTEMD as the dependency,
> > rather than BR2_INIT_SYSTEMD, even if the two are currently tightly
> > intertwinned.
> I would prefer the !BR2_INIT_SYSTEMD as I believe iwd needs
> an service of the running systemd (or an alternative implementation)
> and not a feature/library of the systemd package (only runtime not
> a compile time dependency)...

I'm still not convinced...

What if one has:

    BR2_INIT_SYSTEMD=y
    # BR2_PACKAGE_SYSTEMD_RESOLVED is not set

Does systemd still provides resolv.conf?

I guess not. So in fact the dependency is really not about the init
system. but about a package that provides resolv.conf. In which case it
should be changed to:

    select BR2_PACKAGE_OPENRESOLV if !BR2_PACKAGE_SYSTEMD_RESOLVED

Or did I miss something else?

[--SNIP--]
> > > +ifeq ($(BR2_INIT_SYSTEMD),y)
> > > +define IWD_CONFIG_FILE_NAME_RESOLV_SERVICE
> > > +	echo -e "[Network]\nNameResolvingService=systemd" >> $(TARGET_DIR)/etc/iwd/main.conf
[--SNIP--]
> > However, this will not be working nicely on rebuilds, as it will keep
> > appending this to the file. See below for a better approach (I think):
> On re-builds the common IWD_INSTALL_CONFIG_FILE (copy plain main.conf will
> be executed first, so no problem...

Indeed, but still that's not obvious, as it splits the install of that
one file in two places: a generic one, and a per-init-system one.

> > Also, the condiotion on BR2_INIT_SYSTEMD is already handled by the
> > infra, by using the appropriate INIT_INSTALL hooks:
> >
> >     define IWD_INSTALL_INIT_SYSV
> >         sed -r -e '$s/$/\n[Network]\nNameResolvingService=resolvconf/' \
> >             $(IWD_PKGDIR)main.conf \
> >             >$(TARGET_DIR)/etc/iwd/main.conf
> >     endef
> 
> Does not work, gives:
> 
> 	sed: -e expression #1, char 46: missing command

This is Makefile, I forgot to duplicate the $ signs when copy-pasting
from my shell experiment...

> And did not figure out what would be the right sed exprecssion (the leading $
> seems to be wrong, but without another error occures)...

The leading $ means 'on the last line', so the replacement is only
attemped on the last line.

> >     define IWD_INSTALL_INIT_SYSTEMD
> >         sed -r -e '$s/$/\n[Network]\nNameResolvingService=systemd/' \
> >             $(IWD_PKGDIR)main.conf \
> >             >$(TARGET_DIR)/etc/iwd/main.conf
> >     endef
> Nice shortcut, but misses the enable-the-one-option-for-systemd and
> enable-the-other-option-for-all-other-init-systems...

Sorry, I don't follow you.

For systemd, only the IWD_INSTALL_INIT_SYSTEMD hook is run, and for the
others, only the IWD_INSTALL_INIT_SYSV hook is run. And each does append
a different NameResolvingService key, systemd in the first case,
resolvconf in the second case.

Ah, there is *one* case where the file would not be copied and expanded
with my proposal, when the user uses BR2_INIT_NONE. But this really is
the user's reponsibility to catter for the requirements of their init
system...

[--SNIP--]
> > > +IWD_POST_INSTALL_TARGET_HOOKS += \
> > > +	IWD_INSTALL_CONFIG_FILE \
> > > +	IWD_CONFIG_FILE_NAME_RESOLV_SERVICE
> > And thus those post-install hooks are not longer required.
> Nice, but see downside above...

Except for BR2_INIT_NONE, I don't see the problem...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
