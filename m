From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 23 Nov 2016 19:46:24 +0100
Subject: [Buildroot] pseudo: remaining issues...
In-Reply-To: <315eabd4-eb7f-2e83-c8f8-caa5a3cd3099@mind.be>
References: <20161122212534.GA3529@free.fr>
 <315eabd4-eb7f-2e83-c8f8-caa5a3cd3099@mind.be>
Message-ID: <20161123184624.GB3609@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2016-11-23 00:02 +0100, Arnout Vandecappelle spake thusly:
> On 22-11-16 22:25, Yann E. MORIN wrote:
> > One solution that would make it work in all cases would be:
> > 
> >   - do the target-finalize actions in a copy of target/
> >   - generate, filesystem images form that copy
> >   - trash the copy
> >   - trash pseudo DB
> 
>  This could fit pretty well in a per-package-staging like approach (but then per
> package target, obviously). So each package installs in its own version of the
> target directory, and at the end everything is put together into the final
> target. The latter can be done under pseudo.
> 
>  BTW, it's not really needed to repeat all the makedevs etc. steps under pseudo
> for every filesystem, we could just do that once, and then generate each
> filesystem (under pseudo again of course). But that doesn't fix the issues with
> rebuilding, of course.

You mean, like a patch I sent more than one year ago ;-)
    http://lists.busybox.net/pipermail/buildroot/2015-September/140525.html

Ok, this one still calls makedevs in each fs image generation, because
we were still using fakeroot at the time. We could now also move the
makedevs in the common part.

/me should probablky re-spin this series...

> > Another possibility would be to always do changes in target/ under
> > pseudo:
> >   - installing packages
> >   - taget-finalize
> >   - filesystem generation
> 
>  I think this option is where we want to go long-term. Packages are meant to be
> installed under sudo, so installing them under pseudo is a good idea.

Yes, and this is still quite interesting for the per-package-target, as
you hinted above.

>  It's not so trivial for us, though. In openembedded they can easily do the
> equivalent of install-target under pseudo, but we can't because the commands run
> under individual shells in make. There are a few possibilities to work around
> that, but it needs some thinking.

No, it's not trivial.

We could quite easily move target-finalize to a helper script and call
that through pseudo, but the individual package commands are more
complex to pseudo-ify... Not impossible, though, if we look at how this
is done for the filesystems (but I'd find it ugly)...

> > Neither solution is trivial, especially so close to the release.
> > 
> > 
> > Alternatively, we can revert back to using fakeroot for this release, at
> > the expense of breaking (already previously broken) setups with SELinux
> > on the host.
> 
>  It looks like that will be the way to go :-(
> 
>  Note that we'll also need to revert c85cd189dc1d (as discussed on IRC), because
> of the /dev/console thing you described. That used to work under fakeroot
> because the mknod() was done even if the (normal) file existed already, but with
> c85cd189dc1d it won't work anymore under fakeroot (because there we don't store
> the database).

Yup... :-/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
