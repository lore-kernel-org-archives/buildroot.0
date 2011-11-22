From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 22 Nov 2011 09:29:26 +0000 (UTC)
Subject: [Buildroot] [Bug 4508] /dev/console and /dev/null have to be
 created on udev based systems also
In-Reply-To: <bug-4508-163@https.bugs.busybox.net/>
References: <bug-4508-163@https.bugs.busybox.net/>
Message-ID: <20111122092926.568298F658@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4508

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WORKSFORME

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2011-11-22 09:29:26 UTC ---
No. Our udev and mdev support relies on the devtmpfs filesystem to be enabled
in the kernel and mounted at boot time by the kernel. Buildroot ensures that
this is the case for kernels that it builds (see the following code in
linux/linux.mk), but if you build your kernel outside of Buildroot, it is up to
you to enable those options as well.

        $(if $(BR2_ROOTFS_DEVICE_CREATION_STATIC),,
                $(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS,$(@D)/.config)
                $(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(@D)/.config))

So you must enabled CONFIG_DEVTMPFS and CONFIG_DEVTMPFS_MOUNT in your kernel.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
