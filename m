From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 19 Sep 2014 11:19:28 +0200
Subject: [Buildroot] [PATCH v2] Add support for Flattened Image Trees
In-Reply-To: <CAGm1_kuD=T4XoiEZG=yKDNq_FfoWkXe3k4da0=OVcpC3KbifYA@mail.gmail.com>
References: <1410981210-7788-1-git-send-email-yegorslists@googlemail.com>
 <c3bf0f66-d29d-4a77-930d-c33ac938368c@email.android.com>
 <CAGm1_ks=xwD4pm9aFF9AfKsFDeOhLPthkdx6BbLwY71z1e8TXg@mail.gmail.com>
 <CAAXf6LXtSvZQoJc0qibQhdCvS3XEECgMShr1tncrKduhTAsJGQ@mail.gmail.com>
 <CAGm1_ktxYNG99Vq+=tyhFyQqYuVE2==-psqRPh1Dp7H2aUgMJQ@mail.gmail.com>
 <81266ccf-e3d8-470e-9c94-4a63931a4fa2@email.android.com>
 <CAGm1_kvvNMcCgpZvS+YOxrnsQNHtCxt8Wd_0kprvTMS0zYXJFg@mail.gmail.com>
 <216395b4-20a8-400c-be86-87ec3f22ae14@email.android.com>
 <CAGm1_kuD=T4XoiEZG=yKDNq_FfoWkXe3k4da0=OVcpC3KbifYA@mail.gmail.com>
Message-ID: <CAAXf6LXQ+jsBRG=xGAmhcydPotvb62Pw337NJaX-yitJ0VNa0Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Sep 19, 2014 at 10:37 AM, Yegor Yefremov
<yegorslists@googlemail.com> wrote:

>
> Something like this?
>
> ################################################################################
> #
> # Build the FIT image
> #
> ################################################################################
>
> ROOTFS_FIT_DEPENDENCIES = host-uboot-tools
>
> ifeq ($(BR2_FIT_INSTALL_TARGET),y)
> define FIT_INSTALL_ITB_TARGET
>         mkdir -p $(TARGET_DIR)/boot/ && \
>         cp $(BINARIES_DIR)/$(basename $(notdir $(call
> qstrip,$(BR2_FIT_PATH)))).itb $(TARGET_DIR)/boot/
> endef
> else
> define FIT_INSTALL_ITB_TARGET
>         true
> endef
> endif
>
> define ROOTFS_FIT_CMD
>         cp $(BR2_FIT_PATH) $(BINARIES_DIR) && \
>         $(HOST_DIR)/usr/bin/mkimage -f $(BINARIES_DIR)/$(notdir $(call
> qstrip,$(BR2_FIT_PATH))) $(BINARIES_DIR)/$(basename $(notdir $(call
> qstrip,$(BR2_FIT_PATH)))).itb && \
>         $(FIT_INSTALL_ITB_TARGET)
> endef
>
> $(eval $(call ROOTFS_TARGET,fit))

Yes, exactly.

I don't yet see, as ThomasP also noticed, how this would work for
multiple files. I think you will need a foreach statement here and
there.

Regarding the automatic calculation of the .itb file, if multiple its
files are supported, one possible problem is where a user specifies
two .its files with the same name but in a separate directory. For
example

BR2_FIT_PATH="/tmp/foo/project.its /tmp/bar/project.its"

In this case, the .itb name will be calculated as
$(BINARIES_DIR)/project.itb for both source files.
Since handling this is not trivial in a common way, I would propose to
not handle it and document it in the help text as a limitation.

Regarding the implementation: I think it'd be more clear to calculate
the final ITS and ITB values (so after qstrip, basename,  etc.) in a
separate variable, so that the commands are easy to read and there is
less duplication.

Best regards,
Thomas
