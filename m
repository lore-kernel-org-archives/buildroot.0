Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ADAACA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 09:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F19C80AA1;
	Sun, 11 Oct 2026 09:42:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pca7T_RQxR6p; Sun, 11 Oct 2026 09:42:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4DD8880E50
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791711746;
	b=e9kNd7C3Ex65/GHN55ufG4A0RzEqRuRXJwuMCuWFoyRh4ryQp5IV++er0pPX7eaOWCrk
	 2Lz+aj9UbFAFUL3AFhk54dD5OYluQvPpJbGE6DSl8II2nAg9j882KrEgRXWH9BwVt47HY
	 0OvbCVu4e8ZAQEWZ07oro+I8yUGvKjbGUut2I7aLNbdbVEfGPtNX5DxNg+pczALuyjnfL
	 7q0tkxN+ztbx+gNUKc9PjSef0LsFAN8q8xLzYxPzLaWr/eXDEFNDiRCE2HtFPwWlr0H3Q
	 3XWd4SIONi1oG1/pG1l00TGCiUVcjMW5E2LZ5Vl3XWeLWIQ/gsaCNfKrpgyxB1aQCsQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791711746;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Zokp2Nf36EnJ+r3QYRAgZn4tBtGsKAQtOQn1eSQ/vfY=;
	b=D6YYt7G9+0gsJqeW5i5eE96/r/sNz8aepCr14ZA1pAMWNeZ6I1ku65/Gl+XHKGYbk2yu
	 n8yC9VECXEag7Gw+8UPnhIZXeFOuTFp44UwQwPiBl5aVjlfQaIZZJQC+KXjUWb1KPhjFr
	 /EDlNgZ45gjkGMjSnp4IJ5WaSe7oB5OgbtJWUTOeRCvZew5hBKjKszGaM5MvQNPXLIBSc
	 dBqcewOJqngyaf7acpSBKR9in1Otg34LUagn6JOH27Tfq0tIX0K3dIMlR02qTUyUP/SCS
	 SWudVxrP79ILOCy9RM9oROVGGxoXgcUMa+7eq4Y3RFMKhwgALbuXHqxiFRAn7lSb1oQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791711746;
	bh=Zokp2Nf36EnJ+r3QYRAgZn4tBtGsKAQtOQn1eSQ/vfY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gssVqyXArHTiAt2VILrxIVRgVg1xHt5ILlOO7aedll1eVTGPx1lw6HYPyJ2v0QepB
	 RKhdLtlKUB+PiCN3G4w+9AOvJM4AWoTNSu/QHfMegERg+VgeNjrRAKT8HERDZOV2wQ
	 srfbQpxyF4DZf4C/4glqjiQuzszXy8TnVwV8drPSsbxsIEsg8AoJCamoACaLvMcY6n
	 zVaC5xHuETclcJA3I3EbdBgf6hAHK+VqUlitY8Gbgazt4d3jrxav2FyW3Dh9U+JImV
	 yoJT8XTavGQE2HEU+pc3e48zshRFgXbftRLOp8PNksMDyLYok90Hd/IjWaP+ppfZz/
	 ZNgLQIXOwoBRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DD8880E50;
	Sun, 11 Oct 2026 09:42:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 221D9317
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 09:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 089BC605EE
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 09:42:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id reyuo1Am9AYW for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 09:42:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 55F4E605D1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791711741;
 b=lxEqrhrJzw8tj1I9IpOSWoCSTjjF+8ORkpu+/tteFWaeRWsSYfq0weP04o/9rGzoLDQh
 /Gm56K+QEQgHMelHZSIm1R6WCbJF9kBf/eDPh+PpOaVUnCowKxbyvjA2HQA7Q18Z8Kvv9
 8tmpAwQMMkLc3qxreBEUax6cKrH9BkfUsT6hjAc7g6+my4jxj+FvkHZKAvbL9wGKqp40J
 9g6PtPdnom6FsnA+OlVN7yQkFjHvDcFXBFlrNWGnUkXqmzfiSPo6WUhLBWNnasWK0EvwM
 b7z70FiFYiSWvJ3iDgWs7G4Cf2QCtBq0EM5s0Bj5QxTll+zy58JjjN+fmQF1FeOzszQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791711741;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=POM0CqnF/oxErGcuPEirvkmjgAkdhEK2mEFhhsXrvac=;
 b=m/fVocazv3uxsWAOI45Cx+/ZorAl/gLMsd3+nsSvFsVesg1UvpwdcuSM6zVgQ9WQXBT5
 UyxVzs2JhJ3SrTwIZ37D6VcR45kM+ibt+fuwqKR9GuZl/Ju6yNlcktc73xJGyRDB4ySLL
 jfLHllUIbe2wWqDNTkcsxqq1fr6Atu5NlSa6gZsD2t8joynD5dVzA4dpWNnhzi1Mi9n62
 mjrcLQTb7MPGVnoyirMiDdvsdaUXYqadXSOnhll+H8PP5M3JbvVQn9r/sopL1f7N4uHm/
 kRMtQMoI1RDIRiw0F88t2Lcdi5QCeZMgOl/3iKecInrgDkKm/AwpgGh5wamFmEJEG6w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=NwhR4dCp; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::333"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 55F4E605D1
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 09:42:19 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4a0286c981dso8708215e9.2
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 02:42:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791711738; x=1792316538;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=POM0CqnF/oxErGcuPEirvkmjgAkdhEK2mEFhhsXrvac=;
 b=kk4UDT/kEfrLVVzSAY/SFskebIoGU0QFsr+g+DdZ0/R6VXkDkp+tbHj3b2x750UC2E
 peIbLuSGtL3WIlZm7aa68O23AX8i9DUOs4xxXtwCVz0umnULw/LjrYvrMa8YfLrCbRzH
 LZH5Tb2bCIE3TJad8aA904hu83Xcje/nXDPyP2juhFceocKWAhncMjMln4Uvnww1XPNi
 7PhCKnROvjLZE6gXQ17RsYQ68J2T6UE91fOqzuoamPzHd8BP/ovaz4RlFyilBJYvyIjy
 4fC9jDbBPro0aXuX/lvC2Q02+9X2K0QM+EKHBwDYkJb2ZHuvP6A71klNMGbR8m47b91l
 UEdg==
X-Gm-Message-State: AFq9FYLf19lj0C6TZ+ktvuEeHZEVJkwgrchQQAFMkM7AONExUFps6XTK
 CSsV5Z0PrrNi7AdHJvKU2fKI8ltUnX7G3BJF16sp8PxCMoGoZlJVFsLbUR7SynPKldMTaMiE8n0
 7OgD6ERE=
X-Gm-Gg: AYBFou2MUU5NhfTq0fe96zchCQ0dHy72CAIgo1DHFWe0AYQmDJgE/6Fa2sBc0yJMkaU
 U59W5pkGIDuN8K/ctnIh2EbQfonJrCeFU24n7WdLXEAOkDICzqYhpgH3LQXkV89Om4+xFDjU5vj
 dZ6lSlQ6ovAE+E9uvX6A6PoT59b+SF/PbchgNzHKT2uqD977aT5bZZpJrgmJtccnrW8BZoKSxAy
 o7j3NQsh7LsjUF2lbywFmOJioFxdM+1L3k6ZF3oRnMPYvw7U4+QKBDSpQi7kDDurN2nuxZp/od6
 wtTLJsfSwCBP8H2bMWkGSDi80zQimkzNqB8ZX6ZxYZY9uMvFj4dsZTigm36rhJdSu2mpSz4Gv6P
 sjYFoGluzxF/G1OXtrdfvNLYgg1cW/jR8N+JTesDJqWLUc0BUYHXF4qNFS9RHqw1lB+JqQAQv3n
 WX+BU6wDxgoVJaSktgrgTEfNwZ6X/OjAgsfHQeLdzMEBZgirwN7uqgdbn96LeguSh+Q/lbJouse
 wc+x3FfFngRPbImWHRjvLcMw4TyjReX/LWdPUYppeQmQMMPTg7tvFYJum1PBmOh5r8=
X-Received: by 2002:a05:600c:198c:b0:4a0:1c0e:b136 with SMTP id
 5b1f17b1804b1-4a18e4cdbfbmr121482625e9.29.1791711737702; 
 Sun, 11 Oct 2026 02:42:17 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-f938-e455-e8cc-7064.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:f938:e455:e8cc:7064])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a199e5db12sm67197005e9.2.2026.10.11.02.42.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2026 02:42:17 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Arnout Vandecappelle <arnout@rnout.be>
Date: Sun, 11 Oct 2026 11:42:14 +0200
Message-ID: <20261011094214.682647-3-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261011094214.682647-1-thomas.perale@mind.be>
References: <20261011094214.682647-1-thomas.perale@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 3/3] utils/generate-cyclonedx: add comment to
 explain spec_version
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

The commit [1] introduced the `cdx_spec_version` variable.
The reason for that variable is not immediately clear. Only the license
schema can use patch revision while the spec version should always
exclude the patch revision.

This commit adds a comment clarifying this.

[1] 504bb61bc6 utils/generate-cyclonedx: support custom schema version

Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 utils/generate-cyclonedx | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 9d3baa23f1..1fbf020a3d 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -562,6 +562,10 @@ def main():
     filtered_show_info_dict = {k: v for k, v in show_info_dict.items()
                                if ("rootfs" not in v["type"]) and (args.virtual or v["virtual"] is False)}
 
+    # Only keep the first two numbers of the 'cdx-version' argument.
+    # While the patch revision (e.g. 1.6.2) can be used for the license list,
+    # only the first two numbers (e.g. 1.6) are valid in the schema and the
+    # 'specVersion'.
     cdx_spec_version = ".".join(args.cdx_version.split(".")[:2])
     cyclonedx_dict = {
         "bomFormat": "CycloneDX",
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
