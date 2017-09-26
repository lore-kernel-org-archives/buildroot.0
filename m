From: Alex Suykov <alex.suykov@gmail.com>
Date: Tue, 26 Sep 2017 16:11:50 +0300
Subject: [Buildroot] libatomic indirect symbols in musl systems
Message-ID: <20170926131150.GA8192@latitude.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Current configuration allows gcc to build libatomic with indirect symbols,
regardless of whether the chosen libc supports them:

    .../rootfs/lib/libatomic.so.1.2.0: ELF 64-bit LSB shared object,
    x86-64, version 1 (GNU/Linux), dynamically linked, stripped
    0000000000000000 A LIBATOMIC_1.0
    (...)
    0000000000002a9a T __atomic_exchange_1
    0000000000002f0d i __atomic_exchange_16
    0000000000002b98 T __atomic_exchange_2

Apparently musl ld cannot handle this kind of symbols:

    [12:19:46.700] Loading module '/usr/lib/weston/desktop-shell.so'
    [12:19:46.705] launching '/usr/libexec/weston-keyboard'
    [12:19:46.727] launching '/usr/libexec/weston-desktop-shell'
    Error relocating /lib/libatomic.so.1: __atomic_exchange_16: symbol not found
    Error relocating /lib/libatomic.so.1: __atomic_load_16: symbol not found
    (...)

The problem can be fixed with

    BR2_EXTRA_GCC_CONFIG_OPTIONS="--disable-gnu-indirect-function"

I have no idea how to handle it properly yet (force that option on all builds
with BR2_TOOLCHAIN_BUILDROOT_MUSL=y maybe?) so just reporting it in case anyone
stumbles upon the same issue.

weston is the only package affected in my build. Everything else (busybox etc)
works well. And there are no build-time warnings, it only shows up at runtime.


http://www.openwall.com/lists/musl/2015/11/17/9
Doesn't look like anything has changes since then.
