Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D887CC43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 19:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BAB283EC0;
	Sun, 24 Jul 2022 19:05:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BAB283EC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jBelzDOVm5ay; Sun, 24 Jul 2022 19:05:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60CC282B81;
	Sun, 24 Jul 2022 19:05:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60CC282B81
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 62BAC1BF964
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 19:04:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C121408C9
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 19:04:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C121408C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id akYrB2smt1gS for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 19:04:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05799401A3
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 05799401A3
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 19:04:52 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id c22so5620945wmr.2
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 12:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=B4Kd27nOwhSFqyytw8jV1kTCvO2gmm3XpQgdwRQaAJs=;
 b=GteTe7CSd9tUtRLxZw+tPeAf/+lJOqNyNpdmyXnMx5jaO51MFLwdJPyzFhgdwXNqTf
 /FJSFDRIgEPp+znO45F5ukgXYqjKdvNZDTxzBEJ1h8HYVgbhqxrU9Ao+BU6nEfK7obRl
 VS+K92uoW9WPPu+irEcPD+Zbx6SUxbT+67QsMscE/1CyQtbgjc50jYWWaGkMe8GpytL+
 EwDXZw+fUsIYWa0S7v7sc2G2NO1LBx6AK2fOeLDRO+57v90b5bvTDUmpBrr29rGlLM7G
 2nsyAAdoEYLmUwLIdemUq2cEaagutXAye8wLVeVCQ6AWr0OQm1sNpHJEJzeR09mYS+TG
 hKGg==
X-Gm-Message-State: AJIora8/UXjkoJGRl+487ApD+J9liFx58X9jjQyOeWOvceIp5uSrDBnc
 8dUVvVd2+cZP3y57H8EMTRi0EA==
X-Google-Smtp-Source: AGRyM1vnvgJGu8w8QIHfWm2Auib1OtR9MiJaDmbM7JplNJAQ8Z5ygLYNGSfC91e6vNWRzXEkve2PNQ==
X-Received: by 2002:a05:600c:2d09:b0:3a3:1062:ce61 with SMTP id
 x9-20020a05600c2d0900b003a31062ce61mr6329040wmf.138.1658689490688; 
 Sun, 24 Jul 2022 12:04:50 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 y7-20020adfe6c7000000b0021e4f595590sm10196672wrm.28.2022.07.24.12.04.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 12:04:50 -0700 (PDT)
Message-ID: <1f518c0a-be68-994d-113b-65dfe9ce28ad@mind.be>
Date: Sun, 24 Jul 2022 21:04:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
References: <20220106144301.1022644-1-romain.naour@smile.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220106144301.1022644-1-romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=B4Kd27nOwhSFqyytw8jV1kTCvO2gmm3XpQgdwRQaAJs=;
 b=f/bRAzlionlAkdLsHcFhBbzdsc+CxjB3Pr40F+BxRHxpZdgBG0A0Eo3ZE9IIWeK58y
 Zr1jgtnaJil67jtZ/xNdtmmcMUAePUrAB+E3YB61gcGJNhcCmtFSwQCwdyDvGvJwYvXr
 ZVyvhc6WSHLzWIEqyRcgsQhZ6TLTOke5MCof7qN5VhExgEkKVp0vZEnJfvXrDsA2la/c
 Vu5B2GKk901lYyfWsOeErsYCaO+fyl1UnNWD+3F1qM0/+4/775F2TspbyMDNJeByjLrx
 OSXZj9PhIUZ1nTPg9YW668kyd7USMi8hD/SW3RWLrR8Nh3yaHhmWQUT3Hj2+mzTlz16t
 4uUg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=f/bRAzli
Subject: Re: [Buildroot] [PATCHv6] board/mender: add a mender board example
 configuration.
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Mikael Bourhis-Cloarec <mikael.bourhis@smile.fr>,
 Adam Duskett <Aduskett@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Adam, all,

  I applied to master with some changes, and I have some more concerns/remarks 
as well. Please read on. Also it would be good to re-review what I committed, 
perhaps.

On 06/01/2022 15:43, Romain Naour wrote:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> Buildroot currently has all of the needed packages to use Mender as the primary
> update system. However, there isn't any documentation or examples now that
> provide a starting point for users. This lack of documentation makes setting up
> a Mender based update system difficult and time-consuming.
> 
> Provided in this patch series is a mender_x86_64_efi_defconfig of which sets up
> an x86_64 EFI based build that is ready to flash to a USB pen drive or use in a
> QEMU environment. The system partition schema comprises of two equally sized
> root partitions and a data partition that mounts to /var/lib/mender as a
> persistent data store partition.
> 
> There is a board/mender/readme.txt provided, which gives users documentation on
> how to flash the built image or boot the image using QEMU as well.
> 
> The post-build and post-image-efi scripts also have four options:
> -a --artifact-name:
>    - The name of the artifact, this is added to /etc/mender/artifact_info
> -o --data-part-size:
>    - The data partition size.
> -d --device-type
>    - The device-type used by mender to catagorize registered devices.
> -g --generate-mender-image
>    - Set to true to generate a mender image after a build.

  Why is this optional? Don't you always want both the disk image for production 
and the mender image for updates? At least, that's how I configure things in my 
own projects... In fact, if anything is optional it would be the disk image.

  Therefore, I removed this option entirely and always create the artifact.

> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> Signed-off-by: Mikael Bourhis-Cloarec <mikael.bourhis@smile.fr>
> [Romain: rebase on master (01.2022)
>    - update genimage-efi.cfg to use GPT partition table and genimage-15 syntax
>    - bump the kernel to 5.15.13
>    - Add host-libelf kernel dependency
>    - Use BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI after commit 82d1e8c628cc
>      (boot/grub2: use none platform when building for host)
>    - Add regexp grub mandatory module for mender-grubenv
>    - remove startup.nsh from genimage-efi.cfg after commit 3efb5e31fc05
>      (board, boot, package: remove usage of startup.nsh in EFI partition)]
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

[snip]
> diff --git a/board/mender/x86_64/genimage-efi.cfg b/board/mender/x86_64/genimage-efi.cfg
> new file mode 100644
> index 0000000000..73102d5c30
> --- /dev/null
> +++ b/board/mender/x86_64/genimage-efi.cfg
> @@ -0,0 +1,44 @@
> +image efi-part.vfat {
> +	vfat {
> +		file EFI {
> +			image = "efi-part/EFI"
> +		}
> +		file bzImage {
> +			image = "bzImage"
> +		}
> +	}
> +
> +	size = 16777216

  We abbreviate these things, i.e. 16M.

> +}
> +
> +image disk.img {
> +	hdimage {
> +		partition-table-type = "gpt"
> +	}
> +
> +	partition boot {
> +		partition-type-uuid = c12a7328-f81f-11d2-ba4b-00a0c93ec93b

  We use abbreviations now, i.e. "U".

> +		offset = 32768
> +		size = 16777216

  Explicit size is not needed, it's implicit from the size of the file.

> +		image = "efi-part.vfat"
> +		bootable = true
> +	}
> +
> +	partition roota {
> +		partition-type-uuid = 4F68BCE3-E8CD-4DB1-96E7-FBCAF984B709

  Note that there's no abbreviation for the systemd-defined GUIDs.

> +		offset = 16809984

  Offset is implied by the previous partitions.

> +		image = "rootfs.ext2"
> +	}
> +
> +	partition rootb {
> +		partition-type-uuid = 4F68BCE3-E8CD-4DB1-96E7-FBCAF984B709
> +		offset = 151027712
> +		image = "rootfs.ext2"
> +	}
> +
> +	partition data {
> +		partition-type-uuid = 4F68BCE3-E8CD-4DB1-96E7-FBCAF984B709

  This GUID is for root filesystems only. For a data partition, it should be the 
generic Linux GUID, i.e. "L".

> +		offset = 285245440
> +		image = "data-part.ext4"
> +	}
> +}
[snip]
> diff --git a/board/mender/x86_64/mender_grubenv_defines b/board/mender/x86_64/mender_grubenv_defines
> new file mode 100644
> index 0000000000..77f68fe6b2
> --- /dev/null
> +++ b/board/mender/x86_64/mender_grubenv_defines
> @@ -0,0 +1,25 @@
> +################################################################################
> +# Mandatory
> +################################################################################
> +# Warning: This file is an example and should be customized to fit your needs!

  I think this is just copied from the example in mender itself? Shouldn't this 
warning be removed?

> +
> +# Partition index of root filesystem A
> +mender_rootfsa_part=2
> +
> +# Partition index of root filesystem B
> +mender_rootfsb_part=3
> +
> +# Device file corresponding to the root filesystem partitions, without index.
> +mender_kernel_root_base=/dev/vda

  I think that this is the only one that should be changed? Perhaps it's better 
ot put this in the beginning then.

> +
> +# Name of the storage device containing root filesystem partitions in GRUB
> +# format.
> +mender_grub_storage_device=hd0
> +
> +# Type of kernel (bzImage or zImage)
> +kernel_imagetype=bzImage
> +
> +# Type of initrd image.
> +# Note: An initrd image is not strictly necessary, and the system will boot and
> +#       update without a initrd image.
> +# initrd_imagetype=initrd.img

  Since we don't support an initrd, I think this should be removed entirely from 
the file.

> diff --git a/board/mender/x86_64/overlay/etc/fstab b/board/mender/x86_64/overlay/etc/fstab
> new file mode 100644
> index 0000000000..45a7ba0260
> --- /dev/null
> +++ b/board/mender/x86_64/overlay/etc/fstab
> @@ -0,0 +1,7 @@
> +# <file system>     <mount pt>      <type>      <options>                               <dump>  <pass>
> +/dev/root           /               ext4        rw,noauto                                   0    1
> +/dev/vda1           /boot           vfat        defaults                                    0    0
> +/dev/vda4           /var/lib/mender ext4        rw,relatime                                 0    0

  These two need to be adapted as well if the boot device is not /dev/vda. That 
issue can be avoided (I think) by putting LABEL=... here. It should work both 
for the EFI and the data partition (if genimage is updated to include a label, 
obviously).

> +proc                /proc           proc        defaults                                    0    0
> +devpts              /dev/pts        devpts      defaults,gid=5,mode=620,ptmxmode=0666       0    0
> +sysfs               /sys            sysfs       defaults                                    0    0
> diff --git a/board/mender/x86_64/overlay/etc/mender/mender.conf b/board/mender/x86_64/overlay/etc/mender/mender.conf
> new file mode 100644
> index 0000000000..5f423fb2cb
> --- /dev/null
> +++ b/board/mender/x86_64/overlay/etc/mender/mender.conf
> @@ -0,0 +1,11 @@
> +{
> +  "InventoryPollIntervalSeconds": 1800,
> +  "UpdatePollIntervalSeconds": 1800,
> +  "RetryPollIntervalSeconds": 300,
> +  "RootfsPartA": "/dev/vda2",
> +  "RootfsPartB": "/dev/vda3",

  This will need to be customized as well. I don't know if there is a way to do 
it automatically.

> +  "ServerCertificate": "/etc/mender/server.crt",

  Doesn't this file need to be installed or something?

> +  "ServerURL": "https://docker.mender.io",

  I don't know anything about member, so I typed "mender client" in the booted 
qemu image, and it was proposing an entirely different URL...

> +  "TenantToken": "dummy",
> +  "DeviceTypeFile": "/etc/mender/device_type"
> +}
> diff --git a/board/mender/x86_64/post-build.sh b/board/mender/x86_64/post-build.sh
> new file mode 100755
> index 0000000000..e93a3cb1c2
> --- /dev/null
> +++ b/board/mender/x86_64/post-build.sh

  Both scripts were full of shellcheck warnings, so I fixed those. There was 
also a bunch of inconsistent indentation.

> @@ -0,0 +1,54 @@
> +#!/usr/bin/env bash
> +set -e
> +DEVICE_TYPE="buildroot-x86_64"
> +ARTIFACT_NAME="1.0"
> +
> +function parse_args(){

  We usually use

parse_args() {

but in one place we use the bashism

function parse_args {

so I converted everything to that syntax.

> +    local o O opts
> +    o='a:o:d:g:'
> +    O='artifact-name:,data-part-size:,device-type:,generate-mender-image:'
> +    opts="$(getopt -n "${my_name}" -o "${o}" -l "${O}" -- "${@}")"

  my_name is not defined, so the program name will be just empty... So I just 
removed the -n option.

> +    eval set -- "${opts}"
> +    while [ ${#} -gt 0 ]; do
> +        case "${1}" in
> +        (-o|--data-part-size)
> +            DATA_PART_SIZE="${2}"; shift 2

  DATA_PART_SIZE is not used. The handling is still needed to make sure that 
"shift 2" is done. So I just replaced the assignment with a comment.

> +            ;;
> +        (-d|--device-type)
> +            DEVICE_TYPE="${2}"; shift 2
> +            ;;
> +        (-g|--generate-mender-image)
> +            GENERATE_MENDER_IMAGE="${2}"; shift 2
> +            ;;
> +        (-a|--artifact-name)
> +            ARTIFACT_NAME="${2}"; shift 2
> +            ;;
> +        (--)
> +            shift; break
> +            ;;
> +        esac
> +    done
> +}
> +
> +  # Create a persistent directory to mount the data partition at.
> +function mender_fixup(){
> +  cd ${TARGET_DIR}

  I changed this into pushd/popd, otherwise the changed directory is visible to 
the caller of this function.

> +  if [[ -L var/lib/mender ]]; then
> +    rm var/lib/mender
> +    mkdir -p var/lib/mender
> +  fi
> +
> +  # The common paradigm is to have the persistent data volume at /data for mender.
> +  if [[ ! -L data ]]; then
> +      ln -s var/lib/mender data
> +  fi
> +}
> +
> +function main(){
> +  parse_args "${@}"
> +  mender_fixup
> +  echo "device_type=${DEVICE_TYPE}" > ${TARGET_DIR}/etc/mender/device_type
> +  echo "artifact_name=${ARTIFACT_NAME}" > ${TARGET_DIR}/etc/mender/artifact_info
> +}
> +
> +main "${@}"
> diff --git a/board/mender/x86_64/post-image-efi.sh b/board/mender/x86_64/post-image-efi.sh
> new file mode 100755
> index 0000000000..2d3e36e614
> --- /dev/null
> +++ b/board/mender/x86_64/post-image-efi.sh
> @@ -0,0 +1,84 @@
> +#!/usr/bin/env bash
> +set -e
> +BOARD_DIR="$(realpath $(dirname $0))"
> +GENIMAGE_CFG="${BOARD_DIR}/genimage-efi.cfg"
> +DATA_PART_SIZE="32M"
> +DEVICE_TYPE="buildroot-x86_64"
> +GENERATE_MENDER_IMAGE="false"
> +ARTIFACT_NAME="1.0"
> +
> +
> +# Parse arguments.
> +function parse_args(){
> +    local o O opts
> +    o='a:o:d:g:'
> +    O='artifact-name:,data-part-size:,device-type:,generate-mender-image:'
> +    opts="$(getopt -n "${my_name}" -o "${o}" -l "${O}" -- "${@}")"
> +    eval set -- "${opts}"
> +    while [ ${#} -gt 0 ]; do
> +        case "${1}" in
> +        (-o|--data-part-size)
> +            DATA_PART_SIZE="${2}"; shift 2
> +            ;;
> +        (-d|--device-type)
> +            DEVICE_TYPE="${2}"; shift 2
> +            ;;
> +        (-g|--generate-mender-image)
> +            GENERATE_MENDER_IMAGE="${2}"; shift 2
> +            ;;
> +        (-a|--artifact-name)
> +            ARTIFACT_NAME="${2}"; shift 2
> +            ;;
> +        (--)
> +            shift; break
> +            ;;
> +        esac
> +    done
> +}
> +
> +# Create the data partition
> +function make_data_partition(){
> +    rm -rf ${BINARIES_DIR}/data-part.ext4
> +    rm -rf ${BINARIES_DIR}/data-part
> +    mkdir -p ${BINARIES_DIR}/data-part

  Since this is just empty, I removed the data-part directory and just created 
it without -d option.

  I think that because of that I needed to add -F to force it. Or otherwise it 
was because the output file existed already, or something.

> +
> +    ${HOST_DIR}/sbin/mkfs.ext4 \

  Since this is already at the front of PATH, I just removed the full path.

> +    -d ${BINARIES_DIR}/data-part \
> +    -r 1 \
> +    -N 0 \
> +    -m 5 \
> +    -L "data" \
> +    -O ^64bit ${BINARIES_DIR}/data-part.ext4 "${DATA_PART_SIZE}"

  -O ^64bit was added to our defaults because U-Boot pre-2017.04 didn't support 
64-bit images. U-Boot doesn't need to read this partition, so I removed the option.

> +    ${HOST_DIR}/sbin/e2fsck -y ${BINARIES_DIR}/data-part.ext4

  AFAICS there's no reason to run e2fsck, so I removed this.

> +}
> +
> +
> +# Create a mender image.
> +function generate_mender_image(){
> +  if [[ ${GENERATE_MENDER_IMAGE} == "true" ]]; then
> +    echo "Creating ${BINARIES_DIR}/${DEVICE_TYPE}-${ARTIFACT_NAME}.mender"
> +    ${HOST_DIR}/bin/mender-artifact \
> +      --compression lzma \
> +      write rootfs-image \
> +      -t ${DEVICE_TYPE} \
> +      -n ${BR2_VERSION} \
> +      -f ${BINARIES_DIR}/rootfs.ext2 \
> +      -o ${BINARIES_DIR}/${DEVICE_TYPE}-${ARTIFACT_NAME}.mender
> +  fi
> +}
> +
> +
> +function generate_image(){
> +    sh support/scripts/genimage.sh -c ${BOARD_DIR}/genimage-efi.cfg
> +}
> +
> +# Main function.
> +function main(){
> +  parse_args "${@}"
> +  make_data_partition
> +  generate_image
> +  generate_mender_image
> +  exit $?
> +
> +}
> +main "${@}"
> diff --git a/board/mender/x86_64/readme.txt b/board/mender/x86_64/readme.txt
> new file mode 100644
> index 0000000000..c006215e6f
> --- /dev/null
> +++ b/board/mender/x86_64/readme.txt
> @@ -0,0 +1,67 @@
> +Mender UEFI PC sample config
> +=====================
> +
> +1. Build
> +
> +  $ make mender_x86_64_efi_defconfig
> +
> +  Add any additional packages required and build:

  You should add that the fstab, mender config and grub environment have to be 
adapted to change /dev/vda into whatever is appropriate for the target. I added 
some text there.

> +
> +  $ make
> +
> +2. Write the Pendrive
> +
> +  The build process will create a Pendrive image called disk.img in
> +  output/images.
> +
> +  Write the image to a pendrive:
> +
> +  $ dd if=output/images/disk.img of=/dev/${pendrive}; sync
> +
> +  Once the process is complete, insert it into the target PC and boot.
> +
> +  Remember that if said PC has another boot device you might need to
> +  select this alternative for it to boot.
> +
> +  You might need to disable Secure Boot from the setup as well.
> +
> +3. Enjoy
> +
> +Emulation in qemu
> +========================
> +
> +Run the emulation with:
> +
> +qemu-system-x86_64 \
> +    -M pc \
> +    -bios </path/to/OVMF_CODE.fd> \
> +    -drive file=output/images/disk.img,if=virtio,format=raw \
> +    -net nic,model=virtio \
> +    -net user

  I added "-serial stdio" here, otherwise there's no output at all.

> +
> +Note that </path/to/OVMF.fd> needs to point to a valid x86_64 UEFI
> +firmware image for qemu. It may be provided by your distribution as an
> +edk2 or OVMF package, in a path such as /usr/share/edk2/ovmf/OVMF_CODE.fd.
> +
> +Optional arguments:
> + - -enable-kvm to speed up qemu. This requires a loaded kvm module on the host
> +    system.
> + - Add -smp N to emulate an SMP system with N CPUs.
> +
> +The login prompt will appear in the serial window.
> +
> +Tested with QEMU 4.1.1 on Fedora 31
> +
> +Creating a mender-artifact
> +========================
> +In menuconfig -> System configuration, edit the field
> +"Extra arguments passed to custom scripts"
> +And change --generate-mender-image=false to --generate-mender-image=true
> +
> +You may wish to change --artifact-name=1.0 to a name that best suits your
> +particular needs, as this option changes the mender artifact name. > +
> +Using mender
> +========================
> +Please read the mender documentation at:
> +https://docs.mender.io/2.2/getting-started
> diff --git a/configs/mender_x86_64_efi_defconfig b/configs/mender_x86_64_efi_defconfig
> new file mode 100644
> index 0000000000..aba1c38c7f
> --- /dev/null
> +++ b/configs/mender_x86_64_efi_defconfig
> @@ -0,0 +1,81 @@
> +# Architecture
> +BR2_x86_64=y
> +
> +# Toolchain, required for eudev (to autoload drivers)

  We also need to specify headers version explicitly, otherwise it defaults to 
the latest (currently 5.17).

> +BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> +# Required for sysvinit
> +BR2_TOOLCHAIN_BUILDROOT_USE_SSP=y
> +
> +# System
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> +
> +# Required as vda4 doesn't mount on first boot with busybox
> +BR2_INIT_SYSV=y
> +
> +# Required tools to create bootable media
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> +
> +# Bootloader
> +BR2_TARGET_GRUB2=y
> +BR2_TARGET_GRUB2_X86_64_EFI=y
> +# Add mandatory modules from MENDER_GRUBENV_MANDATORY_MODULES
> +BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI="boot linux ext2 fat squash4 part_msdos part_gpt normal efi_gop loadenv hashsum echo halt gcry_sha256 test regexp"
> +BR2_TARGET_GRUB2_INSTALL_TOOLS=y
> +
> +# Required tools to create a mender image
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MENDER_ARTIFACT=y
> +
> +# Filesystem / image
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
> +# BR2_TARGET_ROOTFS_TAR is not set
> +BR2_ROOTFS_OVERLAY="board/mender/x86_64/overlay"
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/mender/x86_64/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/mender/x86_64/post-image-efi.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="--data-part-size=32M --device-type=buildroot-x86_64 --generate-mender-image=false --artifact-name=1.0"
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.13"

  I updated this to current stable, 5.18.14.

> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/mender/x86_64/linux.config"

  IMHO it would be better to reuse board/pc/linux.config and add a fragment if 
necessary. For now, I haven't changed it.

  Regards,
  Arnout

> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
> +
> +# Firmware
> +BR2_PACKAGE_LINUX_FIRMWARE=y
> +BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9170=y
> +BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9271=y
> +BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160=y
> +BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3168=y
> +BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_5000=y
> +BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2A=y
> +BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2B=y
> +BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7260=y
> +BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7265D=y
> +BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_8000C=y
> +BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_8265=y
> +BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT73=y
> +BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT2XX=y
> +BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=y
> +BR2_PACKAGE_LINUX_FIRMWARE_RTL_81XX=y
> +BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX=y
> +BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX=y
> +
> +# Packages
> +#
> +# Use connman so that networking setup is simpler, via connmanctl tool
> +# acpid is for seamless power button support
> +BR2_PACKAGE_ACPID=y
> +BR2_PACKAGE_CONNMAN=y
> +BR2_PACKAGE_CONNMAN_CLIENT=y
> +BR2_PACKAGE_CONNMAN_WIFI=y
> +BR2_PACKAGE_MENDER=y
> +BR2_PACKAGE_MENDER_GRUBENV=y
> +BR2_PACKAGE_MENDER_GRUBENV_DEFINES="board/mender/x86_64/mender_grubenv_defines"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
