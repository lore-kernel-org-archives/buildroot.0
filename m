From: Norbert Lange <nolange79@gmail.com>
Date: Thu, 28 Mar 2019 21:28:56 +0100
Subject: [Buildroot] [PATCH v2 4/4] package/libfuse: common files from
 libfuse3 are prefered
In-Reply-To: <72b3e43e-2150-e959-fba2-58323051bec4@mind.be>
References: <20190315133033.5275-1-norbert.lange@andritz.com>
 <20190315133033.5275-5-norbert.lange@andritz.com>
 <d521258a-7802-ef6f-961b-3dc52717bf43@mind.be>
 <CADYdroNPCTNv0uVUNX_h-q8EefuR6ZN8sZgDorBwE-zuARHb1w@mail.gmail.com>
 <c4b04ef3-3938-0ad4-4c7a-14ea7d3036e9@mind.be>
 <CADYdroMEDSDjoG388HcMdc8QaOX+CcToCBS9M7H6H0LFr-k-yg@mail.gmail.com>
 <72b3e43e-2150-e959-fba2-58323051bec4@mind.be>
Message-ID: <CADYdroPX3P09ya9Qr9YeZ2YjLxyPcCAG89O-dHgZB6Kvqqyt2g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Di., 26. M?rz 2019 um 21:19 Uhr schrieb Arnout Vandecappelle
<arnout@mind.be>:
>
>
>
> On 26/03/2019 18:45, Norbert Lange wrote:
> > Am Di., 26. M?rz 2019 um 10:50 Uhr schrieb Arnout Vandecappelle
> > <arnout@mind.be>:
> >>
> >>
> >>
> >> On 25/03/2019 22:12, Norbert Lange wrote:
> >>> Am Mi., 20. M?rz 2019 um 23:55 Uhr schrieb Arnout Vandecappelle
> >>> <arnout@mind.be>:
> >>>>
> >>>>
> >>>>
> >>>> On 15/03/2019 14:30, Norbert Lange wrote:
> >>>>> if both libfuse and libfuse3 are co-installed,
> >>>>> make sure libfuse3 will be build first and
> >>>>
> >>>>  Why does libfuse3 have to be installed first? Are there any files that are
> >>>> installed by both after this patch? If so, please list them here. But then the
> >>>> sentence below is not true :-)
> >>>
> >>> I consider the common files part of libfuse3, so if you
> >>> 'make libfuse' it should be ready-to-use.
> >>
> >>  You mean when you do 'make libfuse' without selecting libfuse in .config?
> >> That's a use case we definitely don't support (it works now, but it's not really
> >> meant to work).
> >
> > well, I do that sometimes (running make without config'ed package),
>
>  So do I. And it works most of the time. But not always, so it's not "officially
> supported".
>
> > but also 'make libfuse-dirclean; make libfuse' is interesting, for example
> > after updating the package version (full BR rebuild takes ages).
>
>  Yes, but that will not rebuild libfuse3 anyway, so whether or not it's a
> dependency doesn't make a difference.
>
>
> > What happens is that staging/target directory might get littered with
> > multiple versions of files.
>
>  Indeed, if you update the version and there is some file that is no longer
> there, the old file doesn't get removed. Similarly, if you first build with only
> libfuse enabled, then enable libfuse3 and rebuild, the libfuse udev stuff will
> still be there in target. But neither of these issues is affected by making
> libfuse3 a dependency of libfuse.
>
>
> >>  Your patch makes sure that libfuse and libfuse3 install non-overlapping files,
> >> so there is no need to add it to _DEPENDENCIES.
> >
> > well, if both are configured, then libfuse will need files that are
> > installed from libfuse3
> > (udev rule, and the helper executable).
> > if I dirclean libfuse* and run 'make libfuse' I would like those files
> > to be installed aswell
>
>  I see, you have a good point there. However, that classifies under "runtime
> dependency" and traditionally we don't add make dependencies for runtime
> dependencies. There is no clear reason for that. It has one advantage: running
> 'make libfuse' goes a little bit faster because libfuse3 doesn't need to be
> built. It may also break a circular dependency (though I doubt there are many
> instances of that). But neither of these arguments is very strong.
>
>  Still, adding runtime dependencies to _DEPENDENCIES is a change in Buildroot
> philosophy so you can't sneak it in in a random patch :-)

Yes, its not needed for the build. granted, its easy to get that mixed
up expecially
if you dont have a way to specify runtime dependencies.

> [snip]
> >>> But more robust, specifically if you rebuild single packages (I know
> >>> this is probably not officially supported).
> >>
> >>  It is supported, but I don't see how it creates a problem. There could be a
> >> problem if libfuse3 would call it something that matches libfuse.so*, but it
> >> doesn't (and it never will).
> >
> > Aslong we dont install /etc/fuse.conf =)
>
>  Indeed. But then, IIUC, the fuse.conf of libfuse3 should be used. So libfuse3
> should depend on libfuse, no? That was actually my original thought when I saw
> this dependency on libfuse3, but then I found that it was in fact entirely
> redundant.

err. why would libfuse3 depend on libfuse, so that the files get overwritten
in the right order? To me the latter is a (crude) implementation detail.

>
>
> >>>>  Since we anyway have custom commands for target install, you can do it like this:
> >>>>
> >>>> ifeq ($(BR2_PACKAGE_LIBFUSE3),)
> >>>> define LIBFUSE_INSTALL_SUPPORT_FILES
> >>>>         cp -dpf $(STAGING_DIR)/usr/bin/fusermount $(TARGET_DIR)/usr/bin/
> >>>>         mkdir -p $(TARGET_DIR)/lib/udev/rules.d
> >>>>         cp $(STAGING_DIR)/lib/udev/rules.d/*-fuse.rules \
> >>>>                 $(TARGET_DIR)/lib/udev/rules.d
> >>>> endef
> >>>> endif
> >>>>
> >>>> define LIBFUSE_INSTALL_TARGET_CMDS
> >>>>         cp -dpf $(STAGING_DIR)/usr/lib/libfuse.so* $(TARGET_DIR)/usr/lib/
> >>>>         $(LIBFUSE_INSTALL_SUPPORT_FILES)
> >>>> endef
> >>>
> >>> This only shifts the issue to the staging directory. installing both might
> >>> cause conflicts (like having 99-fuse.rules and 90-fuse-rules) in the future.
> >>
> >>  We don't care about staging, in fact I think we would really prefer to have
> >> everything there in case both packages are installed.
> >
> > And you have everything there, but the target should not contain duplcate files
> > (even semantically duplicates like fuse.udev and fuse3.udev).
>
>  Target, yes - but that is covered by my proposal as well. Staging, not so much.
> I wouldn't mind having both fuse.udev and fuse3.udev in staging.

Me neither.

>
>
> >>> Using a temporary dir for atleast one of the packages cleanly goes around any
> >>> potential issues.
> >>> Its easier to maintain (especially per-package), if a file is renamed the build
> >>> will break vs. just causing issues when either both libfuse* packages
> >>> are installed or not.
> >>
> >>  I don't see how this installating in tmpinstall handles that.
> >
> > if you install into a shared staging directory, your glob patterns
> > might match more than they should (old versions) and (in general,
> > unless you make sure this does not happen) packages could override
> > other packages files
> >
> > tmpinstall would isolate that
>
>  Indeed. Which is in fact another argument why this kind of tmpinstall may be a
> good idea in general. (The fact that all package managers I know do this might
> be a hint :-).
>
> > (I should make sure to delete the dir
> > before installation)
>
>  That doesn't make any difference: whatever is in the tmpinstall has already
> been copied to staging/target in the previous run, so if you remove tmpinstall,
> it's still there in staging/target.

Recreating the target installation cleanly would require that, that
this is not possible
for other reasons so far is another thing.

> >>> (TBH I think a common infrastructure to install in a temp dir would be ideal)
> >>
> >>  You do have a point there. I think it even was one of the options we considered
> >> in our extensive discussion of PPD in Prague back in 2017 [1]. I don't remember
> >> why we didn't stick to that possibility. Perhaps it was because of all the
> >> packages with custom staging/target install commands that would need to be
> >> adapted. But possibly that was before we thought of the trick to rewrite
> >> STAGING_DIR and TARGET_DIR during the installation steps.
> >
> > Could start with a whitelist-flag for testing.
>
>  Or with just a few packages. libfuse, perhaps :-)

The idea I have in mind would need some touching of files
outside the package. But yeah, same difference.

> >>  Maybe indeed this approach would be a good follow-up of PPD, and it would be a
> >> giant step in the direction of the target-from-staging approach that Yann would
> >> like to see.
> >
> > Not sure if target-from-staging aint the opposite of what I mean...
>
>  The target-from-staging concept is neatly served by doing
> install-into-tmpinstall and then rsync-tmpinstall-to-staging and
> selective-rsync-tmpinstall-to-target. The key idea of target-from-staging is
> that everything in target is also in staging (which is not currently the case),
> with ancillary that package install should be done only once instead of twice.
>
>
> >>  That said, for the time being, I'd prefer new stuff to stick to our existing
> >> approach of copying from staging to target, except for cases where it is really
> >> difficult to do differently (e.g. the qt5 stuff). And we can use that as a
> >> learning path to generalise to all packages.
>
>  So that's what I said this morning, but now I'm not so sure :-)
>
>  If we have two fronts that would like to use the tmpinstall concept, then maybe
> we should do it in both at the same time, to maximize our learning. And since
> this would be a kind of prototype of the eventual tmpinstall for all packages,
> we don't need to bikeshed too much on the exact details (tmpinstall?
> tmp-target-install? In $($(PKG)_BUILDDIR) or in $(BUILDDIR)/tmpinstall/$(pkg)? etc.)

You are giving me just more ideas.
What if after building you end up with those
$(BUILDDIR)/tmpinstall/$(pkg) directories,
be free to delete all space gobbling  $($(PKG)_BUILDDIR) dirs, and be
able to reinstall target
or even staging purely from these "deployment packages"...

if you are familiar with debhelper (with multiple binary packages resulting),
the install step installs into debian/tmp then uses textfile to define
what-goes-where.
You could drop some files in the package directory, like an
{target,staging}.install file,
having relative paths/globs to mark the stuff that should be
installed [1].  Or the same stuff for links [2].

The upside here is, you could copy those files into/nextto the
"deployment packages",
so those could be complete and self-sufficient for later Installation.
(of course there might be always outliers that are too complex...)

[1] https://manpages.debian.org/testing/debhelper/dh_install.1.en.html
[2] https://manpages.debian.org/testing/debhelper/dh_link.1.en.html

>  So, if you stick with the tmpinstall approach, I'm not going to oppose it any more.

Id like to finish the package (after addressing the open points),
then I may try to brew up something.

Norbert

PS. I glanced at the qt thread (quite hard to keep track of the
discussion entering in the middle),
but it seems that is completely orthogonal and more about hacking into
the qmake environment,
not a post-processing step.
