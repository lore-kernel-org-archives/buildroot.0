Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F31DEC433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:46:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68FBF60EFF
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:46:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 68FBF60EFF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48DDE40328;
	Sun, 26 Sep 2021 19:46:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r2l9Ap4wMTul; Sun, 26 Sep 2021 19:46:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47FD2402EE;
	Sun, 26 Sep 2021 19:46:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 165381BF383
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11DB74020E
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:46:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hcHiM2Q6URUZ for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 19:46:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9609E40109
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 19:46:28 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id g7so475201edv.1
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 12:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=ledkV569U1oZDVHaG2tcbf6kLIyyzmou2fHYjLVAQfU=;
 b=I+i2RWCDLb2QGzMOTVt5NlbjdA8+bAQbzbd2lrvQX37qnYcgo8tcd4Hu8GHMsCn5t3
 g71l9+HQgrB0ZRBfzHjrt1DfOMfRvS6vGM790al83x+cx8yUsKkXAPi5+V7pppw7uV/K
 Y4eSja2QKR0B35Jrq6rtgYfmUH5sQDqza4oKNhqKZQoS1TmU9zeytkJWcm59vbJm5XbZ
 04qIjaT5yG1VkNUBs4/2spFdjGiFgy3pdc2pBedTc5j7WM7hngt7yFWHrBrRrgFj1swU
 xgkt0kGwDp0N2p9g007pRLq6MAckF9hNPSEoDqEagIEMkKLL0Qgph8eZQmYBChgMyGX5
 6AcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ledkV569U1oZDVHaG2tcbf6kLIyyzmou2fHYjLVAQfU=;
 b=dtZ5XRc8aK+0vzFAjSqjy8y35LzBHwvDWOITSLdTBFt8+bN3uaWv8eRm7NnGzGI54F
 zli2aYFqDPCMTGjlUA09/AZDF2zSg3gJWSSkWb8z0pYF2EAwk/Qq6oYeV60/1qd6kO5O
 T89Ay4oJ/EYug0SVJ7J3S9vkgKcbm+Q8TljcB2PNWAsSw+bzHY90xx6vaX3bOBScdkhG
 ld7QaSvi5J6/yES16CEu0A15idtGMtXDHoi0IR/O3ZZGMyG5rKR4mvL6oa623pSnaWih
 2kMwXq3Fi3dIjOcGqz8aZAnJwwaafabAUzXW9GyZyGefAldux4rRKcuZug93XsssKMxr
 BdWg==
X-Gm-Message-State: AOAM5313Q7dePwYT9lBvT0OjQoQ99uiQ5ATTEW+Rrd+8/vCWdGaMWwyL
 uyvZToy+QxUJUxxKKm4di+BSlw==
X-Google-Smtp-Source: ABdhPJyyyHSaadLmzcXLcL8IZ9amF1c4ujAaXu3ONxkM/mhafAdV3/WJa5fFSM77Avii6G1KBAcpvQ==
X-Received: by 2002:a17:906:2887:: with SMTP id
 o7mr23337883ejd.425.1632685586674; 
 Sun, 26 Sep 2021 12:46:26 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id q6sm7700664eju.45.2021.09.26.12.46.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 12:46:26 -0700 (PDT)
Message-ID: <11a134fc-98dc-52f6-b3f2-00e357c34a10@mind.be>
Date: Sun, 26 Sep 2021 21:46:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210925084554.3323510-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210925084554.3323510-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/ntfs-3g: security bump to
 version 2021.8.22
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/09/2021 10:45, Fabrice Fontaine wrote:
> - Fixed vulnerability threats caused by maliciously tampered NTFS
>    partitions (CVE-2021-33285, CVE-2021-33286, CVE-2021-33287, etc.):
>    https://github.com/tuxera/ntfs-3g/security/advisories/GHSA-q759-8j5v-q5jp
> - Drop patch (already in version)
> 
> https://github.com/tuxera/ntfs-3g/wiki/NTFS-3G-Release-History
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...an-error-when-failed-to-build-the-mo.patch | 72 -------------------
>   package/ntfs-3g/ntfs-3g.hash                  |  2 +-
>   package/ntfs-3g/ntfs-3g.mk                    |  5 +-
>   3 files changed, 2 insertions(+), 77 deletions(-)
>   delete mode 100644 package/ntfs-3g/0001-Fixed-reporting-an-error-when-failed-to-build-the-mo.patch
> 
> diff --git a/package/ntfs-3g/0001-Fixed-reporting-an-error-when-failed-to-build-the-mo.patch b/package/ntfs-3g/0001-Fixed-reporting-an-error-when-failed-to-build-the-mo.patch
> deleted file mode 100644
> index 9ba8aae50c..0000000000
> --- a/package/ntfs-3g/0001-Fixed-reporting-an-error-when-failed-to-build-the-mo.patch
> +++ /dev/null
> @@ -1,72 +0,0 @@
> -From 85c1634a26faa572d3c558d4cf8aaaca5202d4e9 Mon Sep 17 00:00:00 2001
> -From: =?UTF-8?q?Jean-Pierre=20Andr=C3=A9?= <jean-pierre.andre@wanadoo.fr>
> -Date: Wed, 19 Dec 2018 15:57:50 +0100
> -Subject: [PATCH] Fixed reporting an error when failed to build the mountpoint
> -
> -The size check was inefficient because getcwd() uses an unsigned int
> -argument.
> -
> -Fixes CVE-2019-9755: An integer underflow issue exists in ntfs-3g 2017.3.23.
> -A local attacker could potentially exploit this by running /bin/ntfs-3g with
> -specially crafted arguments from a specially crafted directory to cause a
> -heap buffer overflow, resulting in a crash or the ability to execute
> -arbitrary code.  In installations where /bin/ntfs-3g is a setuid-root
> -binary, this could lead to a local escalation of privileges.
> -
> -Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ----
> - src/lowntfs-3g.c | 6 +++++-
> - src/ntfs-3g.c    | 6 +++++-
> - 2 files changed, 10 insertions(+), 2 deletions(-)
> -
> -diff --git a/src/lowntfs-3g.c b/src/lowntfs-3g.c
> -index 993867fa..0660439b 100644
> ---- a/src/lowntfs-3g.c
> -+++ b/src/lowntfs-3g.c
> -@@ -4411,7 +4411,8 @@ int main(int argc, char *argv[])
> - 	else {
> - 		ctx->abs_mnt_point = (char*)ntfs_malloc(PATH_MAX);
> - 		if (ctx->abs_mnt_point) {
> --			if (getcwd(ctx->abs_mnt_point,
> -+			if ((strlen(opts.mnt_point) < PATH_MAX)
> -+			    && getcwd(ctx->abs_mnt_point,
> - 				     PATH_MAX - strlen(opts.mnt_point) - 1)) {
> - 				strcat(ctx->abs_mnt_point, "/");
> - 				strcat(ctx->abs_mnt_point, opts.mnt_point);
> -@@ -4419,6 +4420,9 @@ int main(int argc, char *argv[])
> - 			/* Solaris also wants the absolute mount point */
> - 				opts.mnt_point = ctx->abs_mnt_point;
> - #endif /* defined(__sun) && defined (__SVR4) */
> -+			} else {
> -+				free(ctx->abs_mnt_point);
> -+				ctx->abs_mnt_point = (char*)NULL;
> - 			}
> - 		}
> - 	}
> -diff --git a/src/ntfs-3g.c b/src/ntfs-3g.c
> -index 6ce89fef..4e0912ae 100644
> ---- a/src/ntfs-3g.c
> -+++ b/src/ntfs-3g.c
> -@@ -4148,7 +4148,8 @@ int main(int argc, char *argv[])
> - 	else {
> - 		ctx->abs_mnt_point = (char*)ntfs_malloc(PATH_MAX);
> - 		if (ctx->abs_mnt_point) {
> --			if (getcwd(ctx->abs_mnt_point,
> -+			if ((strlen(opts.mnt_point) < PATH_MAX)
> -+			    && getcwd(ctx->abs_mnt_point,
> - 				     PATH_MAX - strlen(opts.mnt_point) - 1)) {
> - 				strcat(ctx->abs_mnt_point, "/");
> - 				strcat(ctx->abs_mnt_point, opts.mnt_point);
> -@@ -4156,6 +4157,9 @@ int main(int argc, char *argv[])
> - 			/* Solaris also wants the absolute mount point */
> - 				opts.mnt_point = ctx->abs_mnt_point;
> - #endif /* defined(__sun) && defined (__SVR4) */
> -+			} else {
> -+				free(ctx->abs_mnt_point);
> -+				ctx->abs_mnt_point = (char*)NULL;
> - 			}
> - 		}
> - 	}
> ---
> -2.20.1
> -
> diff --git a/package/ntfs-3g/ntfs-3g.hash b/package/ntfs-3g/ntfs-3g.hash
> index 63c999f253..668e11a800 100644
> --- a/package/ntfs-3g/ntfs-3g.hash
> +++ b/package/ntfs-3g/ntfs-3g.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated
> -sha256  3e5a021d7b761261836dcb305370af299793eedbded731df3d6943802e1262d5  ntfs-3g_ntfsprogs-2017.3.23.tgz
> +sha256  55b883aa05d94b2ec746ef3966cb41e66bed6db99f22ddd41d1b8b94bb202efb  ntfs-3g_ntfsprogs-2021.8.22.tgz
>   sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
>   sha256  d7bf9d064ac3e5840f9dd02422b7eeec4f1fd03f37fadbd043602be5e882304f  COPYING.LIB
> diff --git a/package/ntfs-3g/ntfs-3g.mk b/package/ntfs-3g/ntfs-3g.mk
> index 1a388af761..21f7cfc46d 100644
> --- a/package/ntfs-3g/ntfs-3g.mk
> +++ b/package/ntfs-3g/ntfs-3g.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -NTFS_3G_VERSION = 2017.3.23
> +NTFS_3G_VERSION = 2021.8.22
>   NTFS_3G_SOURCE = ntfs-3g_ntfsprogs-$(NTFS_3G_VERSION).tgz
>   NTFS_3G_SITE = http://tuxera.com/opensource
>   NTFS_3G_CONF_OPTS = --disable-ldconfig
> @@ -14,9 +14,6 @@ NTFS_3G_LICENSE = GPL-2.0+, LGPL-2.0+
>   NTFS_3G_LICENSE_FILES = COPYING COPYING.LIB
>   NTFS_3G_CPE_ID_VENDOR = tuxera
>   
> -# 0001-Fixed-reporting-an-error-when-failed-to-build-the-mo.patch
> -NTFS_3G_IGNORE_CVES += CVE-2019-9755
> -
>   ifeq ($(BR2_PACKAGE_LIBFUSE),y)
>   NTFS_3G_CONF_OPTS += --with-fuse=external
>   NTFS_3G_DEPENDENCIES += libfuse
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
