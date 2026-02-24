Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73BE5E9B258
	for <buildroot@archiver.kernel.org>; Tue, 24 Feb 2026 13:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BE9E80DB4;
	Tue, 24 Feb 2026 13:33:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xRMLqQ484Qcf; Tue, 24 Feb 2026 13:33:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C18782223
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771940030;
	bh=iBlbkXGfHh5iqz5Lga9f9Tfi5CNzk5amNvjCbQescvw=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=SaA/q/zFO1OipC9UO0XjkTEpCsavWB7ex72EcnAwlLr5WXriLIyZZIU9RQjYZQsjo
	 G+QNMAhuhia+RqfsGleFL+Hna+98/dP7i/O/VWpCMMcaUNs45BHgCVwCvfCETtQrBr
	 0pEEHlvC/U497fTgW1bLYuso3qZ8UfMmF+EGNSvqFQ8GBPVzR9ENtVsY58XXuzOqkc
	 +uTAu5vudslahMIg65SSz7AA/yRGHaInA3rBtwoyNyDdeMpCe88BRtJtQSB4Rujjk5
	 4abvOlN6dSRNQlp6Ej1DbRrvBHF9x7a3ssGzEVYmwhEhLbv50KRyNufagha4VoHLnU
	 JXcOUjZjhMIaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C18782223;
	Tue, 24 Feb 2026 13:33:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 056D7237
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 13:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF8B960B7B
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 13:33:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GnzqBwJY2sgL for <buildroot@buildroot.org>;
 Tue, 24 Feb 2026 13:33:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=fabien.lehoussel@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C475A60B6D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C475A60B6D
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C475A60B6D
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 13:33:47 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-43591b55727so5419453f8f.3
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 05:33:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771940025; x=1772544825;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UpaIjuisJ2todOsRWmRr/WfPz0Af1b9POfPATo5nw2c=;
 b=QvPxPr1bkgkit4ltUSLjVoQrxmSZO245KxyT1VCdhyp0LXR3EyE0UabA4DJ4DkG8m5
 3urEiu8x2WnMLV+mmAJEVkwY2C6h1TltF9uxNI85WCLbrsFzvVZ0gj9RZs2RbDa+Obmh
 2HGA3aC/s6f3FdcnwNHv63qY+ZwJJ/FjMM/pqLYwar0QnsV469TANBdBsIQwo3IsPZ7G
 b57aBuXDfOHq6ponq65nbltK3q1z1tWSY7aUjGfxS1kV+XwVSTOZQ0FPEx748c/sXG4k
 GWJxHF3U2Hd3O+zD7NKYrk5o4KaDOfRNk9qSQmVnZNEK9P1WyYtWKPdO8gsRygnkhqOV
 DT2A==
X-Gm-Message-State: AOJu0Yymnja06tQ2fyBZPQz9eDi4+Ea4HvCO/r1sBw3+MXeYLs/Ako94
 W0E8GiH8HQxv0OcrZ83qOCty9kC1kf6xp4pR9A3H2KYq0FXiOdQVvf3EFM7EZZEBYqRMwTapN2z
 AxnBz
X-Gm-Gg: ATEYQzxwiqmQRru4t57XVJoYeSykeaws8IDIXmtmq/wj9XcyeRgnc+IZi4ozxJ5CuJ9
 CQ7jxxvvoqzjXT7OftOFeBTGQdAiFE2Q2xsIKonoTpyXFjrIncJi+kMUhBRqxGjtpHDZpFz7Coq
 EcwO7BNc9HnHOcwUScbtqqNVvBvqirlY+1LHUGLl7yYIlL4AHPJiQwc287tzP3/7k+G+gyCM0rn
 q1WgJ4Ka/LLb89OtXz5qhzBUUK3VLO5+dmjdT1XFpcmJKTzW7rDpl2W5AZOKCnMR6VY60wxGfHD
 KWuUynVx0rMnaW3DueqFs4vf/qL1EEGdcX4ZPN4NFdUzRZyav2eDuXpOx8mjLhJaKPll7mZcvNs
 nSh7UVmGFKGQkAodhP+TOiu0MWtJV9kBCH49XjdU+8vAT8fk59OBdYyNctEqoggrcoq/KFsFRmf
 NGTsAc5hI+daLZMQWB51QLsnA6JhsRbiTewzeBgl1q1zV5X3t8h1wLZfTvFlXGLVbGOM3GlWE7O
 1f+aFxVzHfxNbaqYrljOOZ+mJm5o2b8NZjoWtvqEQ==
X-Received: by 2002:a05:6000:4381:b0:437:812c:316d with SMTP id
 ffacd0b85a97d-4396f151992mr22531305f8f.2.1771940025177; 
 Tue, 24 Feb 2026 05:33:45 -0800 (PST)
Received: from FRSMI25-GRAVITY.idf.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439899da8dbsm3194997f8f.18.2026.02.24.05.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Feb 2026 05:33:44 -0800 (PST)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Fabien Lehoussel <fabien.lehoussel@smile.fr>
Date: Tue, 24 Feb 2026 14:33:41 +0100
Message-ID: <20260224133341.1711806-1-fabien.lehoussel@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1771940025; x=1772544825; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UpaIjuisJ2todOsRWmRr/WfPz0Af1b9POfPATo5nw2c=;
 b=u/ifJO2wnsJpkM2pLzYyGs8crQpBufdL2wLrxJCuUD+98jMgQNlkmv7F0MHOF5ZlVM
 ucdHuFkfMLhc0aOyMdgggUcP1LYjawOw1BitUR/6BtEWjjHV3DUB6Kx05HZJGit9LLEz
 dS5NalT27YRLTzKt09kmGe3qYk3ltm95gHkqg=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=u/ifJO2w
Subject: [Buildroot] [PATCH 1/1] cve-check: fix CVE URL format
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
From: Fabien Lehoussel via buildroot <buildroot@buildroot.org>
Reply-To: Fabien Lehoussel <fabien.lehoussel@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update NVD source to full URL format following CycloneDC 1.6
specification [1].

Before: "url": "https://nvd.nist.gov/"
After:  "url": "https://nvd.nist.gov/vuln/detail/CVE-XXXX"

[1] https://cyclonedx.org/docs/1.6/json/#vulnerabilities_items_source_url

Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
---
 support/scripts/cve-check | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/cve-check b/support/scripts/cve-check
index ff14e4b238..bcd970bad8 100755
--- a/support/scripts/cve-check
+++ b/support/scripts/cve-check
@@ -131,7 +131,7 @@ def nvd_cve_to_cdx_vulnerability(nvd_cve):
         "description": cve_api_get_lang_from_list(nvd_cve.get("descriptions", [])) or "",
         "source": {
             "name": "NVD",
-            "url": "https://nvd.nist.gov/"
+            "url": f"https://nvd.nist.gov/vuln/detail/{nvd_cve['id']}"
         },
         **({
             "published": nvd_cve["published"],
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
