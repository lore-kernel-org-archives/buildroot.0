From: Trent Piepho <tpiepho@impinj.com>
Date: Tue, 20 Mar 2018 21:47:37 +0000
Subject: [Buildroot] [PATCH 2/2] core/instrumentation: shave minutes off
 the build time
In-Reply-To: <87o9jjltlh.fsf@dell.be.48ers.dk>
References: <cover.1521146096.git.yann.morin.1998@free.fr>
 <6a793a6dba4f052ca8bbc35edd63df601f46478b.1521146096.git.yann.morin.1998@free.fr>
 <1521477052.10662.140.camel@impinj.com> <20180319175010.0c26763b@windsurf>
 <87o9jjltlh.fsf@dell.be.48ers.dk>
Message-ID: <1521582457.10662.196.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2018-03-19 at 21:04 +0100, Peter Korsgaard wrote:
>  >> After fixing s/L/l/, here are the timings for a 15 minute build:
>  >> 
>  >> configure                510.29
>  >> build                    166.12
>  >> extract                   45.53
>  >> other                     43.88
>  >> hostinstall               35.43
>  >> check_host_rpath          33.37
>  >> check_bin_arch            28.30
>  >> targetinstall             23.37
>  >> stageinstall              15.97
>  >> step_pkg_size              9.49
> 
>  > Thanks for those measurements. I still find it a bit annoying that we
>  > spend 1m10sec on instrumentation related topics on a 15 minutes build.
>  > The use of ccache makes the build time lower than it normally is, and
>  > therefore makes the instrumentation cost even more visible, but using
>  > ccache is a valid use case.

Those times were on a decently speced native Linux workstation.  For a
slightly different build in a dockerized container on a vsphere VM
acting as a agent for a Bamboo CI process, I get this timings from a
total build of 33 minutes:

configure                786.48
build                    656.64
step_pkg_size             94.67
extract                   90.29
other                     87.05
postimage                 47.90
check_host_rpath          47.21
hostinstall               42.22
targetinstall             35.36
check_bin_arch            31.01
stageinstall              30.38
finalize                  20.72
download                  19.33

All sources were already downloaded, so the download time can be mostly
 attributed to re-checking the file hashes.  ccache hit rate is > 99%,
yet build time really is that slow even with ccache.  High cost of
random I/O on a VM I think.  Instrumentation is a bit less than 10% of
total build time.

I'll also point out the interesting cost of step_pkg_size vs
hostinstall.  One would think running "find" over the host tree would
be much faster than copying all those files into the host tree in first
place.  Yet it's not!  Likely because the hostinstall step copies each
file once, while step_pkg_size must stat each file about 60 times, once
for each host package.

If one had per-package install trees, then most of these per-package
instrumentation steps could be much faster by operating only on the
package's files instead of all previous packages' files as well.
