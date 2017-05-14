From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 14 May 2017 13:40:50 -0400
Subject: [Buildroot] [PATCH v3 0/3] refpolicy: new package cover letter.
Message-ID: <20170514174053.26140-1-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Refpolicy is one of the last pieces for buildroot to truley have a easy way to
create a buildroot build with SELinux enabled.  As such I feel it's important
to have it in the buildroot mainline.

The patchset by Bryce Ferguson that was submitted in January adds a refpolicy
that is from early 2015, and as such is quite out of date.  Also the overall
package submitted has some issues that I wanted to fix up as well.

I contacted Bryce on May 10th and asked if I could take over the refpolicy
patches again from him and he was glad to let me do so, if anybody needs a copy
of the email I will gladly forward it to them.


Here are some of the issues I saw that were cleaned up or are changed from
Bryce Fergusons patch set:

Patch1: refpolicy: new package.
  - Removed 0001-Fix-awk-references-to-use-variable.patch: Fixed upstream.
  - Removed 0002-support-fc_sort-use-_FOR_BUILD.patch as this doesn't work in
    the new version of refpolicy.
  - Updated 0001-fc_sort-use-CFLAGS_FOR_BUILD.patch to work with new version
    of Refpolicy.
  - Remove S00selinux, as this would be a bit too much for section 21.5.1
    paragraph 3 of the buildroot manual.  The first patch in this series
    should build and install just a reference policy on the target.
  - Stripped down patch to include just enough to build refpolicy and
    install the policy on the target.
    
  Config.in:
    - Fixed attributes order.
    - Fixed text wrapping.
    - Removed policy type selection.
    - Removed default state selection.

  refpolicy.hash:  
    - Updated hash, however this doesn't work anyways because git
      submodule packages aren't checked for hash consistancy yet.

  refpolicy.mk:
    - Updated version number in refpolicy.mk
    - Changed ordering in refpolicy.mk.  I tend to put the DEPENDENCIES line
      below lines that aren't likely to change often, such as INSTALL_STAGING.
    - Combined REFPOLICY_MAKE_OPTS and REFPOLICY_MAKE_ENV into REFPOLICY_MAKE.
      This cleans up the rest of the makefile.
    - Removed AWK= and M4= in refpolicy.mk, as these are no longer needed with
      the newer version of refpolicy.
    - Removed REFPOLICY_NAME, as the first patch only references a policy name
      once.
    - Changed "br_policy" to "targeted", as that's what most distributions
      that use SELinux have for their default name.
    - Set the default policy version number to 30, as this is the highest
      currently supported by the kernel.
    - Removed install-docs, as they generally installed for buildroot.
    - Broke up CONFIFGURE_CMDS and BUILD_CMDS:  The original patch configured
      and built refpolicies in REFPOLICY_CONFIGURE_CMDS, which doesn't follow
      other buildroot package.mk conventions.
    - Combined making bare and conf into a single line.
    - Removed creatings $(TARGET_DIR)/etc/selinux/config in initial patch.
    - Removed INIT_SYSV section.


patch2: refpolicy-add-ability-to-specify-policy-version
  - The reason why this is a standalone patch is that it follows section 21.5.1
    paragraph 3 of the buildroot manual.  Adding the ability to set a default
    state is secondary to the policy version.  As such I decided to break up
    this patch into it's own seperate patch.
  

patch3: refpolicy-add-ability-to-specify-policy-version
  - Broke this patch up into it's own seperate patch so that it follows section
    21.5.1 paragraph 3 of the buildroot manual.  This patch adds only the
    ability to set the default selinux state.
  - Re-added a template config file with SELINUXTYPE of targeted.
    
  Config.in:
    - Changed ENFORCE to ENFORCING because it matches the actual string.
    - Changed DISABLE to DISABLED because it matches the actual string.
  
  refpolicy.mk:
    - Added only one set command to $(TARGET_DIR)/etc/selinux/config

Adam Duskett (3):
  refpolicy: new package
  add ability to specify policy version
  refpolicy: add ability to set default state.

 package/Config.in                                  |  1 +
 .../0001-fc_sort-use-CFLAGS_FOR_BUILD.patch        | 30 ++++++++++
 package/refpolicy/Config.in                        | 70 ++++++++++++++++++++++
 package/refpolicy/config                           |  9 +++
 package/refpolicy/refpolicy.hash                   |  2 +
 package/refpolicy/refpolicy.mk                     | 55 +++++++++++++++++
 6 files changed, 167 insertions(+)
 create mode 100644 package/refpolicy/0001-fc_sort-use-CFLAGS_FOR_BUILD.patch
 create mode 100644 package/refpolicy/Config.in
 create mode 100644 package/refpolicy/config
 create mode 100644 package/refpolicy/refpolicy.hash
 create mode 100644 package/refpolicy/refpolicy.mk

-- 
2.9.3
