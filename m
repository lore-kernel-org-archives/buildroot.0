From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 11 Feb 2021 23:37:11 +0100
Subject: [Buildroot] [PATCH 1/1] package/zfs: new package
In-Reply-To: <20210203075440.421072-1-salvador.joseluis@gmail.com>
References: <20210203075440.421072-1-salvador.joseluis@gmail.com>
Message-ID: <20210211223711.GJ1679218@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jos?, All,

On 2021-02-03 08:54 +0100, Jos? Luis Salvador Rufo spake thusly:
> OpenZFS is an advanced file system and volume manager which was originally
> developed for Solaris and is now maintained by the OpenZFS community. This
> repository contains the code for running OpenZFS on Linux and FreeBSD.
> 
> http://zfsonlinux.org/

Thanks for this patch! As discussed on IRC earlier, here's a quick
review.

First, the commit log contains a short description of the new package,
which is nice, but does not bring much, as this is already what is
available in the help text of the BR2_PACKAGE_ZFS symbol. Since it is
short, it can be kept, though.

What a commit should realy contain, is the explanations of why the code
looks like it is. Do not describe the code ("we set prefix to /usr") but
explain why this is needed (e.g. "zfs searches for foo and bar in the
usual places, so we set prefix to /usr"). But see below about this one.

Second, I see you have provided a runtime test. This is awesome! :-)
Good job! (this really is what enticed me to divert my evening time from
applying other patches to reviewing this one).

Then, you can validate your changes against the coding rules:

    $ make check-package
    package/zfs/zfs.mk:1: should be 80 hashes (http://nightly.buildroot.org/#writing-rules-mk)
    package/zfs/zfs.mk:5: should be 80 hashes (http://nightly.buildroot.org/#writing-rules-mk)
    package/zfs/zfs.mk:8: remove default value of _SOURCE variable (http://nightly.buildroot.org/#generic-package-reference)

Not too bad ;-)

Now read on from a bit more review. Don't be overwhelmed, they are
numerous but not too bad...

> Signed-off-by: Jos? Luis Salvador Rufo <salvador.joseluis@gmail.com>
> ---
[--SNIP--]
> diff --git a/package/zfs/0001-fix-zfs-tests-cmd-xattrtest-for-uclibc.patch b/package/zfs/0001-fix-zfs-tests-cmd-xattrtest-for-uclibc.patch
> new file mode 100644
> index 0000000000..39ac1b213e
> --- /dev/null
> +++ b/package/zfs/0001-fix-zfs-tests-cmd-xattrtest-for-uclibc.patch

Patches we carry must contain a complete commit log of their own, down
to your SoB line as well. If the upstream project uses git, then the
patch must be a git-formatted patch. See for example:

    package/bc/0001-bc-use-MAKEINFO-variable-for-docs.patch

And see the manual:

    https://buildroot.org/downloads/manual/manual.html#patch-policy

Ideally, we would also like a status about whether those patches have
been submitted upstream (and what upstream said, if at all).

[--SNIP--]
> diff --git a/package/zfs/Config.in b/package/zfs/Config.in
> new file mode 100644
> index 0000000000..0a117c2f7c
> --- /dev/null
> +++ b/package/zfs/Config.in
> @@ -0,0 +1,29 @@
> +comment "zfs needs a Linux kernel to be built"
> +	depends on !BR2_LINUX_KERNEL
> +
> +comment "zfs needs udev /dev management"
> +	depends on BR2_LINUX_KERNEL
> +	depends on !BR2_PACKAGE_HAS_UDEV
> +
> +config BR2_PACKAGE_ZFS
> +	bool "zfs"
> +	depends on BR2_LINUX_KERNEL

Does that really requires that a kernel be built?

But see below, where we'll be discussing about --with-linux=...

And see also furhter, when we discuss ZFS_LINUX_CONFIG_FIXUPS.

> +	depends on BR2_PACKAGE_HAS_UDEV
> +	select BR2_PACKAGE_ZLIB
> +	select BR2_PACKAGE_LIBZLIB

zlib is a virtual package, for which libzlib is only a provider. You
can't select a provider. Furthermore, BR2_PACKAGE_LIBZLIB is in a
choice, and you can't select an entry in a choice.

So, if zfs really requires libzlib (the original zlib, that is), then it
can only depend on it.

> +	select BR2_PACKAGE_UTIL_LINUX
> +	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
> +	select BR2_PACKAGE_UTIL_LINUX_LIBUUID

You need to propagate the dependencies of the symbols you select.
libblkid depends on MMU, and add a comment about why that is, so you'd
need to add:

    depemds on BR2_USE_MMU  # util-linux' libblkid

And so on for the other symbols (I haven't checked which have
dependencies)...

> +	select BR2_PACKAGE_LIBTIRPC
> +	select BR2_PACKAGE_LIBAIO
> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_LIBOPENSSL

Same for openssl as for zlib.

> +	help
> +	  OpenZFS on Linux and FreeBSD
> +
> +	  OpenZFS is an advanced file system and volume manager which
> +	  was originally developed for Solaris and is now maintained by
> +	  the OpenZFS community. This repository contains the code for
> +	  running OpenZFS on Linux and FreeBSD.
> +
> +	  http://zfsonlinux.org/
> diff --git a/package/zfs/zfs.hash b/package/zfs/zfs.hash
> new file mode 100644
> index 0000000000..b0ca922d18
> --- /dev/null
> +++ b/package/zfs/zfs.hash
> @@ -0,0 +1,5 @@
> +sha256 bde5067ce4577d26cc0f0313a09173ad40d590d01539b92c93f33f06ee150b24 zfs-2.0.2.tar.gz
> +
> +# Hash for license files:
> +sha256 1ffb70c33c4f79f04e947facc5c7851f289609256aacb47fc115f700427d9520 LICENSE
> +sha256 1d8894d33462c25b56fc1747cbb5453ab64315306456d26644e51eb3fb44f0e3 COPYRIGHT

Although nothing enforces that, fields should be separated by two
spaces:

    https://buildroot.org/downloads/manual/manual.html#adding-packages-hash

> diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
> new file mode 100644
> index 0000000000..42e4a55c47
> --- /dev/null
> +++ b/package/zfs/zfs.mk
> @@ -0,0 +1,104 @@
> +###############################################################################
> +#
> +# zfs
> +#
> +###############################################################################
> +
> +ZFS_VERSION = 2.0.2
> +ZFS_SOURCE = zfs-$(ZFS_VERSION).tar.gz
> +ZFS_SITE = https://github.com/openzfs/zfs/releases/download/zfs-$(ZFS_VERSION)
> +ZFS_LICENSE = CDDL
> +ZFS_LICENSE_FILES = LICENSE COPYRIGHT
> +
> +ZFS_CONF_OPTS = \
> +	--prefix=/usr \

--prefix=/usr is the default for autotools packages, so you should not
have to specify it.

> +	--bindir=/bin \
> +	--sbindir=/sbin \
> +	--libdir=/lib \

Why do you need to specify those paths? What's wrong with having them in
/usr/{bin,sbin,lib} ?

If there is a good reason, then explain tht in the commit log (or at the
very least, as a coment just above).

> +	--sysconfdir=/etc \

Ditto: /etc is the default.

> +	--enable-pam=$(if $(BR2_PACKAGE_LINUX_PAM),yes,no) \

Don't you also need to add linux-pam in ZFS_DEPENDENCIES?

Usually, in such a case, it is better to write a dedeicated conditional
block, like so:

    ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
    ZFS_DEPENDENCIES += linux-pam
    ZFS_CONF_OPTS += --enable-pam
    else
    ZFS_CONF_OPTS += --disable-pam
    endif

Of course, if zfs does not link to libpam. but just installs some PAM
modules or config files, then you don;t actually need to add it to
_DEPENDENCIES, in which case you should explain that (as a comment, or
in the commit log).

> +	--enable-systemd=$(if $(BR2_INIT_SYSTEMD),yes,no) \

Ditto.

> +	--enable-sysvinit=$(if $(BR2_INIT_SYSV),yes,no) \

What about other init systems: BR2_INIT_BUSYBOX,BR2_INIT_OPENRC?

> +	$(if $(BR2_SYSTEM_ENABLE_NLS),,--disable-nls) \
> +	--with-udevdir=/lib/udev \

Why do you need to specify this path?

Is it the same reason as explained in commit 06e934268db0 ?

(Note that 06e934268db0 uses a different path, but I think that one is
not correct)

> +	--with-linux=$(LINUX_DIR) \
> +	--with-linux-obj=$(LINUX_DIR) \

So, this. Why do you need to access the linux' source and build
directories? Please expland on that in the commit log.

And if you really need the them, then you should also have linux in
ZFS_DEPENDENCIES.

> +	--disable-rpath \
> +	--disable-silent-rules

Why do you disable silent rules? If you want to see actual build
commands, just pass V=1 when calling make, it is (magically?) passed
down by Buildroot...

> +ZFS_AUTORECONF = YES
> +ZFS_AUTORECONF_OPTS = -fiv

I like it that these two go before the first _CONF_OPTS (i.e. between
ZFS_LICENSE_FILES and ZFS_CONF_OPTS). It keeps it in a "logical"
ordering: first we autoreconf, then we configure, etc....

> +# Static, shared or both
> +ifeq ($(BR2_STATIC_LIBS),y)
> +ZFS_CONF_OPTS += --enable-static=yes --enable-shared=no
> +else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
> +ZFS_CONF_OPTS += --enable-static=yes --enable-shared=yes
> +else ifeq ($(BR2_SHARED_LIBS),y)
> +ZFS_CONF_OPTS += --enable-static=no --enable-shared=yes
> +endif

Handling those is already handled in a generic way.

> +# Optional python support
> +ifeq ($(BR2_PACKAGE_PYTHON),y)
> +ZFS_CONF_ENV += PYTHON=$(STAGING_DIR)/usr/bin/python

$(STAGING_DIR)/usr/bin/python is a targ4et executable, so it won't be
possible to execute it during the build...

What is it needed for?

> +ZFS_CONF_OPTS += --enable-pyzfs --with-python=$(PYTHON_VERSION)
> +ZFS_DEPENDENCIES += python
> +else ifeq ($(BR2_PACKAGE_PYTHON3),y)
> +ZFS_CONF_ENV += PYTHON=$(STAGING_DIR)/usr/bin/python

In this case, that would be $(STAGING_DIR)/usr/bin/python3

> +ZFS_CONF_OPTS += --enable-pyzfs --with-python=$(PYTHON3_VERSION)
> +ZFS_DEPENDENCIES += python3
> +else
> +ZFS_CONF_OPTS += --enable-pyzfs=no --with-python=no

We usally directly use the negative options:

    --disable-pyzfs --without-python

> +endif
> +
> +# ZFS needs zlib

Drop this comment and the other similar ones: if you depend on it, it is
obvious that it is required...

> +ZFS_DEPENDENCIES += libzlib
> +ZFS_CONF_ENV += ZLIB_CFLAGS="-I$(STAGING_DIR)/usr/include"
> +ZFS_CONF_ENV += ZLIB_LIBS="-lz"

So zfs can't use pkg-config to find all those libraries and the
required flags?

> +# ZFS needs libuuid (util-linux)
> +ZFS_DEPENDENCIES += util-linux
> +ZFS_CONF_ENV += LIBUUID_CFLAGS="-I$(STAGING_DIR)/usr/include/uuid"
> +ZFS_CONF_ENV += LIBUUID_LIBS="-luuid"
> +ZFS_CONF_ENV += LIBBLKID_CFLAGS="-I$(STAGING_DIR)/usr/include/blkid"
> +ZFS_CONF_ENV += LIBBLKID_LIBS="-lblkid"
> +
> +# ZFS needs libtirpc
> +ZFS_DEPENDENCIES += libtirpc
> +ZFS_CONF_ENV += LIBTIRPC_CFLAGS="-I$(STAGING_DIR)/usr/include/tirpc"
> +ZFS_CONF_ENV += LIBTIRPC_LIBS="-ltirpc"
> +ZFS_CONF_OPTS += --with-tirpc
> +#endif

Drop this comment.

> +# ZFS needs libaio
> +ZFS_DEPENDENCIES += libaio
> +ZFS_CONF_ENV += LIBAIO_CFLAGS="-I$(STAGING_DIR)/usr/include/"
> +ZFS_CONF_ENV += LIBAIO_LIBS="-laio"
> +
> +# ZFS needs libopenssl
> +ZFS_DEPENDENCIES += libopenssl
> +ZFS_CONF_ENV += LIBCRYPTO_CFLAGS="-I$(STAGING_DIR)/usr/include/"
> +ZFS_CONF_ENV += LIBCRYPTO_LIBS="-lcrypto"
> +
> +# ZFS needs udev
> +ZFS_CONF_ENV += LIBUDEV_CFLAGS="-I$(STAGING_DIR)/usr/include/"
> +# The ZFS Makefile expects the /lib/udev/rules.d directory to exist.
> +define ZFS_CREATE_MISSING_DIRS
> +	$(INSTALL) -m 0755 -d $(TARGET_DIR)/lib/udev/rules.d
> +endef
> +ZFS_PRE_INSTALL_TARGET_HOOKS += ZFS_CREATE_MISSING_DIRS

OK, so that has at least to match --with-udevdir, as set above...

> +# Linux kernel config
> +define ZFS_LINUX_CONFIG_FIXUPS
> +	$(call KCONFIG_DISABLE_OPT,CONFIG_DEBUG_LOCK_ALLOC)  # incompatible with the CDDL license

No need for that comment, not in this place.

This particular topic has been debated at lengths in various forums, and
various people have various views. Depending what camp one is in, the
above assertion might or might not be true or false.

Interpreting whether licenses are compatible with each others is not our
responsiiblity, but that of the legal department of the user assembling
and/or distributing a build.

> +	$(call KCONFIG_DISABLE_OPT,CONFIG_TRIM_UNUSED_KSYMS)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_ZLIB_DEFLATE)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_ZLIB_INFLATE)
> +endef
> +
> +# Linux kernel modules
> +ZFS_MODULES = zavl icp zlua znvpair spl zunicode zcommon zzstd zfs
> +ZFS_MODULE_SUBDIRS = module/avl module/icp module/lua module/nvpair module/spl module/unicode module/zcommon module/zstd module/zfs
> +$(eval $(kernel-module))

Ah, so this is why you need to depend on BR2_LINUX_KERNEL.

Is it possible that zfs can be configured to only build the userland
tools, and not the kernel modules?

> +$(eval $(autotools-package))
> diff --git a/support/testing/conf/zfs-kernel-fragment.config b/support/testing/conf/zfs-kernel-fragment.config
> new file mode 100644
> index 0000000000..4c3cead8ef
> --- /dev/null
> +++ b/support/testing/conf/zfs-kernel-fragment.config
> @@ -0,0 +1,2 @@
> +CONFIG_CRYPTO_DEFLATE=y
> +CONFIG_ZLIB_DEFLATE=y

You should not need that, as they are enforced n the .mk by mean of the
ZFS_LINUX_CONFIG_FIXUPS macro. Or did I miss something?

> diff --git a/support/testing/tests/package/test_zfs.py b/support/testing/tests/package/test_zfs.py
> new file mode 100644
> index 0000000000..637669d522
> --- /dev/null
> +++ b/support/testing/tests/package/test_zfs.py
> @@ -0,0 +1,65 @@
> +import os
> +
> +import infra.basetest
> +
> +
> +class TestZfs(infra.basetest.BRTest):
> +    config = """
> +        BR2_x86_64=y
> +        BR2_x86_corei7=y
> +        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kcfgfrag}"
> +        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.12"
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +        BR2_LINUX_KERNEL=y
> +        BR2_PACKAGE_BUSYBOX=y
> +        BR2_PACKAGE_ZFS=y
> +        BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC=y
> +        BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> +        BR2_TOOLCHAIN_EXTERNAL_CXX=y
> +        BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> +        BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
> +        BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
> +        BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> +        BR2_TOOLCHAIN_EXTERNAL_URL="https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--uclibc--stable-2020.08-1.tar.bz2"
> +        BR2_TOOLCHAIN_EXTERNAL_WCHAR=y
> +        BR2_TOOLCHAIN_EXTERNAL=y

Please use one of the pre-configured toolchains. We have quite a variety
of those, like the (old) Linaro toolchain, the (oldish but not so much)
ARM toolchain, and the recent Bootlin toolchains. It is easier to use a
preconfigured toolchain, because then we dont need to adapt the test
when we update the toolchain.

> +        """.format(
> +        kcfgfrag=infra.filepath("conf/zfs-kernel-fragment.config")
> +    )
> +
> +    def test_run(self):
> +        timeout = 35 * self.emulator.timeout_multiplier
> +        kernel = os.path.join(self.builddir, "images", "bzImage")
> +        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
> +        self.emulator.boot(
> +            arch="x86_64",
> +            kernel=kernel,
> +            kernel_cmdline=["console=ttyS0"],
> +            options=["-initrd", cpio_file],
> +        )
> +        self.emulator.login()
> +
> +        for cmd in [
> +            # Init
> +            "modprobe zfs",
> +            "mount -o remount,size=160M /tmp",
> +            "fallocate -l 64M /tmp/container1.raw",
> +            "fallocate -l 64M /tmp/container2.raw",
> +            "zpool create -m /pool pool raidz /tmp/container1.raw /tmp/container2.raw",
> +            "dd if=/dev/urandom bs=1M count=8 of=/pool/urandom",
> +            "sha256sum /pool/urandom > /tmp/urandom.sha256",
> +            # Check
> +            "zpool export pool",
> +            "zpool import pool -d /tmp/container1.raw -d /tmp/container2.raw",
> +            "dd conv=notrunc bs=1M count=32 seek=16 if=/dev/urandom of=/tmp/container1.raw",
> +            "zpool scrub -w pool",
> +            "sha256sum -c /tmp/urandom.sha256",
> +            "zpool status -v",
> +            "zpool export pool",
> +            "rm /tmp/container1.raw /tmp/container2.raw /tmp/urandom.sha256",
> +        ]:

Nitpick:

    cmds = [
        "nanana",
        "blabla"
    ]
    for cmd in cmds:
        self.assertRunOk(cmd, timeout=timeout)

Overall, quite some comments, but this is a complex package. So I am
still pretty happy with this first iteration. :-)

Regards,
Yann E. MORIN.

> +            self.assertRunOk(cmd, timeout=timeout)
> -- 
> 2.30.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
