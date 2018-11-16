From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Nov 2018 15:15:36 +0100
Subject: [Buildroot] [PATCH next v4 3/6] Makefile: rework main directory
 creation logic
In-Reply-To: <CANQCQpaBS+vSiDngcmfBEJ4GCCKEqt0hXR=4upA2A=++-n-Bpg@mail.gmail.com>
References: <20181114105557.12599-1-thomas.petazzoni@bootlin.com>
 <20181114105557.12599-4-thomas.petazzoni@bootlin.com>
 <CANQCQpaBS+vSiDngcmfBEJ4GCCKEqt0hXR=4upA2A=++-n-Bpg@mail.gmail.com>
Message-ID: <20181116151536.666d593a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Matt,

Thanks for the feedback, and for testing the patch series.

On Thu, 15 Nov 2018 19:21:27 -0600, Matthew Weber wrote:

> > -# Populating the staging with the base directories is handled by the
> > skeleton package
> > -$(STAGING_DIR):
> > -	@mkdir -p $(STAGING_DIR)
> > -	@ln -snf $(STAGING_DIR) $(BASE_DIR)/staging
> > -  
> 
> With per package disabled, the staging directory never gets created
> early enough for packages to be able to reference content.
> Specifically I noticed docker couldn't find -lsystemd.  I'm assuming
> it's because of the new target dependency on target-post-image?

The STAGING_DIR itself is definitely created at the beginning of the
build, at the first package installing something into it.

However, with this patch, the $(BASE_DIR)/staging symlink indeed gets
created at the end of the build rather than at the beginning of the
build. However, this symlink is only a compatibility one. The code
should use $(STAGING_DIR) everywhere, which should not depend on this
"staging" compatibility symlink.

I've started a build here to reproduce the issue, but in general it
would be nice when you report issues to include an example defconfig
that exhibits the problem, as well as the build log. It would be a lot
easier to understand the specifics of the problem, and be able to
reproduce it.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
