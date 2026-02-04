Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A903E83EF9
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 13:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAAB860DA2;
	Wed,  4 Feb 2026 13:54:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fNuGqJCw5OCB; Wed,  4 Feb 2026 13:54:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1CF160D9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770213246;
	bh=xs2OIS45iuNLBempEsWdjTE9SGLMMmo3x8HrUF7t3hQ=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=F/+m9usnnwe+SSymieGnZvIsi668h3TWh/DdGK4MZ3jir8g7MxY+ywOezJwIHJIPb
	 2bbWV+f0ETdENfyrROPnPysEaZyCE1/dJbRX9P2wLvSGETcI4m89PgevWtqDvSs2hZ
	 WKn69/tJQKh2rKk3luW1rp473sIkXkqKvWWkXm73fOkoIAp/N6821IcGgeu74iekgE
	 Bc5q60BDzKjqwhsUM2c3vw4Mb49lgcUBt8JwC/a2A0aO47PPnFEpnqcGeWOV7V2nTh
	 7bh5g29NJ24sjnZyl4n646GeZuiYmNMkdC7x8nxUl4dZIt0Im8TcSq4ParzCekImLw
	 dg41L9VtDO0IA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1CF160D9B;
	Wed,  4 Feb 2026 13:54:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 036D3F4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E459B60C08
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:54:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kyocDbXpLOuI for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 13:54:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B530E60BD9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B530E60BD9
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B530E60BD9
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:54:03 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4801c2fae63so53235655e9.2
 for <buildroot@buildroot.org>; Wed, 04 Feb 2026 05:54:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770213241; x=1770818041;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yOQvUInaH0mfupVcRC9pUyfpfaaSft3kdBwoMYnGwNo=;
 b=KeA26aJ5LjNmI5Jwh4Ie8+S9Gky+LiIgZBHGEZK2767kjkrEZQzZseZMtFSBeyEixd
 +jqO/nOpeTmgDJmG2VqaW/VpazfvK3rz3FScxMIdmnHDf15tjIMP3wNgL3lK08cHVGU4
 v6CyrsylR3zYpDhm9hD8WA6DPxN3bPRAXX78NQx7eFg6VP1jGJ80Mkp/lhwy2KyT6mRY
 ohdYG8snm0VYklSpQjCuLhvamen0QWwgVrUOmm2lCapAmnKdRhWp8ed2ZSrzHzKb12ZS
 NQS0/9wwv3RwWWy4Zh64o3izlZMICcKO3ziKcmtzchAJVhC6C3oTlGJJClsA3PbtcMcD
 zSLw==
X-Gm-Message-State: AOJu0YxTyTZkUc4nHYFralx+7AuFnpqYEkw5rcZx5kFs+eoyIleubb9R
 Qo5R0TTiQUaVExldZtd6FDL8V4CTlWJU5IGJDKMBUjF+IckvWJad3JKbZED79sQ135q6vzaBtyI
 32XMr
X-Gm-Gg: AZuq6aKfyzbA8IRdOdpVcAPi0I6pOgotVaR0QZ4ETPnV+nzyxjGpiLxiiFuzzeUG+tn
 jBx2WDWk1wUDKM8X0VYJoyzbv4kq3LMSa892hcadaJAx/7Xhh0q8WMoNQ9F2qgNcGsS/mw+o8kU
 GM9vTE7oBtWUu/7WzHPMQ9VGx5ndPdZqS3KlumkDByLCprgLp6X11mSIwYkOxKPBStZzWLNe30h
 bFrrx2+fitQ1bevJDDUgqWNR4moewbW6NdSU+cTlw+uKu0yAevPIV1MtO9Qwf6yJKY38Ihw83Ks
 x5qlXGhFRt2RJ/DmGzH5UdRWOgnL+v+EenRe7wFiylgVkR2mZHVMtxtN+ZHcsRlYdGtdwcP7OSH
 EU4mjAtppiolqy/UawNyL7Lp0XDA5Whqwag2TZGRuOesEsy0wQ4rY2MPOWj0JtItJGZLHuEkS8H
 6LyOU0klkm4Zun5BBh+qyHFVyEhtUfVFpNbi9ZoNIgUJARgWAm3tQpSw==
X-Received: by 2002:a05:600c:3acd:b0:47e:f481:24b7 with SMTP id
 5b1f17b1804b1-4830e988f24mr40806325e9.17.1770213241412; 
 Wed, 04 Feb 2026 05:54:01 -0800 (PST)
Received: from mindpad (host-109-89-232-55.dynamic.voo.be. [109.89.232.55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48310880598sm41026035e9.0.2026.02.04.05.54.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Feb 2026 05:54:01 -0800 (PST)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
	titouan.christophe@mind.be
Date: Wed,  4 Feb 2026 14:53:55 +0100
Message-ID: <20260204135400.307638-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770213241; x=1770818041; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yOQvUInaH0mfupVcRC9pUyfpfaaSft3kdBwoMYnGwNo=;
 b=DAvW0SwVB6YdMYLVdxh9VYNtMQDKBK34IDoVsu70PwpdYfmqRpB4Qujo3NuvOpcLbA
 nwa2+jMfUOOxlYhrH16WB3ETZTjIiT1MtCnWV3HezLpDbIlJPvx6p5+148QphhjurTSy
 J+aGysG0NvW6Xr1e1PbEut208G5LVND5Hqz4qU/cPMuAJ/DnJVV2LNU1o6r+Ht0286PF
 J4WzZp+wwkXocQ5NMIB7luh9id4h3gAEu+v94104y9sqSdbuQHuGUpjPcOvr9e3HTVdD
 fS4v1dmH01/+1sLBZkWbOIsWtVZbCbkhSm4nXCMN2n3sPdTg8i40NQpNEUJYIXV2eZih
 EonA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DAvW0SwV
Subject: [Buildroot] [PATCH v3 1/6] utils/generate-cyclonedx: use tuple for
 version
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

Allows to compare different (major, minor) version easily.

In next commit, an optional newer version of CycloneDX will be
introduced and this syntax makes it easy to compare without introducing
a dependency to 'packaging.version'.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 utils/generate-cyclonedx | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 2b6c6d63d3..eff55bf598 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -20,13 +20,13 @@ import sys
 import re
 
 
-CYCLONEDX_VERSION = "1.6"
-SPDX_SCHEMA_URL = f"https://raw.githubusercontent.com/CycloneDX/specification/{CYCLONEDX_VERSION}/schema/spdx.schema.json"
+CYCLONEDX_VERSION = (1, 6)
+SPDX_SCHEMA_URL = "https://raw.githubusercontent.com/CycloneDX/specification/{}.{}/schema/spdx.schema.json".format(*CYCLONEDX_VERSION)
 
 brpath = Path(__file__).parent.parent
 
 cyclonedxpath = Path(os.getenv("BR2_DL_DIR", brpath / "dl")) / "cyclonedx"
-SPDX_SCHEMA_PATH = cyclonedxpath / f"spdx-{CYCLONEDX_VERSION}.schema.json"
+SPDX_SCHEMA_PATH = cyclonedxpath / "spdx-{}.{}.schema.json".format(*CYCLONEDX_VERSION)
 
 BR2_VERSION_FULL = (
     subprocess.check_output(
@@ -413,8 +413,8 @@ def main():
 
     cyclonedx_dict = {
         "bomFormat": "CycloneDX",
-        "$schema": f"http://cyclonedx.org/schema/bom-{CYCLONEDX_VERSION}.schema.json",
-        "specVersion": f"{CYCLONEDX_VERSION}",
+        "$schema": "http://cyclonedx.org/schema/bom-{}.{}.schema.json".format(*CYCLONEDX_VERSION),
+        "specVersion": "{}.{}".format(*CYCLONEDX_VERSION),
         "metadata": {
             "component": {
                 "bom-ref": args.project_name,
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
