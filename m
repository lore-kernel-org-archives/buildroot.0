Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D44CA9EC0
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:22:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C64A74098E;
	Sat, 10 Oct 2026 09:22:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V94uIkCMCAgn; Sat, 10 Oct 2026 09:22:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CF9094099F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624168;
	b=A+F1363+wqD4K8N9+4+46m0urHGsb3VRai9Cx/YFl4DBmC0i4ypvFJLBNWwSFktRtS7e
	 kA1T5F74nj3LvqDOZOsDVS6rlSo93GQCp404Nq4J1I5CRJ4cxs0nbk2FTgDPcT5JKYiCo
	 UBE0wwH3xZuHNTUbR39e2atXm8JsrdGXMcd6+HuxD45qwIiAJmuXewKEMSORDw/FTCKKr
	 Z5t6kPyWETtC7uZ8pPwEH3xZL2H3N3kGQ3bFO3pgtFJKXoTHX18rN1NUMt5paecavwzos
	 NmS8bwcKLLPvGwEQQwljZpnGm+mbsmoGgZRiToq7ZhpWj5eCZKK2WM7+Hx2U57q/kYg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624168;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=nbJ2+epk2K9WKwY8K47kdSYhLZEiVghNe4CdThx1ADA=;
	b=q/JS85+FFIq8758JqtWc4SoUctoci/SjrDofW5fr58N9wpyiFqNt45v0mhf6d2FpBSZd
	 8RyT/pP9Yf2qpPNQ7zFgajlgcaXcpTfJKcxdgoZX08GZ5+0EWePi9aVGSA+g7tG1EOhPK
	 rLEMlAWz1OY3TIwUHBo36CWIlWT+0REoipMWIfY0ES2c2EvYft8AzfoUmDi/JvzMdkT8R
	 oeIBy2bxmVZcflXgn2D0ESWmJbZquDf3vZO4bLc/kdUubpn/83QhJ9CxS6/vv2jXcq5n7
	 FcwTMWBM15NfViT1yo4NumlvtOcbcAsGXi7Rh3iykerrJkAqYEvEL+YbcrUlXGjbybA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624168;
	bh=nbJ2+epk2K9WKwY8K47kdSYhLZEiVghNe4CdThx1ADA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AjZuhmp8nO0dbZCrWkFZGkSxcw9pQCcRjAXW7HYSmCJCn47cEyQgposK+tn3l5lGS
	 Ofc8VSCmsSRD9cbjMWq6jtXC7vWo883kFikkLxZwigF8OTE20ho701UoguZJrr+sYy
	 lhIoqOKJ/8nLy+XG9q75ze4PNGa2iTpKPjnBPgEKHWyL0g9Zo3Z0b/mg+Grq0xjLcX
	 KSoQxtVBVSgI8tFmczWusNMXvW6e5cw0Z67IBKJjZJ3ovXWdTjKXMZFTw03aStC67e
	 uP3KtRi5bZ56xzVQeswOCTQEsBpjozLo4pU3tnn0m01ilAL/OZyZMpS9ct4Z2XSdR+
	 PInBu00tpee/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF9094099F;
	Sat, 10 Oct 2026 09:22:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A433356
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3BA9140949
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:22:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kHr2egpiWEv4 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:22:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 161D4405E9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624162;
 b=kjoZ5GjX4186NQvgoO4m/VmRWffXDW7tNpnBB8kLtyLwZXfJJNGoaj4/Ue62zFFoShzN
 i1xDwW0FS0MIRuLCiRejCmsoGy+eYrtVA76B3J0m8K5gR4ecLNyYk5SLpScKFTua21YrM
 Cs0rh8T49JegRw5PM/ITw82X722PcE8icuRv0I/VmQ+1ip5BORMN7f7T5ojHSzW6qCVYo
 bmzuBke1BZoklkA0xRZcoIhHo4oAXmPUkZ9jTsOXDaEDBTtvHFSus0vw43JVKxeCBh//J
 KeiF+OL09YytF4eq0mLn6pKFY+hiQBTsiA3DlKME0GK/DFKECvccgfmT5t9ZoZN7U3Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624162;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=E/XAQPttX7Sf3kSpk6tJSS45uQGTSMRPF5JlSsb4LFc=;
 b=gJfXW69FwmepfWEbkiIqsv632WMt0vGPtSlEpyet9cbzFU2mvZizL3LCUYC+dyDnfjYs
 x0wPWkHLUzRLk2esLNyzAM0CQDvjQ+wrrJl8ch3NsiJt6HJffm12EUmGaU5O5U8WLWNZ2
 ro89pTW6s8jpisvAmL1wN1ft6Eox1TG9boOU4Go3j3obAFfIwnav2aabfBMj7fStpMEwj
 79dN9Ts53A6nFYAe5g/ueCEx3y+so0grUQQVwVRuf7vnxBiqM1QkXQZ7w0rauAoSysLnj
 5UNIObEb0PYgaDGoETjzWQ1hEdjsBz2oda5RBAY9RhAI7sE//PKsO2Vewqn4aVyX+Dw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=a5Wc6f8X; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 161D4405E9
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:22:41 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4a1688d7769so4177755e9.0
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 02:22:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791624159; x=1792228959;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=E/XAQPttX7Sf3kSpk6tJSS45uQGTSMRPF5JlSsb4LFc=;
 b=lTdUZSe4N1x5r3+BohT1yA0CtYqRnDKeoQEeQXLwEhPQDbWSfLLIoHKtwscCGOEbJG
 OGUmICCRX37BfWa76NekLrjHseqSe9i57c2oh1GyrVP/xf1II17OoYIiowtQxRh4CHds
 6MGveH2ewFdsGUgbiAX+qeDIYLBdTD7JD19tLpf4QAKG/QWQ9RE9e4XrvSY2sHgh7bR+
 sbcAvd3Apachrepiy+6q6EOyAuuCsxXgiScKdwQYmxdB0Qozj7k/htwV7UfSCPlRZ0rp
 c9o2bfgVUoKVevnmwN+UzhWSiXBCX/3JFbov1Q6wdH7eB5Og1irOhCNLt30pvCH13dFT
 YOXQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwkIjKy9QJ7+nCskunTYJKSJaYOfpGsuTr0Z249E7f2nlyy4i+aHctHzc+Ne9mfw54ga0osz9BmJ6c=@buildroot.org
X-Gm-Message-State: AFq9FYLYBswWgqITk6J9RJibqcWF1qGpptdI7u1rZY6jN61Uk6V3RVRa
 U7fbvBUJ854ezuQ0UviWgJTia6xI2pm+LUGF4rv+zDeSJts8u1OPvDO808UE4f1u7LE=
X-Gm-Gg: AYBFou2hQMRASoag8qFbZymNMH9KmvjSMwy6qKsvwPTZRaY2Z0C+8WM8A/Dz64ngNyQ
 ikdzaNdzPoPWRbhka8PIy4oEEJCpiHYQTByuEGx3w9kuf1U9/REnuccBARm1HoQ6UZNKP/85abp
 ELhjS/CGHq2KfrTjaqhbkVoUG+yWijMvb0odeYsBTaPAVH5CMAuY267s8oECC+GbvctyoXeTeRU
 3wlp+Q6TQgjZJPmYLqCEdyCq+4APF+hZObJaBomMfzv0rxXcwLBbH2ixv5o0edHGgeasVg5L+sL
 8EGiQTuLy53aDoKkzsDaxBNP0bTg4fSmk7DdgwQ2hYxXplZxbsNlW8mwp6fDV75nzJhmi/A9gih
 AoBnQ2NVvBoJPicPsS3Eu5g5QdIDv2C0OlHR7Udx0FbyMYPmnirXMto7l948Qh0DMWU/tdrI9H/
 EDZtH+X9Nzu69D7LepFlmPN7zqTOrx/8nOKLfW2Cli8CF9i3dTEMi83STwMyVGcfoYUsXu4Dvp8
 AOpjFfQM+46uRe8TbSgWF/OJdf0f99uGCrwkUz7oFRm2/hUxB2OPL5l
X-Received: by 2002:a05:600c:5251:b0:49f:e772:6ddf with SMTP id
 5b1f17b1804b1-4a18e4d5a01mr86718305e9.32.1791624159254; 
 Sat, 10 Oct 2026 02:22:39 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-f938-e455-e8cc-7064.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:f938:e455:e8cc:7064])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18e49792bsm179483355e9.4.2026.10.10.02.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 02:22:38 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 10 Oct 2026 11:22:38 +0200
Message-ID: <20261010092238.138690-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003071237.1471628-1-bernd@kuhls.net>
References: <20261003071237.1471628-1-bernd@kuhls.net>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/{glibc,
 localedef}: security bump version to 2.44-57-g34106fee6
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
> Fixes CVE-2026-97399:
> https://gitlab.com/gnutools/glibc/-/commit/34106fee698c83eb0af71d4d0381e66b399be746
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.08.x. Thanks

> ---
>  package/glibc/glibc.hash       | 2 +-
>  package/glibc/glibc.mk         | 5 ++++-
>  package/localedef/localedef.mk | 2 +-
>  3 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
> index 439fe1f140..51e29673c3 100644
> --- a/package/glibc/glibc.hash
> +++ b/package/glibc/glibc.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated (fetched from git)
> -sha256  2ba6ee9ed5177a792fcce4da13225800f0cb3a2413a459e7864b8843eb5cb790  glibc-2.44-55-gc90398e00571476711792baacb6d92bd2a7b6891-git4.tar.gz
> +sha256  902d628994c2f3b30af4a7f507835079852cc8ed21d8a7f340e45dc5dae148bf  glibc-2.44-57-g34106fee698c83eb0af71d4d0381e66b399be746-git4.tar.gz
>  
>  # Hashes for license files
>  sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYINGv2
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index a838ac1a81..435a97361b 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -7,7 +7,7 @@
>  # Generate version string using:
>  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
>  # When updating the version, please also update localedef
> -GLIBC_VERSION = 2.44-55-gc90398e00571476711792baacb6d92bd2a7b6891
> +GLIBC_VERSION = 2.44-57-g34106fee698c83eb0af71d4d0381e66b399be746
>  GLIBC_SITE = https://gitlab.com/gnutools/glibc.git
>  GLIBC_SITE_METHOD = git
>  
> @@ -46,6 +46,9 @@ GLIBC_IGNORE_CVES += CVE-2026-8674
>  # Fixed by 2.44-55-gc90398e00571476711792baacb6d92bd2a7b6891
>  GLIBC_IGNORE_CVES += CVE-2026-89092
>  
> +# Fixed by 2.44-57-g34106fee698c83eb0af71d4d0381e66b399be746
> +GLIBC_IGNORE_CVES += CVE-2026-97399
> +
>  # This CVE is considered as not being security issues by
>  # upstream glibc:
>  #  https://security-tracker.debian.org/tracker/CVE-2010-4756
> diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
> index e4bfce1a3a..becbdfae7f 100644
> --- a/package/localedef/localedef.mk
> +++ b/package/localedef/localedef.mk
> @@ -7,7 +7,7 @@
>  # Use the same VERSION, SITE, and LICENSE as target glibc
>  # As in glibc.mk, generate version string using:
>  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
> -LOCALEDEF_VERSION = 2.44-55-gc90398e00571476711792baacb6d92bd2a7b6891
> +LOCALEDEF_VERSION = 2.44-57-g34106fee698c83eb0af71d4d0381e66b399be746
>  LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
>  LOCALEDEF_SITE = https://gitlab.com/gnutools/glibc.git
>  LOCALEDEF_SITE_METHOD = git
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
