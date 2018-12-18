From: Trent Piepho <tpiepho@impinj.com>
Date: Tue, 18 Dec 2018 22:55:00 +0000
Subject: [Buildroot] [PATCH] rauc: target rauc needs unsquashfs at
 runtime
In-Reply-To: <20181218225020.4ca03af4@windsurf>
References: <20181217221500.7317-1-tpiepho@impinj.com>
 <20181218225020.4ca03af4@windsurf>
Message-ID: <1545173700.22930.57.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2018-12-18 at 22:50 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 17 Dec 2018 22:15:19 +0000, Trent Piepho wrote:
> > In order to provide info about a bundle file, e.g. running "rauc info
> > bundle.raucb", rauc needs to use the unsquashfs progam from the squashfs
> > package.
> > 
> > This was not documented until upstream commit 10c501c12752 ("docs:
> > integration: document need for 'unsquashfs' tool for 'rauc info'"), but
> > is already present in rauc.
> > 
> > Signed-off-by: Trent Piepho <tpiepho@impinj.com>
> > ---
> >  package/rauc/Config.in | 1 +
> >  1 file changed, 1 insertion(+)
> 
> I am not familiar with rauc, so sorry for what is perhaps a silly
> question: is squashfs needed in all cases, or just for a certain bundle
> format, or certain use cases ?

The only bundle format they support uses squashfs.

To install a bundle on the target, rauc uses a loopback mount and the
kernel's squashfs support to get to the contents of the bundle.  But to
query a bundle file's metadata without installing it, it uses
unsquashfs.

So one could get by without unsquashfs if they were ok with certain
rauc features mysteriously not working.  There are no good error
messages when unsquashfs is not present.

Rauc doesn't have a feature to build without info support, so if one
doesn't have unsquashfs it really does build in a broken state.  You
can not use the broken parts, but that thinking could apply to just
about any runtime dependency.  It seems like pruning out non-optional
features is one of those things that shouldn't be a default.
