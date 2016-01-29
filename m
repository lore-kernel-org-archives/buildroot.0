From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Jan 2016 17:50:03 +0100
Subject: [Buildroot] [PATCH 1/1] configs/orangepi: Changing Linux kernel
	to v4.5-rc1
In-Reply-To: <1454077668-1021-1-git-send-email-echaudron@xiot.nl> (Eelco
 Chaudron's message of "Fri, 29 Jan 2016 15:27:48 +0100")
References: <1454077668-1021-1-git-send-email-echaudron@xiot.nl>
Message-ID: <87d1skmitg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Eelco" == Eelco Chaudron <echaudron@xiot.nl> writes:

 > Signed-off-by: Eelco Chaudron <echaudron@xiot.nl>
 > ---
 >  board/orangepi/orangepipc/post-image.sh | 8 +++++++-
 >  board/orangepi/orangepipc/readme.txt    | 4 ----
 >  configs/orangepipc_defconfig            | 8 ++++----
 >  3 files changed, 11 insertions(+), 9 deletions(-)

 > diff --git a/board/orangepi/orangepipc/post-image.sh b/board/orangepi/orangepipc/post-image.sh
 > index 9cca1b1..dbe1516 100755
 > --- a/board/orangepi/orangepipc/post-image.sh
 > +++ b/board/orangepi/orangepipc/post-image.sh
 > @@ -6,7 +6,13 @@ GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
 
 >  rm -rf "${GENIMAGE_TMP}"
 
 > -genimage                           \
 > +# As we now use the Linux v4.5-RC1 kernel no orangepi-pc dtb exists yet.
 > +# However the orangepi-plus dtb has not much content, only mmc0 and uart
 > +# which are equal to the pc version of the board, so we use it here.
 > +mv ${BINARIES_DIR}/sun8i-h3-orangepi-plus.dtb ${BINARIES_DIR}/sun8i-h3-orangepi-pc.dtb
 > +
 > +
 > +genimage                               \
 >  	--rootpath "${TARGET_DIR}"     \
 >  	--tmppath "${GENIMAGE_TMP}"    \
 >  	--inputpath "${BINARIES_DIR}"  \
 > diff --git a/board/orangepi/orangepipc/readme.txt b/board/orangepi/orangepipc/readme.txt
 > index 00845a4..f12c867 100644
 > --- a/board/orangepi/orangepipc/readme.txt
 > +++ b/board/orangepi/orangepipc/readme.txt
 > @@ -7,10 +7,6 @@ This default configuration will allow you to start experimenting with the
 >  buildroot environment for the OrangePi PC. With the current configuration
 >  it will bring-up the board, and allow access through the serial console.
 
 > -Unfortunately this boards processor is not yet supported by the
 > -mainline kernel, and therefore this default configuration is using a
 > -private Linux kernel repository based on 4.4-rc.
 > -
 >  How to build it
 >  ===============
 
 > diff --git a/configs/orangepipc_defconfig b/configs/orangepipc_defconfig
 > index 34358fb..79a7bd4 100644
 > --- a/configs/orangepipc_defconfig
 > +++ b/configs/orangepipc_defconfig
 > @@ -10,20 +10,20 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/orangepipc/post-build.sh"
 >  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/orangepi/orangepipc/post-image.sh"
 >  BR2_LINUX_KERNEL=y
 >  BR2_LINUX_KERNEL_CUSTOM_GIT=y
 > -BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/jwrdegoede/linux-sunxi.git"
 > -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="a516ac6dda21e6f5edceecd08b475b16e360656b"
 > +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git"
 > +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="v4.5-rc1"

We prefer to use tarballs when possible, so I've changed it to use the
4.5-rc1 tarball.

You also forgot to update the kernel headers to match.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
