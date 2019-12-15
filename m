From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat, 14 Dec 2019 17:15:15 -0800
Subject: [Buildroot] [PATCH 0/2] package/libsemanage: set policy versions
 explicitly.
Message-ID: <20191215011517.1977342-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

When updating the libselinux patch series to 3.0, I ran into an issue:
When running semodule, I received the error:
policydb version 32 does not match my version range 15-31.

After many many hours of digging, I found answers in the code:
  - The kernel I was building supported policies up to version 31.
  - Libselinux 3.0 supports policies up to version 32.

Here's how it works in my case:
semodule -> libsemanage -> libsepol -> include/sepol/policydb/policydb.h
#define POLICYDB_VERSION_MAX    POLICYDB_VERSION_GLBLUB (This is 32)

semodule -> libsemanage -> libsepol -> security/selinux/include/security.h
#define POLICYDB_VERSION_MAX   POLICYDB_VERSION_INFINIBAND (This is 31)

These two patches attempt to fix the issue in a clean way that's easy on the
user:

The first patch adds two simple configuration options:
  - BR2_PACKAGE_SELINUX_POLICY_MANUAL_VERSION (A bool)
  - BR2_PACKAGE_SELINUX_POLICY_MAX_VERSION (A int with a range of 25 - 31)

This patch allows a user to specify the maximum policy value manually, however,
there are five disadvantages to this manual option:
1) It doesn't guarantee that the above won't happen.
2) It is set to 25 by default, which is incredibly old and isn't as secure as
   the newer supported policies.
3) It's manual, and a user has to know what to select.
4) I can do better.
5) I want to do better. ;)


The second patch attempts to fix the above IF a user specifies a kernel version
in the config. (As they should!)

The patch attempts to do the following:
  - Call out to a new script: package/libsemanage/get-kernel-max-policy-version.sh
    which does the following:
      - Cut up the BR2_PACKAGE_LIBSEMANAGE_KERNEL_VERSION variable into two
        seperate variables:
       - LIBSEMANAGE_LINUX_VERSION_MAJOR
        - LIBSEMANAGE_LINUX_VERSION_MINOR
          IE: 4.2.1 becomes 4 and 2.
          (Lucky for me, a policy version support bump has NEVER happened on a
           subversion release, only on point releases.)
     - Go through a bunch of if statements.
     - Echo out the maximum policy version back to the .mk file.
      Note: Thomas recommended putting the following in a patch to make it
            easier to read and maintain, and I agree.

  - If a user has not manually selected a policy, stop here. We have a
    guaranteed maximum policy that's guaranteed to work with the specified
    kernel! Hooray! Better security for everybody!

  - If a user has opted to set the policy version manually, we can now test to
    ensure he didn't set the policy greater than the policy supported in the
    specified kernel:
    - If the manually selected policy is lower, print a warning.
    - If the manually selected policy is greater, throw an error.

  - If a user does not specify a kernel version then we just keep whatever
    policy version they wanted in the first place and they can deal with
    consequences if things breaks.
    
  - If nothing is specified the maximum policy version is built and the user
    can deal with the consequences if things breaks.

This patch does have a big drawback:
  - There is no logic to derive the policy from a kernel that is already being
    built, however this would be quite nice. However this is a good compromise
    I believe.


This patch makes building policies much easier in Buildroot, and in the future
will help when I am ready to introduce another big patch set:
Refpolicy: Going modular.

I am not slightly more insane than I was before all of this, but probably for
the better!

Thanks for reading!
Adam

Adam Duskett (2):
  package/libsemanage: add option to manually define policy version
  package/libsemanage: check against the Kernel for max policy version

 package/libsemanage/Config.in                 | 30 +++++++++
 .../get-kernel-max-policy-version.sh          | 65 +++++++++++++++++++
 package/libsemanage/libsemanage.mk            | 64 ++++++++++++++++++
 3 files changed, 159 insertions(+)
 create mode 100755 package/libsemanage/get-kernel-max-policy-version.sh

-- 
2.23.0
