From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 20 Nov 2018 16:08:42 -0600
Subject: [Buildroot] [PATCH next v4 3/6] Makefile: rework main directory
 creation logic
In-Reply-To: <20181116161447.7632d0bd@windsurf>
References: <20181114105557.12599-1-thomas.petazzoni@bootlin.com>
 <20181114105557.12599-4-thomas.petazzoni@bootlin.com>
 <CANQCQpaBS+vSiDngcmfBEJ4GCCKEqt0hXR=4upA2A=++-n-Bpg@mail.gmail.com>
 <20181116151536.666d593a@windsurf> <20181116161447.7632d0bd@windsurf>
Message-ID: <CANQCQpZ=nfbSoOYi9anZhQ8_y51qM1q2f3Uwvr0TQGaSOgh-QQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,


On Fri, Nov 16, 2018 at 9:14 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Fri, 16 Nov 2018 15:15:36 +0100, Thomas Petazzoni wrote:
>
> > On Thu, 15 Nov 2018 19:21:27 -0600, Matthew Weber wrote:
> >
> > > > -# Populating the staging with the base directories is handled by the
> > > > skeleton package
> > > > -$(STAGING_DIR):
> > > > - @mkdir -p $(STAGING_DIR)
> > > > - @ln -snf $(STAGING_DIR) $(BASE_DIR)/staging
> > > > -
> > >
> > > With per package disabled, the staging directory never gets created
> > > early enough for packages to be able to reference content.
> > > Specifically I noticed docker couldn't find -lsystemd.  I'm assuming
> > > it's because of the new target dependency on target-post-image?
> >
> > The STAGING_DIR itself is definitely created at the beginning of the
> > build, at the first package installing something into it.
> >
> > However, with this patch, the $(BASE_DIR)/staging symlink indeed gets
> > created at the end of the build rather than at the beginning of the
> > build. However, this symlink is only a compatibility one. The code
> > should use $(STAGING_DIR) everywhere, which should not depend on this
> > "staging" compatibility symlink.
> >
> > I've started a build here to reproduce the issue, but in general it
> > would be nice when you report issues to include an example defconfig
> > that exhibits the problem, as well as the build log. It would be a lot
> > easier to understand the specifics of the problem, and be able to
> > reproduce it.
>
> FWIW, the following defconfig:
>
> BR2_arm=y
> BR2_cortex_a8=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM=y
> BR2_INIT_SYSTEMD=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> BR2_PACKAGE_DOCKER_ENGINE=
> # BR2_TARGET_ROOTFS_TAR is not set

My testing was against next with ppsh-v4 applied.

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_INIT_SYSTEMD=y
BR2_PACKAGE_DOCKER_ENGINE=y
BR2_PACKAGE_DOCKER_ENGINE_STATIC_CLIENT=y
# BR2_TARGET_ROOTFS_TAR is not set

Looking at it a bit further, the  "go build" linking fails when the
BR2_PACKAGE_DOCKER_ENGINE_STATIC_CLIENT is set.  Since there is a
pending patch for the docker package, I built with the current "next"
that doesn't have [1] and also with it applied.  I observed that [1]
fixed the static client build.  When they broke out the client from
the daemon the linking approach must have changed.

I guess what I observed doesn't rule out a "go" linker issue.  I'll
see if I can get it to dump the link search path.

[1] https://patchwork.ozlabs.org/patch/994635/

Matt
