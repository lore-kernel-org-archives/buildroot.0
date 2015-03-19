From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 19 Mar 2015 23:57:22 +0100
Subject: [Buildroot] [PATCH 0/5] media image generation
In-Reply-To: <1426632719-4807-1-git-send-email-vivien.didelot@savoirfairelinux.com>
References: <1426632719-4807-1-git-send-email-vivien.didelot@savoirfairelinux.com>
Message-ID: <550B5452.8080401@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Vivien,

On 17/03/15 23:51, Vivien Didelot wrote:
> This patchset adds a minimal support to generate final images for a medium
> (such as SD card or flash), by providing paths to some genimage config files in
> a board directory.

 I agree with this idea, but I think the proposed implementation is still a bit
too ambitious.


> The rationale behind using genimage as the first medium image generation tool,
> is that while its configuration syntax is simple, it requires a small overhead
> to use, like temporary directories, host dependencies, and images path, that
> Buildroot is all aware of.
> 
> The first patch explains the convenience of this host tool, and adds the
> mechanism to wrap and call genimage against optional config file(s) specified
> in the board configuration, as well as the appropriate documentation.
> 
> The subsequent patches adds genimage config files for the following platforms:
> all Raspberry Pi models, BeagleBone Black, and the Wandboard.

 I think this would be the first thing to do: add genimage config files for
these boards, and use them in their respective post-build script.

 Then we can see if adding infrastructure to further support it is worthwhile. A
less invasive second step could be to put a genimage wrapper script in
support/scripts so that you don't need a new copy for every board.


> They give good examples to show how Buildroot can be used to create a fully
> functional SD card image with a bootloader, some firmware files and a
> persistent rootfs, without the need to mount any partition.
> 
> Finally, this support simplifies the user experience by providing ready-to-use
> boot medium images, and lightening board documentation with self documented
> configuration files.

 As part of that plan, I would remove the documentation from the readme (just
keep the reference to the website that explains it), and instead move it to the
configuration file.

> 
> Note: if we happen to include other media image generation tools, the
> BR2_TARGET_MEDIA_GENIMAGE_CFG and future options can then simply be moved to a
> "Media image generation --->" top-level menu.
> 
> Vivien Didelot (5):
>   Makefile: add media image generation
>   board/raspberrypi: install Device Tree
>   board/raspberrypi: add a genimage config
>   board/beaglebone: add a genimage config
>   board/wandboard: add a genimage config
> 
>  Makefile                              |  9 +++++++--
>  board/beaglebone/genimage.cfg         | 30 +++++++++++++++++++++++++++++
>  board/beaglebone/readme.txt           |  4 ++++
>  board/raspberrypi/genimage.cfg        | 32 +++++++++++++++++++++++++++++++
>  board/raspberrypi/post-image.sh       |  7 +++++++
>  board/raspberrypi/readme.txt          |  9 +++++++--
>  board/wandboard/genimage.cfg          | 22 +++++++++++++++++++++
>  board/wandboard/readme.txt            |  3 ++-
>  configs/beaglebone_defconfig          |  3 +++
>  configs/raspberrypi2_defconfig        |  6 ++++++
>  configs/raspberrypi_defconfig         |  5 +++++
>  configs/raspberrypi_dt_defconfig      |  6 ++++++
>  configs/wandboard_defconfig           |  1 +
>  docs/manual/customize-media-image.txt | 36 +++++++++++++++++++++++++++++++++++
>  docs/manual/customize.txt             |  4 ++++
>  support/media/genimage                | 23 ++++++++++++++++++++++
>  system/Config.in                      | 26 +++++++++++++++++++++++++
>  17 files changed, 221 insertions(+), 5 deletions(-)

 This diffstat speaks for itself: it's adding 220 lines of complexity :-)

 Regards,
 Arnout

>  create mode 100644 board/beaglebone/genimage.cfg
>  create mode 100644 board/raspberrypi/genimage.cfg
>  create mode 100755 board/raspberrypi/post-image.sh
>  create mode 100644 board/wandboard/genimage.cfg
>  create mode 100644 docs/manual/customize-media-image.txt
>  create mode 100755 support/media/genimage
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
