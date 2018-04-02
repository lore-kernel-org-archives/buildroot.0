From: Trent Piepho <tpiepho@impinj.com>
Date: Mon, 2 Apr 2018 18:23:53 +0000
Subject: [Buildroot] [PATCH] skeleton-init-systemd: Work around for RO
 root /var/lib not populating
In-Reply-To: <20180331091022.GB25161@scaer>
References: <20180227221628.8283-1-tpiepho@impinj.com>
 <20180331091022.GB25161@scaer>
Message-ID: <1522693433.10662.300.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 2018-03-31 at 11:10 +0200, Yann E. MORIN wrote:
> On 2018-02-27 14:16 -0800, Trent Piepho spake thusly:
> > When using a RO root with systemd, it is intended that /var/lib should be
> > populated at boot time by tmpfiles system mirroring it from
> > /usr/share/factory/var/lib.
> > 
> > However, this will only happen if /var/lib does not already exist at the
> > time systemd-tmpfiles runs.  If it does exist, then tmpfiles will
> > (silently) skip it and do nothing.
> > 
> > It turns out /var/lib will exist, because some part of systemd creates
> > /var/lib/systemd/catalog on boot before tmpfiles runs.
> > 
> > The fix used here is to also create tmpfiles entries for the contents of
> > /var/lib/* and /var/lib/systemd/*.  This way, when those directories
> > already exist, the entire tree is not skipped and instead the
> > not-yet-existing contents of /var/lib and /var/lib/systemd will be still
> > be mirrored from the factory dir.
> > 
> > And if /var/lib/systemd, or a prefix of that, stops getting created and
> > does not exist, it'll still mirror properly.
> 
> I believe that we fixed that in another way with that commit:
> 
>     6e5df928539 package/skeleton-systemd: invert factory logic
> 
> As thus, I've marked this patch as rejected.
> 
> If your use-case is still not fixed, please re-send it.

This patch is already in master, do you intend to revert it?

It's still necessary as "invert factory logic" addressed a different
issue.

My patch address the issue that populating /var/lib from the factory
using only "C! /var/lib - - - -" will silently fail if anything in the
target boot process has created /var/lib before the above tmpfile.d
line is acted upon.  Which happens to be the case.

"invert factory logic" addresses the issue that relative symlinks must
be different if they are used while in /var vs /usr/share/factory/var,
yet the same symlinks were use in both locations.  It solves this by
not using the links from the factory location.  I had an earlier patch
to address this issue by making the links work from both locations.
