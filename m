From: Brett Stahlman <brettstahlman@gmail.com>
Date: Tue, 29 Aug 2017 17:19:52 -0500
Subject: [Buildroot] Buildroot linux kernel configuration confusion
Message-ID: <CAOyxqKmX1VPDxcj-m_2jj1WcbujtjS6DFAYqAWkf3nK1dPcxUw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've read the sections in the manual discussing linux kernel
configuration, and there are several points I on which I could use
clarification...

IIUC, BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG and
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE are a pair: when the former is set
(y), the latter is expected to point to a file that will be filled in
by either `make linux-menuconfig` or `make linux-update-defconfig`.
The documentation seems to suggest that the former will create, but
the latter merely updates an existing file. But where do the settings
come from? And when are these commands meant to be run? As part of a
normal build, or do I need to invoke manually only after making
changes to the configuration somehow?

I'm also a bit confused about BR2_LINUX_KERNEL_USE_DEFCONFIG and the
associated BR2_LINUX_KERNEL_DEFCONFIG. IIUC, the former enables the
feature, and the latter specifies a file that (in contrast to
BR2_LINUX_CUSTOM_CONFIG_FILE) is meant to be created manually by the
user, possibly using an arch-specific defconfig file as a starting
point. Correct so far? It appears to me that this file is used with
`scripts/kconfig/conf --defconfig` to generate an initial .config
file, and that this initial .config file is subsequently updated by a
call to merge_config.sh, which uses the settings in a "fragment file"
to override the defaults. Finally, I can see that there's a call to
`scripts/kconfig/conf --olddefconfig Kconfig`, which IIUC is meant to
allow user the option of overriding the defaults. But since this is
being run in a non-interactive build, I'm not sure what the purpose of
this call is...

Finally, I'm fuzzy on manual vs automatic updates of .config. I know
.config can be updated by commands like `make menuconfig`, which allow
the user to make changes interactively, but I can see that it's also
updated automatically by a standard buildroot `make all`. Once I've
updated the .config file, when will it be overwritten? I'm assuming it
shouldn't be overwritten by a standard make, provided that none of the
fragment files or defconfig files has changed. Correct?

Any big picture overview of the configuration mechanism would be
greatly appreciated...

Thanks,
Brett S.
