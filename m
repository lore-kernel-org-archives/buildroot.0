From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 31 Jan 2018 19:29:53 +0000
Subject: [Buildroot] [Bug 10536] Finding non-relative paths in the ccache
In-Reply-To: <bug-10536-163@https.bugs.busybox.net/>
References: <bug-10536-163@https.bugs.busybox.net/>
Message-ID: <bug-10536-163-g6m7BnUvHK@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10536

--- Comment #10 from Trent Piepho <tpiepho@gmail.com> ---
I seems like Arnout should be right about host compiles in different
directories not sharing ccache.  Since CCACHE_BASEDIR is not set, the paths
should be absolute and different directories would be a cache miss.

But here's some testing with host-uboot-tools.  First a build from a cleared
and reset ccache:
cache hit (direct)                     0
cache hit (preprocessed)               0
cache miss                            58
cache hit rate                      0.00 %
called for link                        8
cleanups performed                     0
files in cache                       171

As expected, all misses. 58 files.

Building again from the same output dir:
cache hit (direct)                    53
cache hit (preprocessed)               5
cache miss                            58
cache hit rate                     50.00 %
called for link                       16
cleanups performed                     0
files in cache                       176

Exactly 58 new hits, as expected, everything in cache.  But 5 new files, odd.

Now the tricky one, building from a different output dir:
cache hit (direct)                    53
cache hit (preprocessed)              15
cache miss                           106
cache hit rate                     39.08 %
called for link                       24
cleanups performed                     0
files in cache                       331

These should be all misses, right?  But there were 10 hits in preprocessed
mode!  Which is fair, if the preprocessed code ends up being exactly the same. 
But just because the c code is the same doesn't mean the auto-dependency file
is the same (absolute paths in the .d file differ!).  If ccache tries to use
the cached .d file with absolute paths on this supposed preprocessed hit, it
will fail.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
