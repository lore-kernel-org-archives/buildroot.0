From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 31 Aug 2012 10:28:32 +0200
Subject: [Buildroot] libffi or the crazy world of toolchain options
In-Reply-To: <201208310035.37641.yann.morin.1998@free.fr>
References: <1345907166-29628-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <201208300053.32183.yann.morin.1998@free.fr> <503FDD5F.4070007@mind.be>
 <201208310035.37641.yann.morin.1998@free.fr>
Message-ID: <504075B0.3060201@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/31/12 00:35, Yann E. MORIN wrote:
> Arnout, Thomas, All,
>
> On Thursday 30 August 2012 23:38:39 Arnout Vandecappelle wrote:
> > On 08/30/12 00:53, Yann E. MORIN wrote:
> >> 1) - introduces a BR2_PACKAGE_XXX_AVAILABLE symbol
> >>      - moves all the package dependencies to this symbol
> >>      - has the package depends only on this symbol
>
> >    So that means the XXX_AVAILABLE is there even if the package has no
> > dependencies? I'm not sure I like that... It means the simplest packages
> > become more complex (only to make a few complex cases simpler).
> > A patch with a shortstat that adds 4500+ lines, that can't be right :-)
>
> Well, the script can be made to split the changes into small chunks.
> Locally, I use 32 packages by patch. That's highly manageable. And pass-1
> does not change anything in the actual dependency computation, except they
> are moved one symbol up.

  Ah yes, forgot to mention that: I don't think it makes sense to split the patch
into smaller patches per 32 packages.  It's still the complete patch that needs
to be reviewed.

  It _does_ make a lot of sense to split it per pass.

>
> >    Take the example of transmission: the size of its Config.in doubles, but
> > the real dependency is IPV6.  Adding all those "depends on ..._AVAILABLE"
> > which are always true only hide the real restriction here.
>
> In the begining, I thought like you. But I went to change all packages:
>    - this way, all packages follow the exact same mechanism
  Good point.

>    - updating packages dependencies is easy, because we do not have to
>      chase down other packages that would then break
  My point is that it is still easy.  I don't think we have had any case in the last
two years where it would require more than 15 lines of diffstat.  See libffi,
below.

>    - also, the dependency of the 'comment' is automatically updated (but
>      that's minor, as it is in the same file, and still requires the user
>      update the comment
  Good point.

>    - adding the _AVAILABLE for new packages is not much trouble [*]
>
> [*] I am also writing a small script that will partially automate the
> addition of a new package by asking a few questions to the user, then
> creating the skeleton files for that package. I hope to be able to post
> this script soon...
  Then it could indeed be more affordable.

>
> >    So I propose to remove the _AVAILABLE symbols for packages that don't
> > have actual dependencies.  At the moment, those are easy to find because
> > the dependencies are present directly in the package (but of course the
> > intention is to remove those direct dependencies if they're actually due to
> > an indirect dependency).
>
> And that will anyway require manual intervention. No script, brilliant as it
> may be, would be able to do that. Too bad... :-]
  Ack.

>
> > =>  In pass 1, only create the _AVAILABLE symbol if there is a depends on.
> > Also log in a file for which packages the _AVAILABLE was created
> >
> > =>  in pass 2 and 3, only execute the transformation if the _AVAILABLE
> > exists.
> >
> >
> >    Note that the disadvantage of restricting the _AVAILABLE to packages
> > that really need it, is that there's more work when a package acquires its first
> > toolchain dependency. Indeed, you have to add the _AVAILABLE symbol,
> > and look for all packages that select this one and add an _AVAILABLE
> > dependency. However, I think it doesn't often occur that a package
> > acquires a new (toolchain) dependency, and when it does it usually already
> > has an existing dependency (cfr. libglib2, python, xorg7, efl).  So, even
> > the libffi case wouldn't have cost much effort.
>
> Looking at how Thomas' libffi patchset is big, I doubt it was effortless! ;-)
  My point is: after this change (the introduction of the _AVAILABLE symbol
is still brilliant!) the libffi patch would just be roughly 15 lines.  You would have
to introduce the _AVAILABLE symbol for libffi, and add it to the two packages
that depend on libffi: libglib2 and python. Since both of them already have an
_AVAILABLE symbol, the recursion stops there.

  The reason is that the tricky packages (libglib2, python, x11r7, efl) already have
a toolchain dependency, so they will have an _AVAILABLE symbol.
>
> >> 2) - transforms all 'depends on BR2_PACKAGE_XXX' into a dependency
> >>        on the corresponding _AVAILABLE symbol
> >>      - adds a select on the corresponding package
> >    Actually I don't think we want this step.  The "depends on BR2_PACKAGE_XXX"
> > construct is used to hide packages that depend on a super-feature, like
> > X11 or python. In other cases, it's used to reduce the size of the menus where
> > relevant; e.g. dbus-glib is only relevant if you have dbus. This isn't perfectly
> > clear-cut,
>
> As a user, I do not care about "super-features". What I care is that the package
> I want be:
>    - either visible, and selects whatever it requires;
>    - or hidden, and a comment tells me why it is not visible (aka. not
>      available) so I can take action to remedy the situation.
>
> As for the size of the menus, I don't see one or a few packages hidden
> making a big deifference (eg. in the "Networking Applications" sub-menu).
> My opinion, of course! ;-)
  You may be right, but that's an independent issue.
>
> > but it shouldn't be done mechanically.
>
> That's why I said: "Some manual inspection and fixes are still required."
>
> >> 3) - checks and fixes 'select BR2_PACKAGE_XXX' that does not have a
> >>        corresponding 'depends on BR2_PACKAGE_XXX_AVAILABLE'
> >
> >    What is missing as a fourth step is the removal of the dependencies which are
> > actually due to transitive dependencies. They can be detected because normally
> > we write
> > depends on BR2_USE_WCHAR # glib2
> > in such a situation.
>
> What about this situation (first package by alphabetical order!):
>
>      config BR2_PACKAGE_ACL
>          bool "acl"
>          select BR2_PACKAGE_ATTR
>          depends on BR2_LARGEFILE
>
>      config BR2_PACKAGE_ATTR
>          bool "attr"
>          depends on BR2_LARGEFILE
>
> Does acl really require LARGEFILE for itself, or because it requires attr
> which itself requires LARGEFILE?
  There you can't say off-hand, so either you check it manually or leave the redundant
dependency.  However, in the cases where there is a comment, it can be removed.
>
> So, transitive dependencies are not systematically identified, so they are
> not easy to automatically remove in a fourth step, as you suggest.
>
> Yes, for those that *are* identified, I was already planning this fourth
> step, but, hey, human beings have a lot of physical requirements: food,
> drink, sleep, and so on! Hehe! ;-)
>
> > But again, I wouldn't do this mechanically. There are only
> > 85 of these comments, and you have the "depends on ..._AVAILABLE" below
> > to verify if the transitive dependency exists.
  As I said, because there are only 85 of the easy ones, and replacing manually
is easy, I'd do it manually.
> >
> >
> >>
> >> NOTE: the coverage of this script is NOT 100%. Some manual inspection
> >> and fixes are still required.
> >>
> >> Pass 1 treats all 817 packages. After a quick glance, all appears OK,
> >> but a more thorough analysis must be conducted.
> >
> >    The script looks correct to me - not much can go wrong here.
>
> Believe me, things *can* go wrong! I had a few issues with the first
> iterations of the script, because of weird dendencies (deps on XXX||FOO).
>
> >> Pass 2 finds 67 packages that needs munging. There are a few packages
> >> left over, becasue they ahve constructs like
> >>       depends on PKG_FOO || PKG_BAR
> >
> >    Can be skipped :-)
>
> You mean pass-2, or the weird constructs?
>
> >> Pass 3 finds 401 packages that 'select' packages without a corresponding
> >> 'depends on' on the _AVAILABLE symbol. A casual glance found that pass
> >> to be pretty OK, although a complete analysis has not ben done so far.
> >
> >    I've updated the script with my own feedback; it's attached.
>
> Thank you! I'll have a look tomorrow.
>
> >    Now only 279 packages are munged in the first pass, and only 146 in the third
> > pass.  However, the third pass detects about twenty of packages with inconsistent
> > select/depends (e.g. automake selects microperl, but microperl depends on MMU).
> > These should be fixed first, of course!
>
> Well, that's the whole point of adding the _AVAILABLE stuff...
  Couldn't agree more!
> Or did I miss something?...
>
> Thanks for the review!
>
> Regards,
> Yann E. MORIN.
>

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
