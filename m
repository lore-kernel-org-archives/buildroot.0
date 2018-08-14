From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Aug 2018 14:29:43 +0200
Subject: [Buildroot] [PATCH 1/1] support: git: Use git-archive to
 generate download tarball
In-Reply-To: <20180814120532.20077-1-andrew@aj.id.au>
References: <20180814120532.20077-1-andrew@aj.id.au>
Message-ID: <20180814142943.1278222d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Andrew,

On Tue, 14 Aug 2018 21:35:32 +0930, Andrew Jeffery wrote:
> Using tar's --transform option with the previously specified regex
> breaks relative symlinks, as the target path starts with the sequence
> './'. Avoid the need for --transform and indirectly generate a tar via
> `git archive` to preserve accuracy of archive content.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

See commit 3abd5ba4243489b821d44e407528020cd8a138f8
("support/download/git: do not use git archive, handle it manually")

    We currently use git-archive to generate the tarball. This is all handy
    and dandy, but git-archive does not support submodules. In the follow-up
    patch, we're going to handle submodules, so we would not be able to use
    git-archive.
    
    Instead, we manually generate the archive:
      - extract the tree to the requested cset,
      - get the date of the commit to store in the archive,
      - store only numeric owners,
      - store owner and group as 0 (zero, although any arbitrary value would
        have been fine, as long as it's a constant),
      - sort the files to store in the archive.
    
    We also get rid of the .git directory, because there is no reason to
    keep it in the context of Buildroot. Some people would love to keep it
    so as to speed up later downloads when updating a package, but that is
    not really doable. For example:
      - use current Buildroot
      - it would need foo-12345, so do a clone and keep the .git in the
        generated tarball
      - update Buildroot
      - it would need foo-98765
    For that second clone, how could we know we would have to first extract
    foo-12345 ? So, the .git in the archive is pretty much useless for
    Buildroot.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
