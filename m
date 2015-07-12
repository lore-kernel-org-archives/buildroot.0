From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 12 Jul 2015 18:26:29 +0200
Subject: [Buildroot] [PATCH 0/6] [NOT-FOR-MERGE] Host-package: RPATH fixup
Message-ID: <1436718395-10536-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Here is a short series fixing the RPATH of the host programs.

This is a first step for a relocatable SDK, that allows to relocate
the toolchain (and only the toolchain), without any patch in the
toolchain packages.

This series adds a hook executed after each host-package installation
step. This hook will scan the HOST_DIR for program, compute and set the
RPATH to the right value.


This make-based implementation is not really intended to be merged,
just for informationi ;-) and keep some peoples' mental health! :-D

Few comments:
- The hook is called after each host-package installation, but calling
  it once, as the target-finalize hook is enough to render the toolchain
  toolchain (not yet the whole SDK).
- This hook will be resubmited, using a python script soon.


Regards,

Samuel Martin (6):
  package/pkg-utils.mk: add relative-path utility function
  package/pkg-utils.mk: add get_rpaths helpers
  package/pkg-utils.mk: add fix_rpaths helpers
  package/pkg-utils: add a POST_HOST_INSTALL_FIX_RPATH helper
  support/dependencies: add host-patchelf to DEPENDENCIES_HOST_PREREQ
  package/pkg-generic.mk: add POST_HOST_INSTALL_FIX_RPATH to the
    POST_INSTALL_HOOKS

 package/pkg-generic.mk               |  2 ++
 package/pkg-utils.mk                 | 39 ++++++++++++++++++++++++++++++++++++
 support/dependencies/dependencies.mk |  2 ++
 3 files changed, 43 insertions(+)

--
2.4.5
