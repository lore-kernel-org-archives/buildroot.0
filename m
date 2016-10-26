From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Wed, 26 Oct 2016 18:27:57 -0400
Subject: [Buildroot] [PATCH] core/download: remove support for special
	git refs
In-Reply-To: <1477512489-14710-1-git-send-email-yann.morin.1998@free.fr>
References: <1477512489-14710-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87d1imsq36.fsf@ketchup.i-did-not-set--mail-host-address--so-tickle-me>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

"Yann E. MORIN" <yann.morin.1998@free.fr> writes:

> f8b8251a (support/download: fetch all refs on full git clone) added
> support for fetching so-called special refs, to retrieve changesets from
> code-review tools like Gerrit or Github PRs.
>
> However, the use-case for using those special refs is not entirely
> clear, and is getting more and more complex (with still-pending patches
> about that).
>
> Those special refs are from code-review tools. As such, they are very
> volatile in nature: re-pushing a rebased branch to github would change
> the content fetched with such a ref (Gerrit seems to be more
> conservative, but still). So, they cannot be used for reproducible
> builds:
>   - they can't be used in a .mk file (normal packages)
>   - they can't be used in a .config file (linux, bootloader...)
>
> So, going back to the black board, two main use-cases have been
> identified:
>   - a developper that wants to manually test a PR
>   - an automated build farm that automatically builds a known
>     configuration against PRs
>
> In either case, there is a better solution that we've been advertising
> all along: the override-srcdir mechanism.
>
> Whether by a build farm or a developper, it looks like it would be much
> easier to do the clone (or a fetch from an existing repo), write a
> local.mk with an override-srcdir, and kick off the build, rather than do
> the various tweaking (in .mk and/or .config).
>
> (note: a developper that wants to test a PR is probably already active
> on that project, so will already have a local clone, so the fetch would
> only grab very few blobs, wo will be very fast).
>
> So, just remove the support for such special refs altogether.

I don't see why it is hard to maintain. A Github pull request ref or a
Gerrit change ref, as well as a custom ref, are valid git references.

That can totally end up in a customer defconfig.

What you are raising here is just a design choice. Whether to guide
developers to mechanism such as override-srcdir because such "special"
refs are to be considered not production-ready, or to be very flexible.

Thus I have no opinion on that. It's up to you guys.

Thanks,

        Vivien
