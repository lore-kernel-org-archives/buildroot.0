From: Norbert Lange <nolange79@gmail.com>
Date: Tue, 26 Mar 2019 18:45:36 +0100
Subject: [Buildroot] [PATCH v2 4/4] package/libfuse: common files from
 libfuse3 are prefered
In-Reply-To: <c4b04ef3-3938-0ad4-4c7a-14ea7d3036e9@mind.be>
References: <20190315133033.5275-1-norbert.lange@andritz.com>
 <20190315133033.5275-5-norbert.lange@andritz.com>
 <d521258a-7802-ef6f-961b-3dc52717bf43@mind.be>
 <CADYdroNPCTNv0uVUNX_h-q8EefuR6ZN8sZgDorBwE-zuARHb1w@mail.gmail.com>
 <c4b04ef3-3938-0ad4-4c7a-14ea7d3036e9@mind.be>
Message-ID: <CADYdroMEDSDjoG388HcMdc8QaOX+CcToCBS9M7H6H0LFr-k-yg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Di., 26. M?rz 2019 um 10:50 Uhr schrieb Arnout Vandecappelle
<arnout@mind.be>:
>
>
>
> On 25/03/2019 22:12, Norbert Lange wrote:
> > Am Mi., 20. M?rz 2019 um 23:55 Uhr schrieb Arnout Vandecappelle
> > <arnout@mind.be>:
> >>
> >>
> >>
> >> On 15/03/2019 14:30, Norbert Lange wrote:
> >>> if both libfuse and libfuse3 are co-installed,
> >>> make sure libfuse3 will be build first and
> >>
> >>  Why does libfuse3 have to be installed first? Are there any files that are
> >> installed by both after this patch? If so, please list them here. But then the
> >> sentence below is not true :-)
> >
> > I consider the common files part of libfuse3, so if you
> > 'make libfuse' it should be ready-to-use.
>
>  You mean when you do 'make libfuse' without selecting libfuse in .config?
> That's a use case we definitely don't support (it works now, but it's not really
> meant to work).

well, I do that sometimes (running make without config'ed package),
but also 'make libfuse-dirclean; make libfuse' is interesting, for example
after updating the package version (full BR rebuild takes ages).

What happens is that staging/target directory might get littered with
multiple versions of files.

>  Your patch makes sure that libfuse and libfuse3 install non-overlapping files,
> so there is no need to add it to _DEPENDENCIES.

well, if both are configured, then libfuse will need files that are
installed from libfuse3
(udev rule, and the helper executable).
if I dirclean libfuse* and run 'make libfuse' I would like those files
to be installed aswell

>
> > The common files are just the udev-rules (which currently are named differently
> [snip]
> >>  However, this patch should also be squashed with the one adding libfuse3. Or,
> >> if you want to separate things a little (possibly a good idea), then originally
> >> libfuse3 should depend on !libfuse, and this patch would lift the dependency again.
> >
> > K, primary though was that the first patch would be faster to accept.
>
>  Well, the libfuse3 patch can't be applied as is because it conflicts with
> libfuse... So to make it faster to accept, the patch adding libfuse3 should make
> it depend on !libfuse.

Think I got that, yes.


>
> [snip]
> >>> -define LIBFUSE_INSTALL_TARGET_CMDS
> >>> -     cp -dpf $(STAGING_DIR)/usr/bin/fusermount $(TARGET_DIR)/usr/bin/
> >>> -     cp -dpf $(STAGING_DIR)/usr/lib/libfuse.so* $(TARGET_DIR)/usr/lib/
> >>> +# From libfuse3 README:
> >>> +# libfuse 3 is designed to be co-installable with libfuse 2. However, some
> >>> +# files will be installed by both libfuse 2 and libfuse 3
> >>> +# (e.g. /etc/fuse.conf, the udev and init scripts, and the mount.fuse(8) manpage).
> >>> +# These files should be taken from libfuse 3. The format/content is guaranteed
> >>> +# to remain backwards compatible with libfuse 2.
> >>> +#
> >>> +# The way we handle this is to let libfuse3 install as usual,
> >>> +# but libfuse has to be carefull to not overwrite any common files.
> >>> +# Also some files are named diferently (udev-rules),
> >>> +# but only the newer is needed.
> >>> +# To ensure this, we install in a temporary directory and
> >>> +# hand-pick the few unique files
> >>> +
> >>> +LIBFUSE_INSTALL_TARGET_OPTS = install DESTDIR=$(@D)/tmpinstall
> >>> +
> >>> +define LIBFUSE_INSTALL_TARGET_POST
> >>> +     cp -dpf $(@D)/tmpinstall/usr/lib/libfuse.so* $(TARGET_DIR)/usr/lib/
> >>> +endef
> >>
> >>  This is way too complicated.
> >
> > But more robust, specifically if you rebuild single packages (I know
> > this is probably not officially supported).
>
>  It is supported, but I don't see how it creates a problem. There could be a
> problem if libfuse3 would call it something that matches libfuse.so*, but it
> doesn't (and it never will).

Aslong we dont install /etc/fuse.conf =)

>
> >>  Since we anyway have custom commands for target install, you can do it like this:
> >>
> >> ifeq ($(BR2_PACKAGE_LIBFUSE3),)
> >> define LIBFUSE_INSTALL_SUPPORT_FILES
> >>         cp -dpf $(STAGING_DIR)/usr/bin/fusermount $(TARGET_DIR)/usr/bin/
> >>         mkdir -p $(TARGET_DIR)/lib/udev/rules.d
> >>         cp $(STAGING_DIR)/lib/udev/rules.d/*-fuse.rules \
> >>                 $(TARGET_DIR)/lib/udev/rules.d
> >> endef
> >> endif
> >>
> >> define LIBFUSE_INSTALL_TARGET_CMDS
> >>         cp -dpf $(STAGING_DIR)/usr/lib/libfuse.so* $(TARGET_DIR)/usr/lib/
> >>         $(LIBFUSE_INSTALL_SUPPORT_FILES)
> >> endef
> >
> > This only shifts the issue to the staging directory. installing both might
> > cause conflicts (like having 99-fuse.rules and 90-fuse-rules) in the future.
>
>  We don't care about staging, in fact I think we would really prefer to have
> everything there in case both packages are installed.

And you have everything there, but the target should not contain duplcate files
(even semantically duplicates like fuse.udev and fuse3.udev).

>
> > Using a temporary dir for atleast one of the packages cleanly goes around any
> > potential issues.
> > Its easier to maintain (especially per-package), if a file is renamed the build
> > will break vs. just causing issues when either both libfuse* packages
> > are installed or not.
>
>  I don't see how this installating in tmpinstall handles that.

if you install into a shared staging directory, your glob patterns
might match more than they should (old versions) and (in general,
unless you make sure this does not happen) packages could override
other packages files

tmpinstall would isolate that (I should make sure to delete the dir
before installation)

>
>
> > (TBH I think a common infrastructure to install in a temp dir would be ideal)
>
>  You do have a point there. I think it even was one of the options we considered
> in our extensive discussion of PPD in Prague back in 2017 [1]. I don't remember
> why we didn't stick to that possibility. Perhaps it was because of all the
> packages with custom staging/target install commands that would need to be
> adapted. But possibly that was before we thought of the trick to rewrite
> STAGING_DIR and TARGET_DIR during the installation steps.

Could start with a whitelist-flag for testing.

>  Maybe indeed this approach would be a good follow-up of PPD, and it would be a
> giant step in the direction of the target-from-staging approach that Yann would
> like to see.

Not sure if target-from-staging aint the opposite of what I mean...

>  That said, for the time being, I'd prefer new stuff to stick to our existing
> approach of copying from staging to target, except for cases where it is really
> difficult to do differently (e.g. the qt5 stuff). And we can use that as a
> learning path to generalise to all packages.
>
>  Regards,
>  Arnout
>
> [1] https://elinux.org/Buildroot:DeveloperDaysELCE2017

Norbert
