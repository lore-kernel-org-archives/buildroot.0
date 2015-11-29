From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Nov 2015 21:04:14 +0100
Subject: [Buildroot] [PATCHv4] core/pkg-generic: check proper package
 installation
In-Reply-To: <20151129192708.5120d6a3@free-electrons.com>
References: <1446837330-31048-1-git-send-email-yann.morin.1998@free.fr>
 <20151129185859.3fa69ae8@free-electrons.com>
 <20151129181007.GF3630@free.fr>
 <20151129192708.5120d6a3@free-electrons.com>
Message-ID: <20151129200414.GG3630@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-11-29 19:27 +0100, Thomas Petazzoni spake thusly:
> On Sun, 29 Nov 2015 19:10:07 +0100, Yann E. MORIN wrote:
> > Well, I for one would prefer we fail right on the culprit package,
> > rather than port-pone the check until the end. This way, it is obvious
> > which package is the cuplrit.
> 
> It's a matter of trade-off between the benefits and the additional
> complexity. IMO, the benefits of failing immediately on the culprit
> package are not that big. When we'll look at the incorrectly installed
> files, it will in 99% of the cases be obvious from which packages the
> files are coming, and in the 1% remaining cases, a simple "find" on a
> file with a name that isn't too generic will give us the answer.

Yes, I understand. My reasoning is that, there is no reason to continue
the build as soon as we know it is borked, so we do not loose time.

> > Except we now have a file-> package mapping (thanks to your graph-size),
> > so we could re-use that in a target-inalise hook, indeed.
> > 
> > Well, except maybe not... Can target-finalise be called before we have
> > all the host packages (most notably the filesystem image generators)?
> 
> The dependencies of rootfs generators are added to PACKAGES, so they
> are built before target-finalize:
> 
> in fs/common.mk:
> 
> PACKAGES += $$(filter-out rootfs-%,$$(ROOTFS_$(2)_DEPENDENCIES))
> 
> in Makefile:
> 
> target-finalize: $(PACKAGES)

OK, so we can safely grab the list in target-finalize.

I'll update the patch accordingly, thanks! :-)

> > > Or alternatively, use the existing instrumentation hooks.
> > 
> > Arnout did not like that, hence why I put in the common install rule.
> 
> What was Arnout reasoning?

Quoting from:
    http://lists.busybox.net/pipermail/buildroot/2015-November/143974.html

    I think this would fit better directly in the .stamp_install_* rules
    rather than as hooks. My reasoning is that it is much more difficult
    to find out why some commands are being called when they're hidden
    in hooks. That's not too bad for things like gathering statistics
    since they're supposedly inobtrusive, but here you're throwing an
    error so it is really useful to be able to find easily in the source
    where this error comes from.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
