Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC62CA5FD4
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 10:33:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B09B60B01;
	Fri,  2 Oct 2026 10:33:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZXjjzHXacbLB; Fri,  2 Oct 2026 10:33:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2BDEC60880
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790937213;
	b=G/Rc2A+8240m6UoM8VYxQZG0f7ZzOSP/5Gkx8pSi3CXXltMOvhY3EXJvdA9rxXbhzraq
	 6ECXBaKvJwwiArp0fiY9GUSWqAA9HmbaY79hreCL+VKy2HMhqHg2XGsLAsFR6dp6/Cfzf
	 0lWcCMjv3blgRs1RgIAYNRJVT+pX3DrSoVefYw9soIKtUxOPHL+j1uMl51hsoyaKYuQgK
	 bFF1duUqE6cBnKIhsQBNyuhxA852W1rs7ehH79L/bve4AME1WqzFavS+tMn97puZgKy2K
	 7AlNTkMaXiGWsI4rsx+2vM/SWBU0ei6DXK/5qH3eZ5OJEUFtMgAFF8bsZQgESQiII1Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790937213;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=HeKgaXpImRNrdBmIhgQUVMSxd0iSFTyhSYBWOuioM48=;
	b=TbWBFjQYhr22Ld/ybLJEUjJPU1W65IBqOcLaq80rdZb5UtrGY7+YfXyiq4EsZjxh5d0o
	 0Pzgt4SKEQxm4SY43+eBcYAC2vjOm+evdVGhTd9R9Q6e3kO/dU4F5R6rfb2QL9/gxzsJ3
	 BON+KsqoEnSvdsKjvn4ovqte1vmsexfTGKhtTbnNBzbPDSfzK5oj4IL0ZpuElGjhA8QA8
	 UlW3EwF5aWsC6oHyswiH0j6pmYyhy8Z2DPomYaRa3M9xFJzBAQ5OwUzWq2vqPBu7TL88B
	 E9D9MHEpH842GdeuPsi3JQ3YHzagggxpJyCl4K/JlFxnQmBk7oesmagisf0AbISGBQQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790937213;
	bh=HeKgaXpImRNrdBmIhgQUVMSxd0iSFTyhSYBWOuioM48=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oHacCWsCApAd4tTBv2ZTa8fNNoF6lxWEFGz6axdKDYvpSPEEFN2c8qf5JREZS/2Ls
	 N67zlwj+sBZyBsiVQIrOZ1NHnUqDtN3WTsrRbTiNBVwy3ENEIuVlnv9Z7y0StB25yL
	 BI2QbzVKPDyJXT5nw9id+8YaJtTK/OFqiOFrqURW1qTcxV8FPnVgXHZPd86AjjhmIh
	 YEehSrg4hxNPt51Z6fCQzZVMADvd4jRtS4AXr9h4kdw9N6M1SIWuh0j0II5jeTQTNJ
	 jSrB7cPW+6o1tLLent0VonjQ9sr3zd8Um4q1qBXRxzAyZ04A2c4YYmdWV4x1gJ8N8Y
	 yx+oyDyLODo9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BDEC60880;
	Fri,  2 Oct 2026 10:33:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 81C943AC
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FB2E40BC8
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:33:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oYAdHV8DVvx4 for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 10:33:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 55A9940BAC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790937210;
 b=FuivLTd12WAF92hnrTlfnFQqMoAsAbnbXwuZzLoVCk85HQQvUVk2QieJnbGsu0iuLS+G
 m3ZvO30sZl1ibTijgSfI/OFiJaq4b2L9cjEJggzEp8PegQLtJsMIx9oP3Zp5/1u7w+qIL
 l9USXuWmDtfTagUuWFfodEqmlrqKsPRt6aYLwFXdpg5I/Adici+MhTjY8MgOgtr8U22Wj
 mdf40zPHLSPXzx87pxUjtnQIvMLwEk7uotJerMsjDAZDq+9fhMJgjzNy8XP0kgMDXJmhH
 ghLZ5/iruPjIFCHBCN29KwXALNV/qltn7RXx7oBy8VO+/adK28CfH8M17ARoHV8OKUQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790937210;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=0Nz5I85XbCrAUALsOs0aEDw4XuDPEEbS8ZqkYbcUcGE=;
 b=n34zQRqL5kKnim4N0CmaFe6ms06veYUmnkL4Lbrs+jt6VRG53GTdpPsLlIik08qrVy17
 lZSQDAq0eTW28bvDQRJo7k/1BhOrctZ2p8yFyecl8Etpoys+9auhfjiMLIita8C9RVR1F
 YMMg6PwzYpWMnRiIGiX6GpPDBn8qC6I/xBvl0G2Lw/pq2aZ5rn63aeulAIhGUJ9yL1Vl/
 nfyAhRFQquVtFHnmvTtqheDTa1gf7zKL3b10j4lsHGqpZcBNgc0cgpuK6sbuRRIhnSo9i
 JYFoPnxzgAUpxz6ePa4EbbyNIBfA50+Dei6BD0cfGtij9VMgR1NuUOWwl4y5VAzcplA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=FjiEHl3b; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:30::10; helo=mail-wr2-x10.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr2-x10.google.com (mail-wr2-x10.google.com
 [IPv6:2a00:1450:4864:30::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 55A9940BAC
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:33:30 +0000 (UTC)
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-482f63546c3so5861027f8f.1
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 03:33:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790937208; x=1791542008;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=0Nz5I85XbCrAUALsOs0aEDw4XuDPEEbS8ZqkYbcUcGE=;
 b=GZ5a8h+bNLHoOhK6BymmN3H+EooJrIOayILng49fryDDzECViq80OStG56bBuLeGrI
 pO5hMxhMtY1s+J3piDG133G7nTxkkoTjppGKiODZcEj/F8rH+ju/4TdBGniOQBGr1yrn
 iwtcGtHGNc+9O0hK/3e/LpFmYR3xp+dkSYW8ByrKamf5SutVYggNHMrMuAqdeXnYln9k
 b3cj+NFE7+OXhIYPzlMwL5emFpGtoWWI1vj+Hpogl55nj82+jMttkr9qQboktvAo0jQ8
 JcadZHlzqdpnoFxN4arGJQ0VP30SOuiW7Sf/h4wlZiuclcR4tT5q35stX7c1HX0OqFep
 GlRw==
X-Gm-Message-State: AFq9FYLfVMqcHOs64RSOUMcgAJ/aRnSliAFiakdrXKu05DeoUXnatdrJ
 7nJLdtOvlNZE2RKrqvBKLYfTofSVaz5jSU8Vj4sahc0CyE02eKKjJQo86l9eWS+eEcXFb4e0v6i
 hDgTo91M=
X-Gm-Gg: AYBFou3yK529WVTWtranQvnnyl+qODqppz+b9TwVsvH/ZiZxO+xHzRNT18Br5iUV1xh
 NTJNuUhLdC6PObmzhxQyc/uQFjlZ7Sbm1zy2JN/Eg/fKkRvTeS+nBnujr1gQ5j6vIsKHVFwisAE
 9q29eoPC+VIxNqQEYy5Gb1atVNfDAw38WV9ABZSl+zMr0r0GSVDiFPJ5QAu0Q4p52p0qIVT38xX
 DzYclF0XgqWVuMwre08NGFenxn10hOCtEISpfjJShkrPig/ANQmxgFEEU5Z7vVjoTjQrat2/6Ao
 MDIi4XFdavCrFF4iH7eSpUjkwG61Z24Ipjln6TEhoF0K6WB98/7vN3vjrRIR0s0AJnNb1THT/08
 etvSz8NZOEkCeRDt/bnBZgwrJrP2RKwuCzTvAktk9pKE0X7au2WZTq7bzNgBsgk5oiZx3LIngMs
 zfh5EX3iU4Vk3vsLg4yyx4ra+Q9nDwCQgSDg6KtIjWdXffpTZqCVl/9XxVHYow/6ynFseTFY8JV
 ot9yQyH0uinoUaTlOznuGu7Tgn45dqJPEPIxbrddn0=
X-Received: by 2002:a5d:6f05:0:b0:48b:6bb:6d3e with SMTP id
 ffacd0b85a97d-48b1274aa1bmr4347991f8f.15.1790937208140; 
 Fri, 02 Oct 2026 03:33:28 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b380f07cdsm4685333f8f.10.2026.10.02.03.33.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 03:33:27 -0700 (PDT)
To: buildroot@buildroot.org,
	yann.morin@orange.com
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  2 Oct 2026 12:33:25 +0200
Message-ID: <20261002103327.77432-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <6e9cc7dc8ad61d29d10b302f3654bfd0ca839d72.1790053648.git.yann.morin@orange.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/skopeo: use new upstream location
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> The upstream location has changed (with a forward from the old one, so
> we did not notice earlier) [0] [1], with 1.23.0 the first release being
> made from the new location, which was accounted for in 96aac440dd79
> (package/skopeo: bump version to 1.23.0) as it required the change of
> the gomod, but where the new location was missed.
> 
> Eventually switch to the new location now.
> 
> [0] https://github.com/podman-container-tools/skopeo/pull/2854
> [1] https://github.com/podman-container-tools/go.podman.io/pull/6
> 
> Reported-by: Julien Olivain <ju.o@free.fr>
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/skopeo/skopeo.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/skopeo/skopeo.mk b/package/skopeo/skopeo.mk
> index 5a22658611..5d23cbf451 100644
> --- a/package/skopeo/skopeo.mk
> +++ b/package/skopeo/skopeo.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  SKOPEO_VERSION = 1.24.1
> -SKOPEO_SITE = $(call github,containers,skopeo,v$(SKOPEO_VERSION))
> +SKOPEO_SITE = $(call github,podman-container-tools,skopeo,v$(SKOPEO_VERSION))
>  
>  SKOPEO_LICENSE = Apache-2.0
>  SKOPEO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
