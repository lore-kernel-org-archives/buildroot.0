From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Mar 2017 22:25:25 +0200
Subject: [Buildroot] Patchwork cleanup, 10 patches to look at
In-Reply-To: <db756f2e-3dda-2fcc-6035-3287b88acf29@mind.be>
References: <20170326235320.448e802a@free-electrons.com>
 <db756f2e-3dda-2fcc-6035-3287b88acf29@mind.be>
Message-ID: <20170328222525.005b27bb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 27 Mar 2017 14:35:46 +0200, Arnout Vandecappelle wrote:

> >  * avahi: link with libintl if libglib2 is enabled
> >    https://patchwork.ozlabs.org/patch/683732/
> > 
> >    My plan is to enable the stub libintl in uClibc-ng and stop having
> >    all those linking issues with libintl from gettext. The only
> >    drawback would be that there would no longer be "translation"
> >    support with uClibc: the libintl implementation in uClibc-ng is
> >    really just a stub.
> > 
> >    Thoughts ?  
> 
>  I think having internationalization support can still be useful in a
> Buildroot/uClibc based system, e.g. to support translation of a custom CLI UI.
> So using the stub implementation unconditionally sounds like a bad idea.
> 
>  How about instead making gettext/intl support depend on !static? That's also a
> catch-all solution, but a lot less aggressive.

Indeed, that's a solution. This solves the static linking issues, but
by getting rid of libintl from gettext entirely, I was hoping to remove
all the BR2_NEEDS_GETTEXT/BR2_NEEDS_GETTEXT_IF_LOCALE stuff.

But yes, I can understand that i18n support can be useful in a uClibc
based system.

However, the !static dependency then needs to be propagated to all
places where libintl is used, but only if uClibc is used. It's a bit of
a nightmare :-/

> >  * qemu: allow to build statically
> >    https://patchwork.ozlabs.org/patch/692667/
> > 
> >    We normally don't want to have special options for each package to
> >    build them statically. Should we make an exception for Qemu?  
> 
>  I see something like this like having package options that do little more than
> selecting other packages, like BR2_PACKAGE_PHP_EXT_BZIP2. It's something we want
> to avoid, but sometimes there are good reasons to do it.
> 
>  So for Qemu and also for Docker I do think it makes sense to have static as a
> per-package option.

ACK, so I'll apply the patch from J?r?me.

> >  * infra: fix 'packages-file-list.txt' with TLP
> >    https://patchwork.ozlabs.org/patch/694519/
> > 
> >    Adds a lock around the installation step of packages, to make
> >    top-level parallel build still generate a correct list of files per
> >    package.
> > 
> >    Gustavo, what is your plan regarding this?
> > 
> >    Others: should we merge this?  
> 
>  I don't think this is the proper approach. The proper approach is map/reduce,
> i.e. generate the pieces in per-package files and collect them together in a
> final gathering stage. Obviously, this requires a per-package target first, but
> that's anyway the way we want to go.
> 
>  I thought someone already made that comment but I can't find it in that thread...

OK, so I'll mark the patch as Rejected.

> >  * linux-headers: Account for LINUX_OVERRIDE_SRCDIR
> >    https://patchwork.ozlabs.org/patch/713927/
> > 
> >    I think I am against this patch, because if the user sets
> >    LINUX_OVERRIDE_SRCDIR, then suddenly he will see his kernel headers
> >    being rebuilt as well.
> > 
> >    Arnout ?  
> 
>  Well, as you can see in the discussion thread, I argued against it, asked for a
> stronger argument for it, but none was forthcoming.
> 
>  However, my conclusion was that we should either apply this, or fix the
> documentation so that it explains that HEADERS_SAME_AS_KERNEL doesn't apply if
> LINUX_OVERRIDE_SRCDIR (or LINUX_SITE_METHOD = local) is set.

I'm also not a big fan of this patch. I prefer if LINUX_OVERRIDE_SRCDIR
really only affects the linux package, to me it's just applying the
principle of least surprise.

> >  * python-lxml: allow build as host package
> >    https://patchwork.ozlabs.org/patch/722644/
> > 
> >    Host package not used anywhere. Discussed at length during the
> >    previous BR meeting. What do we do?  
> 
>  The conclusion at BR meeting was unfortunately not clear, but we definitely
> said that we would be more lenient towards this kind of addition. So I'd say we
> accept it (with a Config.in.host entry, though).

ACK.

> >  * package/pkg-download.mk: add gitlab helper
> >    https://patchwork.ozlabs.org/patch/736382/  
> 
>  I'm not a fan of adding helpers (in fact, I think the github helper should
> die). For gitlab, however, the URL construction is indeed a bit peculiar and it
> differs a lot from the URL a user normally sees (adding that &filename= thing),
> so it does make sense to have it. Since I couldn't decide, I didn't reply :-)

Nothing in Buildroot currently fetches its source code from Gitlab.
This change was proposed for the CIP long-term kernel version, but
according to
https://wiki.linuxfoundation.org/civilinfrastructureplatform/start:

"""Check the 4.4 CIP kernel repository, mirrored in Gitlab"""

So in fact their primary kernel repository is
https://git.kernel.org/pub/scm/linux/kernel/git/bwh/linux-cip.git/, not
the one on gitlab. And additionally, their gitlab mirror is apparently
not working as expected:
https://lists.cip-project.org/pipermail/cip-dev/2017-March/000167.html.
So I guess we should use the git.kernel.org repository instead.

And I still think the BR2_LINUX_KERNEL_LATEST_CIP_VERSION_BRANCH option
is not good, as it uses the "latest" version available, which makes the
build non-reproducible. I argued about this with Angelo, but I was a
bit alone against Angelo on the matter. Could some other folks give
their opinion so that we can resolve the debate?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
