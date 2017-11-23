From: John Keeping <john@metanate.com>
Date: Thu, 23 Nov 2017 12:26:31 +0000
Subject: [Buildroot] [PATCH] systemd: set time epoch for reproducible
 builds
In-Reply-To: <20171122221639.40f60340@windsurf.lan>
References: <20171116170316.19081-1-john@metanate.com>
 <20171122221639.40f60340@windsurf.lan>
Message-ID: <20171123122631.52e7378f.john@metanate.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 22 Nov 2017 22:16:39 +0100, Thomas Petazzoni wrote:

> On Thu, 16 Nov 2017 17:03:16 +0000, John Keeping wrote:
> > Systemd embeds a timestamp which is used to impose a minimum bound on
> > the system time during boot.  Normally this comes from stat'ing the NEWS
> > file included with the systemd source, but this makes the build
> > non-reproducible.  Pass in $SOURCE_DATE_EPOCH to use a deterministic
> > timestamp when reproducible builds are enabled.
> > 
> > Signed-off-by: John Keeping <john@metanate.com>
> > ---
> >  package/systemd/systemd.mk | 5 +++++
> >  1 file changed, 5 insertions(+)  
> 
> Following the feedback from Peter Korsgaard and myself, and the lack of
> additional justification, I've marked this patch as "Rejected" in our
> patch tracking system.
> 
> John: don't hesitate to get back to us with a more detailed explanation
> of the issue if you have not been convinced by Peter's explantion and
> mine.

I'm convinced!

The original problem I was investigating wasn't actually reproducible
builds, but was related to the time set by systemd when the hardware
clock has an invalid time.  It seems that e2fsck will update the
superblock timestamp when it is in the future, which means that
programming an ext4 filesystem image will trigger
systemd-fsck-root.service to attempt a reboot halfway through the first
boot.

I've solved this by setting options.broken_system_clock in e2fsck.conf,
but not before going down the root of trying to get systemd and the
rootfs to agree on a timestamp, which resulted in this patch to make the
timestamp included in systemd consistent with the rest of buildroot.
