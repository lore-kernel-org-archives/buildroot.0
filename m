From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Tue, 15 Jul 2014 18:29:00 +0200
Subject: [Buildroot] [PATCH 1/1] Add a filesystem option so a device can
	be booted over NFS.
In-Reply-To: <CANxTyt6fmkYhRkES85MXWGEPwFc99r_Dioup8_Wds9hbh+WJNQ@mail.gmail.com>
References: <1405430476-29925-1-git-send-email-sagaert.johan@skynet.be>
 <CANxTyt6fmkYhRkES85MXWGEPwFc99r_Dioup8_Wds9hbh+WJNQ@mail.gmail.com>
Message-ID: <BA017C088C5B444E90DF48EFA816C418@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 

-----Oorspronkelijk bericht-----
Van: Danomi Manchego [mailto:danomimanchego123 at gmail.com] 
Verzonden: dinsdag 15 juli 2014 16:46
Aan: Sagaert Johan
CC: buildroot
Onderwerp: Re: [Buildroot] [PATCH 1/1] Add a filesystem option so a device can be booted over NFS.

On Tue, Jul 15, 2014 at 9:21 AM, Sagaert Johan <sagaert.johan@skynet.be> wrote:
> +define ROOTFS_NFS_CMD
> +       rm -rf $(TARGET_ROOTFS_NFS_PATH) ;\
> +       mkdir -p  $(TARGET_ROOTFS_NFS_PATH) ;\
> +       cp -r $(TARGET_DIR)/* $(TARGET_ROOTFS_NFS_PATH) endef
> +
> +$(eval $(call ROOTFS_TARGET,nfs))

As Baruch suggested, using "cp" for this purpose is no good.  Refer to the buildroot manual and the warning file installed to the
target dir:

http://buildroot.uclibc.org/downloads/manual/manual.html#_nfs_boot
http://git.buildroot.net/buildroot/tree/support/misc/target-dir-warning.txt

>Instead, consider simply making a post-build script that does the un-tar for you. Maybe something like this:
>
>    #!/bin/sh
>
>    NFSROOT=${NFS_SHARE:-/srv/my_nfsroot}
>
>    mkdir -p $NFS_SHARE
>    sudo tar -xavf ${BASE_DIR}/images.rootfs.tar -C $NFSROOT

>(Not actually tested.)

>Then no patch is needed.
>Danomi -

Hi all

Right, until now I always used a post script that extracted the rootfs.tar.
So I tought I could integrate this into br.

And yes, I run linux in a vm and am to lazy to create a user and use sudo,
so on my virtual linux machine, I am always logged in as root.

Regards, Johan
