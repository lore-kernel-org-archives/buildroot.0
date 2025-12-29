Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFFB9E92FDE
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 21:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C502D4080C;
	Mon, 29 Dec 2025 21:22:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 13kbiiR0IOaD; Mon, 29 Dec 2025 21:22:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00829405A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767043342;
	bh=HVB6vEOafKituHrmOpDjKlZpY+nrQJLCxSiRbzl3+EQ=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=CcZyp0e9l1xiGlb4QjV+vVBOeEuVVTsDnZ5B4aW4r5046mF9Z6CKK0TZctonZaHtL
	 uj4doy0De8NlEae4rqu49RUnTuCsXf50uJJUTB2WLVwWH4Za4NSItKat0EVLWQU5KJ
	 R6biODuq1XoVpnjjd+X6L/M7eNu+tW7DrEFd4m1pFo/biF0J5a/94kccMZ4xErfnm6
	 GTZth9I+EZ79LlPuaCZbF+q2olx+oXZ+CMcqJn7uVanS9jZKtf4S3Dh4pXzBHbFFmK
	 NZSTL3OoYMP6HBQe5yGBdqjnJWDIEotQQKb66AVLe+Nvie/3LI1jKVTyoCF//MA8cB
	 shfXmvsyYMzKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00829405A6;
	Mon, 29 Dec 2025 21:22:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 74D8335B
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66D914005B
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:22:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SEOnXPpqjy9D for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 21:22:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9653B4002C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9653B4002C
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9653B4002C
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:22:18 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4775895d69cso39622205e9.0
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 13:22:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767043336; x=1767648136;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wQlSnuwdq/yZCaR39sDeYWmFhBR/tIwAP+OhLbH53e8=;
 b=kpOo+GHUn8LpMa+mgjeqngxtZHLkb3T5U7BC6xNnmgdHWRbfK9a/YkLZUH6HDX/HGr
 M44SAuVac8U9Ng58yBp0RvxrqDB75aU3QyaUiumGJ+FpOySjBXHHwDw78Cxlk3wb+4VM
 3Zya9FvN/lYH0QWUkBQUuGmx5b4KXOYHnUZa9qTqDVbZKLpHCc57pz2ZUn6k/BY0dwrq
 piD8tm0c63027w0RlI5FuU8idIKiWcuZBAXYvM8fUgv98BxtE4I0/Sdd0k5N2jv+cnCN
 ghOBi7VaPH26BezfbAK/qe1zIUajx3nTPYa+ulegXB2v2vsZSXO2xf8TIaL5RhJ9sckO
 tcIA==
X-Gm-Message-State: AOJu0YxWAFNFFFeelCnh9jom+qflMwcrdCWFcSUNmshIGi2UVo3HVI14
 P+6gmJsKN1Jua3UrrMUp3r54clv1SHzkfeW/ORZXf//cGOJWvUNYruDtuvVgqlvnS9sBVGiMp2w
 eAhVtkFU=
X-Gm-Gg: AY/fxX52T6Bwk3idNtYnAoBCb6FFwfkxBUgibdNfwZe1bDRTojObudPZjM+x/Iowx7d
 pfdRCfewiDM5aJZUKPZ2UCk2naSYdEoWz1ptpKFBru3xzkEV61yB5EN4N/uWGL41LHc5YxxIVKJ
 OjQqPvwFjuYREK7+2hxF5b/FQ8jBLgR6+p0fGPCsSbxjtBgIQsxQ8JBA7taPoaTFD1NB7yGOq+j
 0WbFPedTt1nVpKNzvfNxhKlW9vFCngJKjai6IEUD3pKvGwWDnhCWOmk2L5B9ySbxC2JuYMemdvh
 XFWomuG5Ely1yizgeNglnea8pREnreQG7cKuQQZ012XfXr1UainsTkt7vSXfuUpYuK3lgddfKcV
 4Y6QW4tKfe8B5DUuLOVcUW4iP/DMjVJLPVZa3pm8lwYmMY0v8sgJMFZuXFlBp8eT31JshhCF4gB
 GEQKU=
X-Google-Smtp-Source: AGHT+IHPNgtXwXuDEbdTW2rb4TpEd7Q8aH8rywQ/vfMzQhKo5i6xbmzcOZxTK3XOsdmbzXNfwf2DCA==
X-Received: by 2002:a05:600c:5251:b0:477:8a29:582c with SMTP id
 5b1f17b1804b1-47d195a425bmr365195145e9.34.1767043336379; 
 Mon, 29 Dec 2025 13:22:16 -0800 (PST)
Received: from arch ([79.132.229.12]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193cbe58sm556813195e9.9.2025.12.29.13.22.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 13:22:14 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 22:21:45 +0100
Message-ID: <20251229212149.167902-13-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229212149.167902-1-thomas.perale@mind.be>
References: <20251229212149.167902-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1767043336; x=1767648136; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wQlSnuwdq/yZCaR39sDeYWmFhBR/tIwAP+OhLbH53e8=;
 b=O8fjeOWHsnA4/PvGGwJrRQY3iqqRjuR4S5mXbE5Uc15Xwei4VT2ox6/VEpXEKyNJhL
 UsWRIi8QRlDHvxoFNKj/51nHKJ5fobS/p/GGqYOXN6xMeRyzLPvwac+Qxv4WErAw8eP+
 gwBvoTrLplpxWwkvxTxZacQDL0yBJo2Vw5uKDTvnMaRKCCIh6BDVGfJffoCvbQY1Qucg
 tjSUtcwffF0Wanu2013nDGRghVYBfzijIgaoy8f4MNUg5QoSKhL1oOz8suO5DS/T0+HR
 koo2CAfh3xxtELul39Q6JnFmGLwgLATHiVIwc8/+xfdLmCLMgCzZXFmPYLrmUzNBtyRP
 4yYg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=O8fjeOWH
Subject: [Buildroot] [PATCH 12/15] package/glibc: remove stale IGNORE_CVES
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Bernd Kuhls <bernd@kuhls.net>, Olivier Singla <olivier.singla@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Danomi Manchego <danomimanchego123@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The IGNORE_CVES entries introduced in [1] no longer match to the glibc
package following the bump to v2.42 in [2]. The version boundaries
specified on the NVD DB are specific to 2.40 & 2.41.

The CVE-2025-8058 though don't have any information available on the NVD
DB and will remain on the IGNORE_CVES then.

[1] feaf53585a package/glibc: security bump to version 2.41-70
[2] fb6256c0ef package/{glibc, localdef}: bump to version 2.42

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/glibc/glibc.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 924274a7d6..9c3ff7124e 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -25,12 +25,6 @@ GLIBC_CPE_ID_VENDOR = gnu
 # allow proper matching with the CPE database.
 GLIBC_CPE_ID_VERSION = $(word 1, $(subst -,$(space),$(GLIBC_VERSION)))
 
-# Fixed by glibc-2.41-57-g84bdbf8a6f2fdafd3661489dbb7f79835a52da82
-GLIBC_IGNORE_CVES += CVE-2025-5745
-
-# Fixed by glibc-2.41-60-g0c76c951620f9e12df2a89b2c684878b55bb6795
-GLIBC_IGNORE_CVES += CVE-2025-5702
-
 # Fixed by glibc-2.41-64-g1e16d0096d80a6e12d5bfa8e0aafdd13c47efd65
 GLIBC_IGNORE_CVES += CVE-2025-8058
 
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
