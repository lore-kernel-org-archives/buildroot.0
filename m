From: Trent Piepho <tpiepho@impinj.com>
Date: Mon, 19 Mar 2018 16:30:52 +0000
Subject: [Buildroot] [PATCH 2/2] core/instrumentation: shave minutes off
 the build time
In-Reply-To: <6a793a6dba4f052ca8bbc35edd63df601f46478b.1521146096.git.yann.morin.1998@free.fr>
References: <cover.1521146096.git.yann.morin.1998@free.fr>
 <6a793a6dba4f052ca8bbc35edd63df601f46478b.1521146096.git.yann.morin.1998@free.fr>
Message-ID: <1521477052.10662.140.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2018-03-15 at 21:35 +0100, Yann E. MORIN wrote:
> Timings however speak for themselves, with this defconfig (slightly
> biggish-but-still-manageable build) [1].
> 
> host/      20965 files    1.2GiB
> staging/    4715 files    333MiB
> target/     1801 files     44MiB
> 
> All instrumentation steps, using md5:    19min 27s
> All instrumentation steps, using mtime:  14min 45s
> No instrumentation step at all:          14min 31s
> 
> So, using mtime is an almost-5min improvement, i.e. about 25% faster,
> while removing all instrumentation steps does not gain that much more...

After fixing s/L/l/, here are the timings for a 15 minute build:

configure                510.29
build                    166.12
extract                   45.53
other                     43.88
hostinstall               35.43
check_host_rpath          33.37
check_bin_arch            28.30
targetinstall             23.37
stageinstall              15.97
step_pkg_size              9.49

Without ccache, the build step would be somewhat longer.


> Now, we also change the way we handle symlinks. Previously, we would
> hash the file pointed to by the symlink. Now, we only look at the mtime
> of the symlink itself, which still detects modifications.

This patch also fixes a problem the previous system had w.r.t. broken
symlinks.  They did not show up as owned by any packages.  Now they are
owned by the package that creates the link.  It also means a package
that replaced a file which was linked to does not also appear,
incorrectly, to replace all the links as well.
