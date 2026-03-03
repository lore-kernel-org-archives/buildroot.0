Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A76EDA68A
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 15:17:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA6A360F7C;
	Tue,  3 Mar 2026 15:17:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ip2usMkygurN; Tue,  3 Mar 2026 15:17:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4C7F61062
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772551020;
	bh=8ZFe7kT4+ysBISMr0Y9TYACC+xIe29jA31xhfKH9pkU=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=QW/dNxMl3z/OuOvpOuF7pkHoiyBmk2b2my+6jnGuDgSFU4nhuwVpH79IarnP2mkuM
	 TzFT4X2afF36UJ/VYPPA10ml2liCT1eBal5tF7dqmuMPQ+M+fnx460fVShbsuHDAYN
	 C3Hc7XvCAOXEY7AZdmLYWsf714IKT21rgFyd/QNBLRKPFI5/+uYfBARLghWQ5+6ies
	 X9JRI3IeBeC7JlS+ydJ3DGZlopqYb0oYLB9FxM7RQcO4/DOnIrUKz/qT58KmrRkdbW
	 oxInGvng9a+7OL4zdxA49ctCuoVClkKKzsvr49kvGBVNfHPV6WEyorhHnheU+KGM2+
	 55f4u8a7kABJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4C7F61062;
	Tue,  3 Mar 2026 15:17:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3AF97231
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 15:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D20E40281
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 15:17:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ahnum0PdAQqX for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 15:16:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 21DE84018D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21DE84018D
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 21DE84018D
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 15:16:58 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso48982345e9.1
 for <buildroot@buildroot.org>; Tue, 03 Mar 2026 07:16:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772551017; x=1773155817;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=FXrPIgBvbxEbL5ej2fXRJo6ZI76Qn/mmCENsAv9a5KQ=;
 b=JTXg2hVmo62jgTVcoc/IRrkTD29IQ/2dy3zSh5N/r72FtyickuI5MKclQjqbJXprhG
 Z9qUvqRmpjDI3Q+9Yqy4kq8LEnORd/wXHQ7ydJHpafq2QYSlU2/6xtrQDKE/X5buov9b
 c9PARyqSPQytjE7eHY/Vs5fz5q5kPuld1YA6fV86OwNrP38olgjr8b1LgTOTzbaX8XEj
 Fu/aF19IAOa7KcM+H9t/7fzXdOOrH/1Tp3QCMfOSsUdChWAucTW9/PlEI/wrnhDJVPcV
 R9Ts0W+ycAOqv0zbqglAAPpMz+f/1Km+JOK+nfJ1l8do4E+s4FKkgQblaoSGN8NNcFGm
 cvkQ==
X-Gm-Message-State: AOJu0Yx4z85bMj48oX9pR7XMt5lFkJbyc3kHT9MJP15llok93ubrqY/p
 5WS4u8llqHCf/aO6Xn/7yZDqRet6lRn+BfunV4Ny7hZlVhFh5KHzxu98k4eiK4Ep5b2FPf1VHsx
 1eEx+
X-Gm-Gg: ATEYQzxQCf3dGCilA5fhZwdWwmRb8MHbDTBANfP7e9HaEH2FVaJa9bgDM1lx5t/WF4v
 fLuefM/RpBWLlkXfttNIPJxrkc4JF8ppkotuEvirqxbU6ZpvrgZQt6pbgBk2hVX1kRmz33aF1G3
 ZC/TNAzpeb0RMgMApnqyNzGdqSd2xa+eA4q7M2oXzH0HTWQOwlIYsPFWyd2uPIA59Fp7P8quzGd
 FjhZT2WrwYBkD/NOqvoihHNMHfJLnGExpGCemBqjfUeuT4j3ksBHvMJUcNfMgpigslMRq7RZOmH
 3Sn7Ue6B1M852nptBBmac4tMN4g93QUR6wm8NdzvFuRfY/7Un5hAjbxViW0hp2PYk2KciToxLKF
 Ui8FGqwYRb4P7nSWPhPjnJxFnZo0d1v37gno9ONscSE6FTpGONHzUkVgRv1/u2tKI0YUxElGJic
 ECPcXMFMetsv6mS6A=
X-Received: by 2002:a05:600c:6085:b0:46e:4e6d:79f4 with SMTP id
 5b1f17b1804b1-483c9bb4ce4mr315725035e9.15.1772551016718; 
 Tue, 03 Mar 2026 07:16:56 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485135d52f6sm17839655e9.31.2026.03.03.07.16.54
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 07:16:54 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue,  3 Mar 2026 16:16:38 +0100
Message-ID: <20260303151641.382820-7-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303151641.382820-1-thomas.perale@mind.be>
References: <20260303151641.382820-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772551017; x=1773155817; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FXrPIgBvbxEbL5ej2fXRJo6ZI76Qn/mmCENsAv9a5KQ=;
 b=KiS8AsROU3vZ8VUnWUM3VvfvTUck11MUfoDPetbeWZRuntypbNSantEASMYOmz5Sa3
 rDmGUllBKZ61pO8xiWi3Yv3WJEUjcic6N0O9m5IiPE7efkX5ANUIaZbdo/nFysUCvrTq
 3DHJFwLRdCNIVJjMAxaWlWcPhDECX+HOUtv2b3B/3ugbR29s0oplEvgbsub+3lip7s9L
 wXzeORofuSTF2M7VsA8HVbwezizD82pQ2Ttn4whIj2s0wWy+EePKSwxei7SFwOW77GRa
 Xk7j97wDY9Q/5FytFqzXOrM0jfu2XsKBek0MjhwpaaWomDBTimnOhs6/1jT8KJyhAvqg
 k6KA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KiS8AsRO
Subject: [Buildroot] [PATCH v4 6/8] utils/generate-cyclonedx: mark host
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
index cbce3364de..407e42fc86 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -373,6 +373,9 @@ class CycloneDX:
         return {
             "bom-ref": name,
             "type": "library",
+            **({
+                "isExternal": True
+            } if self.options.cyclonedx_version == "1.7" and comp["type"] == "host" else {}),
             **({
                 "name": comp["name"],
             } if "name" in comp else {}),
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
