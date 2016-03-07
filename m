From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 07 Mar 2016 20:23:01 +0000
Subject: [Buildroot] [Bug 8771] make savedefconfig modifies sources
In-Reply-To: <bug-8771-163@https.bugs.busybox.net/>
References: <bug-8771-163@https.bugs.busybox.net/>
Message-ID: <bug-8771-163-YmX2Br27g5@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8771

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |WORKSFORME
             Status|NEW                         |RESOLVED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
This is the expected behavior. I personally don't like it (since it deviates
from how the Linux kernel handles defconfig, and also because it's look weird),
but that's the way it's supposed to work in Buildroot.

Basically, the defconfig is stored to the file pointed by BR2_DEFCONFIG. By
default, this option is set to $(CONFIG_DIR)/defconfig, which would do what you
want, i.e save the defconfig next to the .config file.

However, when you run "make <foobar>_defconfig", we set BR2_DEFCONFIG to
"configs/<foobar>_defconfig". The original intent is to make things
"transparent": if you start from a defconfig, the assumption is that you want
changes made to this configuration to be saved back to the same defconfig.

You can override this at any time by changing BR2_DEFCONFIG in
menuconfig/xconfig/nconfig, or simply on the command line by passing
BR2_DEFCONFIG="/some/place".

As I said, I personally don't really like this behavior, and I got confused
several times. The fact that the source tree is modified is indeed another
drawback of this behavior. However, I didn't find this to be too problematic to
really argue against the contributors who wanted this feature.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
