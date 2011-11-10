From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 10 Nov 2011 20:32:02 +0100
Subject: [Buildroot] [PATCH 5 of 5 RFC] dirs and dependencies should be
 executed before every package
In-Reply-To: <patchbomb.1320911665@devws108>
References: <patchbomb.1320911665@devws108>
Message-ID: <229371fcaeaf9f44e4e4.1320911670@devws108>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch attempts to solve two problems:
1. download directory not created before downloading
If the first download is handled by wget, then the download directory will be
created by wget itself and all is fine. However, if the first download is
handled by another tool, e.g. git/bzr/hg/scp etc., then there is no automatic
creation of this directory.

In most cases, you just execute 'make', and the 'dirs' target will be executed
automatically. But, if you give an explicit target the first time, e.g. 'make
ctng-menuconfig', there is no direct dependency to 'dirs'

A similar problem was detected and fixed earlier: see
'source' target should depend on 'dirs'
http://git.buildroot.net/buildroot/commit/?id=4eb982cf90f16927442f4e7692ce51dd5d21f37b
In that case, the fix was made specifically for the 'source' target, but in
fact the problem is generic.

2. dirs not created and dependencies not met before packages are built
The second problem is new. If there are dependencies that are needed to build
packages, e.g. a dependency to host-tar, then these should be executed before
trying to build any other package. Moreover, the build directory etc. should
also be made before building any package. This is not always the case.

For example, ctng-menuconfig depends on 'host-gawk'. If you run
ctng-menuconfig directly, host-gawk will be built first, but the general
'dirs' and 'dependencies' targets will be skipped! This is problematic in the
mentioned 'tar' case.
The same would occur if you explicitly execute 'make foo' as first command.


To solve both problems, this patch changes the gentargets 'foo-source' target
to explicitly depend on 'dirs' and 'dependencies'. This way, every package
built with gentargets/autotargets/cmake will be built after dirs and
dependencies.

But, certain problems remain:
* When a dependency package is not using gentargets.
* In some cases, this patch introduces a circular make dependency, because e.g.
  dependencies <-- host-tar
  <any package>  <-- dirs dependencies

Although make gracefully drops this circular dependency when present, it is
not nice to have. Maybe we need to treat the 'tar' case in a special manner. For
example by adding only a dependency to host-tar (and not 'dependencies' in
general) to the extraction step for all packages, except for host-tar itself.
Or, alternatively, we may decide that we won't support direct calls to 'make
ctng-menuconfig' or similar, without the user having called 'make dependencies'
first.

With respect to the downloads problem, we may also want to change it
differently: either let the download step depend on DL_DIR, or have the download
helpers create the download directory first.

Any thoughts are welcome!

[not to be merged in current state]
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/Makefile.package.in |  2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -558,7 +558,7 @@ ifeq ($$($(2)_OVERRIDE_SRCDIR),)
 
 $(1)-depends:		$$($(2)_DEPENDENCIES)
 
-$(1)-source:		$$($(2)_TARGET_SOURCE)
+$(1)-source:		dirs dependencies $$($(2)_TARGET_SOURCE)
 else
 # In the package override case, the sequence of steps
 #  source, by rsyncing
@@ -571,7 +571,7 @@ else
 
 $(1)-rsync:		$$($(2)_TARGET_RSYNC)
 
-$(1)-source:		$$($(2)_TARGET_RSYNC_SOURCE)
+$(1)-source:		dirs dependencies $$($(2)_TARGET_RSYNC_SOURCE)
 endif
 
 $(1)-show-depends:
