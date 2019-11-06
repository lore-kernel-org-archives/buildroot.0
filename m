From: =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>
Date: Wed, 6 Nov 2019 21:07:36 +0100
Subject: [Buildroot] [PATCH 1/1] Include makefiles from GLOBAL_PATCH_DIR
In-Reply-To: <20191106163748.GA3419@scaer>
References: <20191026145151.17749-1-jeremy.rosen@smile.fr>
 <20191106163748.GA3419@scaer>
Message-ID: <CAFvCimX7DT-StOhWMPmP-GVjNNBRDB5Bit2JfaWoF-VpxVVQhg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Yann, this is not really a surprise with the discussion we had. I'm
still a bit disappointed since this patch has always been a first step in
being able to change the version and one of the most requested feature for
a very long time, but that's the way it goes, I guess...

At least the people reading this mailing list will be able to use the
feature for their needs...

Cheers
Jeremy

Le mer. 6 nov. 2019 ? 17:38, Yann E. MORIN <yann.morin.1998@free.fr> a
?crit :

> J?r?my, All,
>
> Adding some core devs to the Cc list.
>
> On 2019-10-26 16:51 +0200, J?r?my Rosen spake thusly:
> > Including a file named <pkgname>.mk from the GLOBAL_PATCH_DIR allows a
> user
> > to tweak a package provided by buildroot to his own need.
>
> Thanks for sharing your work with this proposal.
>
> > * add a function to pkg-utils.mk to include makefiles from
> GLOBAL_PATCH_DIR
> > * modify all pkg-* to use it as their first action
>
> So I finally took the time to think about this patch. This is not really
> a review per-se, because the core of the changes are pretty trivial
> overall.
>
> Rather, it is mostly my point of view on the subject, and why I think
> an override-based solution is a bad idea. We discussed this during the
> last dev-days, but for posterity, I'll recap all here to spur more
> comments.
>
>
> *
> First, this solution does not cover all use-cases. One major drawback it
> has, is that it can't allow overriding the version of a package. The
> reason for this limitation is that he .hash file is not overridden, so it
> is not possible to provide an alternate version. However, when exposed
> with your proposal, the very first thing most users thought about using
> it for, was *exactly* for that: changing the version of the package.
>
> So, the most obvious limitations of this solution, is also the most
> obvious use-case users would expect to use it for. Big drawback...
>
>
> *
> Second, the excuse for such an override is to be able to claim not
> touching the Buildroot tree, and to be able to update the Buildroot tree
> with just a simple "git pull".
>
> I believe this is broken by design, because this actually hides breakage
> when updating Buildroot. When you update Buildroot, you have to account
> for the changes in the new version: new config options, new variables,
> new values in existing variables, or even changes deep in the various
> infrastructures. A proper override would have to go so far as to unset
> all the variables of a package before redefining it entirely.
>
> Hiding local changes away in an override actually is a missed opportunity
> to notice these changes with actual merge (or rebase) conflicts, instead
> leading to issues much later down the road, which means a lot of time
> lost. That would not show semantic conflicts, true, but actual
> code-level conflicts would show, and they would probably be the most
> common.
>
> So, I am afraid that these overrides are a poor excuse for not wanting to
> do actual VCS work.
>
>
> *
> Third, since the override is outside the Buildroot tree (if it were in,
> there would be no point in the override to begin with), it means it is
> easy to miss it in critical times. Some packages in Buildroot are
> licensed under copyleft licenses (GPL, LGPL...), and those have
> requirements reading something along the lines of "complete source code
> means [...], plus the scripts used to control compilation and
> installation of the executable." Scripts which happens to be Buildroot
> in our case, and the stuff in your override.
>
> Since the override would live in a separate tree with private, non
> public stuff, it would be very easy to miss it when coming into
> compliance for such packages, as one would be tempted to only distribute
> their Buildroot tree.
>
> So, such overrides actually makes one's life more difficult in this
> already complex topic.
>
>
> *
> In conclusion, my position on this topic is pretty straightforward: if
> you want to modify the package recipes, then do so, and do so your the
> Buildroot tree. Use a branch that contains your changes, and when you
> need, merge a new master (or stable, or LTS) into your branch.
>
> This is probably not a pleasing answer or review, I am sorry for that,
> but for all the reasons expressed above, I think an override-based
> solution is not a correct solution.
>
> Regards,
> Yann E. MORIN.
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191106/51c0296e/attachment.html>
