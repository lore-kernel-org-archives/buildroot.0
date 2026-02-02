Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A4BDE7DEFB
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 16:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFE9040BAC;
	Mon,  2 Feb 2026 16:13:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LBsjUfDACt3g; Mon,  2 Feb 2026 16:13:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 835BE40B64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770048788;
	bh=CGT69lsm5AOp8ghzHh//a1L+O5PC6l3IP7lln2ED3FI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UOxHH101iACQVLYC5krVIebY0t7JqlMuzYe/qAiZhIyYOLplnmwzFkoktNQBRdFTs
	 gnBZjT5LSNXngzx/ik5jOLzVp+qeRqF0ujFx/nvp1CTeaBLRX9MgQI/TM7pTTBDWov
	 vmckmWA0CiCGZfabBvyh8yMM3vS3Z6ZpeTzgsy0zGxNaDKC7FdD7lw24eaUPwh36Bc
	 SHj6khZAF3TJbQKmETfeUEArJ6N0RpUAgOAFNU/NI2O5MFTS2+iCaJ87shLyZDnd6m
	 GTEspsXe9QjHu/kLur5nEq+4e7c9hTVhn9UInjaimlNnXOnQcqPYPqiujTe9H+4JXq
	 rah8eD6NU32Wg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 835BE40B64;
	Mon,  2 Feb 2026 16:13:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 799A234E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 16:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B9D760746
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 16:13:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oyTon_ASehNL for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 16:13:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::441; helo=mail-wr1-x441.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7A0BF60744
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A0BF60744
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7A0BF60744
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 16:13:04 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id
 ffacd0b85a97d-43246af170aso2923863f8f.0
 for <buildroot@buildroot.org>; Mon, 02 Feb 2026 08:13:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770048782; x=1770653582;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LARUOja01/I/cCGki0QRMlov6/AQCXZJsOiO/0vuVbM=;
 b=HYikxmawG2JwqwSNtMPEvnAFt3sRNTFQBZwdZUwY1dkI8SMr8blTAXHBY9r3ni8mfz
 rfagp5raG0JvVa19jYXuY4TNN+YIb8YEnErX9NWDBFTvKtHxJ+P8MB5EXzBJY7p9LWKT
 SRsZ7an66lOiWTi2jqsLbqFi/Kid4bas3SRG4TkOv6BADFfGZZTBPTMZnGjnUZQ7pKro
 Zj4LcmV542/zQ7jiogD7NXfQa/cvRlrkXYT3JCCQA2KFKI7evHIlB58A+XF3zsO7gfj4
 aLcRNeM6jV+6OzMs9I6/eahhmwEXGh9d8LUQyVzbV35ZtvJFZhyJcrDZGKx7p7nhGfHh
 hhiA==
X-Gm-Message-State: AOJu0YzXAEUqhjDUXI1Lj5Kl7gbePo0iUreWRtXG6fuED6/CDYOS3fIM
 MvYBbSdUR17XzsVyaL4Iy1EwaVUAfRjaotwIQogMhgJa4RYqjCWJbB8iZmjo19WziZtGdwuhx+9
 rD/ZVK2Y=
X-Gm-Gg: AZuq6aJeARfHQHU6KROIyNI9BjibiWr91uBXSMNiovbM7rmdhCrfONcxdlyBiyUHb+t
 wYDgdgjJ9SO5pDeLO5/VjqUimNqopfEPzMcLVWpx8w8SULpvCXUX762pFjZrInO4aplSJXfUZF6
 2jrw+C0TOxz9DWzjMDzI2k8CC88+J/pTVoq5xrCYD4YB1zmja1l3OXGfPRPfVCze3n1SltykcbW
 VnTaSETYCURurvDTp9UQZwj+56dJ9z5TvOKYYDnmmyfVFTcikA+6TzfcHcCTvVkn4GFB7uwJcE0
 /o6ohaRQCvr/KUuQDQO9si7Mw2kIQDg/159uGz74JTRts7bL12mlRRW0TwvNd3AvNmOEtsCrAZx
 FwVet/HKp97/XZ0H/w//gdpBY+PfX3RNHBdQjWw1GkA9/MxminE10DzzE7IBbxWTK+Rhr/UDWF8
 Se0Y8uT8p46KwKQDhqP83pKGhI28vXtqL4aVveFcf39vM=
X-Received: by 2002:a5d:588b:0:b0:435:932e:f924 with SMTP id
 ffacd0b85a97d-435f428ad7cmr20423437f8f.2.1770048782109; 
 Mon, 02 Feb 2026 08:13:02 -0800 (PST)
Received: from mindpad (host-109-89-232-55.dynamic.voo.be. [109.89.232.55])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e1048a54sm43785229f8f.0.2026.02.02.08.13.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 08:13:01 -0800 (PST)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
	titouan.christophe@mind.be
Date: Mon,  2 Feb 2026 17:12:56 +0100
Message-ID: <20260202161256.104871-3-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202161256.104871-1-thomas.perale@mind.be>
References: <20260202161256.104871-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770048782; x=1770653582; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LARUOja01/I/cCGki0QRMlov6/AQCXZJsOiO/0vuVbM=;
 b=Mkn+Qo3nS5nZgRa/O3K1gdTLZQ5i3x3MeDLZyj5qEh5grgQQ3z2ykeIKXDHTLbU4+B
 Wtk7yr4PbnC4SgqkLNOcGcgo/sYz0EZCxoVEq4ng1Vjrj6HKztf4Mxcty23hYRYQqo0g
 5pxXvq2zppFrdqXFL5mXhycJa8TsF3hIFHwjN1YxlvlLWpW2GlNU1z1S3EXfU4fz6NCx
 Te0hjrDhSelHk9RxVxMU3TeIThXP+u3Or5SwuhJxxJ6xchCIlVgTiESOThn48L3PimIb
 nxAZLYH+CNPABq/tqg71w/YIbESXBsl7tFzldYSD+XLzBljQIkcJ0nO3N4ckuOgIbKCI
 /hyg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Mkn+Qo3n
Subject: [Buildroot] [PATCH 3/3] utils/generate-cyclonedx: mark host
 packages as external
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

Mark Buildroot's host packages as 'external' with the 'isExternal'
property. Starting CycloneDX v1.7 [1][2] the CycloneDX spec defines this
property like the following [3].

> An external component is one that is not part of an assembly, but is
> expected to be provided by the environment, regardless of the
> component's .scope. This setting can be useful for distinguishing which
> components are bundled with the product and which can be relied upon to
> be present in the deployment environment.

This fits the usage of 'host' packages : a package provided by the
environment and not bundled with the target.

[1] https://github.com/CycloneDX/specification/releases/tag/1.7
[2] https://cyclonedx.org/docs/1.7/json/#components_items_isExternal
[3] https://github.com/CycloneDX/specification/issues/321

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 utils/generate-cyclonedx | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 1ef2544e1b..097d9707de 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -293,6 +293,9 @@ def cyclonedx_component(name, comp, ctx: Context):
     return {
         "bom-ref": name,
         "type": "library",
+        **({
+            "isExternal": True
+        } if ctx.CYCLONEDX_VERSION == "1.7" and comp["type"] == "host" else {}),
         **({
             "name": comp["name"],
         } if "name" in comp else {}),
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
