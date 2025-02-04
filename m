Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0117C02193
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 15:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B5A5607D2;
	Tue,  4 Feb 2025 15:35:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id usMhnyGwyCcz; Tue,  4 Feb 2025 15:35:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C17A60849
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C17A60849;
	Tue,  4 Feb 2025 15:35:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 709E512A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5591C810C7
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:35:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VsiBWrSPbh9U for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 15:35:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0B96C80CA8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B96C80CA8
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0B96C80CA8
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:35:34 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-438a3216fc2so57409725e9.1
 for <buildroot@buildroot.org>; Tue, 04 Feb 2025 07:35:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738683333; x=1739288133;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NUQ5IYG6RWKTSIUZGcADZukwi4KTZrcCgptIW4AHHhc=;
 b=VYV5aVFV5f5AsO7b3Stws/RuVvYLGKrQbTs+yjaD7eY2gY3eGneqLSsY0VU6T7/9ry
 EmjZWeD6yW8rbbOQzOmaEt57gN7VpxEuaGbs80DIgVTxC/Fb2CKVkOARD+IGicw7PEoJ
 T4Hfng0F/Zm0wecCqrva3/0y3FSNBrkTtqnnWnrsE9ZD2tU+5ODQ5a4XcVlLbRn5Kf5y
 A6/RoKDl8J2h2UFwvl9bWf1Sv4UtnMuRYGZOFhcD4RpIDOoI9ujWxdhDZi3x7BzlV11D
 hIRxTyazBTxFLRGxkQzzt3BITBX5JRrMJHzNeRe0nTMax8wCWounGFCKK100G+U/ETHj
 pf9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVO2DLHmIE4OTlaPlt6LzTBOmK+9NWxbAJTg8n180dSFDUNgitHinMxdKIXBzJ9IzHJG9nXYAG0E04=@buildroot.org
X-Gm-Message-State: AOJu0YzMov0LKQBs3pOnaJZtJLUNcXz0Q58SQrUTF2xenRXMyzLFvzbq
 iPW9X4p2iybXLT/IJ2SJod73Vyu7I0GUVRbbEx1CgtKL/H5VgY9+KaJXHkkpbFG5D8aQqeCtqnn
 9
X-Gm-Gg: ASbGnctkPIe8voao9pgnGaZVGhTTjcYb6VC7ND0MsxA6vJ3xW2FkjQVEiOejv8+gi8Y
 ekJjxSuwKPUDMIqEYIVm+BOUiI5nqc8VT7GZRO++G2mC7urjhCJ+BxUtgJhwpKtK9/GADZBfqnQ
 ZAfSeaCok9FeJMITLVke6rJfvqdwhQ3xolBR9JyGJlvC/hORYv2jBmKfAFLnPau5UwJFxW7Ujfd
 iOIVomv3KEL0r74/2xzW21r4oCMdXaEmz0EUORPJCfL8EkN35FqD6yB5ebDfSKRyCNxC0a72jdS
 sQJVVPeiHlusqOL4J4j8OW627F8tO8v8wledTxuDosuAI5M=
X-Google-Smtp-Source: AGHT+IHmwUzGwlNevXiGhOeNlb6+AyMJUam7PgQ0uHjr3zCpmXX8M+kU2afvFf2oDYTVsGDhS8UZ6w==
X-Received: by 2002:a05:600c:3b23:b0:436:f960:3428 with SMTP id
 5b1f17b1804b1-438dc42ff3cmr234111485e9.29.1738683332768; 
 Tue, 04 Feb 2025 07:35:32 -0800 (PST)
Received: from [172.16.2.111] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc27125sm226525595e9.15.2025.02.04.07.35.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 07:35:32 -0800 (PST)
Message-ID: <aeb33c22-b624-46e5-9e61-46f0a26ac471@mind.be>
Date: Tue, 4 Feb 2025 16:35:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20250203142104.2704631-1-peter@korsgaard.com>
Content-Language: en-GB
In-Reply-To: <20250203142104.2704631-1-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738683333; x=1739288133; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NUQ5IYG6RWKTSIUZGcADZukwi4KTZrcCgptIW4AHHhc=;
 b=eOEENoNX+tG5Qc8bLCNn4b7/tlXJOqUG5zzh0cQ9hf0dwtwQjqmwVs/sSivadfnHHK
 9z58/p95zQ3/hJYiXGN/JW3EcBBuAGDTRgpsOXZalkw96JwjjTPCF+eefa6SKDJrJ0lz
 5S6yCEe4KWHFJB/DYI2BiHWMXAz1kdzFsJw7OgcfEgeAN+5D7RO7kw3FI9Kc3lFMGkY0
 uoTz5D6IT2UwOmXoPwP8JxgkWIeo2L5i5UFS+4s6vnsIIKIzirqmnaZHr09zn7rT3H0K
 uZLIOnSoyaQPfZszEozoKwG/YSq8hpCWtU30dlJlZwPLHOdzd0brZQ8VimnB2PRJf5cJ
 im9A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=eOEENoNX
Subject: Re: [Buildroot] [PATCH] {fs/,package/gen}romfs: remove
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 03/02/2025 15:21, Peter Korsgaard wrote:
> Fixes:
> http://autobuild.buildroot.net/results/9b0/9b09c8681e1003580b766aa0d244889f3b0be0c8/
> 
> Romfs is very old and limited, the fs logic and package has not really
> changed since it was added 17 years ago with Commit 4b01dfced944 ("Add romfs
> target support, courtesy Josh <buildroot@digitalpeer.com>") and genromfs
> crashes in some situations, so drop it.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  You forgot to remove it from DEVELOPERS and checkpackageignore.

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   Config.in.legacy                         | 12 +++++++++
>   fs/Config.in                             |  1 -
>   fs/romfs/Config.in                       |  4 ---
>   fs/romfs/romfs.mk                        | 13 ---------
>   package/Config.in                        |  1 -
>   package/genromfs/0001-build-system.patch | 26 ------------------
>   package/genromfs/Config.in               |  6 -----
>   package/genromfs/genromfs.hash           |  3 ---
>   package/genromfs/genromfs.mk             | 34 ------------------------
>   9 files changed, 12 insertions(+), 88 deletions(-)
>   delete mode 100644 fs/romfs/Config.in
>   delete mode 100644 fs/romfs/romfs.mk
>   delete mode 100644 package/genromfs/0001-build-system.patch
>   delete mode 100644 package/genromfs/Config.in
>   delete mode 100644 package/genromfs/genromfs.hash
>   delete mode 100644 package/genromfs/genromfs.mk
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index abc65d0c9a..7ccb4a0cbc 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,18 @@ endif
>   
>   comment "Legacy options removed in 2025.02"
>   
> +config BR2_PACKAGE_GENROMFS
> +	bool "genromfs"
> +	select BR2_LEGACY
> +	help
> +	  Romfs root filesystem support has been removed.
> +
> +config BR2_TARGET_ROOTFS_ROMFS
> +	bool "romfs root filesystem has been removed"
> +	select BR2_LEGACY
> +	help
> +	  Romfs root filesystem support has been removed.
> +
>   config BR2_GDB_VERSION_13
>   	bool "gdb 13.x has been removed"
>   	select BR2_LEGACY
> diff --git a/fs/Config.in b/fs/Config.in
> index eee5e26bb2..6b338f8ec8 100644
> --- a/fs/Config.in
> +++ b/fs/Config.in
> @@ -12,7 +12,6 @@ source "fs/initramfs/Config.in"
>   source "fs/iso9660/Config.in"
>   source "fs/jffs2/Config.in"
>   source "fs/oci/Config.in"
> -source "fs/romfs/Config.in"
>   source "fs/squashfs/Config.in"
>   source "fs/tar/Config.in"
>   source "fs/ubi/Config.in"
> diff --git a/fs/romfs/Config.in b/fs/romfs/Config.in
> deleted file mode 100644
> index 84944a0fc0..0000000000
> --- a/fs/romfs/Config.in
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -config BR2_TARGET_ROOTFS_ROMFS
> -	bool "romfs root filesystem"
> -	help
> -	  Build a romfs image of the root filesystem.
> diff --git a/fs/romfs/romfs.mk b/fs/romfs/romfs.mk
> deleted file mode 100644
> index 163751b4e2..0000000000
> --- a/fs/romfs/romfs.mk
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -################################################################################
> -#
> -# Build the romfs root filesystem image
> -#
> -################################################################################
> -
> -ROOTFS_ROMFS_DEPENDENCIES = host-genromfs
> -
> -define ROOTFS_ROMFS_CMD
> -	$(HOST_DIR)/bin/genromfs -d $(TARGET_DIR) -f $@
> -endef
> -
> -$(eval $(rootfs))
> diff --git a/package/Config.in b/package/Config.in
> index e9c789cff2..44b285d348 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -238,7 +238,6 @@ menu "Filesystem and flash utilities"
>   	source "package/fwup/Config.in"
>   	source "package/genext2fs/Config.in"
>   	source "package/genpart/Config.in"
> -	source "package/genromfs/Config.in"
>   	source "package/gocryptfs/Config.in"
>   	source "package/imx-usb-loader/Config.in"
>   	source "package/mmc-utils/Config.in"
> diff --git a/package/genromfs/0001-build-system.patch b/package/genromfs/0001-build-system.patch
> deleted file mode 100644
> index 827fe75bd2..0000000000
> --- a/package/genromfs/0001-build-system.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> ----
> - Makefile |    4 +---
> - 1 file changed, 1 insertion(+), 3 deletions(-)
> -
> -Index: genromfs-0.5.2/Makefile
> -===================================================================
> ---- genromfs-0.5.2.orig/Makefile
> -+++ genromfs-0.5.2/Makefile
> -@@ -6,8 +6,6 @@
> - PACKAGE = genromfs
> - VERSION = 0.5.2
> - CC = gcc
> --CFLAGS = -O2 -Wall -DVERSION=\"$(VERSION)\"#-g#
> --LDFLAGS = -s#-g
> -
> - DISTDIR = $(PACKAGE)-$(VERSION)
> -
> -@@ -24,7 +22,7 @@
> - 	$(CC) $(LDFLAGS) genromfs.o -o genromfs
> -
> - .c.o:
> --	$(CC) $(CFLAGS) $< -c -o $@
> -+	$(CC) $(CFLAGS) -DVERSION=\"$(VERSION)\" $< -c -o $@
> -
> - clean:
> - 	rm -f genromfs *.o
> diff --git a/package/genromfs/Config.in b/package/genromfs/Config.in
> deleted file mode 100644
> index e4eba9f16a..0000000000
> --- a/package/genromfs/Config.in
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -config BR2_PACKAGE_GENROMFS
> -	bool "genromfs"
> -	help
> -	  Tool to generate a ROMFS filesystem.
> -
> -	  http://romfs.sourceforge.net/
> diff --git a/package/genromfs/genromfs.hash b/package/genromfs/genromfs.hash
> deleted file mode 100644
> index 0be88ee1b4..0000000000
> --- a/package/genromfs/genromfs.hash
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -# Locally computed:
> -sha256  30f37fc734572c1dbaa2504585bc23ba6b8fd7df767ae7155995b2ca0ebed960  genromfs-0.5.2.tar.gz
> -sha256  cc2a6651c315b233ebc110b49ea3c6452eff9a28f8bc051ffd2bb92a8dcfa3d2  COPYING
> diff --git a/package/genromfs/genromfs.mk b/package/genromfs/genromfs.mk
> deleted file mode 100644
> index fd696b45b2..0000000000
> --- a/package/genromfs/genromfs.mk
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -################################################################################
> -#
> -# genromfs
> -#
> -################################################################################
> -
> -GENROMFS_VERSION = 0.5.2
> -GENROMFS_SITE = http://downloads.sourceforge.net/project/romfs/genromfs/$(GENROMFS_VERSION)
> -GENROMFS_LICENSE = GPL-2.0+
> -GENROMFS_LICENSE_FILES = COPYING
> -
> -define GENROMFS_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> -		CC="$(TARGET_CC)" \
> -		CFLAGS="$(TARGET_CFLAGS)" \
> -		LDFLAGS="$(TARGET_LDFLAGS)"
> -endef
> -
> -# "PREFIX" is the equivalent of DESTDIR in autotools, "prefix" is the
> -# traditional prefix. "prefix" defaults to /usr so no need to set it.
> -define GENROMFS_INSTALL_TARGET_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=$(TARGET_DIR) install
> -endef
> -
> -define HOST_GENROMFS_BUILD_CMDS
> -	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
> -endef
> -
> -define HOST_GENROMFS_INSTALL_CMDS
> -	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) prefix=$(HOST_DIR) install
> -endef
> -
> -$(eval $(generic-package))
> -$(eval $(host-generic-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
