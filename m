From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Tue, 15 Jul 2014 10:45:32 -0400
Subject: [Buildroot] [PATCH 1/1] Add a filesystem option so a device can
 be booted over NFS.
In-Reply-To: <1405430476-29925-1-git-send-email-sagaert.johan@skynet.be>
References: <1405430476-29925-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <CANxTyt6fmkYhRkES85MXWGEPwFc99r_Dioup8_Wds9hbh+WJNQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 15, 2014 at 9:21 AM, Sagaert Johan <sagaert.johan@skynet.be> wrote:
> +define ROOTFS_NFS_CMD
> +       rm -rf $(TARGET_ROOTFS_NFS_PATH) ;\
> +       mkdir -p  $(TARGET_ROOTFS_NFS_PATH) ;\
> +       cp -r $(TARGET_DIR)/* $(TARGET_ROOTFS_NFS_PATH)
> +endef
> +
> +$(eval $(call ROOTFS_TARGET,nfs))

As Baruch suggested, using "cp" for this purpose is no good.  Refer to
the buildroot manual and the warning file installed to the target dir:

http://buildroot.uclibc.org/downloads/manual/manual.html#_nfs_boot
http://git.buildroot.net/buildroot/tree/support/misc/target-dir-warning.txt

Instead, consider simply making a post-build script that does the
un-tar for you. Maybe something like this:

    #!/bin/sh

    NFSROOT=${NFS_SHARE:-/srv/my_nfsroot}

    mkdir -p $NFS_SHARE
    sudo tar -xavf ${BASE_DIR}/images.rootfs.tar -C $NFSROOT

(Not actually tested.)

Then no patch is needed.

Danomi -
