From: Trent Piepho <tpiepho@impinj.com>
Date: Mon, 11 Mar 2019 21:59:03 +0000
Subject: [Buildroot] 2019.02 performance
Message-ID: <1552341542.7410.20.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With 2018.02, I had to disable the package size and related hooks as
they were too slow: over half the build time.  As I'm sure some
remember, there was a thread about it and performance was
improved.  Here's the results with 2019.02.  I'm using a real config
for a product we have and testing on a reasonably modern native Linux
workstation with a decent NVMe SSD and a four core processor.  Using
ccache, which had already built the software.

Total build time: real 22:53, CPU 39:04.

Breakdown by build step (host/stage/target/images mean install same),
across all packages:

configure                666.223
build                    381.480
host                     122.191
extract                   57.489
target                    57.039
stage                     28.356
patch                      9.711
postimage                  9.008
finalize                   6.396
images                     0.063
download                   0.022


The single threaded configure and cmake scripts remain the killer,
through total of all install steps is about 2/3 of the build step time.

Breakdown for the global instrumentation hooks, across all packages and
build steps:

check_host_rpath          64.345
step_pkg_size             32.992
check_bin_arch            26.286
step_check_build_dir       8.365
step_time                  7.895

pkg_size is much more reasonable now.  In total, these are about 10.2%
of the total build time.

Next are benchmarks from a cloud VM, which is considerably slower.

Total build time: Real 53:58, CPU 55:22

configure               1021.933
build                    936.449
host                     206.171
extract                  106.642
target                    98.028
stage                     53.747
finalize                  40.840
download                  25.091
postimage                 22.876
patch                     19.153
images                     0.119

The GIH breakdown:

check_host_rpath         117.981
step_pkg_size             49.881
check_bin_arch            46.035
step_time                 12.573
step_check_build_dir       9.307

About 7.2% of total build time.
