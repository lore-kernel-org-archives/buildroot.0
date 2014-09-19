From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 19 Sep 2014 13:02:05 +0200
Subject: [Buildroot] [PATCH v2] Add support for Flattened Image Trees
In-Reply-To: <20140919120057.06ef721b@free-electrons.com>
References: <1410981210-7788-1-git-send-email-yegorslists@googlemail.com>
 <c3bf0f66-d29d-4a77-930d-c33ac938368c@email.android.com>
 <CAGm1_ks=xwD4pm9aFF9AfKsFDeOhLPthkdx6BbLwY71z1e8TXg@mail.gmail.com>
 <CAAXf6LXtSvZQoJc0qibQhdCvS3XEECgMShr1tncrKduhTAsJGQ@mail.gmail.com>
 <CAGm1_ktxYNG99Vq+=tyhFyQqYuVE2==-psqRPh1Dp7H2aUgMJQ@mail.gmail.com>
 <81266ccf-e3d8-470e-9c94-4a63931a4fa2@email.android.com>
 <CAGm1_kvvNMcCgpZvS+YOxrnsQNHtCxt8Wd_0kprvTMS0zYXJFg@mail.gmail.com>
 <216395b4-20a8-400c-be86-87ec3f22ae14@email.android.com>
 <CAGm1_kuD=T4XoiEZG=yKDNq_FfoWkXe3k4da0=OVcpC3KbifYA@mail.gmail.com>
 <CAAXf6LXQ+jsBRG=xGAmhcydPotvb62Pw337NJaX-yitJ0VNa0Q@mail.gmail.com>
 <20140919120057.06ef721b@free-electrons.com>
Message-ID: <CAGm1_ksbRQ=8qWmM1YfnN+y9bpWEC8kvMrWdt-FeqMN_a_km7w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Sep 19, 2014 at 12:00 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Fri, 19 Sep 2014 11:19:28 +0200, Thomas De Schampheleire wrote:
>
>> Regarding the implementation: I think it'd be more clear to calculate
>> the final ITS and ITB values (so after qstrip, basename,  etc.) in a
>> separate variable, so that the commands are easy to read and there is
>> less duplication.
>
> I think that's exactly what I did in the prototype code I sent to
> Yegor, but apparently, he didn't use it...

I think I drunk not enough coffee today :-) I've added foreach, but
haven't tested it with multiple source files. Will integrate your
example too. I must deal with some real life stuff today, so I'll
answer all questions next week. Thanks for helping.

################################################################################
#
# Build the FIT image
#
################################################################################

ROOTFS_FIT_DEPENDENCIES = host-uboot-tools

FIT_SRCS = $(BINARIES_DIR)/$(notdir $(call qstrip,$(BR2_FIT_PATH)))
FIT_BLOBS = $(BINARIES_DIR)/$(basename $(notdir $(call
qstrip,$(BR2_FIT_PATH)))).itb

ifeq ($(BR2_FIT_INSTALL_TARGET),y)
define FIT_INSTALL_ITB_TARGET
        mkdir -p $(TARGET_DIR)/boot/ && \
        cp $(FIT_BLOBS) $(TARGET_DIR)/boot/
endef
else
define FIT_INSTALL_ITB_TARGET
        true
endef
endif

define ROOTFS_FIT_CMD
        cp $(BR2_FIT_PATH) $(BINARIES_DIR) && \
        $(foreach its,$(FIT_SRCS),$(HOST_DIR)/usr/bin/mkimage -f
$(its) $(basename $(its)).itb) && \
        $(FIT_INSTALL_ITB_TARGET)
endef

$(eval $(call ROOTFS_TARGET,fit))

Yegor
