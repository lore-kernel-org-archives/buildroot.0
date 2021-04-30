From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 30 Apr 2021 20:54:17 +0200
Subject: [Buildroot] [RFC PATCH 1/1] package/iproute2: bump version to
 5.12.0
In-Reply-To: <20210429192541.8530-1-petr.vorel@gmail.com>
References: <20210429192541.8530-1-petr.vorel@gmail.com>
Message-ID: <YIxSWTqVGoqYu0Pk@pevik>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

...
> ++++ b/lib/fs.c
> +@@ -30,6 +30,31 @@
> + /* if not already mounted cgroup2 is mounted here for iproute2's use */
> + #define MNT_CGRP2_PATH  "/var/run/cgroup2"
> +
> ++
> ++#if (!defined HAVE_NAME_TO_HANDLE_AT && !defined HAVE_OPEN_BY_HANDLE_AT)
> ++struct file_handle {
> ++	unsigned handle_bytes;
> ++	int handle_type;
> ++	unsigned char f_handle[];
> ++};
> ++#endif
> ++
> ++#ifndef HAVE_NAME_TO_HANDLE_AT
> ++int name_to_handle_at(int dirfd, const char *pathname,
> ++	struct file_handle *handle, int *mount_id, int flags)
> ++{
> ++	return syscall(name_to_handle_at, 5, dirfd, pathname, handle,
I overlooked wrong syscall number (should be __NR_name_to_handle_at)

> ++	               mount_id, flags);
> ++}
> ++#endif
> ++
> ++#ifndef HAVE_OPEN_BY_HANDLE_AT
> ++int open_by_handle_at(int mount_fd, struct file_handle *handle, int flags)
> ++{
> ++	return syscall(open_by_handle_at, 3, mount_fd, handle, flags);
And here __NR_open_by_handle_at

+ needed #include <sys/syscall.h>

This is also missing in v2 of the upstream patchset [1].
I suppose Heiko will send v3, but not sure if upstream even cares.
Maybe we'll have to carry until ve upgrade our toolchain.

Kind regards,
Petr

[2] https://lore.kernel.org/netdev/20210430062632.21304-1-heiko.thiery at gmail.com/#t
