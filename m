From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 19 Nov 2018 14:30:09 +0100
Subject: [Buildroot] [PATCH next v4 0/6] Per-package host/target
 directory support
In-Reply-To: <20181114105557.12599-1-thomas.petazzoni@bootlin.com>
References: <20181114105557.12599-1-thomas.petazzoni@bootlin.com>
Message-ID: <58c4e4e6-41a9-496c-59d9-fbfa4de2690e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Thomas,


On 14/11/2018 11:55, Thomas Petazzoni wrote:
> Hello,
> 
> Here is a fourth iteration of the per-package SDK and target directory
> implementation.

 It's very late to be coming with this, and I haven't thought it through, but I
realized something now...

 What we are doing is to create a per-package directory in which all of that
package's dependencies are collected. However, NixOS for example is doing the
reverse: each package gets installed in a separate staging directory, and
dependant packages are built with a long list of -I and -L flags to point to all
the dependencies. Well, to be exact, in many cases it's just PKG_CONFIG_LIBDIR
that needs to be set.

 The big advantage of such an approach is that no rewriting of absolute paths is
needed. It's perfectly fine if there are absolute paths, because we're not going
to change the location of any library or include directory.

 There are a few disadvantages to this approach that I already thought of:

- It doesn't fix the issue with qmake that the installation location is
hardcoded in the qmake configuration - but I guess a solution for that must exist.

- We're not doing exactly the same as NixOS, since NixOS will set --prefix to
the real installation location, while we will use --prefix=/usr and
DESTDIR=$($(PKG)_STAGING_DIR). I'm not sure what the impact is, but I'm pretty
sure it will have an impact. We can't use --prefix because we don't want that
absolute path on the target.

- We still need to combine everything for the SDK.

- Probably others...


 Still, given all the problems that we already found with PPD, it's something to
consider I think.

 Regards,
 Arnout



> 
> If you're interested in testing it, you can find the patch series at:
> 
>   http://git.bootlin.com/users/thomas-petazzoni/buildroot/log/?h=ppsh-v4
> 
> Changes since v4
> ================
> 
>  - Dropped patches that have been merged upstream, mainly the "extract
>    dependency" patches, but also a few other preparation patches.
> 
>  - Dropped the change of the RPATH handling. As discussed during
>    previous Buildroot Developers meeting, it is not a big problem if
>    during the build, the RPATH of a binary points to the library
>    folder of another package per-package folder. Therefore, instead of
>    fixing up RPATH at the end of each package installation, we keep
>    what Buildroot does today: fix them at the very end of the build.
> 
>  - Made the support for per-package folders optional. Indeed, we
>    realized there was no way to make sure it would be perfect from day
>    1. Even if the principle works, there are lots of package-specific
>    details to solve, and solving all of them before merging the base
>    per-package folder support is not reasonable. So for now, an option
>    BR2_PER_PACKAGE_FOLDERS is introduced, which defaults to off. When
>    this option is enabled, the .NOTPARALLEL statement of the main
>    Makefile goes away, which allows to do top-level parallel build.
> 
>  - Addition of a commit that reworks how the top-level directories are
>    created.
> 
>  - Introduction of a prepare-per-package-folder function in
>    pkg-generic.mk to encapsulate the logic to create the per-package
>    folders from the dependencies of a package.
> 
>  - Rebased on top of the latest master.
> 
> Changes since v3
> ================
> 
>  - Dropped patches that have been merged upstream:
>    pkgconf: use relative path to  STAGING_DIR instead of absolute path
>    toolchain: post-pone evaluation of  TOOLCHAIN_EXTERNAL_BIN
> 
>  - For now, removed the most controversial/complicated patches
>    (changing the rpath strategy, and switching to per-package
>    host/target directories). The goal for now is to merge only the
>    preparation patches.
> 
> Changes since v2
> ================
> 
>  - Solved the problem of all DEPENDENCIES_HOST_PREREQ targets:
>    host-ccache, host-tar, host-lzip, host-xz, host-fakedate.
> 
>    To achieve this, introduced <pkg>_EXTRACT_DEPENDENCIES and used
>    that to handle the dependencies on host-tar, host-lzip and host-xz.
> 
>    Used regular dependencies for host-ccache and host-fakedate.
> 
>    See below for more details.
> 
> Changes since v1
> ================
> 
>  - Rebased on the latest Buildroot next branch
> 
>  - The pkg-config changes are reworked according to Arnout's comments:
>    only @STAGING_SUBDIR@ is replaced in pkg-config.in to generate
>    pkg-config, the rest of the logic is internal to the script.
> 
>  - New patch to move the "host skeleton" logic into a proper
>    host-skeleton package.
> 
>  - New patch to have the CMake related files generated as part of the
>    toolchain package.
> 
>  - New patch to add a new "install" step that depends on the different
>    install steps (target, staging, images, host). This is needed to
>    later add some logic that is executed once all install steps of a
>    package have been done.
> 
>  - Fix the approach to solve the RPATH logic: instead of using
>    LD_LIBRARY_PATH, we actually fix with patchelf the RPATH of host
>    binaries right after their installation.
> 
>  - Misc other improvements in the per-package SDK implementation.
> 
> What is this all about ?
> ========================
> 
> See the cover letter of v3 for details:
> http://lists.busybox.net/pipermail/buildroot/2017-December/208384.html
> 
> What remains to be done?
> ========================
> 
> The main problem that remains is fixing packages that don't work well
> with per-package folders. I have already sent a few fixes (such as
> adding missing host-pkgconf dependencies, or fixing the freetype
> package), but I have setup a separate autobuilder instance to test
> this, and it uncovered a number of other problematic packages:
> 
>  - apr-util doesn't build, because some hardcoded paths from the "apr"
>    per-package folders leak into the apr-util build.
> 
>  - Meson packages currently do not build, because pkg-meson.mk doesn't
>    use $$(HOST_DIR) to reference cross-compilation.conf, but more
>    importantly because cross-compilation.conf uses hardcoded paths.
> 
>  - The qt5 stack is entirely broken, because qmake hardcodes the
>    installation path to be $(STAGING_DIR), so all qt5 packages install
>    to the per-package $(STAGING_DIR) of qt5base. I started working on
>    this topic, and will be sending a separate e-mail about this.
> 
> Best regards,
> 
> Thomas
> 
> Thomas Petazzoni (6):
>   Makefile: evaluate CCACHE and HOST{CC,CXX} at time of use
>   support/scripts/check-host-rpath: split condition on two statements
>   Makefile: rework main directory creation logic
>   Makefile: move .NOTPARALLEL statement after including .config file
>   Makefile: define TARGET_DIR_WARNING_FILE relative to TARGET_DIR
>   core: implement per-package SDK and target
> 
>  Config.in                        | 18 ++++++
>  Makefile                         | 94 ++++++++++++++++++++------------
>  fs/common.mk                     |  3 +-
>  package/pkg-generic.mk           | 27 ++++++++-
>  support/scripts/check-host-rpath |  8 ++-
>  5 files changed, 110 insertions(+), 40 deletions(-)
> 
