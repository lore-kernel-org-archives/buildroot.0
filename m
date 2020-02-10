From: Carlos Santos <unixmania@gmail.com>
Date: Sun, 9 Feb 2020 21:00:31 -0300
Subject: [Buildroot] [git commit] package/polkit: bump to version 0.116
In-Reply-To: <20191208145140.33E3E8899E@busybox.osuosl.org>
References: <20191208145140.33E3E8899E@busybox.osuosl.org>
Message-ID: <CAJ4jsacmmUF8eKM9Xs+5vVseg8VrHw-K1APU-O=6DGdyvDJvTg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Dec 8, 2019 at 12:00 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> commit: https://git.buildroot.net/buildroot/commit/?id=ce2a5eff7890815afeb26105c7760b6f8d2986e0
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> Other changes:
>   - Add spidermonkey as a dependency.
>   - Add 0001-make-netgroup-support-optional.patch to allow building on musl.
>   - Add a runtime dependency on dbus.
>   - Add --disable-libelongind.
>   - Add --disable-libsystemd-login.
>   - Update dependencies for systemd pam support.
>   - Update dependencies for udisks.
>
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Argh, the mozjs (spidermonkey) dependency increases the size of the
target system by 45 MiB!

2020-02-09T20:12:08 Superblock backups stored on blocks:
2020-02-09T20:12:08 8193, 24577, 40961, 57345
2020-02-09T20:12:08
2020-02-09T20:12:08 Allocating group tables: done
2020-02-09T20:12:08 Writing inode tables: done
2020-02-09T20:12:08 Copying files into the device: __populate_fs:
Could not allocate block in ext2 filesystem while writing file
"libmozjs-60.so"
2020-02-09T20:12:08 mkfs.ext2: Could not allocate block in ext2
filesystem while populating file system
2020-02-09T20:12:08 *** Maybe you need to increase the filesystem size
(BR2_TARGET_ROOTFS_EXT2_SIZE)
2020-02-09T20:12:08 make[1]: *** [fs/ext2/ext2.mk:64:
/work/qemu_x86_64_glibc_eudev/images/rootfs.ext2] Error 1
2020-02-09T20:12:08 make: *** [Makefile:23: _all] Error 2

$ grep -F BR2_TARGET_ROOTFS_EXT2_SIZE .config
BR2_TARGET_ROOTFS_EXT2_SIZE="60M"

$ file build/buildroot-fs/ext2/target/usr/{bin/js60,lib/libmozjs-60.so}
build/buildroot-fs/ext2/target/usr/bin/js60:           ELF 64-bit LSB
executable, x86-64, version 1 (GNU/Linux), dynamically linked,
interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 4.14.0,
BuildID[sha1]=93295e8e66ae075577bc76110d7a81fc3f9b6359, stripped
build/buildroot-fs/ext2/target/usr/lib/libmozjs-60.so: ELF 64-bit LSB
shared object, x86-64, version 1 (GNU/Linux), dynamically linked,
BuildID[sha1]=2cda65c78b09727e5ee4ac481f8847ca07953cc9, stripped

$ du -hc build/buildroot-fs/ext2/target/usr/{bin/js60,lib/libmozjs-60.so}
23M    build/buildroot-fs/ext2/target/usr/bin/js60
23M    build/buildroot-fs/ext2/target/usr/lib/libmozjs-60.so
45M    total

-- 
Carlos Santos <unixmania@gmail.com>
