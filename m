From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Mar 2020 17:15:41 +0100
Subject: [Buildroot] [PATCH] core: fix packages-file-list.txt after an
 incremental build
In-Reply-To: <20200214195734.32081-1-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Fri, 14 Feb 2020 20:57:33 +0100")
References: <20200214195734.32081-1-patrickdepinguin@gmail.com>
Message-ID: <87eetwz0wi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > The package instrumentation step 'step_pkg_size' is populating the files:
 >     output/build/packages-file-list.txt
 >     output/build/packages-file-list-staging.txt
 >     output/build/packages-file-list-host.txt
 > by comparing the list of files before and after installation of a package,
 > with some clever tricks to detect changes to existing files etc.

 > As an optimization, instead of gathering this list before and after each
 > package, where the 'after-state' of one package is the same as the
 > 'before-state' of the next package, only the 'after-state' is used and
 > is shared between packages.

 > This works fine, except at the end of the build, as explained next.

 > In the target-finalize step, many files will be touched. For example, files
 > like /etc/hosts, /etc/os-release, but also all object files that are
 > stripped, and all files touched by post-build scripts or created by rootfs
 > overlays. This means that the 'after-state' of the last package does not
 > reflect the actual situation after target-finalize is run.

 > For a single complete build this poses no problem. But, if one incrementally
 > rebuilds a package after the initial build, e.g. with 'make foo-rebuild',
 > then all changes that happened in target-finalize at the end of the initial
 > build (the 'after-state' of the last package built) will be detected as
 > changes caused by the rebuild of package foo. As a result, all these files
 > will incorrectly be treated as 'owned' by package foo.

 > Correct this situation by capturing a new state at the end of
 > target-finalize, so that the 'before-state' of an incremental build will be
 > correct.

 > Note: the reasoning above talks about packages-file-list.txt and
 > target-finalize, but also applies to
 > packages-file-list-staging.txt/staging-finalize and
 > packages-file-list-host.txt/host-finalize.

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
