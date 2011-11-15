From: Michael S. Zick <minimod@morethan.org>
Date: Tue, 15 Nov 2011 17:28:40 -0600
Subject: [Buildroot] Report from the Buildroot Developer Day
In-Reply-To: <201111152217.08212.arnout@mind.be>
References: <20111102160349.4afe5935@skate> <201111152217.08212.arnout@mind.be>
Message-ID: <201111151728.43325.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue November 15 2011, Arnout Vandecappelle wrote:
> > ?* Ultimately, be able to generate binary packages (ipk or other
> > ? ?format) that can be installed on the target without re-generating a
> > ? ?new root filesystem image.
> 
> ?Now this, on the other hand, is still a useful addition. ?At least, if it 
> doesn't make the build system much more complicated to add it (you probably 
> need at least a per-package staging dir).
> 

Or,
A per-package filesystem layer.
Better than a per-package directory because the layered filesystem
would also 'capture' changes and deletions, not just additions.

The filesystem I have in mind as I write this, is auFS.

But,
The auFS filesystem isn't in the main-stream kernel, and requiring
a specially patched kernel (not all distros have an 'auFS' kernel)
would be too restrictive for general Buildroot usage.

And, the folks not running Buildroot on a Linux host would be
really left out in the cold.  ;-)

Hmm...
Then again,
It might be practical to support such an 'external' (user provided)
system with the only changes to main-stream Buildroot being a pair
of (normally empty) 'hooks' in the package install infrastructure.

The user could then provide (perhaps based on a Buildroot 'contrib'
tree submissions) the prolog and epilog functions/scripts needed.

In this sort of 'package building' infrastructure;

The 'PKG_INSTALL_INIT' hook ensures there is an empty/clean, R/W
top layer of the filesystem.

The 'PKG_INSTALL_FINAL' hook would examine the top layer (from
outside of the total stack mount point) - -
All of the newly added files will be __only__ on that clean layer;
All of the changed files will have been copied up (which can be detected);
All of the deleted files will have 'whiteouts' recorded in the layer.

Currently, JRO (auFS author) is considering adding a 'move down'
function to the file system, which would simplify going from the
"final" state of the prior package to the "init" state of the next
package somewhat simpler.

This way, the people who are running an auFS enabled kernel could
just set the 'hooks' to their extra packaging code;
everyone else could just ignore the new hooks with minimal impact.

Mike
