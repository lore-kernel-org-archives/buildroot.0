From: Hai Zaar <haizaar@haizaar.com>
Date: Sun, 19 Oct 2008 02:37:10 +0200
Subject: [Buildroot] EABI broken on arm926t?
Message-ID: <76d9e2a30810181737u6987153fsb6509635312f5141@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Good day!
I'm building two weeks old buildroot snapshot for AT91SAM9260 board.

All I do it:
make at91sam9260dfc_defconfig
make menuconfig (select arm926t, EABI and remove games, etc...)
make

Results:
All kernels from 2.6.25 and later finish boot like this:
   VFS: Mounted root (ext2 filesystem).
   Freeing init memory: 128K
   Kernel panic - not syncing: Attempted to kill init!

The only kernel that worked is 2.6.24. After checking the kernel
config, I've found out that CONFIG_AEABI was not set (in spite of EABI
being selected in buildroot's config). Disabling EABI on later
kernels, (or enabling CONFIG_OABI_COMPAT) made them (almost)work.

Currently the situation is as follows:

EABI kernel + EABI rootfs = kernel panic (busibox's linuxrc dies)
EABI kernel + OABI rootfs = kernel panic (busibox's linuxrc dies)
OABI kernel + EABI rootfs = works, but some things like ping and nfs
return 'Illegal instruction'
EABI+OABI_COMPAT kernel + EABI rootfs = works, but some things like
ping and nfs return 'Illegal instruction'
EABI+OABI_COMPAT kernel + OABI rootfs = work correctly
OABI kernel + OABI rootfs = works correctly

1. Is EABI support broken for this platform in buildroot?
2. How can further investigate this issue?

-- 
Zaar
