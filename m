From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Aug 2010 03:33:53 +0200
Subject: [Buildroot] Correct way to check for clock_gettime()
In-Reply-To: <AANLkTi=7t2kQXj96nktqEd=T3zDOvBXQDrjXW+u7FpG0@mail.gmail.com>
References: <20100730135118.45adcc67@surf>
	<AANLkTi=7t2kQXj96nktqEd=T3zDOvBXQDrjXW+u7FpG0@mail.gmail.com>
Message-ID: <20100802033353.281d9bc8@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Dave,

Thanks for your feedback!

On Fri, 30 Jul 2010 20:03:28 +0000
Dave Hart <davehart@gmail.com> wrote:

> Neither, I'm afraid.  On their own, both work correctly, including
> with a configuration cache file.  The error is in sharing the
> configuration cache across independently-maintained packages that are
> not designed to share a cache.  I think if you continue sharing the
> cache across independent packages, you will continue to expose
> problems like this over time.
> 
> I am sympathetic to your desire to share the cache.  I do test builds
> on some remarkably slow machines, including one which takes nearly 20
> minutes of configure runs for the NTP package (and its SNTP
> subpackage) without a primed cache.  I invested a good bit of work to
> make sure NTP's configure.ac files use the cache properly to ensure I
> can re-use caches over time, including adding a versioning mechanism
> to purge the cache automatically after a change invalidating old
> cached results.  I wish I had a better answer to offer, but I think
> you simply need to ensure the two packages are not sharing a cache,
> which means ensuring they are not nested under a common configure
> script, and invoking them with different --cache-file options.

Obviously, for Buildroot, the main advantage of cache files is if we
can share them between packages. A given package is rarely built twice.

However, the documentation of Autoconf seems to say quite the
oppositive than what you're saying. See
http://www.gnu.org/software/hello/manual/autoconf/Cache-Files.html,
which says:

"The site initialization script can specify a site-wide cache file to
use, instead of the usual per-program cache. In this case, the cache
file gradually accumulates information whenever someone runs a new
configure script. (Running configure merges the new cache results with
the existing cache file.) This may cause problems, however, if the
system configuration (e.g., the installed libraries or compilers)
changes and the stale cache file is not deleted."

So the ability of sharing the cache between execution of
different configure scripts is a documented feature. Is it just that in
reality it doesn't work that well ?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
