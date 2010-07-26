From: Maxime Petazzoni <maxime.petazzoni@bulix.org>
Date: Mon, 26 Jul 2010 10:47:53 +0200
Subject: [Buildroot] Re-implementing the spider/source-check targets
Message-ID: <20100726084752.GE21488@bulix.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

With my patch series to implement non-WGET downloads, I stubbed out the
spider and source-check targets since they didn't integrate very nicely
with the download mechanism anymore.

But we obviously need to bring these features back, so I wish to start a
quick discussion on what they are supposed to do.


As I understand it, the spider target downloads everything so that all
the tarballs are available for later use. This is useful too for
creating the BR2 backup site.

The source-check feature would be to only check that the remote source
is available. This is done with the wierdly named --spider option of
wget. For the VCS, we can use `{svn,git} ls` to check that the remote
repository is available and accessible.


Onto the implementation now. I think we should restrict the
implementation of these two features to GENTARGETS package, which would
hopefully help accelerate the migration of the remaining packages to the
new architecture (by the way is there a list of the packages still using
the "old system", to get an idea of which are left to update, and which
ones, so I can eventually contribute a few?).

The spider feature should be rather easy to implement: we just need
$(BUILD_DIR)/%/.stamp_downloaded for each package in the config.

For source-check, we need "checkers" for each download method. Then we
need a phony target (we don't want to create a stamp or anything here)
that'll dispatch to the checkers. I'm not sure how we want to show the
results, if we should fail on the first unavailable package source, etc.
Feedback/ideas here is very welcome!


Regards,
- Maxime

-- 
Maxime Petazzoni <http://www.bulix.org>
 ``One by one, the penguins took away my sanity.''
Linux kernel and software developer at MontaVista Software
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 198 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100726/8323a572/attachment-0001.pgp>
