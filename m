From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Nov 2018 16:14:47 +0100
Subject: [Buildroot] [PATCH next v4 3/6] Makefile: rework main directory
 creation logic
In-Reply-To: <20181116151536.666d593a@windsurf>
References: <20181114105557.12599-1-thomas.petazzoni@bootlin.com>
 <20181114105557.12599-4-thomas.petazzoni@bootlin.com>
 <CANQCQpaBS+vSiDngcmfBEJ4GCCKEqt0hXR=4upA2A=++-n-Bpg@mail.gmail.com>
 <20181116151536.666d593a@windsurf>
Message-ID: <20181116161447.7632d0bd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 16 Nov 2018 15:15:36 +0100, Thomas Petazzoni wrote:

> On Thu, 15 Nov 2018 19:21:27 -0600, Matthew Weber wrote:
> 
> > > -# Populating the staging with the base directories is handled by the
> > > skeleton package
> > > -$(STAGING_DIR):
> > > -	@mkdir -p $(STAGING_DIR)
> > > -	@ln -snf $(STAGING_DIR) $(BASE_DIR)/staging
> > > -    
> > 
> > With per package disabled, the staging directory never gets created
> > early enough for packages to be able to reference content.
> > Specifically I noticed docker couldn't find -lsystemd.  I'm assuming
> > it's because of the new target dependency on target-post-image?  
> 
> The STAGING_DIR itself is definitely created at the beginning of the
> build, at the first package installing something into it.
> 
> However, with this patch, the $(BASE_DIR)/staging symlink indeed gets
> created at the end of the build rather than at the beginning of the
> build. However, this symlink is only a compatibility one. The code
> should use $(STAGING_DIR) everywhere, which should not depend on this
> "staging" compatibility symlink.
> 
> I've started a build here to reproduce the issue, but in general it
> would be nice when you report issues to include an example defconfig
> that exhibits the problem, as well as the build log. It would be a lot
> easier to understand the specifics of the problem, and be able to
> reproduce it.

FWIW, the following defconfig:

BR2_arm=y
BR2_cortex_a8=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM=y
BR2_INIT_SYSTEMD=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_DOCKER_ENGINE=y
# BR2_TARGET_ROOTFS_TAR is not set

with ppsh-v4, but BR2_PER_PACKAGE_FOLDERS disabled, builds just fine,
and dockerd is linked with libsystemd.

Could you give more details about the issue you're seeing ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
