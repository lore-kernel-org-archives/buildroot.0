From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 04 Dec 2017 18:04:35 +0000
Subject: [Buildroot] [Bug 10536] New: Finding non-relative paths in the
 ccache
Message-ID: <bug-10536-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10536

            Bug ID: 10536
           Summary: Finding non-relative paths in the ccache
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: mhirota at impinj.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

It appears that non-relative paths are leaking into the buildroot ccache
despite the default BR2_CCACHE_USE_BASEDIR=y.

Here are my steps to demonstrate this:

    $ git clone git://git.buildroot.net/buildroot
    $ cd buildroot
    $ make zynq_zybo_defconfig
    $ make menuconfig
    $ # Build options -->
    $ #   [*] Enable compiler cache
    $ #   < Save > and < Exit > back to prompt
    $ make

At this point, I grep the ccache for anything that starts with "/home":

    $ grep -r --include "*.d" "^\/home" $HOME/.buildroot-ccache/ | wc -l
    647

I was expecting this to be zero.

Just to confirm some assumptions:

    $ grep -r --include "*.d" "^\.\." $HOME/.buildroot-ccache/ | wc -l
    60840
    $ grep CCACHE .config
    BR2_CCACHE=y
    BR2_CCACHE_DIR="$(HOME)/.buildroot-ccache"
    BR2_CCACHE_INITIAL_SETUP=""
    BR2_CCACHE_USE_BASEDIR=y
    # BR2_PACKAGE_CCACHE is not set

-- 
You are receiving this mail because:
You are on the CC list for the bug.
