Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81190CAC5B0
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43E994174B;
	Thu, 25 Sep 2025 20:17:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IOgO2UfEc1BQ; Thu, 25 Sep 2025 20:17:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A2B64175E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A2B64175E;
	Thu, 25 Sep 2025 20:17:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B487612D
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67AF54129D
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:17:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UnrPLfHDOVe3 for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:17:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 58BAD41275
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58BAD41275
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 58BAD41275
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:17:18 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3b9edf4cf6cso1461878f8f.3
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 13:17:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758831436; x=1759436236;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V+govTe4/ODF7CtYmooWsXNg1IaN6QJA5bD9CzBqPTU=;
 b=Sh2/jb4TqnghTLGeMHAUt7xM61Z7tPIARHzea33rUKbkfd+YmqgufLAJfZRdZB1NXT
 3KTMejU70p2MKfZ+pXXmF/IRnwMnPj7+n+hwSbEmXm/PGiU+Uw680DGU1c6PhbSaMkBF
 0vAFz6L/yDvLcOUXwkjZpLtCf9jVujiu9hO+sD2VYCq7H/QUx28SgzpiGMMfsG4+D2mb
 TqgbQ6yYCPEJGltmb/Rrn0kR6Fw+nNn7f5NhBlMtamrw2N2uvjsU86L68UBFkOHnjjPA
 XABjBNRbBjVLocophGbAtb42HRl+WaILOMNd5y1yzI2VZWPPGHdwGbISJzkfWyLO6XTv
 yD4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzgmkiB/VHoYVz1VtvJpTprGUP7TUTGkegStnaU9FvtZlsLoE8nDYbxJOrmUoNrgaB2LIe3GuPHws=@buildroot.org
X-Gm-Message-State: AOJu0YwZHNlH4uLTOjg55/NYKrlXRzWR5YTEMrVHMQWU1LgGBmbHqIva
 sUNEF/MgofkTH4EUIk366kxuKui1kJK390t1pIdcky5qwZ6d2yG6XVnTUDpY1Id0b8E=
X-Gm-Gg: ASbGncte3tDWqqr5ABlCjnF6g1dsIA+hxh4fmLt8AWqgl2H/f0b6sOte+8oBQW81eUY
 sObYM3zssA9bY/bI3WRSPr+0q/dZWOS77fQLFW1UtFuWI2WbbBYIKn9LhSODXHyAzmc/B9G+0ji
 LbEvBXqNz7o/8J7uEJsVlhHvu3NBAh4HKSMK3JnZXNhY31bB59d+Xg1+laVPGmUYBVfOshlZQSF
 KgFdnD96UQ1pvDk+W73i1kD2JQJOxekfCM7J9lA6IpAVj1F5F/Fhjs3aXIp2Zh+7cMSeLnT3+0g
 bQkTaSHbs7NOJTRgEQogPp9JGi58UvZ7OmbU1K9s99h60PWMNRVB+6tJLWl8bjkNS+mMxYTvUq2
 7vucuxrvvG+JaGF4=
X-Google-Smtp-Source: AGHT+IENOVdoqmrfVMK3dwrrwZoVdfPGEE7c09ofwHaQsuuG3WEGm4NDnCk8NCLATFhENcRHfZMMXQ==
X-Received: by 2002:a05:6000:3101:b0:3ea:bccc:2a2c with SMTP id
 ffacd0b85a97d-40e46514d91mr4453667f8f.11.1758831436459; 
 Thu, 25 Sep 2025 13:17:16 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc6cf3835sm4198498f8f.46.2025.09.25.13.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 13:17:16 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 25 Sep 2025 22:17:15 +0200
Message-ID: <20250925201715.44731-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250907160424.3546872-2-thomas.petazzoni@bootlin.com>
References: <20250907160424.3546872-2-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758831436; x=1759436236; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V+govTe4/ODF7CtYmooWsXNg1IaN6QJA5bD9CzBqPTU=;
 b=OYq6iKYiIvb8PpMPy9YGIAsK4Ph9qYQukDVqgxltq21kOGow7HBk/tfsuJ/BjJE+BI
 1WyYcy53D9XyBua2CYSK2u51+FhRU9JGRG/Qz/b12rydWi60s2otff5Fe3L7y3F3C3uw
 Hqvj9z0eOZug/pinzVEdBExKDl2/l+l0EZJ+pyMZ7YhZAcLzQfrjfIGl9ha9ILfiyy/I
 qLnx+FyXmzV3b8OCg3C+Wh5eK177vuVrxG6iuJY5MlEKuWgTwV1+8deIa/DF+PpcwZic
 MN1nvM5xOTzexxqEvtN02WWO8Q8w3eUgN7oqmSjXHgz69dVN+/6pXdj9jPSUo3S60RZL
 WP9g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OYq6iKYi
Subject: Re: [Buildroot] [PATCH 2/2] package/c-icap-modules: fix build with
 GCC 15.x
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Add a patch fixing prototype issues with GCC 15.x. The patch cannot be
> submitted upstream because the problematic code has completely changed
> in newer releases.
> 
> No autobuilder failures because they were hidden by 'c-icap' not
> building with GCC 15.x.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.08.x. Thanks

> ---
>  ...ule-function-prototypes-for-GCC-15.x.patch | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 package/c-icap-modules/0001-Fix-module-function-prototypes-for-GCC-15.x.patch
> 
> diff --git a/package/c-icap-modules/0001-Fix-module-function-prototypes-for-GCC-15.x.patch b/package/c-icap-modules/0001-Fix-module-function-prototypes-for-GCC-15.x.patch
> new file mode 100644
> index 0000000000..c0886d3c0e
> --- /dev/null
> +++ b/package/c-icap-modules/0001-Fix-module-function-prototypes-for-GCC-15.x.patch
> @@ -0,0 +1,59 @@
> +From 5cc2e2764588fc5025e1ba7e07361d50659bb06a Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +Date: Sun, 7 Sep 2025 17:58:00 +0200
> +Subject: [PATCH] Fix module function prototypes for GCC 15.x
> +
> +Upstream: N/A, upstream has completely changed how modules work
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + services/virus_scan/clamav_mod.c | 4 ++--
> + services/virus_scan/clamd_mod.c  | 4 ++--
> + 2 files changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/services/virus_scan/clamav_mod.c b/services/virus_scan/clamav_mod.c
> +index a138006..ee26ce6 100644
> +--- a/services/virus_scan/clamav_mod.c
> ++++ b/services/virus_scan/clamav_mod.c
> +@@ -75,7 +75,7 @@ static struct ci_conf_entry clamav_conf_variables[] = {
> + 
> + int clamav_init(struct ci_server_conf *server_conf);
> + int clamav_post_init(struct ci_server_conf *server_conf);
> +-void clamav_release();
> ++void clamav_release(struct ci_server_conf *server_conf);
> + 
> + CI_DECLARE_MOD_DATA common_module_t module = {
> +     "clamav_mod",
> +@@ -273,7 +273,7 @@ int clamav_post_init(struct ci_server_conf *server_conf)
> +      return CI_OK;
> + }
> + 
> +-void clamav_release()
> ++void clamav_release(struct ci_server_conf *server_conf)
> + {
> +     clamav_destroy_virusdb();
> +     if (CLAMAV_TMP)
> +diff --git a/services/virus_scan/clamd_mod.c b/services/virus_scan/clamd_mod.c
> +index c0d2909..c522a9c 100644
> +--- a/services/virus_scan/clamd_mod.c
> ++++ b/services/virus_scan/clamd_mod.c
> +@@ -34,7 +34,7 @@ static struct ci_conf_entry clamd_conf_variables[] = {
> + 
> + int clamd_init(struct ci_server_conf *server_conf);
> + int clamd_post_init(struct ci_server_conf *server_conf);
> +-void clamd_release();
> ++void clamd_release(struct ci_server_conf *server_conf);
> + 
> + CI_DECLARE_MOD_DATA common_module_t module = {
> +     "clamd_mod",
> +@@ -301,7 +301,7 @@ int clamd_post_init(struct ci_server_conf *server_conf)
> +     return CI_OK;
> + }
> + 
> +-void clamd_release()
> ++void clamd_release(struct ci_server_conf *server_conf)
> + {
> + }
> + 
> +-- 
> +2.51.0
> +
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
