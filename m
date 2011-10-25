From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 25 Oct 2011 10:26:09 +0200
Subject: [Buildroot] Some topics for the Buildroot Developer Day
In-Reply-To: <20111024173815.2277c6dd@skate>
References: <20111024173815.2277c6dd@skate>
Message-ID: <CAAXf6LU9SgGqKmY1m-cnscymyharBCMomt2F_O4_=fi7SRH2Nw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, Oct 24, 2011 at 5:38 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> As discussed on IRC, I am posting below a list of topics that might be
> discussed during the developer day. Note that this is just _my_ list of
> topics, note the one of the Buildroot project as a whole. Moreover,
> it's very likely that not all topics will be covered during our meeting
> day. However, feel free to add your opinion and/or your additional
> topics, especially if you can't make it to the Developer day.

First of all, thanks for posting this list.
I will not be able to attend ELCE/BDD, so all I can do is give my
preliminary input below...

[..]

> ELCE 2011 meeting agenda
> ========================
>
> ?* Migration to the Ascii-doc format, what remains to be done ?
> ? Infrastructure on the web server side ?

Ack

>
> ?* Extract sources in a new output/sources/ directory, and do
> ? out-of-tree build of packages.
>
> ? Pros:
>
> ? ?- Allows more natural integration with the override source
> ? ? ?directory mechanism. No rsync needed here, especially useful for
> ? ? ?big packages such as the kernel.
>
> ? ?- Allows to extract only once the source code for utitilies built
> ? ? ?for the host and the target (X.org components, Glib/Gtk stack,
> ? ? ?etc.)
>
> ? ?- Should work fine for all CMake-based and autotools-based packages.
>
> ? Cons:
>
> ? ?- Not all packages support out-of-tree build. The infrastructure
> ? ? ?should support a <pkg>_OUTOFTREE boolean, defaulting to NO for
> ? ? ?all packages, overriden to YES for autotools-based and
> ? ? ?CMake-based packages. When set to NO, the infrastructure will
> ? ? ?have to copy/rsync the source code to the build directory. This
> ? ? ?adds an additional copy of the source code for packages that
> ? ? ?don't support out-of-tree build.

I would be in favor of out-of-tree building. We had a discussion on
this some time ago in the thread "[PATCH 05/12] package: implement a
'local' site method". At that time, it was still considered too
difficult to get right.

>
> ?* Website improvement. The website is ugly, never changes, not
> ? representative of the vivacity of the community. At least improve
> ? the design. Wiki ? Blog ?

I agree that the website doesn't look very modern, and I would
certainly not be opposed to changing it.
But, I do feel this is a of a lesser priority with respect to some
other items on the list. So, please don't spend half of Buildroot
Developer Day on creating a website layout ;-)

>
> ?* Maintainance/patch review/merge. How to spread the load ? Should we
> ? move to a model with trusted maintainers for specific parts of
> ? Buildroot ? Usage of patchwork/Gerrit ?

In my opinion, the buildroot development model is an important item to discuss.

Peter has indicated that he currently has little time to spend on
Buildroot, and understandably so: this is a community project and we
cannot expect anyone to take this as a full-time task.
Nevertheless, we should think about ways to improve the way
contributions are handled: patches that are reviewed should make it to
master faster, and we should certainly avoid reviewed patches not
being taken in at all.
Tools like patchwork may help the maintainer in getting an overview of
patches and their statuses, but are not necessarily solving a problem
if all Peter is lacking is time, and he *does* have a good overview of
what remains to be done. This is something that Peter can assess
better than us.
Having co-maintainership for Buildroot, or partial-maintainership on
specific parts could indeed be a solution, but only works if there is
a good understanding between these people and the way the project
should evolve.

Regarding the stable releases: I think it would be good to announce
which date we are shooting for, until when last 'new features' and
until when bugfixes will be accepted. For example, all I know about
the next release is that it's due in November, but there are 30 days
in that month and we're close to the 1st.

Another item regarding the development model is the usage of mailing
list versus bug tracker. Although most people use the mailing list to
send patches or report issues, occasionally people file bug reports as
well (with or without patch). What is the intended split? When should
something become a reported bug, and when is it just posted to the
list?
Also, we should attempt to bring down the number of open bugs
(currently: 66 open bugs). I had the impression that there was some
crash action a short while ago closing or at least querying certain
bugs. We should do that more regularly.
Certainly, bugs that have patches attached to them, should either be
closed and the patch applied to master, or rejected.

Note that closing bugs can be a joint effort, but I'd prefer to have
some directions first: what to do with old bugs that can not be
reproduced. The poster may not be interested anymore and not respond.

>
> ?* Host packages visible in menuconfig. Discussion has taken place on
> ? the list, consensus reached between several contributors,
> ? implementation proposed. What do we do ?
>
> ? + proposal of Arnout to derive host dependencies from target
> ? ? dependencies.

Ack.

>
> ?* Per-package device files handling, proposed by Maxime Ripard.

Ack.

>
> ?* Testing infrastructure. Possible to put build results on the Web
> ? server ? Common format for them ?

At work we're using Jenkins. I haven't worked with buildbot.
I feel that re-using such a system is the way to go.
As others indicated, we'll need to define the configurations that'll
be built, and which build server(s) will be used.

>
> ?* Tracking of files installed by packages. Do we care ? Is this an
> ? important feature of Buildroot ? Won't the added complexity make
> ? Buildroot more complicated to understand ?
>
> ? Which solution ? Two solutions:
>
> ? ?- Change the installation steps of packages so that each package
> ? ? ?installs in a different directory.
>
> ? ? ?Pros:
>
> ? ? ? ?seems to be the cleanest solution.
>
> ? ? ? ?allows to easily detect packages overriding files installed by
> ? ? ? ?other packages.
>
> ? ? ?Cons:
>
> ? ? ? ?requires modifications of all gentargets packages to use
> ? ? ? ?$$(STAGING_DIR) and $$(TARGET_DIR) instead of $(STAGING_DIR)
> ? ? ? ?and $(TARGET_DIR).
>
> ? ? ? ?strange handling of host packages. DESTDIR isn't used, the
> ? ? ? ?prefix is the absolute path to HOST_DIR.
>
> ? ?- Keep installing package files in their normal directory, but
> ? ? ?detect new files and modified files.
>
> ? ? ?Pros:
>
> ? ? ? ?no need to change anything in the current package installation
> ? ? ? ?procedures.
>
> ? ? ?Cons:
>
> ? ? ? ?need to scan the TARGET_DIR, STAGING_DIR and HOST_DIR after
> ? ? ? ?every package installation.
>
> ? ? ? ?hard to detect modified/overwritten files, except by storing
> ? ? ? ?hashes of installed files.

I would like a feature that can list all files owned by a certain
package. It also facilitates to make a breakdown of the rootfs size.
Although I'm not currently using this, being able to upload a 'package
of a package' to the target and install it on the fly can be useful.
For example, you need to debug a certain problem but did not include a
debugger on target. Or you want to add a profiling tool because it
turns out that there is a performance problem in the field.

Gentoo uses a sandbox environment for installing each package. Access
by the installation phase outside of the sandbox is detected and
raises a sandbox violation. I haven't looked into the implementation
of this sandbox, but if we could reuse something like that, detecting
which files were added is very simple.
A sandbox seems like a clean solution as well, that (depending on the
implementation) wouldn't complicate buildroot too much.

>
> ?* Next big directions. What are the next big directions for Buildroot
> ? ? The major features we want to implement ?

This may not be a major feature, but nevertheless it crossed my mind:
I would like to see a document describing the recommended approach to
use buildroot to meet license requirements (such as GPL's) for systems
that have open-source software mixed with proprietary software.
For example, place a copy of all tarballs in the dl directory, copy
all proprietary software to the 'customize' package (even though
during development you use a 'real' buildroot package to build it),
... (or whatever the recommendation is).
We could provide a command that automates certain aspects of this,
e.g. 'make buildroot-tarball'.

Another item: external toolchain support of Buildroot toolchains: the
issue was raised that Buildroot toolchains are not relocatable, which
is problematic if you try using it as an external toolchain. Will we
fix this? Or will we give the recommendation to use crosstool-ng
instead for external toolchains?
What I like about the buildroot toolchains is that its build is
integrated in Buildroot. You don't have to get to know another tool
like crosstool-ng. You don't have to duplicate certain modifications
(like adding scp support for package downloads) in multiple places.


Best regards,
Thomas
