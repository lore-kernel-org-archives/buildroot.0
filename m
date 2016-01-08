From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 Jan 2016 18:45:29 +0100
Subject: [Buildroot] Persistent dropbear keys
In-Reply-To: <CAAXf6LULMusN+KRUf6D32GNx77bbB0vSayJqk03T7ouNCArhHA@mail.gmail.com>
 (Thomas De Schampheleire's message of "Fri, 8 Jan 2016 14:43:29
 +0100")
References: <CAAXf6LULMusN+KRUf6D32GNx77bbB0vSayJqk03T7ouNCArhHA@mail.gmail.com>
Message-ID: <87mvsgdkxy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > Hello,
 > Commit e7d04dd2df8bb935c61f7c814ee88eba7e75b5e4 (package/dropbear: fix
 > generating keys on RO file systems) (+ some subsequent commits)
 > changed the handling of the /etc/dropbear directory. Previously
 > /etc/dropbear was a real directory in the rootfs, now it initially is
 > a link to /var/run/dropbear. During S50dropboar, the link is replaced
 > with a real (empty) directory (if rootfs is writable) or a warning is
 > given.

 > I understand all this. However, what I do not understand is how you
 > are then creating persistent dropbear keys. From how I understand the
 > code, the keys are persistent across reboots, but not between upgrades
 > of the rootfs, because after an upgrade a new empty /etc/dropbear is
 > created.

If your upgrade overwrites /etc/dropbear, then yes.

E.G. I use a persistent writable unionfs on /etc, so changes to /etc are
not lost after an upgrade.


 > In my case, the rootfs is an initramfs, but mounted rw at boot time.

 > The solution I have been using is with an S49dropbear_keys script that:
 > - at 'stop', verifies the correctness of the keys in /etc/dropbear
 > (with dropbearkey) and if ok copies them to a real persistent medium,
 > - at 'start', verifies if there are any keys on the persistent medium,
 > verify their correctness, and if ok copies them to /etc/dropbear.

Why don't you just make /etc/dropbear a symlink to your persistent
medium?

-- 
Bye, Peter Korsgaard
