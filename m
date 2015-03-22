From: Alex Suykov <alex.suykov@gmail.com>
Date: Sun, 22 Mar 2015 14:39:14 +0200
Subject: [Buildroot] [RFC 01/11] common service startup files
In-Reply-To: <550E057E.2030605@mind.be>
References: <cover.1426960081.git.alex.suykov@gmail.com>
 <3116b4122f3e3ea776ce2739c11ee36ea967297f.1426960081.git.alex.suykov@gmail.com>
 <550E057E.2030605@mind.be>
Message-ID: <20150322123914.GB21403@vostro>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sun, Mar 22, 2015 at 12:57:50AM +0100, Arnout Vandecappelle wrote:

Thanks for extensive review, a lot of good points which I skip in
this reply because they should go directly into the code.

> Missing SoB, but perhaps that's intentional because it's not ready for inclusion?
Well, partially, and partially I just forgot -s when re-splitting commits.

> > files may set $(PKG)_INIT = KEY:value KEY:value ..., which will be
> > handled by install-run. The substitutions will be applied to sysv
> > and systemd files.
> 
>  I don't see why this is needed, and it probably makes the install-run script
> more complicated.
> 
BR2_PACKAGE_GPSD_DEVICES, and keeping it a variable in the resulting initscript.
Or maybe in /etc/default.
If sed substitutiions are ok, this can be done much simplier of course:

    sed s!DEVICES!/dev/ttyS1! package/gpsd/gpsd.run > build/gpsd-.../gpsd.run
    support/init/install-run build/gpsd-.../gpsd.run

> BTW, shouldn't tmpdirs be handled for sysv as well? Typically, the init script
> will create the tmpdir...
I saw this as systemd-specific.
Looking at the packages, yes, makes sense to have some kind of generic tmpdir
variable.

>  - The script should only handle cases that are actually used. So start with
> something extremely simple that covers a few interesting cases, and leave the
> others to use the old initscripts system.
Why I was trying handle as many packages as possible: I'm pretty sure something
like 80% of them will work immediately with only the basic support,
but it would be really bad to find a show-stopper among the remaining 20%.
Something that would require changing the way the whole thing works.

Perhaps it's ok to drop bad cases for now, leave them as initscripts-only
and expect the users do something about the unsupported cases themselves.

>  - Use existing infrastructure where possible. For instance, you could change
> the .run format into .ini format and use configparser, or you could use the
> shlex module for parsing.
Regarding ini files, I was thinking about using a kind of extended/simplified
.service format. Systemd being systemd, it would cover all cases, and it's got
some documentation already.

The problem is that there are pretty long shell scripts that do not fit well
within .ini files. Examples: sunxi-mali, ti-gfx, am33-cm3 and maybe some others.
That's why I tried to keep .run files looking somewhat like shell scripts.

Well, that and I don't like systemd documentation all that much.

> This bypass syntax is hard to understand IMHO. Can you find something
> simpler/clearer and more verbose? If you would switch to ini format, it could be
> something like
> 
> [initscripts]
> cp = package/foo/S10start
>      /etc/init.d/S10start
> 
> [systemd]
> cp-ln = package/foo/foo.service
>         /usr/lib/systemd/system/foo.service
>         /etc/systemd/system/multi-user.target.wants

The primary goal of the whole changeset is to separate package-specific
and init-system-specific things, moving the latter out of packages,
so that a change in systemd directory layout (for instance) would not require
patching all the packages.

This is why I try to specify startup ordering (priority 10 or multi-user.target
in this case) indirectly, and why I try to avoid explicit paths.
I see this as a part of init config format, not a part of service configuration.

The package does not need to know where to put those and how to name them.
All it needs is to have its process started, at some point.
