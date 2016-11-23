From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Wed, 23 Nov 2016 18:59:35 -0500
Subject: [Buildroot] [PATCH v3] pseudo-wrapper: fix console issue
In-Reply-To: <a4e40d0e-fa6d-cbc9-0eca-52827a006e91@mind.be>
References: <20161123173650.1740-1-gael.portay@savoirfairelinux.com>
 <20161123182843.GA3609@free.fr>
 <a4e40d0e-fa6d-cbc9-0eca-52827a006e91@mind.be>
Message-ID: <20161123235935.xhdfzufyezsxej5t@gportay>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This patch *should* be abandonned.

The issue has been fixed and mainlined by the Seebs (the maintainer of pseudo),
see commit d6eb2df3fe63b765f35d62332add4d0e4e9c6a39.

Now we can update the wrapper script to run:
exec "${0%/*}/pseudo" -S "${@}"

The -S argument tells server to shutdown and "waits" for the server to complete.

Seebs has picked up the solution proposed by Arnout. It uses the socket to
determine when the server has terminated. The socket is closed right before
exiting.

On Wed, Nov 23, 2016 at 10:47:26PM +0100, Arnout Vandecappelle wrote:
> 
> > 
> > So, the question is: are we sure the client will talk to the daemon that
> > we spawn?
> > If the answer is "yes, we're sure", then all is good; id the answer is
> > "no, we're not sure", then it's a problem...
> 
>  I don't think we're really sure, but I do believe that pseudo protects against
> this situation, i.e. when two servers start up concurrently, only one of them
> will really run. The problem is that the one that commits suicide may be the one
> that we start from the pseudo wrapper, so we end up wait'ing for the wrong pid.

There is a lock, thus only a single instance of a server could run.

> > 
> > Thoughts?
> > 
> > Now, my position on all this mess is :
> > 
> >   - we revert back to using fakeroot for 2016.11;
> 
>  Yeah, I think we need to do that. Too bad for the Fedora users.

Agree. Even if this issue can be easily fixed, it remains the issue reported by
Jerome.

Regards,
Gael
