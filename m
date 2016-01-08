From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 8 Jan 2016 14:43:29 +0100
Subject: [Buildroot] Persistent dropbear keys
Message-ID: <CAAXf6LULMusN+KRUf6D32GNx77bbB0vSayJqk03T7ouNCArhHA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Commit e7d04dd2df8bb935c61f7c814ee88eba7e75b5e4 (package/dropbear: fix
generating keys on RO file systems) (+ some subsequent commits)
changed the handling of the /etc/dropbear directory. Previously
/etc/dropbear was a real directory in the rootfs, now it initially is
a link to /var/run/dropbear. During S50dropboar, the link is replaced
with a real (empty) directory (if rootfs is writable) or a warning is
given.

I understand all this. However, what I do not understand is how you
are then creating persistent dropbear keys. From how I understand the
code, the keys are persistent across reboots, but not between upgrades
of the rootfs, because after an upgrade a new empty /etc/dropbear is
created.

In my case, the rootfs is an initramfs, but mounted rw at boot time.

The solution I have been using is with an S49dropbear_keys script that:
- at 'stop', verifies the correctness of the keys in /etc/dropbear
(with dropbearkey) and if ok copies them to a real persistent medium,
- at 'start', verifies if there are any keys on the persistent medium,
verify their correctness, and if ok copies them to /etc/dropbear.

I will now need to adapt this script S49dropbear_keys to first remove
the /etc/dropbear link, to keep its functionality.

But it pops up the question how other people are handling this.

Thanks,
Thomas
