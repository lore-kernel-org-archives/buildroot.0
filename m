Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC151FCC067
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B12AD614CA;
	Fri,  6 Mar 2026 19:53:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bWCrKdrJS3OZ; Fri,  6 Mar 2026 19:53:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB403614C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826819;
	bh=XVN4Yoxx8lc8Xd4mp0BKaAqWDtGJhn0wWcKlJy/SDh0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=h1VmP+DasT+DPx5pH54FLggQ6zixWZvT8H3OeDsdz8826Mhmkp3dTL+f0ENmBH8KO
	 Zenljm51pcrCsas4iPaxGRpSEm1FMfYHJ0svPf4qt+lyN+hTrl7npq3AE6/3FdjNuf
	 BbrqjzXi99HhmnO/PcCyPiYRVqpbOvaRpEnnTQFifzuUGinV0zmk4sRiaAxAES03zW
	 cVXw1w82EDVMKb79ij+/WyU3yYJpI6V6imH5Akw938zIsbTFGKXTVDnVuo4cGmb2O8
	 9vfBfcFAw6lcRC+wo8JEP4ocgEDDxC3FGUwfNQlvLYh5f1gBJEZj5qI/5X/0E6yP32
	 T48mJnxq0rfYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB403614C0;
	Fri,  6 Mar 2026 19:53:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A9942169
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F78040455
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TuRr7gLwpXce for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:53:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 833AA40343
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 833AA40343
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 833AA40343
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:27 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-439b8a3f2bcso4674228f8f.3
 for <buildroot@buildroot.org>; Fri, 06 Mar 2026 11:53:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772826805; x=1773431605;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pFziJ52exmLA9Q7OX5D/Egt6rrSNnHHyKUChPk9n2OM=;
 b=YXolwQoebxjJJ3cQO/9/f380vPkszpGHt963P4ekfY2bVBo/pWS42ZUtoK43T0ln7w
 Pjt031zC9C9NQwhOzxjgzeo09FvBklm/C1St9E2J464tftnFNY0qQVdIuUv/Y2uNrqb3
 m5/brawjrpQGDgQBRlnXgjATsqCXsJQ6+mcZ8X7M55PcRVYQX7upD3GDATqMgSD0MX/J
 UXNtX0WCQxDTtppk16X2z8vktaDwy99GRofafPqUoxv3QgewkFuIzayqZm8RQpv2ch64
 qPYTFdlq6Hqa90/h06oyZqylKbYXKuxbtQKMyyNxsNcN2ov8UJ47CHvLA/uKSzwdm3Nc
 V73Q==
X-Gm-Message-State: AOJu0Yz3mg+sgvSiSOmWK3KgLN/Ty7Mfkwo67gMQaxNICUXE4Kiqg9aK
 K6GktbYYBPIqjTWh5q7C0cR/GL0X79Srymmcan6T9UtVXK4P6duB+fbdGnk9nJbbUng=
X-Gm-Gg: ATEYQzykSolAzDvD0hFtoN4AOW3gSVESxx6HbNuHsvf4mFoC9GWgTCo4r9vt4Ggs6Rz
 4aN+BOpHw6gQcZ41asc5qhdUM02PqscWr48bcahaZet9wfeF6hHNPbjirnI057MJXGLZGzSvlCu
 SAfShlZfOD8WsleUTtF1r0UcS3XGbodh/XSujudurRLuY5plEnHU9IR1seJcB3OukXPzk7mebeU
 kZMsRp1zAgL+2KpTEAfV6209LpUCC1iZS4uSB0PYNsgRbF1zwv7VraD+2hlkS3O2q//6ULPB0WC
 m9als/mfDUCmrbTWWTh0qOSacT6dSveItp3qt7FP0ko+1OfZkOsUSegT8ZgG2PZ9Os0ZiFQvecu
 ga2ksEXJs3lB9a3b5UDMBqYAP5dKY1ClkPfHBDSWAGErJQC8KX4JsM27Ec8NgX9vHvHDWANXyVZ
 ar6osGCpT1QjYLHYA=
X-Received: by 2002:a05:6000:40dd:b0:439:cb5c:b18d with SMTP id
 ffacd0b85a97d-439da893f6cmr5723537f8f.38.1772826805470; 
 Fri, 06 Mar 2026 11:53:25 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dad8d973sm5345106f8f.3.2026.03.06.11.53.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 11:53:25 -0800 (PST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri,  6 Mar 2026 20:53:24 +0100
Message-ID: <20260306195324.8433-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303081323.53405-2-thomas.perale@mind.be>
References: <20260303081323.53405-2-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772826805; x=1773431605; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pFziJ52exmLA9Q7OX5D/Egt6rrSNnHHyKUChPk9n2OM=;
 b=IoiIezaKrk5w+KMUCBoJbb3WJraGe3GNUL2P036owSYhNrtH6C8/XZFXLqpqLykFEv
 6IaBG+KNS8oG/OGyq6uWEpruqqG5GL8c3lEfxVvxRurmOGSrFtFZMfomTUNtwRYv45zg
 nwNmvVNt+//RRptmGnvX8GYks1MPHkGnoChFfnPC3sX97ldJzdNsinDMLiU4J5N4mtp8
 qR7uPaqqV566sNhSoSwM264M43jGUEOnjQxsmWlW/c4VXeGcDVO0LMjG5AI5+PSCCe2i
 DywolJlFJs6P+JnXEmsuY0BVe2NHrGgllzEeqTRSdQDu/Lb8qJouqQMdFhvPK8D0W1dB
 CNMg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IoiIezaK
Subject: Re: [Buildroot] [PATCH 2/4] package/graphicsmagick: add
 CVE-2007-0770 to IGNORE_CVES
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
> This vulnerability match on every version of graphicsmagick [1].
> It was issued because of an incomplete patch for CVE-2006-5456 and has
> been since remediated [2].
> 
> Since it's really old it's unlikely it will be updated and is thus added
> to IGNORE_CVES.
> 
> [1] https://nvd.nist.gov//vuln/detail/CVE-2007-0770
> [2] https://bugzilla.redhat.com/show_bug.cgi?id=210921#c5
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/graphicsmagick/graphicsmagick.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/graphicsmagick/graphicsmagick.mk b/package/graphicsmagick/graphicsmagick.mk
> index 40107b3aae..6c2885b7d8 100644
> --- a/package/graphicsmagick/graphicsmagick.mk
> +++ b/package/graphicsmagick/graphicsmagick.mk
> @@ -15,6 +15,11 @@ GRAPHICSMAGICK_CPE_ID_VENDOR = graphicsmagick
>  # Fixed in version 1.2.3
>  GRAPHICSMAGICK_IGNORE_CVES += CVE-2008-6621
>  
> +# Wrong NVD annotations englobbing all versions
> +# Wrong patch for CVE-2006-5456 later updated
> +# https://bugzilla.redhat.com/show_bug.cgi?id=210921#c5
> +GRAPHICSMAGICK_IGNORE_CVES += CVE-2007-0770
> +
>  # 0001-ReadJXLImage-Apply-image-dimension-resource-limits.patch
>  GRAPHICSMAGICK_IGNORE_CVES += CVE-2025-27795
>  
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
