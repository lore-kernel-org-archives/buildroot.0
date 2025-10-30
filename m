Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48AD2CCF9FA
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 08:24:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2155E411C6;
	Thu, 30 Oct 2025 08:24:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eX1pXnyzK6DG; Thu, 30 Oct 2025 08:24:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4547B411D3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4547B411D3;
	Thu, 30 Oct 2025 08:24:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C11A2160
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2EBD810E1
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:23:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kGjKKN12jGYT for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 08:23:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7F3AC810DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F3AC810DE
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F3AC810DE
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:23:55 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3ee130237a8so496446f8f.0
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 01:23:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761812633; x=1762417433;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5YWdGQb+kqzQuNOpl/ti3KyYjTknLoEinoahn/v4Nf4=;
 b=mSN6xdUZOdxPLkh+52eDcucdZZA+lmwfXtr/kn6xndIe9Zqyqx+lpGpI3QfEm10Goq
 qShtxRV4gq3rf4GhXDKdeemf2rB8QAGihjDDji/6o9VA0SZFkuJXmhRQHGUHrZCkFIlD
 Z1RvbOhnves1BhdTNTW+XQTZTYop4HpCwlVpw2LGpCIqawaRUuuk9KoIvEtNXXjkKJvk
 opMb3z/YjhAsANQswgLQLdn74w1yov7DSMS5nx+g+pfvyFpEEspEnVaStFaxc25WXLJc
 Lspm+GhD+Rxfcu4F0rXWxMfz7zvSzumEaMzhALfRO5IQnk+6dgT8ovp2haY1/MJgRZUf
 TeQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcJXKc+GPQxbUWyGtir4Zk6cixPc/19cXQ9ptjkrIsvFnOXCHd97fieTUNMPWReLLisMfILQWt0Wk=@buildroot.org
X-Gm-Message-State: AOJu0YxSSHmD9Z1XMBFVFGIxt/LIGWKRmMcRG2Epj+TtTHCXH92/y5eo
 sp81Hwn9CnrQekU6oqD/RcnkZRuN8FQR4SFqAxmNU14N/aOG0jnx8xmz7rZvPZ3Mozk=
X-Gm-Gg: ASbGncshgZ41dSBBb8Y0QtvxqUJZ9CCULm+ogt2sdnkGEpK+bwzYDxANRP5RsacyScz
 m1paHxLLXYDNcIUuVvclCGfPOtwEFZHqVWwqWDYRz3cGy559rl36IyvHzt7WhV7AG5WpBZWuOhc
 sxGNHrrFvQJ5Ii1iPaUbqrP88ZxlZQtcc56rGalXgsgdFpArOMThZTjBuke1KxFb2u5FFWMpS4/
 cneyXFI1RuqYwO0zp28uo0rX1EHAZvtO3eOPvllsAA3yeD904pnOJdJcQthH+eBFjng9xj6Bb/L
 JC3UjwZatsquPsV709MtT4k4VpeeG69aQ8Jf3a6CYqWc7Ny5QJK9osUSEOBPz+De0DKudBttFmH
 bBsGylU1NS3TUrScJ1Ru9rB/yGrfwBFleCKBAC6xr/8LqwC27jFm1esJzeo+3SvKrofikxOv9SQ
 3cnDP4UfUpKUm2uUrIylxMLE9SXg==
X-Google-Smtp-Source: AGHT+IHUiWr2vu7n9M0scfZ6vAfoUlRa0VGXIiDIHaLzDm87lTM9LVpyxEP7cU17Oq/0wQSzUiJ3wQ==
X-Received: by 2002:a05:6000:2088:b0:427:4a2:5124 with SMTP id
 ffacd0b85a97d-429aed36034mr4037201f8f.0.1761812633620; 
 Thu, 30 Oct 2025 01:23:53 -0700 (PDT)
Received: from arch (77.109.92.202.static.edpnet.net. [77.109.92.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952da12dsm31055945f8f.29.2025.10.30.01.23.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 01:23:53 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 30 Oct 2025 09:23:53 +0100
Message-ID: <20251030082353.35341-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023140527.544948-4-titouan.christophe@mind.be>
References: <20251023140527.544948-4-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1761812633; x=1762417433; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5YWdGQb+kqzQuNOpl/ti3KyYjTknLoEinoahn/v4Nf4=;
 b=TLzGDwhYWr190PrMa4eeo7kxE+28cN75ITwHLOvhStHxCTlcwpGk0DKiXik6Ffm7cE
 WAAbGjSOmOzTeIA0K332WEl67/PQ5a4LDLh708mhkIyrlmS3TqmE8DdX3W5NMpxEQcxU
 VVUfM7SdYreEDscfNqkFfVgHj1WP4kwRwaFsUPJBKK9g/QVhvsGoBDYOUzMngSv2XJxe
 Es8/WI3JueMVaeWMukSTD2OUbW81p8zctwIgUbsuw5dGqiIlM5wkh2dN2K/1PX99ejGM
 7fewjmv4Lm0U8NqXygXLfb5oWCX7iuEGdW6HGBENiaGhC1no/3MJ6yp5qaD2cUiwL7yO
 XukQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=TLzGDwhY
Subject: Re: [Buildroot] [PATCH 3/4] package/openvmtools: ignore
 CVE-2021-31693
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
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x & 2025.08.x. Thanks

> ---
>  package/openvmtools/openvmtools.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
> index 0f5c86fe6d..58876c877a 100644
> --- a/package/openvmtools/openvmtools.mk
> +++ b/package/openvmtools/openvmtools.mk
> @@ -13,6 +13,10 @@ OPENVMTOOLS_LICENSE_FILES = COPYING
>  OPENVMTOOLS_CPE_ID_VENDOR = vmware
>  OPENVMTOOLS_CPE_ID_PRODUCT = tools
>  
> +# This CVE affects a Wordpress plugin. VMware information,
> +# previously connected to this CVE ID because of a typo, is at CVE-2022-31693
> +OPENVMTOOLS_IGNORE_CVES += CVE-2021-31693
> +
>  # 0013-Properly-check-authorization-on-incoming-guestOps-re.patch
>  OPENVMTOOLS_IGNORE_CVES += CVE-2022-31676
>  
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
