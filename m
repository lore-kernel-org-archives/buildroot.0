From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Nov 2012 15:49:20 +0100
Subject: [Buildroot] Global autoconf cache
In-Reply-To: <E1TYkqM-0001Xd-Jb@fencepost.gnu.org>
References: <E1TYkqM-0001Xd-Jb@fencepost.gnu.org>
Message-ID: <20121119154920.196323b2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Richard Stallman,

On Wed, 14 Nov 2012 16:49:58 -0500, Richard Stallman wrote:

> The global cache that autoconf formerly used was very good for
> efficiency of autoconf, especially when building lots of packages.
> Without that, it is slow.
> 
> I am told it had a problem: results depended on things such as
> compiler options, that varied from package to package, this suggests
> the idea of recording those in the cache, so that the cached results
> would be reused only when truly applicable.  Is this possible?
> 
>     > 2. There were common problems where "rm config.cache" was part of the
>     >    solution. E.g., run configure, it fails to detect som library needed
>     >    for som optional feature. You install the library and rerun
>     >    configure, and ten it still won't detect the library since the result
>     >    was cached. 
> 
> This problem could be fixed automatically by making the the package
> manager communicate with autoconf, to clear the cache whenever certain
> packages are installed.

In Buildroot [1], we had support to use an autoconf cache to speed up
the build. This autoconf cache was shared amongst packages, with the
idea that once a package has verified that such or such system feature
was available or not, it would be written in the cache, and subsequent
packages to be built would not have to do those tests again.

Unfortunately, we ran into several corner cases where some packages
were using the same autoconf variable name for tests that were mostly
the same, but not exactly, leading to the autoconf cache having a nasty
effect on the build of certain packages, if other packages built before
had "poisoned" the cache with somewhat invalid values.

I personally spent quite a significant amount of time fixing a few
configure.{ac,in} files in various packages, but in the end, we gave up
with this idea and no longer use the autoconf cache.

However, using the autoconf cache for successive rebuilds of the same
package should work.

Best regards,

Thomas


[1] A tool that automates the process of cross-compiling an embedded
    GNU/Linux system, http://www.buildroot.org.
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
