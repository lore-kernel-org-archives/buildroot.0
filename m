From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Sun, 8 May 2016 22:17:21 +0200
Subject: [Buildroot] [PATCH 04/34] reproducibility: make rootfs.tar
 reproducible
In-Reply-To: <8465e4e8-3c5b-13ac-ee57-552bceeaa768@mind.be>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <1462002570-14706-4-git-send-email-gilles.chanteperdrix@xenomai.org>
 <20160507152318.017bf013@free-electrons.com>
 <8465e4e8-3c5b-13ac-ee57-552bceeaa768@mind.be>
Message-ID: <20160508201721.GP13285@hermes.click-hack.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, May 07, 2016 at 09:51:36PM +0200, Arnout Vandecappelle wrote:
> On 05/07/16 15:23, Thomas Petazzoni wrote:
> > Hello,
> >
> > On Sat, 30 Apr 2016 09:49:00 +0200, Gilles Chanteperdrix wrote:
> >
> >> +define ROOTFS_TAR_CMD
> >> +	cd $(TARGET_DIR) && { \
> >> +		find . -\( -! -type d -o -empty -\) -print0 | \
> >> +		sort -z | \
> >> +		tar --null -T - -c$(TAR_OPTS)f $@ --mtime=@$(SOURCE_DATE_EPOCH) --numeric-owner; \
> >> +	}
> >
> > We normally write such constructs as:
> >
> > 	(cd $(TARGET_DIR) && \
> > 		foo ....)
> 
>   Actually, we don't AFAIK... In general, the parenthesis are not needed so they 
> should be removed. So also in this case it should be
> 
> 	cd $(TARGET_DIR);
> 		find ....
> 
> >
> > However, this raises the question of what's needed for all the other
> > filesystem formats. Will they all have to implement a different
> > ROOTFS_<foo>_CMD variable ? Or will there be some commonalities that
> > should be factored out in the common rootfs image infrastructure ?
> 
>   Yes, to me it makes more sense to do this in the actual target directory after 
> the post-build scripts have been run.

I do not understand what you mean. The aim of the command is to sort
the list of files passed to tar, it does not operate on the file
system.

Sorting is indeed needed for most other outputs I have tested (cpio,
isofs).

-- 
					    Gilles.
https://click-hack.org
