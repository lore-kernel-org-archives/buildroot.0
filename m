Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D0ECD4847
	for <buildroot@archiver.kernel.org>; Fri, 22 Sep 2023 18:04:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9483E60ACA;
	Fri, 22 Sep 2023 18:04:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9483E60ACA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id viI5tZy30YQw; Fri, 22 Sep 2023 18:04:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48581610DB;
	Fri, 22 Sep 2023 18:04:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48581610DB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D56F61BF2CA
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 18:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6F6641DED
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 18:04:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6F6641DED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5SY_EWzZliRM for <buildroot@lists.busybox.net>;
 Fri, 22 Sep 2023 18:04:19 +0000 (UTC)
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7F0B541B4E
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 18:04:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F0B541B4E
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-532e6f8125cso2937068a12.3
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 11:04:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695405857; x=1696010657;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uhBJ3uVcX6L7IrRCOZuSMJYASaSV6GADWtlRNMMoYGc=;
 b=xCc7BAZxeFhW8zoN+ga+xiI0mXDj+1TwqRlcsfvzGmBrx2IhMobH8Qhg3DPZ0be4PW
 hvgx2UpYp6vatkvHg6T2vwz2vcDX9+OoAT3qTlFp/aDoet15QE/OakKKAkEi4TtynK2Y
 SH95yKuIhnx9NXm00iRO1byg0tWxoXaHqChZsjGo3Qg/Bn73BeIvniSCV4Ji7gfuS2gL
 TkBceLfDEifd7gdzRGbRvtLrNZUUS0TNwS7bJiYtLtu0VigN9iOF3AcU6buO7aXlmEtk
 qJb20zlfuqAm8AeH2vDhBqhyl0//rPVGVbI7iKKz7ZEQ4b0D6aqqS2kb3+s6Vi95uenZ
 n4uA==
X-Gm-Message-State: AOJu0YyvfSbhYOfBmcX2jC57haha5j32xaH85qvgXsd4q9kfDaLg5obq
 b9JeA2TGdpwBgp3EYuN91pw7JYPLk6uY8wruCb0=
X-Google-Smtp-Source: AGHT+IFtxtcPNEcC12dqVU9S8j6N/HbTxjs2GSagMTpwwupScemHQWeji1DJP1y4BJ6Ussue0CCFsA==
X-Received: by 2002:aa7:db99:0:b0:522:2782:537 with SMTP id
 u25-20020aa7db99000000b0052227820537mr191334edt.15.1695405857259; 
 Fri, 22 Sep 2023 11:04:17 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 r22-20020aa7da16000000b00532c84e6997sm2559311eds.23.2023.09.22.11.04.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Sep 2023 11:04:16 -0700 (PDT)
Message-ID: <515993ce-d39e-bc01-4346-8506db876b9e@mind.be>
Date: Fri, 22 Sep 2023 20:04:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Jens Maus <mail@jens-maus.de>, buildroot@buildroot.org
References: <20230917200134.1251786-1-mail@jens-maus.de>
In-Reply-To: <20230917200134.1251786-1-mail@jens-maus.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1695405857; x=1696010657; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uhBJ3uVcX6L7IrRCOZuSMJYASaSV6GADWtlRNMMoYGc=;
 b=HuOnANlUQY4s0wNYgU8i4x/Ex2lG+w3R3s93sKeizuF2chqCXYldy31mQyDMlxA2k6
 d0lCgAilnPl/buk1RIKBMuilS8g4sS+QeIYtCFXPIdAsp0Dl1BC8iNCSDYycO4U4mast
 muZGp5rQcBUeIFm5tc9p6pQf1zawtyUC7Am0BLSlYjCmbhiKfwTlwGdiNqb81UN1plG7
 kfo2zEmAE9J6MUbcdoLFbkVikGkksHZQX5BQY9w7QPDBEOu405rH5LrIv4FDjs/o9b9Q
 vmWkQ73jRRVSueN8c9AnqvzfLh51UQE3OxlQgNZVocwKYQfyunLXKuJnUCHKCRry4dEl
 65Kw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=HuOnANlU
Subject: Re: [Buildroot] [PATCH 1/1] boot/grub2: fix incompat e2fsprogs
 feature use
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Jens,

On 17/09/2023 22:01, Jens Maus via buildroot wrote:
> With bump of package/e2fsprogs to 1.47.0 [1] a freshly generated
> ext4 fs has unfortunately different default features enabled
> (e.g. metadata_csum_seed). This and some other newer fs features
> (e.g. large_dir) are however not supported by our grub2.
> Thus, newly generated ext-based rootfs won't be recognized by grub2
> and are therefore not bootable/usable from grub2 anymore. This is
> an issue already known to other Linux derivates [2],[3],[4].
> 
> This commit introduces two additional upstream patches to
> package/grub2 which adds EXT4_FEATURE_INCOMPAT_CSUM_SEED and
> EXT4_FEATURE_INCOMPAT_LARGEDIR to the EXT2_DRIVER_IGNORED_INCOMPAT
> list of ignored incompatible ext features, allowing grub2 to
> use ext filesystems with these newer default feature sets.
> 
> [1] https://git.buildroot.net/buildroot/commit/?id=6a21733f839478d902f3eab287a82b456e55f708
> [2] https://bugs.launchpad.net/ubuntu/+source/grub2/+bug/1844012
> [3] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1031325
> [4] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1030939
> 
> Signed-off-by: Jens Maus <mail@jens-maus.de>
> ---
>   ...gnore-checksum-seed-incompat-feature.patch | 59 +++++++++++++++++++
>   ...gnore-the-large_dir-incompat-feature.patch | 58 ++++++++++++++++++
>   2 files changed, 117 insertions(+)
>   create mode 100644 boot/grub2/0019-Ignore-checksum-seed-incompat-feature.patch
>   create mode 100644 boot/grub2/0020-Ignore-the-large_dir-incompat-feature.patch
> 
> diff --git a/boot/grub2/0019-Ignore-checksum-seed-incompat-feature.patch b/boot/grub2/0019-Ignore-checksum-seed-incompat-feature.patch
> new file mode 100644
> index 0000000000..27b2277c40
> --- /dev/null
> +++ b/boot/grub2/0019-Ignore-checksum-seed-incompat-feature.patch
> @@ -0,0 +1,59 @@
> +From 7fd5feff97c4b1f446f8fcf6d37aca0c64e7c763 Mon Sep 17 00:00:00 2001
> +From: Javier Martinez Canillas <javierm@redhat.com>
> +Date: Fri, 11 Jun 2021 21:36:16 +0200
> +Subject: fs/ext2: Ignore checksum seed incompat feature
> +
> +This incompat feature is used to denote that the filesystem stored its
> +metadata checksum seed in the superblock. This is used to allow tune2fs
> +changing the UUID on a mounted metdata_csum filesystem without having
> +to rewrite all the disk metadata. However, the GRUB doesn't use the
> +metadata checksum at all. So, it can just ignore this feature if it
> +is enabled. This is consistent with the GRUB filesystem code in general
> +which just does a best effort to access the filesystem's data.
> +
> +The checksum seed incompat feature has to be removed from the ignore
> +list if the support for metadata checksum verification is added to the
> +GRUB ext2 driver later.
> +
> +Suggested-by: Eric Sandeen <esandeen@redhat.com>
> +Suggested-by: Lukas Czerner <lczerner@redhat.com>
> +Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> +Reviewed-by: Lukas Czerner <lczerner@redhat.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>

  This is missing your Signed-off-by and upstream link (as reported by 
check-package).

  The signed-off-by is needed separately on patches because the patches may be 
copied outside of Buildroot, thus loosing the provenance trail.

  For the upstream link, preferably point to the right commit in 
https://git.savannah.gnu.org/cgit/grub.git


  Regards,
  Arnout

> +---
> + grub-core/fs/ext2.c | 10 ++++++++--
> + 1 file changed, 8 insertions(+), 2 deletions(-)
> +
> +diff --git a/grub-core/fs/ext2.c b/grub-core/fs/ext2.c
> +index e7dd78e..4953a15 100644
> +--- a/grub-core/fs/ext2.c
> ++++ b/grub-core/fs/ext2.c
> +@@ -103,6 +103,7 @@ GRUB_MOD_LICENSE ("GPLv3+");
> + #define EXT4_FEATURE_INCOMPAT_64BIT		0x0080
> + #define EXT4_FEATURE_INCOMPAT_MMP		0x0100
> + #define EXT4_FEATURE_INCOMPAT_FLEX_BG		0x0200
> ++#define EXT4_FEATURE_INCOMPAT_CSUM_SEED		0x2000
> + #define EXT4_FEATURE_INCOMPAT_ENCRYPT          0x10000
> +
> + /* The set of back-incompatible features this driver DOES support. Add (OR)
> +@@ -123,10 +124,15 @@ GRUB_MOD_LICENSE ("GPLv3+");
> +  * mmp:            Not really back-incompatible - was added as such to
> +  *                 avoid multiple read-write mounts. Safe to ignore for this
> +  *                 RO driver.
> ++ * checksum seed:  Not really back-incompatible - was added to allow tools
> ++ *                 such as tune2fs to change the UUID on a mounted metadata
> ++ *                 checksummed filesystem. Safe to ignore for now since the
> ++ *                 driver doesn't support checksum verification. However, it
> ++ *                 has to be removed from this list if the support is added later.
> +  */
> + #define EXT2_DRIVER_IGNORED_INCOMPAT ( EXT3_FEATURE_INCOMPAT_RECOVER \
> +-				     | EXT4_FEATURE_INCOMPAT_MMP)
> +-
> ++				     | EXT4_FEATURE_INCOMPAT_MMP \
> ++				     | EXT4_FEATURE_INCOMPAT_CSUM_SEED)
> +
> + #define EXT3_JOURNAL_MAGIC_NUMBER	0xc03b3998U
> +
> +--
> +cgit v1.1
> +
> diff --git a/boot/grub2/0020-Ignore-the-large_dir-incompat-feature.patch b/boot/grub2/0020-Ignore-the-large_dir-incompat-feature.patch
> new file mode 100644
> index 0000000000..957b66f2c1
> --- /dev/null
> +++ b/boot/grub2/0020-Ignore-the-large_dir-incompat-feature.patch
> @@ -0,0 +1,58 @@
> +From 2e9fa73a040462b81bfbfe56c0bc7ad2d30b446b Mon Sep 17 00:00:00 2001
> +From: Theodore Ts'o <tytso@mit.edu>
> +Date: Tue, 30 Aug 2022 22:41:59 -0400
> +Subject: fs/ext2: Ignore the large_dir incompat feature
> +
> +Recently, ext4 added the large_dir feature, which adds support for
> +a 3 level htree directory support.
> +
> +The GRUB supports existing file systems with htree directories by
> +ignoring their existence, and since the index nodes for the hash tree
> +look like deleted directory entries (by design), the GRUB can simply do
> +a brute force O(n) linear search of directories. The same is true for
> +3 level deep htrees indicated by large_dir feature flag.
> +
> +Hence, it is safe for the GRUB to ignore the large_dir incompat feature.
> +
> +Fixes: https://savannah.gnu.org/bugs/?61606
> +
> +Signed-off-by: Theodore Ts'o <tytso@mit.edu>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +---
> + grub-core/fs/ext2.c | 10 +++++++++-
> + 1 file changed, 9 insertions(+), 1 deletion(-)
> +
> +diff --git a/grub-core/fs/ext2.c b/grub-core/fs/ext2.c
> +index 0989e26..e1cc5e6 100644
> +--- a/grub-core/fs/ext2.c
> ++++ b/grub-core/fs/ext2.c
> +@@ -104,6 +104,7 @@ GRUB_MOD_LICENSE ("GPLv3+");
> + #define EXT4_FEATURE_INCOMPAT_MMP		0x0100
> + #define EXT4_FEATURE_INCOMPAT_FLEX_BG		0x0200
> + #define EXT4_FEATURE_INCOMPAT_CSUM_SEED		0x2000
> ++#define EXT4_FEATURE_INCOMPAT_LARGEDIR		0x4000 /* >2GB or 3 level htree */
> + #define EXT4_FEATURE_INCOMPAT_ENCRYPT          0x10000
> +
> + /* The set of back-incompatible features this driver DOES support. Add (OR)
> +@@ -129,10 +130,17 @@ GRUB_MOD_LICENSE ("GPLv3+");
> +  *                 checksummed filesystem. Safe to ignore for now since the
> +  *                 driver doesn't support checksum verification. However, it
> +  *                 has to be removed from this list if the support is added later.
> ++ * large_dir:      Not back-incompatible given that the GRUB ext2 driver does
> ++ *                 not implement EXT2_FEATURE_COMPAT_DIR_INDEX. If the GRUB
> ++ *                 eventually supports the htree feature (aka dir_index)
> ++ *                 it should support 3 level htrees and then move
> ++ *                 EXT4_FEATURE_INCOMPAT_LARGEDIR to
> ++ *                 EXT2_DRIVER_SUPPORTED_INCOMPAT.
> +  */
> + #define EXT2_DRIVER_IGNORED_INCOMPAT ( EXT3_FEATURE_INCOMPAT_RECOVER \
> + 				     | EXT4_FEATURE_INCOMPAT_MMP \
> +-				     | EXT4_FEATURE_INCOMPAT_CSUM_SEED)
> ++				     | EXT4_FEATURE_INCOMPAT_CSUM_SEED \
> ++				     | EXT4_FEATURE_INCOMPAT_LARGEDIR)
> +
> + #define EXT3_JOURNAL_MAGIC_NUMBER	0xc03b3998U
> +
> +--
> +cgit v1.1
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
