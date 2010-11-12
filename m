From: Malte Starostik <m-starostik@versanet.de>
Date: Fri, 12 Nov 2010 02:49:52 +0100
Subject: [Buildroot] new way to rebuld just the target root?
In-Reply-To: <20101112012744.GA8311@moomers.org>
References: <20101112005454.GZ8311@moomers.org>
	<20101112012744.GA8311@moomers.org>
Message-ID: <201011120250.52416.m-starostik@versanet.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Igor,

Am Freitag, 12. November 2010, 02:27:44 schrieb Igor Serebryany:
> addendum: i can see that packages often have a .stamp_target_installed
> file, and I wouldn't mind going through and deleting all of those, but
> how do i get the entire target directory re-created, including copying
> from skeleton?

I've added this rule to the toplevel Makefle:

clean-target:
        rm -rf $(TARGET_DIR) $(STAGING_DIR) $(STAMP_DIR) $(BUILD_DIR)/.root 
$(BUILD_DIR)/*/.stamp_target_installed $(BUILD_DIR)/*/.stamp_staging_installed 
$(BUILD_DIR)/linux-*/.stamp_installed $(BUILD_DIR)/*/.built

It removes the staging dir as well because that doesn't cost so much in terms 
of rebuild-time but keeps quite some problems away.  But it's most likely not 
complete, so I'm not going to post it as a patch.  Serves me quite well 
though.

HTH,
Malte

> 
> On Thu, Nov 11, 2010 at 06:54:54PM -0600, Igor Serebryany wrote:
> > hi,
> > 
> > 	i've asked this question before, but it seems the structure of the
> > 	buildroot output directories has changed since I last upgraded.
> > 	
> > 	using 2009.08, i would do the following to have buildroot rebuild
> > 	ONLY the target filesystem:
> > 	
> > 	* remove everything in project_build_*arch*/*myname*/autotools-stamps
> > 	* remove the project_build_*arch*/*myname*/root directory
> > 	* remove the project_build_*arch*/*myname*/.root file
> > 	
> > 	however, this directory structure doesn't exist anymore, and just
> > 	removing 'output/target' and 'output/staging' doesn't seem to
> > 	work/causes problems.
> > 	
> > 	is there a new way to rebuild JUST the target filesystem?
> > 
> > --igor
> > 
> > 
> > 
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
