Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41854CEE34D
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 21:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBC02812FC;
	Wed,  9 Oct 2024 21:06:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gq9f5rkzwaQi; Wed,  9 Oct 2024 21:06:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC3BC812F3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC3BC812F3;
	Wed,  9 Oct 2024 21:06:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B8B2C1BF3D4
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 21:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92343407B9
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 21:06:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ld8ZgDYyTpHP for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 21:06:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 99E6D4079D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99E6D4079D
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 99E6D4079D
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 21:05:59 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-53993564cb1so214869e87.2
 for <buildroot@buildroot.org>; Wed, 09 Oct 2024 14:05:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728507957; x=1729112757;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=voVnGNvmki4gP0Gmm6wmdSIb6XcAG7pZTbFNRHi88B4=;
 b=MLF3gDAK+2cU5oi2cG5qtixkK4C3HNcxderQsOShKBFUOpxLuxIRhWcklsggb0asv9
 KgsUYTPEIPN9T+ZpEBcMK//8NKG6P6V/4k2Pg467KN9bCDBNBoFn7hpwQA9Idr78PnRa
 GYyTess5v34I0n8ZFchvJ/I+lkhQMfQfKAZNNAYG3Z5b2CV48GOZWATHncVy9omTX4L5
 6A30IcgOd1wT+szoaztnDCm70asrYYZi6u2Es9nOkdJBK970G0lFZyVQYlr0mQktaQUf
 v/BjeVs8gVkutD9LTjOENW8mIKE/jqz8lGh2nzusi8tgHr5reht9mfMZkKJNSTFKCqIs
 7NXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoluHipbX57O3ZTheDywMdcOkZ0HW5YOn1/LGA33yMbpFNYNlpSPYrzfQ6Tj6/PkgWU+zen1YQNl0=@buildroot.org
X-Gm-Message-State: AOJu0YwXtrxf5rU7xrwWYGGULkLo9t+c7yoSOxaqgmfNHKiOV6VCkyLv
 J6fz4p8pclO3S3Khz5AmZY04tKI5zTg/lIUY9HAfljkoLjkgsuzPJ3brdAErtwqpc4oQx1rojWr
 s
X-Google-Smtp-Source: AGHT+IF5CabLIyZWK01YHPc0ewzlIyPHKn3C5KcO9ZMwKisvtF8N+tPyH38kuBBvZpncTBoaoBMfHw==
X-Received: by 2002:a05:6512:104e:b0:539:8980:2009 with SMTP id
 2adb3069b0e04-539c48f5a5amr2849459e87.36.1728507956120; 
 Wed, 09 Oct 2024 14:05:56 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-430ccf45d6csm30129295e9.17.2024.10.09.14.05.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 14:05:55 -0700 (PDT)
Message-ID: <2ec115ec-9eb1-40c0-878f-2c27e273b442@mind.be>
Date: Wed, 9 Oct 2024 23:05:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
References: <20241008073301.125344-1-adam.duskett@amarulasolutions.com>
 <20241008073301.125344-2-adam.duskett@amarulasolutions.com>
Content-Language: en-GB
In-Reply-To: <20241008073301.125344-2-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1728507957; x=1729112757; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=voVnGNvmki4gP0Gmm6wmdSIb6XcAG7pZTbFNRHi88B4=;
 b=M1qEQwqwMZN40Wkg2NRqOYaYksVh0mwZ/JoEND/Ep0B/WNqiuUuza5VzILcmIyE1Mc
 CL4c56uVN44pSVVfPRbW+Z4y1seP8k7pJHiJbSYmDWrGdN7jaWq5paN9rH6DktJ/3FTD
 2/8u5H6eOPtoz5qhMd3CktmwlOlGx2i5M/Q8nxEgxgD0IrHTz5qwo1334gzSHaJ3yd4S
 NbYIqBpPKO60buec3jZn1utycq6r6D6MhbCLh6LPw1dclRdzOw2kK7TIJWaZEEKvd0zq
 CGacz6x/h1Oyx/ixh6Zh2l7e6I6JI6CGJJ+0w/QyEWmrZ9LhROxhpwTEj0H5aiv4uNL+
 BcoQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=M1qEQwqw
Subject: Re: [Buildroot] [PATCH v2 2/2] package/mender: bump package version
 to 4.0.4
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Adam,

  Thanks for this patch! It's been a while since I've done a review with dozens 
of comments :-)


On 08/10/2024 09:33, Adam Duskett wrote:
> Starting with Mender version 4, the program is rewritten from Go to C++ using
> CMake.
> 
> The current package provided by Buildroot is 3.4.0, which is quite old, having
> been released on 25/9/2022. Since then, several changes have occurred,
> necessitating a substantially large patch with many changes all at once.
> 
> The following is a list of changes:
> 
> MAJOR:
> 
>    - Mender now requires a bootstrap.mender artifact.
>      Introduced with version 3.5.0, the purpose of the bootstrap.mender
>      artifact is on start-up; Mender checks for a special bootstrap Artifact in
>      path /var/lib/mender named bootstrap.mender and installs it to initialize
>      the device database when Mender first runs. This change also removes the

  This part is not explained in the migrating.adoc or the readme...

  Also, previously the artifact_info file was generated automatically by the 
mender package. Now, you need to do it in the post-build/image script? Hm, 
actually, it was just a placeholder before anyway... Perhaps Config.in options 
to set artifact name and device type would be nice. But that's out of scope for 
this patch. Just mentioning in migrating or readme is enough.

>      requirement for the /etc/mender/artifact_info file, which Mender no longer
>      uses. As such, the following are necessary for the above change:
> 
>      - Remove installing the /etc/mender/artifact_info file in the Mender.mk file.
>      - Remove package/mender/artifact_info
>      - Remove the creation of the artifact_info file from
>        board/mender/x86_64/post-build.sh.
> 
>      - Create a generate_mender_bootstrap_artifact method in
>        board/mender/x86_64/post-image-efi.sh and
>        support/testing/tests/package/test_mender/post-build.sh. This method
>        generates a proper bootstrap.mender file according to the documentation.
>        This change also necessitates creating a "${BINARIES_DIR}"/data-part
>        directory, putting the bootstrap.mender file in the data-part directory,
>        and modifying mkfs.ext4 to use the data-part directory for initial
>        creation.
> 
>    - Mender is now split into two separate binaries: mender-authd and
>      mender-updated. Both daemons build unconditionally. However, the build
>      system must invoke the `install-mender-auth` command to install the
>      mender-auth daemon. Because of this, Mender's defaut mode is now
>      standalone, where a user runs `mender-update install
>      /path/to/update.mender` to start updates.

  I had to read this 3 times before I understood :-(

  Without authd it doesn't talk to the server at all, correct? That is not very 
clear from the help text.

> 
>    - New option `BR2_PACKAGE_MENDER_AUTHD`. Select to install the mender-auth
>      daemon and mender-update service files, along with the mender-auth daemon.
>      Not installing the mender-auth daemon saves 3M of space when compiling
>      with LTO and stripping the binary.
> 
>    - New option `BR2_PACKAGE_MENDER_IDENTITY_SCRIPTS`. Replaces automatic
>      installation of identity scripts. This new option results in less future
>      maintenance to the package, as any new identity scripts automatically
>      install when `install-identity-scripts` is run if added in new versions of
>      Mender.

  I don't understand - how does this option reduce maintenance?

  Also, do all those optional things make enough of a size difference to make it 
worth to make them optional?


>    - New option `BR2_PACKAGE_MENDER_INVENTORY_SCRIPTS`. Installs several
>      identity scripts automatically. Resulting in less future maintnance.
> 
>    - New option `BR2_PACKAGE_MENDER_INVENTORY_GEO`. A separate inventory script
>      because it requires wget as a runtime dependency and installs by calling
>      `install-inventory-network-scripts.`

  Busybox wget doesn't work?

> 
>    - New option `BR2_PACKAGE_MENDER_OPTIONAL_MODULES`. Replaces automatic
>      installation of inventory scripts, which results in less future
>      maintenance, as `install-inventory-scripts` installs the inventory scripts
>      automatically. However, there is a list of update modules to remove after
>      installation that the system may not support. These modules are:
>        - deb: Unconditionally removed.
>        - docker: If the package is not selected.
>        - rpm: If the package is not selected.
> 
>    - New option `BR2_PACKAGE_MENDER_HOST_MODULES_GEN`. Installs scripts to
>      HOST_DIR. These scripts intend to help generate mender artifacts commonly
>      used outside of the traditional full rootfs. As they are shell scripts, there
>      is no need for a host package, and a call to `install-modules-gen` with a
>      DESTDIR pointing towards HOST_DIR is all that is required.

  Well, the reason to make it a host package is just to reduce confusion. But we 
also have a bunch of target packages that install something in HOST_DIR. Another 
reason is to be able to build/install those things without the target package, 
but that's not relevant here either. So OK.

  I just wonder, why make this optional? We can just install to HOST_DIR 
unconditionally.

> 
> MINOR:
>    - Removed from MENDER_INSTALL_CONFIG_FILES:
>      - /etc/mender/scripts/version: No longer used.
>      - /etc/mender/artifact_info: No longer used
>      - /etc/mender/device_type: Expected to be in /var/lib/mender
>      - unconditionally installing everything in $(@D)/support/modules is
>        replaced with configure options sent to CMake.
> 
>      - package/mender/mender.conf:
>        - Add "DeviceTypeFile": "/etc/mender/device_type"

  But... above you say "expected in /var/lib/mender"?

> 
>    - Mender uses several submodules, and the tags from GitHub do not include the
>      submodules in the tarball. As such, the human-readable version is above the
>      commit hash as a comment in the mender.mk file, and
>      `MENDER_GIT_SUBMODULES = YES` is set.
> 
>    - package/mender/readme.txt file is updated.
> 
>    - The following busyboxy options are required by the rootfs module and are
>      enabled by default:
>      - stat
>      - stat format
>      - sync_fancy
>        Note: While sync_fancy isn't strictly necessary, enabling this feature
>              prevents several messages about sync ignoring all arguments.
> 
>    - New dependencies are as follows:
>      - boost
>      - libarchive
>      - libglib2
>      - lmdb
>      - systemd
>      - util-linux
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>   board/mender/x86_64/linux.config              |   1 +
>   board/mender/x86_64/post-build.sh             |   5 +-
>   board/mender/x86_64/post-image-efi.sh         |  29 +++
>   configs/mender_x86_64_efi_defconfig           |   5 +-
>   docs/manual/migrating.adoc                    |  21 ++
>   .../0001-rootfs-image-shellcheck-fixups.patch | 110 ++++++++++
>   package/mender/Config.in                      | 131 ++++++++++--
>   package/mender/S42mender                      |  60 ------
>   package/mender/artifact_info                  |   1 -
>   package/mender/device_type                    |   1 -
>   package/mender/mender-authd.service           |  14 ++
>   package/mender/mender-client.service          |  24 ---
>   package/mender/mender-updated.service         |  14 ++
>   package/mender/mender.conf                    |   1 +
>   package/mender/mender.hash                    |  48 ++---
>   package/mender/mender.mk                      | 192 +++++++++++-------
>   package/mender/readme.txt                     |  42 ++--
>   support/testing/tests/package/test_mender.py  |  48 +++--
>   .../tests/package/test_mender/post-build.sh   |  30 +++
>   .../rootfs-overlay/etc/mender/artifact_info   |   1 -
>   .../rootfs-overlay/etc/mender/mender.conf     |  11 +
>   21 files changed, 536 insertions(+), 253 deletions(-)
>   create mode 100644 package/mender/0001-rootfs-image-shellcheck-fixups.patch
>   delete mode 100644 package/mender/S42mender
>   delete mode 100644 package/mender/artifact_info
>   delete mode 100644 package/mender/device_type
>   create mode 100644 package/mender/mender-authd.service
>   delete mode 100644 package/mender/mender-client.service
>   create mode 100644 package/mender/mender-updated.service
>   create mode 100755 support/testing/tests/package/test_mender/post-build.sh
>   delete mode 100644 support/testing/tests/package/test_mender/rootfs-overlay/etc/mender/artifact_info
>   create mode 100644 support/testing/tests/package/test_mender/rootfs-overlay/etc/mender/mender.conf
> 
> diff --git a/board/mender/x86_64/linux.config b/board/mender/x86_64/linux.config
> index f17fc18edb..8d24b86e88 100644
> --- a/board/mender/x86_64/linux.config
> +++ b/board/mender/x86_64/linux.config
> @@ -59,6 +59,7 @@ CONFIG_EXT4_FS=y
>   CONFIG_FUSE_FS=y
>   CONFIG_VFAT_FS=y
>   CONFIG_SQUASHFS=y
> +CONFIG_TMPFS=y

  Why is this suddenly needed? Isn't it default on anyway? In particular, 
systemd means devtmpfs and devtmpfs implies tmpfs...

>   CONFIG_NLS_CODEPAGE_437=y
>   CONFIG_NLS_ISO8859_1=y
>   CONFIG_UNWINDER_FRAME_POINTER=y
> diff --git a/board/mender/x86_64/post-build.sh b/board/mender/x86_64/post-build.sh
> index 254b0a21fd..4eff9f6753 100755
> --- a/board/mender/x86_64/post-build.sh
> +++ b/board/mender/x86_64/post-build.sh
> @@ -1,7 +1,6 @@
>   #!/usr/bin/env bash
>   set -e
>   DEVICE_TYPE="buildroot-x86_64"
> -ARTIFACT_NAME="1.0"
>   
>   
>   parse_args() {
> @@ -20,7 +19,8 @@ parse_args() {
>               DEVICE_TYPE="${2}"; shift 2
>               ;;
>           (-a|--artifact-name)
> -            ARTIFACT_NAME="${2}"; shift 2
> +            # Ignored to have same options as other scripts
> +            shift 2
>               ;;
>           (--)
>               shift; break
> @@ -51,7 +51,6 @@ main() {
>       parse_args "${@}"
>       mender_fixup
>       echo "device_type=${DEVICE_TYPE}" > "${TARGET_DIR}/etc/mender/device_type"
> -    echo "artifact_name=${ARTIFACT_NAME}" > "${TARGET_DIR}/etc/mender/artifact_info"
>   }
>   
>   main "${@}"
> diff --git a/board/mender/x86_64/post-image-efi.sh b/board/mender/x86_64/post-image-efi.sh
> index c7c848e453..ee6967f742 100755
> --- a/board/mender/x86_64/post-image-efi.sh
> +++ b/board/mender/x86_64/post-image-efi.sh
> @@ -32,6 +32,34 @@ parse_args() {
>   }
>   
>   
> +# Generate a mender bootstrap artifact.
> +# See https://northerntech.atlassian.net/browse/MEN-2585
> +generate_mender_bootstrap_artifact() {
> +  bootstrap_artifact="bootstrap.mender"
> +  data_part="${BINARIES_DIR}"/data-part
> +  img_checksum=$(sha256sum "${BINARIES_DIR}"/rootfs.ext4 |awk '{print $1}')
> +
> +  rm -rf "${data_part:?}"
> +  mkdir -p "${data_part}"
> +  rm -rf "${BINARIES_DIR:?}"/"${bootstrap_artifact}"
> +
> +  "${HOST_DIR}"/bin/mender-artifact write bootstrap-artifact \
> +    --compression lzma \
> +    --artifact-name "${ARTIFACT_NAME}" \
> +    --device-type "${DEVICE_TYPE}" \
> +    --provides "rootfs-image.version:${ARTIFACT_NAME}" \
> +    --provides "rootfs-image.checksum:${img_checksum}" \
> +    --clears-provides "rootfs-image.*" \
> +    --output-path "${BINARIES_DIR}"/"${bootstrap_artifact}" \
> +    --version 3
> +
> +    cp -rf "${BINARIES_DIR}"/"${bootstrap_artifact}" "${data_part}"/
> +    cd "${data_part}"/
> +    ln -sf /etc/mender/mender.conf mender.conf

  So is this actually needed?

  You don't actually need to cd here, you can just do
ln -sf /etc/mender/mender.conf "${data_part}/mender.conf"

> +    cd -
> +}
> +
> +
>   # Create the data partition
>   make_data_partition() {
>       "${HOST_DIR}/sbin/mkfs.ext4" \
> @@ -65,6 +93,7 @@ generate_image() {
>   # Main function.
>   main() {
>       parse_args "${@}"
> +    generate_mender_bootstrap_artifact
>       make_data_partition
>       generate_image
>       generate_mender_image
> diff --git a/configs/mender_x86_64_efi_defconfig b/configs/mender_x86_64_efi_defconfig
> index d0e0d8a364..718f5886dd 100644
> --- a/configs/mender_x86_64_efi_defconfig
> +++ b/configs/mender_x86_64_efi_defconfig
> @@ -1,6 +1,7 @@
>   BR2_x86_64=y
>   BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
> -BR2_INIT_SYSV=y
> +BR2_TOOLCHAIN_BUILDROOT_CXX=y
> +BR2_INIT_SYSTEMD=y
>   BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
>   BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
>   BR2_ROOTFS_OVERLAY="board/mender/x86_64/overlay"
> @@ -42,7 +43,7 @@ BR2_PACKAGE_MENDER_GRUBENV=y
>   BR2_PACKAGE_MENDER_GRUBENV_DEFINES="board/mender/x86_64/mender_grubenv_defines"
>   BR2_TARGET_ROOTFS_EXT2=y
>   BR2_TARGET_ROOTFS_EXT2_4=y
> -BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
> +BR2_TARGET_ROOTFS_EXT2_SIZE="176M"

  Huh? From Go to C++ and it becomes _bigger_ ?

>   # BR2_TARGET_ROOTFS_TAR is not set
>   BR2_TARGET_GRUB2=y
>   BR2_TARGET_GRUB2_X86_64_EFI=y
> diff --git a/docs/manual/migrating.adoc b/docs/manual/migrating.adoc
> index 69bf0dc221..c0ab434833 100644
> --- a/docs/manual/migrating.adoc
> +++ b/docs/manual/migrating.adoc
> @@ -184,3 +184,24 @@ sed -r -i -e 's/(\.tar\.gz)$/-cargo2\1/' $(
>   
>   Note that the hash _will_ have changed, so that needs to be updated
>   (manually) as well.
> +
> +[[migrating-git-attributes]]

  Label should be modified to something relevant here.

> +=== Migrating to 2024.11
> +
> +Mender is now at version 4.x, which is a significant update. Please be sure to
> +check the following when upgrading:
> +
> +* Mender defaults to standalone mode. If you wish to use mender in a
> +  client/server configuration, `BR2_PACKAGE_MENDER_AUTHD` must be selected.
> +  This option installs the `mender-authd.service` and `mender-updated.service`
> +  files. The `mender-updated.service` file depends on `mender-authd.service`.
> +  If you have an overlay that replaces a `mender-client.service` file, update
> +  its name to mender-updated.service, and rename `/usr/bin/mender` to
> +  `/usr/bin/mender-update` in the ExecStart field.
> +
> +* Inventory and identity scripts are now a configuration option and not
> +  installed automatically. Be sure to select them if you are using them.
> +  The only script installed automatically is the rootfs-image script.
> +
> +* Mender requires systemd. You must change your init system if you are
> +  currently not using systemd.
> diff --git a/package/mender/0001-rootfs-image-shellcheck-fixups.patch b/package/mender/0001-rootfs-image-shellcheck-fixups.patch
> new file mode 100644
> index 0000000000..27c4bd016d
> --- /dev/null
> +++ b/package/mender/0001-rootfs-image-shellcheck-fixups.patch
> @@ -0,0 +1,110 @@
> +From 553ddbdb54c56967e6149ebc64937a528c0cf300 Mon Sep 17 00:00:00 2001
> +From: Adam Duskett <adam.duskett@amarulasolutions.com>
> +Date: Mon, 7 Oct 2024 10:42:55 +0200
> +Subject: [PATCH] rootfs-image shellcheck fixups
> +
> +Fixes the following warnings:
> +  - SC2005 useless echo
> +  - SC2166 Preffer || or && instead of -o
> +  - SC2086 Douple quote
> +
> +Upstream: https://github.com/mendersoftware/mender/pull/1675

  Why do we need this patch in Buildroot?

> +
> +Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
[snip]
> diff --git a/package/mender/Config.in b/package/mender/Config.in
> index c9b9d0b757..5af5978550 100644
> --- a/package/mender/Config.in
> +++ b/package/mender/Config.in
> @@ -1,14 +1,27 @@
>   config BR2_PACKAGE_MENDER
>   	bool "mender"
> -	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> -	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
> -	depends on BR2_TOOLCHAIN_HAS_THREADS
> -	select BR2_PACKAGE_HOST_GO
> +	depends on BR2_INSTALL_LIBSTDCPP # boost
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # boost-log
> +	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-log
> +	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-log
> +	depends on BR2_USE_MMU # libglib2
> +	depends on BR2_USE_WCHAR # libglib2
> +	depends on BR2_PACKAGE_SYSTEMD # runtime
> +	select BR2_PACKAGE_BOOST
> +	select BR2_PACKAGE_BOOST_FILESYSTEM
> +	select BR2_PACKAGE_BOOST_LOG
> +	select BR2_PACKAGE_DBUS if !BR2_PACKAGE_DBUS_BROKER
> +	select BR2_PACKAGE_LIBARCHIVE
> +	select BR2_PACKAGE_LIBGLIB2
> +	select BR2_PACKAGE_LMDB
>   	select BR2_PACKAGE_OPENSSL
>   	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
>   	select BR2_PACKAGE_LIBOPENSSL_ENGINES
>   	select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4
>   	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160
> +	select BR2_PACKAGE_SYSTEMD_RESOLVED # runtime

  Does it really need systemd resolved? No other resolver is allowed?

> +	select BR2_PACKAGE_UTIL_LINUX # runtime
> +	select BR2_PACKAGE_UTIL_LINUX_BINARIES # flock

  Commit message doesn't mention why busybox flock is not good enough.

>   	help
>   	  Mender is an open source over-the-air (OTA) software updater
>   	  for embedded Linux devices. Mender comprises a client
> @@ -21,16 +34,13 @@ config BR2_PACKAGE_MENDER
>   	    - uboot-tools must be selected.
>   	    - fw_printenv must be functional on the device.
>   	  The Mender Uboot patches are at:
> -	  https://github.com/mendersoftware/meta-mender/
> +	  https://github.com/mendersoftware/meta-mender/tree/master/meta-mender-core/recipes-bsp/u-boot/patches
>   
>   	  For more information on Manual U-Boot integration, see:
> -	  https://docs.mender.io/2.6/system-updates-yocto-project/board-integration/bootloader-support/u-boot/manual-u-boot-integration
> +	  https://docs.mender.io/3.4/system-updates-yocto-project/board-integration/bootloader-support/u-boot/manual-u-boot-integration
>   
>   	  For systems using Grub2 as the bootloader:
>   	    - Mender depends on the mender-grubenv package.
> -	    - The mender-grubenv package provides a fw_printenv script,
> -	      which is not compatible with the uboot-tools fw_printenv
> -	      script.
>   
>   	  The mender project recommends using uboot to load Grub2 as a
>   	  secondary bootloader whenever possible. Using Grub2 as a
> @@ -39,7 +49,102 @@ config BR2_PACKAGE_MENDER
>   
>   	  https://github.com/mendersoftware/mender
>   
> -comment "mender needs a toolchain w/ threads"
> -	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> -	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS
> +if BR2_PACKAGE_MENDER
> +
> +config BR2_PACKAGE_MENDER_AUTHD
> +	bool "authentication daemon"
> +	select BR2_PACKAGE_CA_CERTIFICATES
> +	help
> +	  Select this if your device will connect to a Mender
> +	  server. This installs the following:
> +	    - mender-authd.service
> +	    - mender-updated.service
> +	  Otherwise, mender is expected to be ran as a standalone
> +	  app.
> +
> +config BR2_PACKAGE_MENDER_IDENTITY_SCRIPTS
> +	bool "identity scripts"
> +	help
> +	  Install an example script called by Mender client to
> +	  collect device identity data.
> +
> +config BR2_PACKAGE_MENDER_INVENTORY_SCRIPTS
> +	bool "inventory scripts"
> +	help
> +	  Install several scripts used for device inventory
> +	  management. These include:
> +
> +	    - bootloader-integration:
> +	      Tries to determine which type of bootloader
> +	      integration has been used.
> +
> +	    - hostinfo
> +	      Collects information about current host.
> +
> +	    - network
> +	      Collects the list of network interfaces, as well as
> +	      ethernet and IP addresses of each of the interfaces.
> +
> +	    - os
> +	      Returns an "os" attribute to Mender containing the
> +	      currently running OS.
> +
> +	    - provides
> +	      Returns the current list of providees for the devices,
> +	      using the Mender client's `show-provides` command.
> +
> +	    - rootfs-type
> +	      Determines what the root filesystem type is.
> +
> +	    - update-modules
> +	      Returns the update-modules currently installed on the
> +	      system in /usr/share/mender/modules/v3
> +
> +config BR2_PACKAGE_MENDER_INVENTORY_GEO
> +	bool "inventory geo script"
> +	select BR2_PACKAGE_WGET # runtime
> +	help
> +	  Install the mender-inventory-geo script which collects
> +	  information on geo localization. These include:
> +	  - IP
> +	  - City
> +	  - Country
> +	  - Time zone
> +
> +config BR2_PACKAGE_MENDER_OPTIONAL_MODULES
> +	bool "optional modules"
> +	help
> +	  Install the following optional modules in
> +	  /usr/share/mender/modules/v3:
> +	    - directory
> +	    - script
> +	    - single-file
> +
> +	  Install the following if the packages are selected:
> +	    - docker
> +	    - rpm
> +
> +config BR2_PACKAGE_MENDER_HOST_MODULES_GEN
> +	bool "host module generation scripts"
> +	help
> +	  Install scripts to generate update modules.
> +	  These scripts are installed to HOST_DIR
> +	  as they are not meant to be ran on the target.
> +	  These include:
> +	    - docker-artifact-gen
> +	    - directory-artifact-gen
> +	    - single-file-artifact-gen
> +
> +endif # BR2_PACKAGE_MENDER
> +
> +comment "mender needs a toolchain w/ C++, NPTL, wchar"
> +	depends on BR2_USE_MMU
> +	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
> +		!BR2_TOOLCHAIN_HAS_THREADS_NPTL
> +
> +comment "mender needs a toolchain not affected by GCC bug 64735"
> +	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
> +
> +comment "mender needs systemd"
> +	depends on !BR2_PACKAGE_SYSTEMD

  The three comments should be merged in a single one (yes I know there are 
other places where it is split).

[snip]
> diff --git a/package/mender/mender-authd.service b/package/mender/mender-authd.service
> new file mode 100644
> index 0000000000..5bde1120a1
> --- /dev/null
> +++ b/package/mender/mender-authd.service
> @@ -0,0 +1,14 @@
> +[Unit]
> +Description=Mender authentication service
> +After=systemd-resolved.service data.mount

  data.mount?

  You probably instead want a RequiresMountsFor= (or whatever it is).

> +Conflicts=mender.service

  Where does this come from?

> +
> +[Service]
> +Type=idle
> +User=root
> +Group=root

  Can't this run as a non-root user? I expect that that's the whole point of 
splitting it...

> +ExecStart=/usr/bin/mender-auth daemon
> +Restart=always
> +
> +[Install]
> +WantedBy=multi-user.target
[snip]
> diff --git a/package/mender/mender-updated.service b/package/mender/mender-updated.service
> new file mode 100644
> index 0000000000..cedad666ed
> --- /dev/null
> +++ b/package/mender/mender-updated.service
> @@ -0,0 +1,14 @@
> +[Unit]
> +Description=Mender OTA update service
> +After=systemd-resolved.service mender-authd.service data.mount

  I think you also need

Requires=mender-authd.service

> +Conflicts=mender.service
> +
> +[Service]
> +Type=idle
> +User=root
> +Group=root
> +ExecStart=/usr/bin/mender-update daemon
> +Restart=always
> +
> +[Install]
> +WantedBy=multi-user.target

[snip]> +# MIT clause license
> +sha256  86b998c792894ccb911a1cb7994f7a9652894e7a094c0b5e45be2f553f45cf14  vendor/json/LICENSE.MIT
> +sha256  08c345dca1019879171c2c465410f7bee984bbfbdb177afd2d95bf9ff6267602  vendor/json/docs/mkdocs/docs/home/license.md

  There's no possibility to unvendor the json library?

[snip]

> diff --git a/package/mender/mender.mk b/package/mender/mender.mk
> index ee1398244b..2c2def5ec3 100644
> --- a/package/mender/mender.mk
> +++ b/package/mender/mender.mk
> @@ -4,112 +4,148 @@
>   #
>   ################################################################################
>   
> -MENDER_VERSION = 3.4.0
> -MENDER_SITE = $(call github,mendersoftware,mender,$(MENDER_VERSION))
> -MENDER_LICENSE = Apache-2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT, OLDAP-2.8
> +# 4.0.4
> +MENDER_VERSION = 80f37fe47f9eac22d78a8a848b77072d45976c3e
> +MENDER_SITE = https://github.com/mendersoftware/mender.git
> +MENDER_SITE_METHOD = git
> +MENDER_GIT_SUBMODULES = YES
> +MENDER_LICENSE = Apache-2.0, BSL-1.0, CC0-1.0, MIT, Unlicense
>   MENDER_CPE_ID_VENDOR = northern.tech
> -
> -# Vendor license paths generated with:
> -#    awk '{print $2}' LIC_FILES_CHKSUM.sha256 | grep vendor
>   MENDER_LICENSE_FILES = \
>   	LICENSE \
>   	LIC_FILES_CHKSUM.sha256 \
> -	vendor/github.com/mendersoftware/mender-artifact/LICENSE \
> -	vendor/github.com/mendersoftware/openssl/LICENSE \
> -	vendor/github.com/minio/sha256-simd/LICENSE \
> -	vendor/github.com/mendersoftware/progressbar/LICENSE \
> -	vendor/github.com/pkg/errors/LICENSE \
> -	vendor/github.com/godbus/dbus/LICENSE \
> -	vendor/github.com/gorilla/websocket/LICENSE \
> -	vendor/github.com/klauspost/compress/LICENSE \
> -	vendor/github.com/pmezard/go-difflib/LICENSE \
> -	vendor/golang.org/x/sys/LICENSE \
> -	vendor/github.com/bmatsuo/lmdb-go/LICENSE.md \
> -	vendor/github.com/remyoudompheng/go-liblzma/LICENSE \
> -	vendor/golang.org/x/term/LICENSE \
> -	vendor/github.com/davecgh/go-spew/LICENSE \
> -	vendor/github.com/klauspost/pgzip/LICENSE \
> -	vendor/github.com/klauspost/cpuid/v2/LICENSE \
> -	vendor/github.com/sirupsen/logrus/LICENSE \
> -	vendor/github.com/stretchr/testify/LICENSE \
> -	vendor/github.com/ungerik/go-sysfs/LICENSE \
> -	vendor/github.com/urfave/cli/v2/LICENSE \
> -	vendor/github.com/stretchr/objx/LICENSE \
> -	vendor/gopkg.in/yaml.v3/LICENSE \
> -	vendor/github.com/mattn/go-isatty/LICENSE \
> -	vendor/github.com/bmatsuo/lmdb-go/LICENSE.mdb.md
> -
> -MENDER_DEPENDENCIES = host-pkgconf openssl
> -
> -MENDER_LDFLAGS = -X github.com/mendersoftware/mender/conf.Version=$(MENDER_VERSION)
> -
> -MENDER_UPDATE_MODULES_FILES = \
> -	directory \
> -	script \
> -	single-file \
> -	$(if $(BR2_PACKAGE_DOCKER_CLI),docker) \
> -	$(if $(BR2_PACKAGE_RPM),rpm)
> +	vendor/expected/COPYING \
> +	vendor/json/docs/mkdocs/docs/home/license.md \
> +	vendor/json/LICENSE.MIT \
> +	vendor/lmdbxx/UNLICENSE \
> +	vendor/optional-lite/LICENSE.txt \
> +	vendor/tiny-process-library/LICENSE
> +
> +MENDER_DEPENDENCIES += \
> +	host-pkgconf \
> +	boost \
> +	libarchive \
> +	libglib2 \
> +	lmdb \
> +	openssl \
> +	systemd \
> +	util-linux

  Config.in says that it's a runtime dependency?

> +
> +MENDER_INSTALL_TARGET_OPTS = \
> +	install-mender-update \
> +	install-rootfs-image-module
>   
>   define MENDER_INSTALL_CONFIG_FILES
> -	$(INSTALL) -d -m 755 $(TARGET_DIR)/etc/mender/scripts
> -	echo -n "3" > $(TARGET_DIR)/etc/mender/scripts/version
> -
>   	$(INSTALL) -D -m 0644 $(MENDER_PKGDIR)/mender.conf \
>   		$(TARGET_DIR)/etc/mender/mender.conf
> +
>   	$(INSTALL) -D -m 0644 $(MENDER_PKGDIR)/server.crt \
>   		$(TARGET_DIR)/etc/mender/server.crt
>   
> -	$(INSTALL) -D -m 0755 $(@D)/support/mender-device-identity \
> -		$(TARGET_DIR)/usr/share/mender/identity/mender-device-identity
> -	$(foreach f,bootloader-integration hostinfo network os rootfs-type, \
> -		$(INSTALL) -D -m 0755 $(@D)/support/mender-inventory-$(f) \
> -			$(TARGET_DIR)/usr/share/mender/inventory/mender-inventory-$(f)
> -	)
> +	mkdir -p $(TARGET_DIR)/var/lib
> +	ln -snf /var/run/mender $(TARGET_DIR)/var/lib/mender

  IIUC, mender now breaks down completely if /var/lib/mender doesn't persist 
over reboot (I honestly don't know if it did work before...). But then that 
symlink is pointless.

> +endef
> +MENDER_POST_INSTALL_TARGET_HOOKS += MENDER_INSTALL_CONFIG_FILES
>   
> -	$(INSTALL) -D -m 0755 $(MENDER_PKGDIR)/artifact_info \
> -			$(TARGET_DIR)/etc/mender/artifact_info
> +ifeq ($(BR2_PACKAGE_DBUS_BROKER),y)
> +MENDER_DEPENDENCIES += dbus-broker
> +else
> +MENDER_DEPENDENCIES += dbus
> +endif
>   
> -	$(INSTALL) -D -m 0755 $(MENDER_PKGDIR)/device_type \
> -			$(TARGET_DIR)/etc/mender/device_type
> +ifeq ($(BR2_PACKAGE_MENDER_AUTHD),y)
> +MENDER_DEPENDENCIES += ca-certificates

  Is there really a compile-time dependency on ca-certificates?

> +MENDER_INSTALL_TARGET_OPTS += install-dbus install-mender-auth

  It's a bit weird that the dbus dependency is unconditional, but install-dbus 
is only done for authd... I guess that has something to do with what you wrote 
in the commit message, that authd is always built but not always installed?

> +MENDER_INSTALL_SERVICE_FILES += \
> +	mender-authd.service \
> +	mender-updated.service
> +endif
>   
> -	mkdir -p $(TARGET_DIR)/var/lib
> -	ln -snf /var/run/mender $(TARGET_DIR)/var/lib/mender
> -	$(foreach f,$(MENDER_UPDATE_MODULES_FILES), \
> -		$(INSTALL) -D -m 0755 $(@D)/support/modules/$(notdir $(f)) \
> -			$(TARGET_DIR)/usr/share/mender/modules/v3/$(notdir $(f))
> +ifeq ($(BR2_PACKAGE_MENDER_IDENTITY_SCRIPTS),y)
> +MENDER_INSTALL_TARGET_OPTS += install-identity-scripts
> +endif
> +
> +ifeq ($(BR2_PACKAGE_MENDER_INVENTORY_SCRIPTS),y)
> +MENDER_INSTALL_TARGET_OPTS += install-inventory-scripts
> +endif
> +
> +ifeq ($(BR2_PACKAGE_MENDER_INVENTORY_GEO),y)
> +MENDER_DEPENDENCIES += wget

  Isn't this a runtime dependency?

> +MENDER_INSTALL_TARGET_OPTS += install-inventory-network-scripts
> +endif
> +
> +ifeq ($(BR2_PACKAGE_MENDER_OPTIONAL_MODULES),y)
> +MENDER_INSTALL_TARGET_OPTS += install-modules
> +MENDER_UPDATE_MODULES_FILES_REMOVE = \
> +	deb \

  What exactly does the 'deb' module need? Busybox has a dpkg utility so if 
that's all that's needed, there's no need to remove it.

> +	$(if $(BR2_PACKAGE_DOCKER_CLI),,docker) \
> +	$(if $(BR2_PACKAGE_RPM),,rpm)

  Is it in fact really worth removing them? Do we save a lot of size with it?

> +
> +define MENDER_REMOVE_UPDATE_MODULES
> +	$(foreach f,$(MENDER_UPDATE_MODULES_FILES_REMOVE), \
> +		$(RM) $(TARGET_DIR)/usr/share/mender/modules/v3/$(f)
>   	)
>   endef
> +MENDER_POST_INSTALL_TARGET_HOOKS += += MENDER_REMOVE_UPDATE_MODULES
> +endif
>   
> -MENDER_POST_INSTALL_TARGET_HOOKS += MENDER_INSTALL_CONFIG_FILES
> +ifeq ($(BR2_PACKAGE_MENDER_HOST_MODULES_GEN),y)

  I think you should repeat here, not just in the commit message:

# This only installs scripts so it's OK to do it during target installation

> +define MENDER_INSTALL_MODULES_GEN
> +	DESTDIR=$(HOST_DIR) \
> +	$(BR2_MAKE) -C $(@D) \

  If you're going to call into make instead of cmake --install, you should 
explicitly set MENDER_CMAKE_BACKEND = make IMHO.

> +		install-modules-gen
> +endef
> +MENDER_POST_INSTALL_TARGET_HOOKS += += MENDER_INSTALL_MODULES_GEN
> +endif
> +
> +ifeq ($(BR2_PACKAGE_GZIP),y)
> +MENDER_DEPENDENCIES += gzip
> +MENDER_CONF_OPTS += -DMENDER_ARTIFACT_GZIP_COMPRESSION=ON
> +else
> +MENDER_CONF_OPTS += -DMENDER_ARTIFACT_GZIP_COMPRESSION=OFF
> +endif
>   
>   ifeq ($(BR2_PACKAGE_XZ),y)
>   MENDER_DEPENDENCIES += xz
> +MENDER_CONF_OPTS += -DMENDER_ARTIFACT_LZMA_COMPRESSION=ON
>   else
> -MENDER_TAGS += nolzma
> +MENDER_CONF_OPTS += -DMENDER_ARTIFACT_LZMA_COMPRESSION=OFF
>   endif
>   
> -ifeq ($(BR2_PACKAGE_DBUS)$(BR2_PACKAGE_LIBGLIB2),yy)
> -MENDER_DEPENDENCIES += libglib2
> -define MENDER_INSTALL_DBUS_AUTHENTICATION_MANAGER_CONF
> -	$(INSTALL) -D -m 0755 $(@D)/support/dbus/io.mender.AuthenticationManager.conf \
> -		$(TARGET_DIR)/etc/dbus-1/system.d/io.mender.AuthenticationManager.conf
> -
> -	$(INSTALL) -D -m 0755 $(@D)/support/dbus/io.mender.UpdateManager.conf \
> -		$(TARGET_DIR)/etc/dbus-1/system.d/io.mender.UpdateManager.conf
> -endef
> -MENDER_POST_INSTALL_TARGET_HOOKS += MENDER_INSTALL_DBUS_AUTHENTICATION_MANAGER_CONF
> +ifeq ($(BR2_PACKAGE_ZSTD),y)
> +MENDER_DEPENDENCIES += zstd
> +MENDER_CONF_OPTS += -DMENDER_ARTIFACT_ZSTD_COMPRESSION=ON
>   else
> -MENDER_TAGS += nodbus
> +MENDER_CONF_OPTS += -DMENDER_ARTIFACT_ZSTD_COMPRESSION=OFF
>   endif
>   
> +define MENDER_INSTALL_MISSING_FILES
> +	$(INSTALL) -D -m 0755 \
> +		$(@D)/vendor/tiny-process-library/libtiny-process-library.so \
> +	$(TARGET_DIR)/usr/lib/libtiny-process-library.so
> +endef
> +MENDER_POST_INSTALL_TARGET_HOOKS += MENDER_INSTALL_MISSING_FILES

  Huh... Maybe it would be better to patch upstream CMakeLists.txt so the shared 
library gets installed when needed? Or even to build libtiny-process-library 
statically even if ENABLE_SHARED is set?

  Anyway, an upstreamable patch is better but this is OK as well.


>   define MENDER_INSTALL_INIT_SYSTEMD
> -	$(INSTALL) -D -m 0644 $(MENDER_PKGDIR)/mender-client.service \
> -		$(TARGET_DIR)/usr/lib/systemd/system/mender-client.service
> +	$(foreach f,$(MENDER_INSTALL_SERVICE_FILES), \
> +		$(INSTALL) -D -m 0644 $(MENDER_PKGDIR)/$(f) \
> +			$(TARGET_DIR)/usr/lib/systemd/system/$(f)
> +	)
> +endef
> +
> +define MENDER_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) \
> +	$(TARGET_BUILD_ENV) \
> +	DESTDIR=$(TARGET_DIR) \
> +	$(BR2_MAKE) -C $(@D) \
> +		$(MENDER_INSTALL_TARGET_OPTS)

  Huh? Is it really needed to override the install commands? Isn't it enough to 
set MENDER_INSTALL_TARGET_OPTS ?

>   endef
>   
> -define MENDER_INSTALL_INIT_SYSV
> -	$(INSTALL) -D -m 755 $(MENDER_PKGDIR)/S42mender \
> -		$(TARGET_DIR)/etc/init.d/S42mender
> +# Needed for rootfs-image-module
> +define  MENDER_BUSYBOX_CONFIG_FIXUPS
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_STAT)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_STAT_FORMAT)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_SYNC_FANCY)

  You can also enable wget here (if busybox wget works).

>   endef
>   
> -$(eval $(golang-package))
> +$(eval $(cmake-package))
> diff --git a/package/mender/readme.txt b/package/mender/readme.txt
> index c884524a1b..a153b06d38 100644
> --- a/package/mender/readme.txt
> +++ b/package/mender/readme.txt
> @@ -26,8 +26,13 @@ In Buildroot the following packages are provided:
>   
>   - BR2_PACKAGE_MENDER
>       - This will install the client on target rootfs
> +- BR2_PACKAGE_MENDER_CONNECT
> +    - This package allows for remote terminal access to devices
> +      registered on a mender server.

  Not really related to the version bump, but OK.

>   - BR2_PACKAGE_HOST_MENDER_ARTIFACT
>       - This will install the 'mender-artifact' tool in host rootfs.
> +- BR2_PACKAGE_MENDER_GRUBENV
> +    - This package provides Grub2 integration for Mender.

  Same here.

>   
>   To fully utilize atomic image-based deployments using the A/B update
>   strategy, additional integration is required in the bootloader. This
> @@ -38,6 +43,9 @@ integrations please visit:
>   
>       https://github.com/mendersoftware/buildroot-mender
>   
> +There is also an example mender_x86_64_efi_defconfig that can be used
> +as a demo using qemu-system-x86_64 (see board/mender/x86_64/readme.txt)
> +
>   Default configurations files
>   ----------------------------
>   
> @@ -46,14 +54,9 @@ files that need your attention:
>   
>   - /etc/mender/mender.conf
>       - main configuration file for the Mender client
> -    - https://docs.mender.io/client-configuration/configuration-file/configuration-options
> -
> -- /etc/mender/artifact_info
> -    - The name of the image or update that will be built. This is what the
> -      device will report that it is running, and different updates must have
> -      different names
> +    - https://docs.mender.io/client-installation/configuration-file
>   
> -- /var/lib/mender/device_type
> +- /etc/mender/device_type
>       - A string that defines the type of device
>   
>   Mender server configuration
> @@ -113,15 +116,13 @@ then you would typically create the Mender Artifact in a post image
>   script (BR2_ROOTFS_POST_IMAGE_SCRIPT). Below is an example of such a
>   script:
>   
> -    #!/bin/sh
> +    #!/usr/bin/env bash
>   
> -    set -e
> -    set -x
> +    set -ex
>   
>       device_type=$(cat ${TARGET_DIR}/var/lib/mender/device_type | sed 's/[^=]*=//')

  Higher up you changed this to /etc/mender/device_type

> -    artifact_name=$(cat ${TARGET_DIR}/etc/mender/artifact_info | sed 's/[^=]*=//')
>   
> -    if [ -z "${device_type}" ] || [ -z "${artifact_name}" ]; then
> +    if [ -z "${device_type}" ]; then
>           echo "missing files required by Mender"
>           exit 1
>       fi
> @@ -129,21 +130,18 @@ script:
>       ${HOST_DIR}/usr/bin/mender-artifact write rootfs-image \
>           --update ${BINARIES_DIR}/rootfs.ext4 \
>           --output-path ${BINARIES_DIR}/${artifact_name}.mender \
> -        --artifact-name ${artifact_name} \
> +        --artifact-name "${BR2_VERSION}" \
>           --device-type ${device_type}
>   
> -As you can see some properties are extracted from target rootfs, and
> -this is because these values are used for compatibility checks,
> +As you can see, device_type is extracted from the target rootfs.
> +This is because that value is used for compatibility checks,
>   meaning that the information must be present in both rootfs and in
>   Mender Artifact meta data.
>   
> -- device_type - must be an exact match between rootfs and Mender
> -                Artifact meta-data to apply update. You can set an
> -                array of devices here as well, e.g if your image is
> -                compatible with multiple hardware revisions
> -
> -- artifact_name - must be an exact match between rootfs and Mender
> -                  Artifact meta-data to apply update.
> +Note: device_type must be an exact match between rootfs and Mender
> +Artifact meta-data to apply update. You can set an array of devices
> +here as well, e.g if your image is compatible with multiple hardware
> +revisions
>   
>   Configuring Mender with certificates
>   ------------------------------------
> diff --git a/support/testing/tests/package/test_mender.py b/support/testing/tests/package/test_mender.py
> index fdf55ed616..bde180f654 100644
> --- a/support/testing/tests/package/test_mender.py
> +++ b/support/testing/tests/package/test_mender.py
> @@ -4,29 +4,51 @@ import infra.basetest
>   
>   
>   class TestMender(infra.basetest.BRTest):
> -    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +    # infra.basetest.BASIC_TOOLCHAIN_CONFIG cannot be used as it does
> +    # not include BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
> +    # needed by mender. This config also uses an ext4 rootfs as
> +    # the default 128MB is too small for mender and systemd.
> +    # a larger initrd in RAM).

  This sentence is broken.

> +    config = \
>           """
> +        BR2_x86_64=y
> +        BR2_x86_corei7=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_STABLE=y
> +        BR2_LINUX_KERNEL=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.50"
> +        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/mender/x86_64/linux.config"

  Why do we need a custom kernel? Are the prebuilt kernels too old or is there a 
config option missing? Please add a comment to explain that.

>           BR2_PACKAGE_MENDER=y
> -        BR2_TARGET_ROOTFS_CPIO=y
> +        BR2_ROOTFS_POST_BUILD_SCRIPT="{}"
>           BR2_ROOTFS_OVERLAY="{}"
> +        BR2_INIT_SYSTEMD=y
> +        BR2_CCACHE=y

  We don't enable ccache anywhere else in the tests. Perhaps we should though.

> +        BR2_PACKAGE_HOST_MENDER_ARTIFACT=y
> +        BR2_TARGET_ROOTFS_EXT2=y
> +        BR2_TARGET_ROOTFS_EXT2_4=y
> +        BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
> +        # BR2_TARGET_ROOTFS_TAR is not set
>           """.format(
> +           infra.filepath("tests/package/test_mender/post-build.sh"),
>              # overlay to add a fake 'fw_printenv', used by Mender
>              infra.filepath("tests/package/test_mender/rootfs-overlay"))
>   
>       def test_run(self):
> -        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
> -        self.emulator.boot(arch="armv5",
> -                           kernel="builtin",
> -                           options=["-initrd", cpio_file])
> +        drive = os.path.join(self.builddir, "images", "rootfs.ext4")
> +        kern = os.path.join(self.builddir, "images", "bzImage")
> +        self.emulator.boot(arch="x86_64",
> +                           kernel=kern,
> +                           kernel_cmdline=["root=/dev/vda console=ttyS0"],
> +                           options=["-cpu", "Nehalem",
> +                                    "-m", "256M",
> +                                    "-drive", f"file={drive},if=virtio,format=raw"])
>           self.emulator.login()
>   
> -        # Check if the Daemon is running
> -        self.assertRunOk("ls /var/run/mender.pid")
> -        self.assertRunOk("ps aux | egrep [m]ender")
> -
>           # Check if a simple Mender command is correctly executed
> -        self.assertRunOk("mender -log-level debug show-artifact")
> -        self.assertRunOk("mender -log-level debug show-artifact | grep 'RUNTIME_TEST_ARTIFACT_NAME'")
> -        cmd = "mender show-artifact 2>&1 | grep -i 'err'"  # Check if no 'error' among the traces
> +        self.assertRunOk("mender-update --log-level debug show-artifact")
> +        self.assertRunOk("mender-update --log-level debug show-artifact | grep 'RUNTIME_TEST_ARTIFACT_NAME'")
> +        cmd = "mender-update show-artifact 2>&1 | grep -i 'err'"  # Check if no 'error' among the traces
>           _, exit_code = self.emulator.run(cmd)
>           self.assertEqual(exit_code, 1)
> diff --git a/support/testing/tests/package/test_mender/post-build.sh b/support/testing/tests/package/test_mender/post-build.sh
> new file mode 100755
> index 0000000000..2a084e70f5
> --- /dev/null
> +++ b/support/testing/tests/package/test_mender/post-build.sh
> @@ -0,0 +1,30 @@
> +#!/usr/bin/env bash
> +set -e
> +DEVICE_TYPE="buildroot-x86-64"
> +ARTIFACT_NAME="RUNTIME_TEST_ARTIFACT_NAME"
> +
> +generate_mender_bootstrap_artifact() {
> +  "${HOST_DIR}"/bin/mender-artifact \
> +    --compression none \
> +    write bootstrap-artifact \
> +    --artifact-name "${ARTIFACT_NAME}" \
> +    --device-type "${DEVICE_TYPE}" \
> +    --provides "rootfs-image.version:${ARTIFACT_NAME}" \
> +    --clears-provides "rootfs-image.*" \
> +    --output-path "${TARGET_DIR}"/var/lib/mender/bootstrap.mender \
> +    --version 3
> +}
> +
> +function mender_fixup() {
> +  cd "${TARGET_DIR}"
> +  rm -rf var/lib/mender
> +  mkdir -p var/lib/mender
> +
> +  rm -rf data
> +  mkdir -p data
> +  ln -sf /var/lib/mender/ data/

  I don't understand why this is needed... For the test, there's nothing 
persistent, so we can just use /var/lib/mender right? We anyway do that in the 
defconfig (mount the writable partition directly on /var/lib/mender).


  Regards,
  Arnout

> +}
> +
> +echo "device_type=${DEVICE_TYPE}" > "${TARGET_DIR}"/etc/mender/device_type
> +mender_fixup
> +generate_mender_bootstrap_artifact
> diff --git a/support/testing/tests/package/test_mender/rootfs-overlay/etc/mender/artifact_info b/support/testing/tests/package/test_mender/rootfs-overlay/etc/mender/artifact_info
> deleted file mode 100644
> index 4d54b8f89c..0000000000
> --- a/support/testing/tests/package/test_mender/rootfs-overlay/etc/mender/artifact_info
> +++ /dev/null
> @@ -1 +0,0 @@
> -artifact_name=RUNTIME_TEST_ARTIFACT_NAME
> diff --git a/support/testing/tests/package/test_mender/rootfs-overlay/etc/mender/mender.conf b/support/testing/tests/package/test_mender/rootfs-overlay/etc/mender/mender.conf
> new file mode 100644
> index 0000000000..5f423fb2cb
> --- /dev/null
> +++ b/support/testing/tests/package/test_mender/rootfs-overlay/etc/mender/mender.conf
> @@ -0,0 +1,11 @@
> +{
> +  "InventoryPollIntervalSeconds": 1800,
> +  "UpdatePollIntervalSeconds": 1800,
> +  "RetryPollIntervalSeconds": 300,
> +  "RootfsPartA": "/dev/vda2",
> +  "RootfsPartB": "/dev/vda3",
> +  "ServerCertificate": "/etc/mender/server.crt",
> +  "ServerURL": "https://docker.mender.io",
> +  "TenantToken": "dummy",
> +  "DeviceTypeFile": "/etc/mender/device_type"
> +}

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
