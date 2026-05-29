Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7111CD6E50
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 15:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68BB2613CA;
	Fri, 29 May 2026 15:06:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id piDz-5n_yRsN; Fri, 29 May 2026 15:06:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E6AB60EB5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780067199;
	bh=AvJz3bFqd/a+1P3q9+cBUJoFSEzH8KP5dbDRUrYzMmY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=T5l+raLerdKIeMAfUfnlXDDd5O2Es/pJGjS0j5mojo+OUT0UJeYi9UfQPRygwdIat
	 fVUx4kq5MgVgbK8OVuwj00Yy1x+ASzEi88ShQdFnpE2ByaiQEx3+E2XipW2aMktune
	 u+rKGoNMFWmLJo/jWSTH6s/JeJ4Mp4j6zv9FjPIpbQAWafTaotZ9YHCwb/kL9Bj+8l
	 athltLWLuG2wS+MZoQZ4v4v/add51Fl97pXsU0uv9DbwaxfQoBUy6TzMnW9W1puPXj
	 c8ZAgaAWG1ThBNaVU1X/hvCEMvr2uN0+FOEBIIUML0bhf3YK79+JqfR0LX6xqd+fDz
	 Ocs8GS4fF8J2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E6AB60EB5;
	Fri, 29 May 2026 15:06:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CBE9288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D82F411BB
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:06:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AvK2JzBFnsVR for <buildroot@buildroot.org>;
 Fri, 29 May 2026 15:06:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6272141E26
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6272141E26
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6272141E26
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:06:35 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4891c0620bcso90749355e9.1
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:06:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780067193; x=1780671993;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5O/pR3izEprFbekdTDB9q0jUdLSOCeuVbH1fJ0JPVXE=;
 b=UIkm4bH59G3NeRdmW0+3hTop3W3k+HhFOdnZxbhyXPzIMRz/TjT7kpwgAbpMxfJhBL
 +b6JNH8pdFK5s+bX/AtNLhqebzgPUJSSaeeO1TK4RCI2N799RnfZf6TyoOlyTdaULD1s
 PoWhN51wKsG7fG/tJyh/ur8qdpRuSYrz6UNg5K/Ij7r2wQ6ZnwZR2sjcEJTWcQb5ls+5
 MprdpVSps833GN5NCoolTiQSZVpDN5vrvobtDa8NH+4CJziN0pZYJn9h12QbMkHx6BQr
 WjyATsJgIfOneWH9Wpj+dEvSuR21orPGkUunjil9cVnxwR3eKrFRTaF2nC+GSsExzHSu
 7isg==
X-Gm-Message-State: AOJu0YzWYz014vX1ev1Av8wDqfiUa68b8eD6FIHE/SJMytcr6GJ5/N/5
 B21gc2cJEIdee1MScJRIRuuNkhze0BGBoWdYW2axJLhcko2KE5mmHsm1jo6y7/CKsp6eUCICcZ9
 hc76x
X-Gm-Gg: Acq92OGgSiqouXJ/K45m9gpabYFS2hCfv23/oz2vHK2PNJ+1SdCbfjALj8r2fpZIFm0
 X3wjfYU0rt4CqI2ybGdViAawntNkAG+OZOGYmP1RCXJnITlvrNZYRk+WhFI0XbbtLkpl5IHkTh2
 y5US+FXztgGHDiafkiKyF4EftKKG3h2Hq90KsCP1sAtEb1hQT3hUTspb6TSms1ndg99NFe75+s/
 i9awDEgngdQqurkf6uN2sVKIVL27OxOEUMbyLsMA98ELrM/zZWSsAp3kDM6vMzCgO+QCJkG+g/H
 Neq/eIgmCXViPCiy/huIXVCpoeH9IoUEdQ/3vimN3pj9uCqMErs5PzLNHdBGBqt3+w6GlF2WX8Y
 qT+ZDtiCFkBtyAGq80bJV+6TY0BzHdj+0Ms1HR/Fv3cbvw/EoJeqS5rOwHosbvfNhO1FSJZTKfd
 QCEpcZ1retDkHk7AMwcdjCe/rhKpnsyOx2uZFAniC880xRhixXG7+GZ17gow==
X-Received: by 2002:a05:600d:8648:20b0:490:9d5c:a3e0 with SMTP id
 5b1f17b1804b1-490a29215ebmr443145e9.9.1780067193169; 
 Fri, 29 May 2026 08:06:33 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef3559645sm4091190f8f.26.2026.05.29.08.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 08:06:32 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 May 2026 17:06:29 +0200
Message-ID: <20260529150631.447940-3-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529150631.447940-1-thomas.perale@mind.be>
References: <20260529150631.447940-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780067193; x=1780671993; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5O/pR3izEprFbekdTDB9q0jUdLSOCeuVbH1fJ0JPVXE=;
 b=IIWc7AQ2zHrIer+Sd4INbq+secZHQcmkK3guzH4VrttuRVod1i2kB8fXUX6wPpSkpQ
 NP4TqHIOpC5NCw4VfLQRjQgDXa+pLHDsFTXsIutAyG0YZDO2rghq6VqBoNScqIbujAUt
 qZq5iXeH7JytKAZJaPPIrq4XgrgPhRwci5b+kDIkKiES59XApk3Vo6m8YgwjzHLGtrZR
 tlFqwSYDu1CodGAwmNCSDbiFS7YGQlOvWLUbsACdXXkAywOnQbSqAI3Q4xQzP4J2XhA8
 Stb5Hm5WTy2uh0Llz6fjZP2xM72aofpR9LEHowp8Rtg+6H59IW9BXejJvhgTbR6IEMNq
 dNzw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IIWc7AQ2
Subject: [Buildroot] [PATCH v2 3/5] support/scripts/cve-check: remove
 'bom-ref' for vulnerabilities
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

The 'bom-ref' are optionnal and since we don't reference the
vulnerabilities from anywhere else in the SBOM they are not necessary in
this case.

In the following commit, it will introduce multiple vulnerabilities that
have the same id. So using the vulnerability id as 'bom-ref' won't be
correct as the 'bom-ref' needs to be unique unlike the id property.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/scripts/cve-check | 1 -
 1 file changed, 1 deletion(-)

diff --git a/support/scripts/cve-check b/support/scripts/cve-check
index c045d7ea27..881d9c03c0 100755
--- a/support/scripts/cve-check
+++ b/support/scripts/cve-check
@@ -147,7 +147,6 @@ def nvd_cve_to_cdx_vulnerability(nvd_cve):
     [1] https://cyclonedx.org/docs/1.6/json/#vulnerabilities
     """
     vulnerability = {
-        "bom-ref": nvd_cve["id"],
         "id": nvd_cve["id"],
         "description": cve_api_get_lang_from_list(nvd_cve.get("descriptions", [])) or "",
         "source": {
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
