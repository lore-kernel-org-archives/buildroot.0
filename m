From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 6 Mar 2019 18:36:39 +0100
Subject: [Buildroot] [PATCH] package/openrc: new init package OpenRC
 (0.38.3)
In-Reply-To: <28627e2a-5cd9-dfb9-5825-bc6b294cba3b@mind.be>
References: <20190228194415.7943-1-michal.lyszczek@bofc.pl>
 <befe78f5-d0b9-9f10-187d-26a918a6250c@mind.be>
 <20190305213858.GQ2721@scaer>
 <20190305232045.mylcl6l2ic26akxk@c-ml-p3510.redembedded.pl>
 <28627e2a-5cd9-dfb9-5825-bc6b294cba3b@mind.be>
Message-ID: <20190306173639.GR2721@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Micha?, All,

On 2019-03-06 10:58 +0100, Arnout Vandecappelle spake thusly:
> On 06/03/2019 00:20, michal.lyszczek at bofc.pl wrote:
> > On 2019-03-05 22:38:58, Yann E. MORIN wrote:
> >>     systemd is compatible with the SysV init system to a large degree:
> >>     SysV init scripts are supported and simply read as an alternative
> >>     (though limited) configuration file format. The SysV /dev/initctl
> >>     interface is provided, and compatibility implementations of the
> >>     various SysV client tools are available. In addition to that, various
> >>     established Unix functionality such as /etc/fstab or the utmp
> >>     database are supported.
> 
>  Yes, but at the moment we don't install the sysvinit scripts so systemd is not
> going to execute them.

Oh, I thought you were speaking about the init script that packages
installs themselves, not ours...

Of course, I was a bit off my shoes on that one.

OTOH, people usually contribute whjat they need. systemd service got
added as time passed, when people realised their pet package did not
install one.

This is usualy our mantra: things get done when people are interested in
it.

>  Ideally we'd also have a runtime test that checks if the sysvinit script indeed
> gets called.

If we do have the fallback, then yes, of course, but in the end does it
make sense to have that fallback? As I said, people interested in OpenRC
and seeing their package of interest lack a prroper startup script, can
contribute one.

IMHO, the fallback allows for lazyness and complacency.

> > So my proposition would be to not perform default 'make install' but install
> > only bare minimum set of init scrips, that are sure not to fail. 
>  Instead of doing a custom install, I prefer to just do the default install and
> remove things are not needed / wanted.

I usually prefer to whitelist rather than blacklist. I.e .I prefer a
selective install, rather than a selective removal.

Otherwise, when we bump the version, and a new tool is installed, we can
very easily miss it and leave it installed. While when we selectively
install, we can't leave cruft on the target, but we will notice easily
that something is missing.

Of course, the alternative is to go full-blown, which I also find
acceptable. We can then trim down in followup patches.

> > - Invoke "install" for each file? There are quite of them.

OTOH, there are probalby quite a bunch of files to remove too, no?

> > - Do normal 'make install' then call 'rm' on each uneeded files in target_dir?
>  Yep, that's the one.

I'm still not happy with tselective removal...

> >> (and I find it ugly indeed, because it makes the first pattern different
> >> from the others... Bleark...)
>  Eek, bleark indeed... Why do we have that -e in $(SED)?

The most powerfull of the reasons: it's historic? ;-)

> > That field was not designed to place hostname there but os branding. For
> > example, "GNU/Linux Debian" would be good example of branding, since multiple
> > hardware with different hostnames can use single OS. Of course it's just for
> > eye-candy but I would prefer to hardcode it to "Buildroot" (or empty) than put
> > hostname or issue here.
> 
>  For gcc we have:
>         --with-pkgversion="Buildroot $(BR2_VERSION_FULL)" \
>         --with-bugurl="http://bugs.buildroot.net/"
> so using the same for openrc seems appropriate.

+1

>  Maybe we should introduce a global config + variable to control this, i.e. the
> NAME and PRETTY_NAME in /etc/os-release.

I amundecided on that one... Would you also offer a way to change the
version, to match that of the product? IMHO, people that are concerned
with having their names in there can just generate os-release from a
post-build script, so that they can get the version out of their VCS for
example.

> >> I think this should be a sub-option of the openrc package, not the 'init'
> >> part.
>  I actually disagree that the various init packages depend on PID1 coming from
> that particular package. There could be use cases to have a different init
> system (usually _NONE) and still have the init executable there.

But then, what package is responsible for install /sbin/init ?

If you allow to enable busybox' init, sysvinit, and systemd (and later,
OpenRC) simultaneously, they will all compete to provide /sbin/init,
with the latest winning over the others...

(Actually 'None' should really read as 'Custom', because there better be
an kind of init system, or 'first'application' to start.)

>  For openrc, this is doubly so, because openrc is not a standalone init system.
> So it can very obviously be used with a different PID1.
>  So IMO this choice really belongs to the system config.

Well, OpenRC really looks like a weird 'non-init' system, in the end...

Maybe we're taking the problem in the wrong way, then? Can we revert the
logic, and have something like:

    System configuration  --->
        Init system
            ( ) Busybox
            (X) sysvinit
            ( ) systemd
            ( ) None
        [ ] Use OpenRC as scripts scheduler/watcher/reaper

With that new option having 'depends on !systemd'.

I haven't given it much thought, but maybe that's where we want to go?
Or something along those lines? Thoughts?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
