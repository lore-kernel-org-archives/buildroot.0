From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 15 Aug 2016 00:45:35 +0200
Subject: [Buildroot] [PATCH 1/2] support/apply-patches: use options
 rather than positional arguments
In-Reply-To: <1933cc9d-7a02-eebc-6f7d-3f9f61770e45@mind.be>
References: <1471209606-17689-1-git-send-email-romain.naour@gmail.com>
 <1933cc9d-7a02-eebc-6f7d-3f9f61770e45@mind.be>
Message-ID: <20160814224535.GK30771@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2016-08-15 00:35 +0200, Arnout Vandecappelle spake thusly:
> On 14-08-16 23:20, Romain Naour wrote:
> > In order to improve the apply-patches script in a follow up patch and
> > ease it maintenance, use options provided by bash getopts rather than
> > positional arguments.
> > 
> > Update Buildroot infra and packages but this will break existing
> > packages from BR2_EXTERNAL using APPLY_PATCHES.
> > 
> > While at it, rename builddir to sourcedir since it is really the
> > package source directory.
> > 
> > Ref:
> > http://lists.busybox.net/pipermail/buildroot/2016-August/169760.html
> > 
> > Signed-off-by: Romain Naour <romain.naour@gmail.com>
> > Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
>  However, I think the -d -D is a bit confusing. How about -S (sourcedir) and -P
> (patchdir) instead?

The original proposal by Romain was to use:

    -b  build dir (which is in fact the source dir, but is currently
        called build dir in the script)

    -p  patch dir

    -P patch pattern

However, I think that -p and -P are too close to each other, so I asked
he changed that to use options that are not too similar graphically.

With your proposal, we'd get -s and -S which are again a bit too
similar.

With -d, -D , -p and -s, we now have options that are not look-alike.

>  We could also do a little bit of refactoring, and define a global
> APPLY_DEBIAN_PATCHES that can be used for all the debian-patched packages (it
> can be used directly as a POST_PATCH_HOOK). If you do that first, this commit
> becomes a lot smaller.

Ideally, I'd prefer we fix things before adding features. Besides, we're
targetting this change for master, since it is fixing a blocking
regression introduced since the last release.

>  Also (but for a separate patch of course), the current defaults are totally
> stupid. It would make more sense to default to *.patch for the pattern, because
> those are the most common ones. The default sourcedir and patchdir are probably
> best defined empty, so that it errors out in case those are forgotten.

Ditto for the ptach pattern: it should not be empty, IMHO.

>  And another nice addition would be an option for a single patch file, we have
> quite a few of those.

Just pass the patch filename as a pattern, no?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
