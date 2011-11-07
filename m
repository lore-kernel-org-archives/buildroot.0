From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 7 Nov 2011 10:58:22 +0100
Subject: [Buildroot] Report from the Buildroot Developer Day
In-Reply-To: <20111102160349.4afe5935@skate>
References: <20111102160349.4afe5935@skate>
Message-ID: <CAAXf6LV8pXKtNqU5oey_yikX_7YMLLVJpd9aE9SpyCgiuCC7zw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Nov 2, 2011 at 4:03 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Buildroot Developer Day - ELCE 2011
> ===================================
>
> The Embedded Linux Conference Europe 2011 took place from Wednesday
> October, 26th to Friday October, 28th in Prague. The Buildroot
> developers took that opportunity to organize a one day meeting on
> Saturday October, 29th. The meeting took place in the lobby of the
> Clarion Congress Hotel, where the rest of the conference took place.
>
> The participants were :
>
> ?* Robert Schwebel, maintainer of the PTXdist build system, working at
> ? Pengutronix, Germany
> ?* Yann E. Morin, maintainer of crosstool-NG, from France
> ?* Peter Korsgaard, maintainer of Buildroot, working at Barco, Belgium
> ?* Esben Haabendal, maintainer of the OE-lite build system, working at
> ? Prevas A/S, Denmark
> ?* Brian Murphy, Buildroot user, from Denmark
> ?* Thomas Petazzoni, contributor to Buildroot, working at Free
> ? Electrons, France
>
> During the day we also had the opportunity to discuss with Benjamin
> Zores and Davide Cavalca, respectively maintainer and developer of the
> OpenBricks build system.
>
> This report has been written by Thomas Petazzoni, with reviews and
> comments of Yann E. Morin and Peter Korsgaard. It has been written
> after the developer day based on memory and raw notes and may
> therefore be slightly inaccurate in places.

Also from me, thanks a lot for writing this...

>
> Expanding send-patches.org
> --------------------------
>
> As developers from various build systems were here, the day started
> with a discussion on making the send-patches.org initiative more
> useful. The idea of send-patches.org is to allow the various
> cross-build systems to cooperate on the multiple patches required to
> get various packages to cross-compile properly and to get them merged
> upstream. The project already has a short website and a
> mailing-list. The mailing-list has so far been used to Cc the patches
> that various build systems developers send to upstream projects to fix
> cross-compilation issues, but the activity hasn't been very high.
>
> After some discussion, we decided to create a Git repository at
> send-patches.org on which the interested build system developers could
> store patches that fix cross-compilation issues. The idea is that:
>
> ?* we could more easily share those patches between different build
> ? systems.
>
> ?* we could use when possible identical patchsets on a given package
> ? of a given version.
>
> ?* it enables developers of various build systems to work together in
> ? improving those patches to make them suitable for upstream
> ? inclusion.
>
> ?* having patches sent to upstream projects by a community of 3, 4 or
> ? 5 different build systems projects having similar needs certainly
> ? gives a much higher chance of seeing those patches included.
>
> This Git repository will be organized in a <package>/<version>/
> hierarchy, with patches being stored in the standard Git format. Each
> patch will carry special tags, for example:
>
> ?* a tag indicating which build system currently uses the patch
>
> ?* a tag indicating the upstream status (not ready for upstream, ready
> ? for upstream, submitted at upstream, etc.)
>
> Write access to this Git repository will be given to a few key
> developers of each build system project. Robert Schwebel of
> Pengutronix, who already manages the send-patches.org website and
> mailing-list, will setup this Git repository.
>
> A few days after ELCE and before this report was published, Robert
> created the repo at
> http://git.pengutronix.de/?p=rsc/send-patches-org.git;a=summary (it
> will move to send-patches.org soon). The repo only contains a README
> file describing the process, which is being discussed.
>
> Robert of Pengutronix and Esben of OE-lite both think that they can
> adapt their build system so that it will automatically integrate
> patches from the send-patches.org repository. Yann E. Morin might do
> the same in crosstool-NG. On the Buildroot side, Peter and Thomas
> preferred to not complicate Buildroot with such a mechanism, and
> simply manually copy patches in both directions as needed.
>
> During lunch, Benjamin Zores and Davide Cavalca from Openbricks joined
> the discussion, and were also interested in the project. This would
> already bring 5 build systems into the project: crosstool-NG, PTXdist,
> OpenBricks, OE-lite and Buildroot.
>
> Testing infrastructure
> ----------------------
>
> On Saturday, Robert briefly presented the testing infrastructure that
> they have set up at Pengutronix for PTXdist.
>
> First, they have some compile testing every night :
>
> ?* They build the BSPs of their customers, with a minimal system. The
> ? idea here is mainly to build the bootloader/kernel part.
>
> ?* They build a special configuration that has all their packages
> ? enabled.
>
> In addition to that, they do runtime testing every night, on a farm of
> 16 different boards. Using kermit scripts, they execute various tests
> and benchmarks on their boards.
>
> On the Buildroot side, we want first to focus on build time
> testing. At the moment, Peter continuously run randpackageconfig
> builds on a machine of the gcc farm but with only a single ARM
> internal toolchain configuration, and Thomas sometimes run batches of
> randpackageconfig with a set of ~20 different toolchain
> configurations. Unfortunately, none of the build results are available
> publicly, which doesn't allow the Buildroot community to take part in
> fixing the issues. After a big work on package quality, Peter tests
> now generally work 100% of the time except minor breakages that Peter
> quickly fixes. However, Thomas tests generally have a relatively high
> failure rate, due to their higher coverage of architectures and
> toolchains configuration.
>
> With Peter, we agreed on the following :
>
> ?* Peter will put in place on uclibc.org a shell script executed in
> ? crontab that goes through build results (composed of: bzip2
> ? compressed complete log file, uncompressed last 100 lines of log
> ? file, a status file indicating whether the build suceeded or not,
> ? the Buildroot configuration, and a text file describing what the
> ? toolchain is) and generates nice HTML pages of those results. Each
> ? build will be identified by a string
> ? "<buildmachine>-<year><month><day><hour><minute>" and the script
> ? will generate seperate HTML pages for each day of results.
>
> ?* Peter and Thomas will both adapt their testing infrastructure so
> ? that their build tests are pushed to the uclibc.org server and
> ? appear on the public page of results.
>
> This is just a very rough description, the fine details will be sorted
> out when things will be put in place.
>
> Package management
> ------------------
>
> On the feature that is often discussed on the Buildroot list, and
> which was on the agenda for this meeting was the general topic of
> "package management". To summarize, the idea would be to add some
> tracking of which Buildroot package installs what files, with the
> goals of :
>
> ?* Being able to remove files installed by a package when this package
> ? gets unselected from the menuconfig ;
>
> ?* Ultimately, be able to generate binary packages (ipk or other
> ? format) that can be installed on the target without re-generating a
> ? new root filesystem image.
>
> In general, most people think it is easy to do: just track which
> package installed what and remove it when the package is
> unselected. However, it is much more complicated than that:
>
> ?* It is not only about the target/ directory, but also the sysroot in
> ? host/usr/<tuple>/sysroot and the host directory itself. All files
> ? installed in those directories by various packages must be tracked.
>
> ?* When a package is removed, it is not sufficient to remove just the
> ? files it installed. One must also remove all its reverse
> ? dependencies (i.e packages relying on it) and rebuild all those
> ? packages. For example, package A depends optionally on the OpenSSL
> ? library. Both are selected, and Buildroot is built. Package A is
> ? built with crypto support using OpenSSL. Later on, OpenSSL gets
> ? unselected from the configuration, but package A remains (since
> ? OpenSSL is an optional dependency, this is possible). If you just
> ? remove the OpenSSL files, then the files installed by package A are
> ? broken: they use a library that is no longer present on the
> ? target. Technically, it is possible to do this (the prototype that
> ? Lionel Landwerlin and Thomas Petazzoni have worked on started to do
> ? this), but it is difficult and adds a fair bit of complexity.
>
> ?* In addition to the previous problem, there is the case where the
> ? optional dependency is not even known to Buildroot. For example,
> ? package A in version 1.0 never used OpenSSL, but in version 2.0 it
> ? automatically uses OpenSSL if available. If the Buildroot .mk file
> ? hasn't been updated to take this into account, then package A will
> ? not be part of the reverse dependencies of OpenSSL and will not be
> ? removed and rebuilt when OpenSSL is removed. For sure, the .mk file
> ? of package A should be fixed to mention this optional dependency,
> ? but in the mean time, you can have non-reproducible behaviors.
>
> ?* The whole idea is also to allow changes in the menuconfig to be
> ? applied on the output directory without having to rebuild
> ? everything from scratch. However, this is very difficult to achieve
> ? in a reliable way: what happens when the suboptions of a package
> ? are changed (we would have to detect this, and rebuild the package
> ? from scratch and potentially all its reverse dependencies), what
> ? happens if toolchain options are changed, etc. At the moment, what
> ? Buildroot does is clear and simple so its behaviour is very
> ? reliable and it is easy to support users. If we start telling users
> ? that the configuration changes done in menuconfig are applied after
> ? the next make, then it has to work correctly and properly in all
> ? situations, and not have some bizarre corner cases. We fear bug
> ? reports like "I have enabled package A, B and C, then ran make,
> ? then disabled package C and enabled package D and ran make, then
> ? re-enabled package C and enabled package E and then there is a
> ? build failure". Or worse "I did some configuration, then built,
> ? then did some changes, built, some more changes, built, some more
> ? changes, built, and now it fails, but I don't remember all the
> ? changes I did and in which order". This will be impossible to
> ? support.
>
> For all these reasons, the conclusion of the Buildroot Developer Day
> was that adding tracking of installed files to remove them when the
> package is unselected is something that is very hard to achieve
> reliably and will add a lot of complexity.
>
> In the morning, we had some discussion with Robert Schwebel about how
> PTXdist does package management. They only do it for files installed
> in the target filesystem. So for example the libraries/headers are
> never removed from their sysroot, so you quickly end up with
> inconsistencies. This is something we would like to avoid in
> Buildroot, because it creates confusing behaviors in our
> opinion. Esben from OE-lite also said that package management is very
> difficult to do reliably and that it would add a lot of complexity to
> a currently relatively simple Buildroot.
>
> Buildroot focus is on simplicity and building relatively small
> systems, and this is definitely something we want to preserve. Moving
> away from this principle would make Buildroot more similar to existing
> more complicated build systems and therefore less interesting.
>
> For the time being, we'd prefer not to add such mechanisms in
> Buildroot and keep its behavior as simple and easy to understand as it
> is today. We think it's better to focus on other features than trying
> to implement something that will never be completely reliable and will
> add a very significant complexity to Buildroot.
>
> Toolchain backend
> -----------------
>
> The default toolchain build mechanism in Buildroot is the internal
> code to build it. However, since crosstool-NG has been created, the
> Buildroot developers wanted to use it instead of the internal build
> mechanism, in order to factorize the effort of toolchain build
> technology at the level of the crosstool-NG project.
>
> Yann E. Morin has added and maintains regularly the crosstool-NG
> backend in Buildroot, which has now been around for a while.
>
> We have therefore decided to make the crosstool-NG backend the default
> toolchain build mechanism in 2012.02. This will be notified in the
> 2011.11 release. For the moment, the internal build mechanism will
> remain available.

One thing I really like about the internal build mechanism is that
it's internal. If you want to modify something about it, you can
directly patch the code and submit to the list. This not only holds
for the generation of the toolchain, but also for side-aspects like
downloading the necessary tarballs and patching. Since crosstool-ng is
treated as a package (at least currently it is), any change you want
to make to it, has to be done by adding a patchfile to
package/crosstool-ng/. This is much more cumbersome than modifying
buildroot files.
For example, I added scp support to buildroot some time ago, and use
it for the primary download site. When switching to crosstool-ng, this
no longer worked, I had to add scp support again.

I think it would be beneficial to buildroot if the integration of
crosstool-ng could increase. For example, crosstool-ng using the
download mechanisms of buildroot.

>
> Yann E. Morin also later noted that not all architectures supported by
> Buildroot are supported by crosstool-NG. This will have to be sorted
> out (propose a different default toolchain backend depending on the
> architecture, or better, port other architectures support to
> crosstool-NG).
>
> Migration to the asciidoc format
> --------------------------------
>
> The day before the conference, Peter merged the new asciidoc
> documentation, which validates the migration to this documentation
> format.
>
> However, there are currently some build issues of the documentation on
> the uclibc.org and Peter will work with OSOUL people to get this
> fixed. Once this is done, Peter will write the script that generates
> automatically the documentation when the Git repository is updated and
> the HTML version will be removed.
>
> The asciidoc version will therefore be the official documentation in
> 2011.11, and patches to upgrade the documentation in this format are
> welcome.
>
> Finally, Peter will move the website stuff from the docs/ directory to
> the docs/website/ directory, to be consistent with the new location of
> the documentation in docs/manual/.
>
> Out-of-tree build of packages
> -----------------------------
>
> Another topic discussed was whether we should build packages
> out-of-tree instead of in-tree. Currently, the package sources are
> uncompressed directly in the directory in which they are built. This
> means that when a package is built once for the host and once for the
> target, its source code is uncompressed twice. Moreover, the fact that
> the packages are built in-tree means that packages with overriden
> source directory (the new <pkg>_OVERRIDE_SRCDIR) or local packages
> (with the new <pkg>_SITE_METHOD = local) need to be rsync'ed into
> their build directory. This is particular annoying because:
>
> ?* One of the package for which the override srcdir mechanism is the
> ? most useful is the Linux kernel, and it's a huge package in terms
> ? of source code size, so rsync'ing it is heavy. This is also
> ? especially annoying since Linux perfectly supports out-of-tree
> ? build.
>
> ?* Currently source-overriden and local packages are handled in a kind
> ? of special way. Separating the source directory from the build
> ? directory for all packages would make those source-overriden and
> ? local packages feature a lot more integrated.
>
> The packages source code could for example be extracted in
> $(O)/sources/<pkg>-<version>/, and the build could place at the same
> location as today, in $(O)/build/(host-)<pkg>-<version/.
>
> While out-of-tree build should work fine for autotools-based packages,
> for cmake-based packages and for packages such as Linux, U-Boot or
> Barebox, most GENTARGETS-based packages probably don't support
> out-of-tree build. Therefore, for those packages, we'd have two
> solutions :
>
> ?* Extract their source code in the $(O)/sources/<pkg>-<version>/ and
> ? then rsync it/extract it as needed in
> ? $(O)/build/(host-)<pkg>-<version/. This has the drawback of
> ? requiring another copy of the package source code.
>
> ?* Do not extract them in $(O)/sources/<pkg>-<version>/ at all, and
> ? only extract them directly to the build directory. This has the
> ? drawback of breaking the homogeneity in how packages are handled.
>
> A new variable <pkg>_SUPPORTS_OUTOFTREE would be added to package,
> defaulting to NO for GENTARGETS packages and to YES for AUTOTARGETS
> and CMAKETARGETS package. This way, on a per-package basis, it is
> possible to say whether a package supports out-of-tree build or not.
>
> For the record, we currently have 587 packages using the autotargets
> infrastructure, 110 packages using the gentargets infrastructure and 5
> packages using the cmaketargets infrastructure. Amongst the gentargets
> packages, several of them do support out-of-tree build (Linux kernel,
> Barebox, U-Boot, Busybox, Qt, etc.) and many of them have a very small
> source code base, for which an additional copy wouldn't be too costly.
>
> Peter was also worried about packages for which we apply patches only
> for the target or only for the host versions, which wouldn't work with
> an out-of-tree build process with which the source code base is shared
> between the target build and the host build. However, as of today,
> there is only a single package in this situation, libgtk2 with a patch
> applied for the host variant only. The patch has been written by
> Thomas Petazzoni, who said that it would definitely be possible to
> improve the patch so that it can be applied for both the host and
> target cases.
>
> Through our discussion, we haven't been able to reach a final decision
> on this. Therefore, we decided to give a try and see what it means in
> terms of package infrastructure modifications, in terms of number of
> packages that don't support out-of-tree build.

Great!

>
> Website improvement
> -------------------
>
> The website of Buildroot hasn't changed for a long time except for
> news regarding new releases and the website style looks a bit
> oldish. This doesn't really reflect the vitality of the Buildroot
> project and its user and developer community.
>
> After some discussion, Peter proposed that Thomas creates a test
> Wordpress instance somewhere, with the contents of a Buildroot
> website. Thomas also looks at how to inject the HTML version of the
> asciidoc documentation into the website. This would give us a more
> modern looking website, giving a better image of our project.
>
> Maintainance process
> --------------------
>
> The number of contributions and therefore the number of patches
> proposed on the mailing list has increased recently and some patches
> are only handled after quite some time. There has been complaints
> about this and suggestions of splitting the maintainership. This topic
> was discussed during the developer day.
>
> For the moment, a model with several maintainers in charge of various
> areas of Buildroot didn't seem appropriate to the participants. The
> Buildroot code base is relatively small and fairly hard to split into
> clear areas of authority. Formally assigning each package a given
> maintainer seems too complicated and when those maintainers would send
> their patches to Peter, he would anyway have to review/verify/test the
> patches as he does today. Considering the relativaly small size of the
> project, it sounds better not to assign formal maintainers. It is
> however important to remember that the more correct contributions a
> developer makes, the higher the trust of Peter in this developer
> increases, which reduces the need for Peter to do very careful
> checking and testing of the proposed patches. Therefore, even though
> there are no maintainers per-area, the most active developers being
> trusted will see their patches more easily merged.
>
> Generally speaking, Peter is relatively quick at merging
> package-related patches. In contrary, the patches touching the core
> infrastructure take more time to get merged, but this can also be seen
> as a feature: the core infrastructure coherency and stability is very
> important, and it is therefore good to take enough time to review,
> think and test the changes related to the core infrastructure.
>
> We however came up with a set of proposals for the development process
> organization:
>
> ?* We would like to encourage the community to help the maintainer job
> ? by reviewing others patches (making comments, and providing their
> ? Reviewed-by tags when they consider that the patch *looks* good)
> ? and even better by testing other patches (testing the package
> ? bumps, the new packages, etc. and providing their Tested-by
> ? tags). If a given patch has been tested by 1 or 2 developers other
> ? than the patch author, then Peter can trust that testing was done
> ? and merge the patch quickly. This is really the key point on which
> ? the community as a whole can help in making Buildroot move faster.

Could someone clarify the difference between Acked-by and Reviewed-by ?
I looked up the Linux kernel definitions, but this didn't make it
clearer for me. The way
I read these, the Acked-by seemed more appropriate for subsystem
maintainers, while Reviewed-by could be used by any developer. If that
is indeed the main difference, and given that we don't have subsystem
maintainers in buildroot, should we use Acked-by, Reviewed-by, or both
interchangeably?

>
> ?* The development process has a 3 months cycle, with 2 months of
> ? development and 1 month of bug-fixing. During the month of
> ? bug-fixing, Peter only accepts bug fix patches and other minor
> ? evolutions. This means that the merge of more invasive patches is
> ? completely stalled during one month and those patches accumulate
> ? and it is difficult for Peter to merge them all when the next
> ? development cycle opens. To solve this, Peter will now maintain a
> ? -next branch during the month of bug-fixing. This way, Peter will
> ? continue to merge the patches non-acceptable during the bug-fixing
> ? period, and all those patches would be merged into the master
> ? branch as soon as the next development cycle starts.

Ok, I like this idea.

>
> ?* Peter will investigate the installation of patchwork. The patchwork
> ? solution was preferred over Gerrit since patchwork works completely
> ? over the mailing list, which avoids the split between comments made
> ? on patches through a Web interface and comments made through the
> ? mailing list. patchwork simply helps at tracking which patches
> ? remain to be merged and what is the latest version of those
> ? patches. We considered using a pre-installed version of patchwork
> ? at patchwork.ozlabs.org, but this would have prevented us from
> ? connecting the Git repository to patchwork in order to have the
> ? patches merged in Git automatically marked as such in patchwork.

Although I haven't worked with patchwork before, I'm positive towards the idea.

>
> We hope that those three proposals will help making the process nicer
> for everyone.
>
> Host packages visible in menuconfig
> -----------------------------------
>
> Peter is fine with the proposal that has been discussed on the mailing
> list to make some host packages appear in menuconfig. The proposal
> should therefore be merged.
>
> Peter is also fine with the related proposal of Arnout to
> automatically derive dependencies of host packages from the
> dependencies of target packages. It needs to be reviewed, but the
> general principle has been accepted.
>
> Per-package device files handling
> ---------------------------------
>
> Maxime Ripard's proposal on adding a new makefile variable to define
> special permissions for certain files or add devices to the root
> filesystem has been discussed. The general principle has been agreed,
> but a few changes might be needed:
>
> ?* The <pkg>_FILES name is too generic and might make people think
> ? that all files must be listed. A better name needs to be
> ? found. Maybe <pkg>_PERMISSION_TABLE and <pkg>_DEVICE_TABLE. Having
> ? two separate variables allows to not create the devices when a
> ? dynamic /dev management is used.
>
> ?* We thought about putting the contents of this variable in a
> ? separate file in the package directory, but that would have
> ? prevented from doing conditional addition of permissions/devices
> ? depending on the package configuration.
>
> ?* We thought about using some helper macros like $(call
> ? fileperm,/bin/busybox,4755,0,0) to clarify the syntax, but we're
> ? not sure it will really clarify things.
>
> We'll have to review and comment Maxime's patches on those points.
>
> Relocatable toolchain
> ---------------------
>
> A complaint that was raised about the fact that the toolchains
> generated by Buildroot are non-relocatable. Generally speaking, the
> discussion during the developer day was centered around the fact that
> we want our complete SDK (the host/ directory) to be relocatable. We
> listed the different things needed to do so:
>
> ?* Make sure that all binaries and libraries built for the host are
> ? built with a rpath pointing to host/usr/lib. Normally, this should
> ? already be the case, but it's worth checking.
>
> ?* Change the rpath value to $ORIGIN/../lib instead of the current
> ? absolute path $(O)/host/usr/lib.
>
> ?* Modify the compiler wrapper program of external toolchains so that
> ? instead of using a fixed location for the compiler tools, it
> ? deduces their location in a relative manner from its current
> ? location.
>
> ?* Modify/patch pkg-config so that instead of having a fixed location
> ? for the PKG_CONFIG_PATH and PKG_CONFIG_SYSROOT_DIR, those are
> ? deduced from the location of the pkg-config binary. This will allow
> ? a pkg-config binary that has been moved to still operate properly,
> ? without having to set any environment variable.
>
> ?* Write a shell script, installed in host/usr/bin, which would mungle
> ? the libtool .la files, the qmake.conf file and the CMake toolchain
> ? file to set the correct path. This script reads a file (can be
> ? host/usr/share/buildroot/location) which contains the original
> ? location of the SDK. This allows the script to do the right
> ? modifications on all the libtool, qmake.conf and cmake files. Once
> ? this is done, the script changes the
> ? host/usr/share/buildroot/location file so that it contains the new
> ? location.
>
> ?* Modify the external toolchain wrapper so that it bails out and
> ? warns the user if the directory it is executed in doesn't match the
> ? location of host/usr/share/buildroot/location. We haven't discussed
> ? how this could work with internal and crosstool-NG toolchains,
> ? though.
>
> ?* Not strictly related, but the CMake toolchain file should be moved
> ? somewhere into host/ to be part of the SDK, maybe
> ? host/usr/share/cmake or host/usr/share/buildroot.
>
> ?* Not strictly related, but adding a br-configure script in
> ? host/usr/bin would be nice. This script would be a helper for
> ? people willing to use the Buildroot SDK to build external
> ? autotools-based packages. They would run
> ? ...BUILDROOTSDK/usr/bin/br-configure --enable-foo --disable-bar,
> ? and the br-configure script would call the ./configure script in
> ? the current directory passing all the right options (--host, and
> ? all environment variables CC, LD, AS, AR and such).
>
> The whole idea of SDK would only work for toolchains installed in
> HOST_DIR (external toolchains downloaded and extracted by Buildroot,
> internal and crosstool-ng toolchains), and not for pre-installed
> external toolchains since those are outside HOST_DIR.
>
> We haven't defined who would be responsible for doing all these tasks,
> so contributions are welcome.
>
> Licensing report generation
> ---------------------------
>
> On the list of topics was also the feature of automatic licensing
> report generation. The idea is that since Buildroot builds embedded
> Linux systems, it should help in complying with the licensing of the
> various components integrated in the system. From the discussion at
> the Buildroot Developer Day, this is definitely a feature we'd like to
> have.

I agree.

>
> It is clear that some licensing metadata information is required for
> each package, probably in the .mk file or as additional file(s) in the
> package directory. Yann E. Morin warned on the fact that some packages
> have complicated licensing (like different licenses depending on which
> configuration options are choosen).
>
> It is also not clear yet what the output of this report should be. On
> one side, Thomas Petazzoni proposed that it generates an HTML document
> inside a directory with all the tarballs and all the patches for the
> different components. On the other side, Peter Korsgaard proposed that
> a report be generated, but only with a list of tarballs, leaving the
> user the work of putting the tarballs together. For Peter, there is no
> need to worry about the patches, since releasing Buildroot as a whole
> is sufficient to provide all the patches. Thomas, however, wasn't sure
> if releasing the Buildroot environment itself was acceptable for all
> Buildroot users as the Buildroot configuration gives quite some
> details on the system configuration. This remains to be discussed.
>
> Thomas precised that one of his current customer is interested by
> having this feature implemented, so he might have in the near future
> some paid time to work on this. However, this doesn't prevent the
> community to start defining how it should work.

I think the output of such a feature should also include a tarball of
the buildroot sources themselves, because the buildroot environment
used for certain projects do not necessarily correspond to a stable
buildroot release: project-specific modifications may have been made
and have to be distributed as well.

Regarding the discussion about passing along .config or not: in my
view, the philosophy of the GPL is very clear, and it requires the
.config to be present. You have to make sure that the person you
distribute your open-source-based product to, receives the sources and
scripts that allow to recreate the product, possibly with
modifications by that person. If you do not give the .config file,
that person would not realistically be able to recreate it.
It's the same if I would create a GPL shell script, but with tons of
variables to hide certain aspects, and I wouldn't need to pass along
the values of these variables because they would be part of the
environment.

>
> Next Buildroot Developer Day
> ============================
>
> The next Buildroot Developer Day will take place on Friday, 3rd
> February 2012 in Brussels, Belgium. The FOSDEM conference
> <http://www.fosdem.org> will take place in Brusells on Saturday and
> Sunday. All Buildroot developers and users are invited to join. The
> exact location will be given later, but it will be a location in
> Brussels center, accessible by metro.

Great, I hope to be able to join this time.

Best regards,
Thomas
