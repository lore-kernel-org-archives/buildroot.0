From: Doug Kehn <rdkehn@yahoo.com>
Date: Fri, 21 Nov 2014 20:14:16 -0600
Subject: [Buildroot] [PATCH 0/1] [RFC] Reinstall Targets
Message-ID: <1416622457-10448-1-git-send-email-rdkehn@yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This RFC proposes adding the following targets to pkg-generic.mk:
	<package>-clean-for-staging-reinstall
	<package>-clean-for-target-reinstall
	<package>-clean-for-reinstall

These targets remove the package's .stamp_*_installed file to allow the
<package>-install, <package>-install-staging, <package>-install-target
targets to execute.  The only method I presently know of to reinstall a
package is to make <package>-rebuild.  The proposed targets allow a
package reinstall without incurring a rebuild of the package.

In addition to allowing a reinstall to staging and/or target output
directories, the proposed targets allow selected packages to be
installed to a different 'target' directory.  For example, I attempt to
keep software updates as small as possible; therefore, I cherry-pick
files to include in the update package.  If I know packages foo and bar
have been updated, the following will install those packages to a
directory that can be further processed to generate the desired update
package.

make TARGET_DIR=${PWD}/update \
	foo-clean-for-target-reinstall \
	foo-install-target

make TARGET_DIR=${PWD}/update \
	bar-clean-for-target-reinstall \
	bar-install-target

This proposal may also form the basis for the "TODO items under
discussion" for a make target to reinstall everything to the target.

* This is my first attempt at proposing a Buildroot submission.  Please
* let me know if I'm doing it wrong and/or what I can do better.

Doug Kehn (1):
  pkg-generic.mk: -clean-for-*-reinstall targets

 package/pkg-generic.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

-- 
1.9.1
