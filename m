Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 469A4C88E75
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 07:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDCF040B04;
	Fri, 18 Sep 2026 07:36:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xTVjYrM9B2Ye; Fri, 18 Sep 2026 07:36:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2B70240B05
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789717001;
	b=QqVn/ozqqhYhpyJVB9eox0/E1MEZUz3skPcdaeobjfsLYtInQ6NUNB7JJ4F+bTbTUPKZ
	 MzMk2b8Mn8I0NTJoeJJFe+f0TfqSAfhevwFMAWtAxYH7Mz1mojLeCkfAI91NO2/eN141J
	 Ot22x5wYmsq6IgS9FMDOIBe280Z8A4v/BVenFr1dmgT34+HzWEqfTy/VT+c63S0UgyRIB
	 VISk85fiIgtkP5VSZcdI/wedDglnHBtonUVI9Ic6+ybSDJV+EZUgwkR12OmvSf5KMvaTS
	 jVtJPX6d4o0tr4MCP8kcQs+YKjGN97riAp8+TIxc1LNyYvqissEmSTWXOAluqdJo8CQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789717001;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=8iW6NjPVBHiZ/C1xA0kvlbQctdbeodQI1ZChyBnUpP8=;
	b=QMuyS7AdXGOblrJZdMA0G5t3H1z8fh5sSdO/K0GNxFGQz7EBKLdmw3kSKSSUT06CG/kv
	 LICq/0f0kiurvO9lxaC7KF5kecp8mJspFymtsyaSk5+jNevA7mS3RCEWHruN6sbSaxD8Z
	 jn4cJKi9FyWh+KZKE3Qry9awJUrLMYGlPFXpkPdA6vZj/G4dGbK3M7AFJ+WhMpBQ5o0/i
	 U3HMz3GvNRusYen1AxvpdjpEVzv0u0hrIg3sRZjpRi3MjFc23E28m+lDe6FI2npVTp8IW
	 MV9TRGLSiPtNnzVGQBTbvxUVrr9JLyi/i9xKc8NVNsPHI/wbV9MeNexNbYgl1LsqedQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UDnEX6lQ;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789717001;
	bh=8iW6NjPVBHiZ/C1xA0kvlbQctdbeodQI1ZChyBnUpP8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JoQeI9mcUG+QAUJTA419/aFsHA170WkVpw3Sg9K6PVPmxLGPUsWA/x4X2U5yKLVQb
	 AumnjvVyGjvDkRjsoEEpb9cD+rsrqqR8UtDIFLulHxGljfzQJz9i6TfVuKu2poCX3n
	 bICuYE/IPsDsEmisDitQvcj6czoD4luHmd4QIpatClUAaMCo0Hn5/IwAT5msdpcDF0
	 BrX1M0oFISeaXASZvdTpAPIjYOHM9EXrroBol7fKARqwdNcbE8C73U8X/gMZsdkmoC
	 8tlD52joZfPe3cOphzwKv0dA42g8BRLKdDNQ0JH6Ig+ko10KSr+erc+wWdlyvT2oYI
	 rsXcCM0z8BCNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B70240B05;
	Fri, 18 Sep 2026 07:36:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F64037A
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 07:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 513B540B05
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 07:36:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j_eGsBnbatyR for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 07:36:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4697340B04
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:30::f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789716999;
 b=BgHHdgq2XEkVjt1RO1xA+wTeiqvy3NGFJmBT2stqfSi+gE0WjJO7E78fChKYA0NX0Au0
 /HHBJppRz/TDiCZ/jCt4nP6zfRnaXqA6iXr/kbbv2ohcwYCpMAVRxNkCpm8cax9XOufBS
 BDPiFNlIHeXwqWspH/dfXaQH4UTPy8YDmeOaLiFbfLzg6hqlDSvDvEcLUP3Xj/pEVnicr
 RhMU3PTIHPJq41VMxehimXdqJ0yHNYa0XyFNdHelxscYo1V0q2asf9G4yMiY7k09simmf
 8D+Eo7mswFMrRKktB4a0YEKSzfulxcWXlp4rG7YjeHaucgxYpdrrhmz8zB3tkfA9XeQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789716999;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=Sa2BmaOH9aZRuYOfD7nEILM8TEBYMPYO1CpCDNx8Mu4=;
 b=K97+fJL8A+YjcWWEsBNL/e5487Z5WyX4iFR86CHuL6J6pzIDq5NVsvPFOkN6wcXGWVpy
 MhSsyt5GfyPBkEwnfJv0zeHy9SpLBYJp8kqmHrXiRIpv7niCmRW1alGOk/StzuIvc1jFE
 +aIliSFIl8987aaFSY0YM0ufKb3MF1SmnWHZ/mT4rhO315uFUO1lUMGvVr3YRP0OinXul
 5IRpP0ULm2YCHO/smX8yaJjW/IBemNFOSDvZbZ50AOM8QGoCPDpjIQYum0Jb2MegETLKQ
 hhMWqvhjahH4d4OyXI2Mu+NzOeO79bOsd4N5WWdiRD+J03r4NzHhdtQZJ+SUyd33LGQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=UDnEX6lQ; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::f"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:30::f;
 helo=mail-wr2-x0f.google.com; envelope-from=heiko.thiery@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=UDnEX6lQ
Received: from mail-wr2-x0f.google.com (mail-wr2-x0f.google.com
 [IPv6:2a00:1450:4864:30::f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4697340B04
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 07:36:36 +0000 (UTC)
Received: by mail-wr2-x0f.google.com with SMTP id
 ffacd0b85a97d-482f635552aso296214f8f.2
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 00:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789716994; x=1790321794; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Sa2BmaOH9aZRuYOfD7nEILM8TEBYMPYO1CpCDNx8Mu4=;
 b=UDnEX6lQZqf+IZVzFcEzB5vlhrLIvvDSl1kQ1QuthMXYzTfNgICLUumUjaXIlmVUfh
 RymGiJyomTVyC7EEgEYBZEvcodFtGnZHAxQrph/ddRlaZnK1M7Xka/aqSshZBFOAcEwX
 Ixdqzu4AuVqPCd0PW8VggXaU0YCyJn6wdYK1RDIjcRzU49hf7FYf9L6QKke9sE9UcUok
 netZZnp+Zk0kzrFgQ7tzJjMT0ic4DHuTG4XKbbzjeJfg9sGO4Vx4rp6jizCdoudsuAfN
 XX8Cp6t52mhvpoW3+BuORGvjRijkBfrH2LddhIwha4tj/AD07FJH3RvkvzRELekDuBSZ
 frAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789716994; x=1790321794;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Sa2BmaOH9aZRuYOfD7nEILM8TEBYMPYO1CpCDNx8Mu4=;
 b=fN0i3ttmPzU8BWPTH7fXbbS5KqjAxoj6DSV0SPZ0Q75LtIdhe4TMnkqikzus60tD7I
 GFxJw3+/2sRte4APZrWitxf6i/AoXdHJZWl5ie7mHh9Q0eonKE5FG7OqwpCd9ZW++kYM
 gp7v62thUuhDYKCqZPfZqbyBWpXLMIymVlT/A/me3ePFl8B2NXCSqd3iNoaqzlLrvU/Z
 eQqW53XdU+EaNlQryIfi0WjFPk9NV35fLHbyuHl/VQJXo1Qq6Z7sXCF2EPH4U9ZD6l7u
 ptckXs8yjjsrMEecJ+W7IjrDF04oQOHPVknuCnPqnX4e7vE37zvbNKXYXNtKy//l34jT
 vczg==
X-Gm-Message-State: AFuF++mvvKuvquEGH98d6PRqcptKKFLxu8ihNSFtdwKD2liFcgmCF55/
 JueULZkPf3uCB0ZPFSu5lcohFqtqamT2LdweJ3uuDL+gGdu7cGaHx1YuaQ0DWg==
X-Gm-Gg: AYBFou3OQVrXebw0oO5ItVPKfqbieMOhu4XUEMUIO7tNiwnxVVAkW1Rt2H+/9wz/Wbv
 vVlJT+pzR2MQya1zLAMJngVPEcIdWHv2ZSyMMDFqpgOcEsvV3DKErIPiJBtnsLnx4sMaBkdpL+u
 koL2DFbHHK1WyhXjVPs3vXQvqpIHy15WZfN/PCnXgUONEuCIk8qIs/zIk42aJCIx/KRQ3eI5diB
 l0+hxXNx2qXLSCrcBJPXAunuJiuglwrNAFfG0WuEkpX+jRUPC8vODH8QctlqZb+5c1ifHAcL18M
 YvF7UjLWUgZWw/Hty5cSHwtlC1G1BuHU70v92iPmvF3g8xP9P8h1X2swphEGBmeiwW7zuX8WAgf
 6ggrjeXW8g8NTH+FNOTaYg6qSUDXqS6ZO+rj8BBpAZfFUP3jHaIV1fWXJJLTho6nyoxBbvjbQ3m
 qPHeZlHU+I6WW2S0d0/pDtYYykXDtFV9cIOKyJsMpZqW8j/UWAju4PlB9YYqcU6Oi61mp8j5aob
 +qmIphL7B6N/A==
X-Received: by 2002:a05:6000:2f85:b0:487:d8f:27a0 with SMTP id
 ffacd0b85a97d-4871e3961c0mr1599266f8f.32.1789716993832; 
 Fri, 18 Sep 2026 00:36:33 -0700 (PDT)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4871fe5d84asm2044560f8f.0.2026.09.18.00.36.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 00:36:32 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 18 Sep 2026 09:36:31 +0200
Message-ID: <20260918073631.665322-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] utils/generate-cyclonedx: add uuid as
 serialNumber
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In CycloneDX the serialNumber field is an optional top-level field that
uniquely identified a SBOM using a URN RFC 4122 UUID format.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 utils/generate-cyclonedx | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index df12ee84c0..c3b614b6be 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -19,6 +19,7 @@ import urllib.request
 import subprocess
 import sys
 import re
+import uuid
 
 
 CYCLONEDX_VERSION = "1.6"
@@ -534,6 +535,7 @@ def main():
         "bomFormat": "CycloneDX",
         "$schema": f"http://cyclonedx.org/schema/bom-{CYCLONEDX_VERSION}.schema.json",
         "specVersion": f"{CYCLONEDX_VERSION}",
+        "serialNumber": uuid.uuid4().urn,
         "metadata": {
             "component": {
                 "bom-ref": args.project_name,
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
