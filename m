Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F6BEF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:39:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED7204213A;
	Fri, 13 Feb 2026 19:39:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1iQ_4H-t8ZLj; Fri, 13 Feb 2026 19:39:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2422E42143
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011541;
	bh=sqkvV0RnsaPQtJj0SrH+NA6gsCJg8u0vCYK96BdAWuM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=T1vNWnOOFjJ1qrHHhO8K6qd8bzwGy4zzbh22aQ1V7hYvrYvdChlaHCZCNE0pxFNFs
	 wElxBW6DsfiZQjE53WgQvczoFMuKLvTMLPJyWUyiI9c74CRlwWRwAvVcyuvrYTMhtz
	 PKWk1QO1fQv6u3xWnPU6vJomOBt17GqWnnGpHn/0pi0lZoNvmKY+fHmMAYGpMK6Cls
	 X+cbvjn5sIzuerpsSpYHKDa9adlGbkLXyuJYAKYhKvFesbw5jajfnPCBDA7Oq7kL3E
	 xSbx54G03UoY+fq1oQzVbGnvdSlqlBF7+shg7TfElDiHsW8wevHAFS/DpJ/hMytF/a
	 4aJg+ZwarhWRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2422E42143;
	Fri, 13 Feb 2026 19:39:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1001369
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B967241F8D
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kM_PfL9g7STA for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8298B41F8F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8298B41F8F
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8298B41F8F
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:53 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-48375f1defeso7407285e9.0
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:37:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011471; x=1771616271;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9NEMBpkhWqKJitynTbgZTwtqdLATcFqWG/hqCmcTgAE=;
 b=Qui13Fx/EnX70Red06OKk5XwfB6WYWmn254LrTt6TXvpzJFrks6kGPSW/XYi//JAH2
 JpefhtVUlDFeUT4ivmTwcgDVtVedPbLgLxoQuKu4KG9mVOhwQvatYTESOASgHBlIgEoS
 fp2B/P8crDdcVQfkg2o8H+mnL9Fg5aolU4XC0LQfVJo3L5jFum7fIZgwYmZTwEmX/MDa
 XGOX6BqO+IvLb8hOoFtrtbOdAGVzwA+nF6OfR/wqbx0Zi2DtncpPONfqZthtEzl4FMMB
 2svm6w0+l7slJwT2G4wDjWAnpdjEH687hsBqJf7BUmvMOCg7mr8ITH8zHguVLvNkCcsx
 TZjQ==
X-Gm-Message-State: AOJu0Yw7AeUTkRVD32yZ3jJBjqJmo6l27N9muCKec7J9Ywf0qvWJ0wWU
 6iOEPszZ2g8CIq1/kjsZmnmEkTO7R3NXExaW6J5CKHinC2qsCQbQgjPKp6NKlFAqRLHUYk12Jfq
 vL8uR
X-Gm-Gg: AZuq6aKrrRsXHnCC3Rhj5WNDRpE+T48rVUrEW+K4HrqTbs7nuPO7rGYea1dh6RTyVtX
 viYZ0y7Yk4qjmWlXqaVNnG6FFfSRCPc9xtjiCR4f0gOJ6ayTylutFFEYzBsX8k3sJcZHC5AvG88
 85gBZZZ9yAURhpyi8BLf960Jv0dWNQ1tfrC0F2ykKUbbJ5eGW9o4yrPi+OExPxVWV2BiBamK8aH
 WDjMawbYOQY5ZHM7jHojhcmSpOtxeycYDU+thuCdti9NFt2WfrVa6PzzoznqPK99jgdBdXlmH5Y
 HxdeUc8X+FFX9ECmu7Y0v0PGcxLSO+VIJziGHIqz1i7vd/R2VxGzzitCfMqjOff3w1Vup6stDiE
 LuS98Yp5P1WdW8X/FyevjXH0ZrbKoSxTpkYWStu+pjAgnJqL2zEaaQkKWJ/UA5eLgmLxMYNxwtb
 P3CR6865AWY07dyRY=
X-Received: by 2002:a05:600c:a09:b0:477:6d96:b3e5 with SMTP id
 5b1f17b1804b1-48373a0809fmr47151895e9.7.1771011471531; 
 Fri, 13 Feb 2026 11:37:51 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835d92267bsm317057335e9.0.2026.02.13.11.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:37:51 -0800 (PST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:37:50 +0100
Message-ID: <20260213193750.40839-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120082405.46683-2-thomas.perale@mind.be>
References: <20260120082405.46683-2-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011471; x=1771616271; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9NEMBpkhWqKJitynTbgZTwtqdLATcFqWG/hqCmcTgAE=;
 b=fZXQc3gHlLL+UVCAwyBEaDFRJrfP5mmXYwsva72MxOZcdoLJIE1IRyw6TChqyTCS7c
 ychqz3NDznhcGX2hFEieu4hAyWaHQ54nUq/Yfil5koUa3Ux3qajTu6n9+gSWhW7zanir
 6Mu0XVBkOhS7O439b4J0vAGSVpulMuo8v/hkUeRjHEal04cSmBRYzxkn2BW89/pFBjr1
 kWK5mIfzOhSugORW8AxmQN2ZpMTUPvuSS0ea4eGFUBntX+fRi1vQfJ/M9+RXE7XYqemv
 zTSdGYVnALr2sy7lUsSTqyGNmDEHm57f8W1vmJL5kr2RVaUV9bhKXSBiAV/vqLAT2ger
 wSxA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fZXQc3gH
Subject: Re: [Buildroot] [PATCH 2/6] package/podman: add CPE
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
> Add the `podman_project:podman` CPE referenced in the GHSA page [1].
> 
> The last entry with this CPE is CVE-2024-3056 [2].
> 
> Dropping the `v` prefix from the version to track the CPE version
> correctly.
> 
> [1] https://github.com/containers/podman/security
> [2] https://nvd.nist.gov//vuln/detail/CVE-2024-3056
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/podman/podman.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/podman/podman.mk b/package/podman/podman.mk
> index 31cc9ba349..80107f3d9e 100644
> --- a/package/podman/podman.mk
> +++ b/package/podman/podman.mk
> @@ -31,6 +31,8 @@ PODMAN_TAGS += seccomp
>  PODMAN_DEPENDENCIES += shadow
>  PODMAN_TAGS += libsubid
>  
> +PODMAN_CPE_ID_VERSION = $(subst v,,$(PODMAN_VERSION))
> +
>  ifeq ($(BR2_PACKAGE_BTRFS_PROGS),y)
>  PODMAN_DEPENDENCIES += btrfs-progs
>  define PODMAN_LINUX_CONFIG_FIXUPS_BTRFS
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
