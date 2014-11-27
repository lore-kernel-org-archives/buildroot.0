From: Doug Kehn <rdkehn@yahoo.com>
Date: Wed, 26 Nov 2014 22:48:45 -0600
Subject: [Buildroot] [PATCH v2 0/2] [RFC] Reinstall Targets
Message-ID: <1417063727-4420-1-git-send-email-rdkehn@yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This RFC proposes adding the following targets to pkg-generic.mk:
	<package>-reinstall
	<package>-reinstall-target
	<package>-reinstall-staging
	<package>-reinstall-images
	<package>-reinstall-host

These targets remove the package's .stamp_*_installed file to allow the
reinstall to execute.  The only method I presently know of to reinstall a
package is to make <package>-rebuild.  The proposed targets allow a package
reinstall without, unnecessarily incurring a rebuild of the package.

In addition to allowing a reinstall to staging and/or target output
directories, the proposed targets allow selected packages to be
installed to a different 'target' directory.  For example, I attempt to
keep software updates as small as possible; therefore, I cherry-pick
files to include in the update package.  If I know packages foo and bar
have been updated, the following will install those packages to a
directory that can be further processed to generate the desired update
package.

make TARGET_DIR=${PWD}/update foo-reinstall-target

make TARGET_DIR=${PWD}/update bar-reinstall-target

Doug Kehn (2):
  pkg-generic.mk: reinstall targets
  manual: reinstall targets

 docs/manual/package-make-target.txt | 26 ++++++++++++++++++++------
 package/pkg-generic.mk              | 28 +++++++++++++++++++++++++---
 2 files changed, 45 insertions(+), 9 deletions(-)

---
Changes v1 -> v2:
  - Reworked to include reinstall target (requested by Thomas)
  - Updated documentation

-- 
1.9.1
