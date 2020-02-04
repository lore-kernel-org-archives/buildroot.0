From: Michael Drake <michael.drake@codethink.co.uk>
Date: Tue, 4 Feb 2020 11:06:11 +0000
Subject: [Buildroot] libcef: Approach for handling v8 snapshot builds
Message-ID: <f4a845a2-213a-ddcb-ca97-8e3b026951a6@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Previously we proposed a patch series adding libcef to Buildroot [0].
One of the complex parts of the build is that you build the a cut-down
browser (mksnapshot) for the host, as part of the build process to
capture the v8 context snapshot.  This is a JavaScript heap dump which
the target browser loads as an optimisation for opening new tabs.  Since
this is complicated and requires a lot of extra host packages, we split
this out into a config option.  Also, it was difficult to build for
32-bit, so we simply made the option only work for x86_64.

In the latest release of libcef, the v8 context snapshot is mandatory.
So it can't be an optional feature.  This has meant we have had to get
it working for ARM.

We have two solutions for this.

The first involves doing an initial build of the libcef package in a
32-bit container (which we would provide with the libcef package), with
a new option set, to tell the package to only generate the snapshot
artifacts.  These snapshot artifacts need to be stored on your
BR2_PRIMARY_SITE server.  Then, we can run the full Buildroot build in a
64-bit container, and the libcef package depends on a libcef-v8snapshot
package.  The libcef package builds as normal, building an inappropriate
64-bit mksnapshot, and then copies the pre-packaged 32-bit artifacts
over these 64-bit ones, and then proceeds to build the rest of the
browser. This requires several new Buildroot host packages in order to
build mksnapshot.

The second solution is a lot closer to upstream Chormium/CEF, which is
to run the Buildroot build inside a container with multi-lib host
packages installed.  Instead of depending on Buildroot host packages for
libraries, it would use the ones from the system.  This is necessary
because the Chromium/CEF build requires a 64-bit build machine, but the
mksnapshot step must be built for a 32-bit memory architecture.  This
means we need both 32 and 64 bit variants of host libraries, which is
achievable with system multi-lib packages, but not with Buildroot host
packages. We haven't tested this approach in buildroot, but the Chromium
documentation suggests it works. Since this requires a bigger host
system to bootstrap the libcef package, we would provide a suitable
variant of the `support/docker/Dockerfile` with required packages installed.

Which of these options is the most appropriate for Buildroot? We have a
working example for the first solution, which we intend to send soon.

[0] http://lists.busybox.net/pipermail/buildroot/2019-October/262977.html

-- 
Michael Drake                     https://www.codethink.co.uk/
