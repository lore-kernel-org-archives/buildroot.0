From: Trent Piepho <tpiepho@impinj.com>
Date: Sat, 10 Mar 2018 01:14:13 +0000
Subject: [Buildroot] Build time increase in 2018.02
Message-ID: <1520644453.25567.398.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We've seen a big increase in build time with the latest buildroot.  On
a vpshere instance, times have gone up from 45 minutes to 180+ minutes.
 I think there are some issues with poor vm performance that can be
addressed outside of buildroot, but even on a real Linux workstation,
there's been a significant increase in time.

Here's a breakdown of build time by task for a build that takes 26.5
minutes.  ccache is in use and is quite effectively decreasing the
compile time.  I've split out all the instrumentation steps so they can
be accounted separately from the rest of host-install, etc.  In this
list, host-install only includes the time spent executing the install
commands, not instrumentation or pre/post-hooks.

step_pkg_size        831.17
configure            441.77
build                149.56
extract               40.28
host-install          31.96
all other             27.78
check_host_rpath      20.86
check_bin_arch        20.77
target-install        19.84
stage-install         13.25

Finding the package sizes takes more time than everything else put
together.  And indeed, if I remove that step, check_bin_arch, and fake
out check-uniq-files, the build drops from 26.5 minutes to 12 minutes!

If we consider config+buid+extract+*-install to be the actual package
building and the rest overhead, then the build is about %56 overhead
and %44 building.  And most of the building time is (re-)running
autoconf scripts.

On the vsphere instance, the time is much much worse.  I'm still
waiting for numbers.  It takes hours.  I think the lousy vm filesystem
performance magnifies the problem.
