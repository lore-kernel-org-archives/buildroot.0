From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 17 Feb 2021 16:26:55 +0000
Subject: [Buildroot] [Bug 13466] creation of bridge interface via interfaces
 does not work
In-Reply-To: <bug-13466-163@https.bugs.busybox.net/>
References: <bug-13466-163@https.bugs.busybox.net/>
Message-ID: <bug-13466-163-n1pmDXSrZM@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13466

--- Comment #1 from Ryan Barnett <ryan.barnett@rockwellcollins.com> ---
Hello,

The supports for bridges in the /etc/network/interfaces file is provide by
Debian through the combination of having two packages installed: bridge-utils
and ifupdown. Debian has customized bridge-utils package to provide support for
bridge syntax in the /etc/network/interfaces file with the ifupdown package.

On Debian based distributions, the syntax for bridge in /etc/network/interfaces
is accomplished utilizing if-pre-up.d/bridge and if-post-down.d/bridge hooks as
seen from the list of the Debian package files [1].

Buildroot utilizes the official bridge-utils source from kernel.org which does
not contain any of these ifupdown hooks [2]. 

In order to support this syntax utilizing buildroot, I'd recommend that the
full version of ifupdown be built. Support for the bridge hooks could be added
by utilizing a BR2_ROOTFS_OVERLAY [3] which installs the hooks for bridge
support in the /etc/network/if-pre-up.d/ and fi-post-down.d/ hook locations
utilizing the Debian source [4]

Thanks,
-Ryan

[1] - https://packages.debian.org/stretch/amd64/bridge-utils/filelist
[2] -
https://git.busybox.net/buildroot/tree/package/bridge-utils/bridge-utils.mk#n9
[3] - https://buildroot.org/downloads/manual/manual.html#rootfs-custom
[4] - https://sources.debian.org/src/bridge-utils/1.6-2/debian/ifupdown.sh/

-- 
You are receiving this mail because:
You are on the CC list for the bug.
