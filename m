Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B00EDEBF5
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 22:24:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C5FA606F2;
	Tue,  3 Mar 2026 22:24:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9wUD6hXERRk5; Tue,  3 Mar 2026 22:24:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77A8C606FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772576642;
	bh=kvflBddQxx1GGiHjz4QJMC/l7gXpP9G9Evmv2AdWfmQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=j8qsbopdEZUxLq1ZLJCjV/ofd4MESTGNCvQeoSYr4PGQBKArJ3jiQ+drGNkA3yptz
	 QBc4teSHN85YDQ1/wm5LvAhF+fEbPZFHxgFWfDtZYl/RYSCAmLNt1GpseKYIPlygRV
	 UXWOVV2tl4gIDscfV0fVZTM6GFfVTI9IoJbTCk2YAeQocW4htNEjLCW/PqtHbBgFKf
	 0ZsdfLe9xWbaZyM6/0SJq2u1cFLFbokyHhM3gRsKFkEKKsp7OB5qITcH1MiDILpvNu
	 93ozUUxEl9zUj63J+rlviXOcveN6fOPt2mo+QKidgJhAmyEVAaJZs0Y0A3+3A0qiBH
	 jnRKnsPRGW7Gw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77A8C606FF;
	Tue,  3 Mar 2026 22:24:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E39E225B
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 22:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5ADF81279
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 22:24:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lf8JR9Qu4P95 for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 22:24:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CFD588126C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFD588126C
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CFD588126C
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 22:23:59 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4833115090dso63846355e9.3
 for <buildroot@buildroot.org>; Tue, 03 Mar 2026 14:23:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772576637; x=1773181437;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bG6aa1N/3ESkg5eZxnTgOkbZ4tqFsedpKcFMvGIKv6Q=;
 b=dtMUfSrwTggs/kdzn5B9DAK5S68BhoDMD3u9Tu8olElHjEjjHlZi34/7WjRPvUX+4t
 Jr5HaYSnSPGhHPjFuaozlhHb7C0gua2HugeJP+pqmX/G3RFSrDokJeQc9Lw4wkYvCKI8
 qoWDIrE+iaaL5g9ZkYDpdQiRJzabv3vQjVd73r6HakSlpoMu6be9KeRnIvy0V5NLg5S9
 TPRxStdZ+3+hRseEYrnsui+Ca0ase4HcH58+wkGS4WeGFaHttKjp/cvgHB9qwMZQDOSB
 QXW0RREppsDBQdQNPwatZuLURafayRxLHXo+/rDBs1Nf0y3EYu+0S9cll2uXP9F0kSQD
 82Jg==
X-Gm-Message-State: AOJu0Yx8OOFM4GXSTLVCHTzo+wV9IJAQQ+InDoEjk2DGRx1IMZQ7keac
 0yGNwUu1OzHCIWYnBdfVypkPU5z4mc2vzFKziojiYghc7zvdvLzsh58P5N5DfwTOKQQTDIfBMYT
 Kf2Lf
X-Gm-Gg: ATEYQzxJeElCf/lO9ZH4/xb+0jav9Z1sXFDf8BEQeFqSkpxO3CkJx3SzJq1s2vKzybm
 b2Vl3aPevROrw6CKyN2HbnTUnPkOsp8EnrFdOldra69irKs7X/MCQSbJQr0ZnEETe1zDWYViwn1
 TbjXNSdmWOSNb1OcdB9Au2F5RWRSV+Ta/gORSKPsjotRYaf5yKet4kTnSy+R655sW79PSQD+iX9
 7U4rZTXrYL2F565luZD3X2qqbyNuFW0paHGdL5OV4c7NXs1uP8E8CDgPpYiGSKuzxtq/TffctO4
 540IGgOLDHApgX26kbURYba5Y28I0xFDBoiwYmis2dbMVV896chTZ0KwgKMX88fYen4eDFQxuKU
 A5KbSKt4PvWVPuW/wjZqrUWgbf0VBGVxkKvo58aoU2FlCi2ZiPtic6WXmNlUQuULQcZfbx7ZZHC
 p7vc1yDJ5NPucWjLI=
X-Received: by 2002:a05:600c:b90:b0:483:456a:514b with SMTP id
 5b1f17b1804b1-483c9bb1fbfmr317617865e9.12.1772576637030; 
 Tue, 03 Mar 2026 14:23:57 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485187b6ffbsm7992775e9.2.2026.03.03.14.23.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 14:23:56 -0800 (PST)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  3 Mar 2026 23:23:50 +0100
Message-ID: <20260303222352.95612-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303222352.95612-1-thomas.perale@mind.be>
References: <20260303222352.95612-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772576637; x=1773181437; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bG6aa1N/3ESkg5eZxnTgOkbZ4tqFsedpKcFMvGIKv6Q=;
 b=JPezkEXIJHG96pDPiQI9BQe1C7tt5Is900BaBI38zdPQimJMJl4aySjzpAN5lJWNNe
 LgLLUzTAKaqwwUB384WCA2oe5B2KjHn92ckJ9cuURGeeQHgaDLotusjinn9PW9tsMeE/
 TEXFy+B8uaFXZlNy6j/cU0qaGAezDGk2cs9SNqRSZ/9vQZKrtVy2COPTt2iBkUzzYesY
 QSzO8Wv8d3DjFU4Rzhe8VwkwYb33+ASkoE7IUEKroHfw9K+x6XJ4bKFeyKy8ADfMINxS
 2vbsxLyB5qiYZOvZlKd8tZsm+NSgori2Yh580CviLFuifb7MmyQzrdww6H16MM4y0iPx
 ugyQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JPezkEXI
Subject: [Buildroot] [PATCH 2/4] support/scripts/cve-check: remove 'bom-ref'
 for vulnerabilities
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
index 2bb3524014..1c006e4ce4 100755
--- a/support/scripts/cve-check
+++ b/support/scripts/cve-check
@@ -129,7 +129,6 @@ def nvd_cve_to_cdx_vulnerability(nvd_cve):
     [1] https://cyclonedx.org/docs/1.6/json/#vulnerabilities
     """
     vulnerability = {
-        "bom-ref": nvd_cve["id"],
         "id": nvd_cve["id"],
         "description": cve_api_get_lang_from_list(nvd_cve.get("descriptions", [])) or "",
         "source": {
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
