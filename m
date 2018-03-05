From: Trent Piepho <tpiepho@impinj.com>
Date: Mon, 5 Mar 2018 18:55:10 +0000
Subject: [Buildroot] [PATCH 1/3] package/skeleton-init-systemd: work
 around for /var/lib not populating
In-Reply-To: <20180304202911.GA9484@scaer>
References: <cover.1520183159.git.yann.morin.1998@free.fr>
 <eecb0195cfda07450e00e2162febe5626bf079c0.1520183159.git.yann.morin.1998@free.fr>
 <20180304212433.781aaee7@windsurf.home> <20180304202911.GA9484@scaer>
Message-ID: <1520276110.25567.295.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 2018-03-04 at 21:29 +0100, Yann E. MORIN wrote:
> On 2018-03-04 21:24 +0100, Thomas Petazzoni spake thusly:
> > On Sun,  4 Mar 2018 18:06:15 +0100, Yann E. MORIN wrote:
> > > systemd-tmpfiles[148]: [/etc/tmpfiles.d/var-factory.conf:7] Duplicate line for path "/var/lib/systemd", ignoring.
> > > systemd-tmpfiles[148]: [/etc/tmpfiles.d/var-factory.conf:8] Duplicate line for path "/var/lib/systemd/coredump", ignoring.
> > > 
> > > But they can be ignored.
> > 
> > But annoying. Lots of people are going to wonder what's happening, and
> > find them bogus.
> 
> Yes, I have a few isdeas on how to fix them...

This indicates that there is another tmpfile.d line somewhere for the
same path.  In this case, they are in systemd.conf, part of systemd's
installed files.

One could just have the buildroot script avoid the lines for these
specific paths, but then what if systemd removes them from its
tmpfiles.d configuration?  Add in some fancy grep command to check a
path against /usr/lib/tmpfiles.d/* and see if it appears anywhere?

> > > IMHO, I think a better solution would be for systemd-tmpfiles to gain a
> > > "merge tree" operation that is like "C" but doesn't abort if the
> > 
> > What is "C" ? What is needed for this "better solution" ?
> 
>            Recursively copy a file or directory, if the destination
>            files or directories do not exist yet. Note that this command
>            will not descend into subdirectories if the destination
>            directory already exists. Instead, the entire copy operation
>            is skipped.

That last sentence is the problem.  It seems to me that merging the
source into the destination would be more useful.  So why wasn't that
done?  Maybe it ends up being a really bad idea for some reason that is
not obvious to me?  Or maybe the person who coded this originally
didn't need to merge directories and "do nothing" was an easy way to
avoid thinking about that problem?

So what would be needed is to convince the systemd guys that "merge
tree" should be added to tmpfiles and then have someone code it. 
Looking at the existing infrastructure in systemd for filesystem tree
ops, it seems like a lot of what is needed is there.  But clearly the
timeframe for that is much too long for the buildroot release at hand
now.

The thing I don't like the current situation is that the "create /var
tree" process needs to know each and every path in the /var that is
created on boot by something else.  If buildroot duplicates something
from elsewhere, we get those warnings.  If buildroot fails to account
for something that is elsewhere, the whole operation can stop working. 
Too fragile!
