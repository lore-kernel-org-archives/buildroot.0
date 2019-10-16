From: Norbert Lange <nolange79@gmail.com>
Date: Wed, 16 Oct 2019 22:31:24 +0200
Subject: [Buildroot] [PATCH 2/4] prepare build infrastructure to pick up
 installed meson tool
In-Reply-To: <20191016201610.GG14656@scaer>
References: <20191016111927.14208-1-nolange79@gmail.com>
 <20191016111927.14208-3-nolange79@gmail.com>
 <20191016154850.0d093c4d@windsurf>
 <CADYdroMp8GzXS+zQ0a+T-eeqDiMggbybn+gu6H4Y2x-d4GTkdA@mail.gmail.com>
 <20191016210129.4043da12@windsurf.home> <20191016201610.GG14656@scaer>
Message-ID: <CADYdroOZp=M3DCYtE1gi-n7H1QAYtvZWxUb7Jop8LbY_DgKN9w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mi., 16. Okt. 2019 um 22:16 Uhr schrieb Yann E. MORIN
<yann.morin.1998@free.fr>:
>
> Norbert, Thomas, All,
>
> On 2019-10-16 21:01 +0200, Thomas Petazzoni spake thusly:
> > On Wed, 16 Oct 2019 18:28:02 +0200
> > Norbert Lange <nolange79@gmail.com> wrote:
> > > Well I do effectively use it, meson and its dependencies multiply my build-time,
> > > builds systemd and my libfuse3 package fine.
>
> So this had me wonder: why do you report that it works for you (and I am
> ready to believe you), although we do have a patch that you are not
> using?
>
> Put in other words, I was wondering that, maybe, your report was an
> indication that our patch was in fact no longer needed, in which case we
> could drop it and would reconsider your proposal.
>
> So I had to dig a bit on what this patch was doing (it is a relatively
> simple patch), and why it was needed.
>
> It turns out that the prupose of that patch is to ensure that a
> host-meson-package that also uses a library installed by one of our
> other host packages, keeps an RPATH to find that library (instead of not
> finding it, or of finding the system-provided one).
>
> This is nicely laid out in the git log for our patch:
>
>     commit 5c939246a802c0ad9704dac1505105037542a1d3
>     Author: Eric Le Bihan <eric.le.bihan.dev@free.fr>
>     Date:   Sat Oct 27 19:59:22 2018 +0200
>
>         meson: re-add patch for skipping RPATH fixing
>
>         The patch to skip RPATH fixing performed by Meson was removed in commit
>         a03f46ca6e9f43028003aedc92f1a1204ae7480f, as the script
>         support/scripts/check-host-rpath was not complaining anymore.
>
>         But without it, the problem still occurs for host packages [1].
>
>         So, restore this patch to fix build of host packages with Meson.
>
>         [1] http://lists.busybox.net/pipermail/buildroot/2018-October/232956.html
>
>         Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
>         Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>
> So yes, ther are situations where using a system-provided meson _may_
> work, but the generic case is that our patch is still required to ensure
> that the situatiuon dexribed above still works.

Yes, you want to be able to build all packages in buildroot without issues.
My patch would not change that. You would need to set an variable
override to pick up the system meson/ninja.

If upstream is fixed and you are confident nothing breaks, just set
that variable
in check-host-meson.mk.
Work done now, tested by users at their own peril now, flipping the switch
later. Sounds not so outrageous for me?

> Note that the only package in that situation in upstream Buildroot, is
> libglib2, so if you don't have that, then you do not have the problem
> this patch is solving.
>
> So, with those explanations, I hope it is now clearer why we can't rely
> on the system-provided meson.

Not rely, but add an option that the user can pick up the system meson
if he dares to do so.

> Anyway, your proposal was interesting, if at least because it really
> made us reconsider the usefulness of our patch.
>
> > > > Another (more useful ?) thing to look at: is it possible to use the
> > > > system-provided Python for Meson and Ninja, when python3 is provided by
> > > > the system ? I think Meson and Ninja by themselves are not long at all
> > > > to build, and it would be a much more useful direction for this patch
> > > > series.
> > > Define "useful". The patches work correctly for me (tm), and I dont
> > > use more than 1000 included packages that are useless for me (tm).
> > > Even if meson is not ready (again: it is for me), then improving
> > > buildroot ahead of it causes no harm?
>
> The case "works for me" is not a valid reason, because as demonstrated
> above, there are cases where it won't work.

As reiterated above, unless you explicitly enable it, those patches will
NOT pick up system meson. "Works for me" means there is a valid reason
for having the option.

Regards, Norbert
