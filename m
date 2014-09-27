From: zooey at hirschkaefer.de <zooey@hirschkaefer.de>
Date: Sat, 27 Sep 2014 15:12:18 +0200
Subject: [Buildroot] [RFC 0/3] samba4: allow build of libsmbclient only
Message-ID: <1411823541-4953-1-git-send-email-zooey@hirschkaefer.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this set of patches is a first draft of allowing a separate build
of samba4's libsmbclient. Most of our devices don't need all of the
other samba servers and tools, so it seems a bit of a waste having
to build them all.

The first patch contains the naive attempt at implementing the separation.

However, it seems that samba4's build system gets confused when not all 
targets have been built, as it tries to install manpages along with 
libsmbclient which haven't been generated during the build phase. Patch 2
works around the problem by deactivating installation of manpages in general,
but as that is hardly acceptable, I wonder if anyone here has a better idea?

Patch 3 appies --disable-rpath-private-install in order to work around
another build problem, which is apparently caused by libsmbclient.inst.so (and
additional install libraries) to not have been created during the build phase.
Again, the solution proposed in the patch isn't a good one, as it basically 
means that samba4's private libraries are not being built with RPATH set, 
which is bound to cause problems at runtime (they won't be found by the 
runtime loader). As with patch 2, I'd be grateful for any hints at better
solutions.

Thanks for any input.

cheers,
    Oliver
