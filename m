From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 27 Mar 2017 14:35:46 +0200
Subject: [Buildroot] Patchwork cleanup, 10 patches to look at
In-Reply-To: <20170326235320.448e802a@free-electrons.com>
References: <20170326235320.448e802a@free-electrons.com>
Message-ID: <db756f2e-3dda-2fcc-6035-3287b88acf29@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 26-03-17 23:53, Thomas Petazzoni wrote:
> Hello,
> 
> I'd like to again restart the patchwork cleanup effort. There are
> numerous patches in patchwork that I'm not sure what we want to do
> with.

 Great initiative!

> 
> Here is a list of 10 patches that we need to take a decision on. If no
> decision is taken in the next 2 weeks, I'll mark them as Rejected.
> 
>  * avahi: link with libintl if libglib2 is enabled
>    https://patchwork.ozlabs.org/patch/683732/
> 
>    My plan is to enable the stub libintl in uClibc-ng and stop having
>    all those linking issues with libintl from gettext. The only
>    drawback would be that there would no longer be "translation"
>    support with uClibc: the libintl implementation in uClibc-ng is
>    really just a stub.
> 
>    Thoughts ?

 I think having internationalization support can still be useful in a
Buildroot/uClibc based system, e.g. to support translation of a custom CLI UI.
So using the stub implementation unconditionally sounds like a bad idea.

 How about instead making gettext/intl support depend on !static? That's also a
catch-all solution, but a lot less aggressive.


>  * qemu: allow to build statically
>    https://patchwork.ozlabs.org/patch/692667/
> 
>    We normally don't want to have special options for each package to
>    build them statically. Should we make an exception for Qemu?

 I see something like this like having package options that do little more than
selecting other packages, like BR2_PACKAGE_PHP_EXT_BZIP2. It's something we want
to avoid, but sometimes there are good reasons to do it.

 So for Qemu and also for Docker I do think it makes sense to have static as a
per-package option.


>  * infra: fix 'packages-file-list.txt' with TLP
>    https://patchwork.ozlabs.org/patch/694519/
> 
>    Adds a lock around the installation step of packages, to make
>    top-level parallel build still generate a correct list of files per
>    package.
> 
>    Gustavo, what is your plan regarding this?
> 
>    Others: should we merge this?

 I don't think this is the proper approach. The proper approach is map/reduce,
i.e. generate the pieces in per-package files and collect them together in a
final gathering stage. Obviously, this requires a per-package target first, but
that's anyway the way we want to go.

 I thought someone already made that comment but I can't find it in that thread...

>  * e2fsprogs: keep util-linux's fsck if chosen
>    https://patchwork.ozlabs.org/patch/696634/
> 
>    This fixes a real bug, but even Maxime who submitted the patch is
>    not too happy with the proposal. Could someone look into this?
> 
>  * linux-headers: Account for LINUX_OVERRIDE_SRCDIR
>    https://patchwork.ozlabs.org/patch/713927/
> 
>    I think I am against this patch, because if the user sets
>    LINUX_OVERRIDE_SRCDIR, then suddenly he will see his kernel headers
>    being rebuilt as well.
> 
>    Arnout ?

 Well, as you can see in the discussion thread, I argued against it, asked for a
stronger argument for it, but none was forthcoming.

 However, my conclusion was that we should either apply this, or fix the
documentation so that it explains that HEADERS_SAME_AS_KERNEL doesn't apply if
LINUX_OVERRIDE_SRCDIR (or LINUX_SITE_METHOD = local) is set.


>  * python-lxml: allow build as host package
>    https://patchwork.ozlabs.org/patch/722644/
> 
>    Host package not used anywhere. Discussed at length during the
>    previous BR meeting. What do we do?

 The conclusion at BR meeting was unfortunately not clear, but we definitely
said that we would be more lenient towards this kind of addition. So I'd say we
accept it (with a Config.in.host entry, though).


>  * fakedate: simplify logic
>    https://patchwork.ozlabs.org/patch/725396/
> 
>  * linux-tools/perf: fix build for MIPS by using the right emulation on
>    LD
>    https://patchwork.ozlabs.org/patch/729154/
> 
>  * package/pkg-download.mk: add gitlab helper
>    https://patchwork.ozlabs.org/patch/736382/

 I'm not a fan of adding helpers (in fact, I think the github helper should
die). For gitlab, however, the URL construction is indeed a bit peculiar and it
differs a lot from the URL a user normally sees (adding that &filename= thing),
so it does make sense to have it. Since I couldn't decide, I didn't reply :-)


 Regards,
 Arnout

>  * linux: Add CIP SLTS easy selection option
>    https://patchwork.ozlabs.org/patch/736383/
> 
> Please help taking decisions about those patches.
> 
> Thanks!
> 
> Thomas
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
