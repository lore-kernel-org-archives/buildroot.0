Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13773D2ED11
	for <buildroot@archiver.kernel.org>; Tue, 20 Jan 2026 08:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF8D0806BD;
	Tue, 20 Jan 2026 08:24:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x4_QaUMm9pUz; Tue, 20 Jan 2026 08:24:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C30D806D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768897460;
	bh=0Y/ItPtRFC5/NZCmt0+ZK1qKFMeveu/Vz8KxBsGyjJo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=H4/0RL5XkoQDev+io4vATWkLLqwRq+dVVR9DRfHju5cNWBPpWIUtVQRhX7erJW/U5
	 LWq8A+RDhNWU/81rqD1qKO5+2tkq8qmPCF1+OlnUNvQ84o4bBRN0aeozmD4OZTOYvA
	 ML/kccEof7XDjA54yh4yUYlGjNBZy1ibyAEfLby6JnBXc5rZ8BGL6bZE2M/G5A12m0
	 PLTEZFVOq/jeA7w/GIhlKy0gm5P2CkqSXXgNXMGsBFj/gDbEByM8y/oAOZPbtr/87p
	 Np7u8cmpJ8pQf/2FLeGGq5yeJqZ58YTgKO2xCluH7EV59c66m3lunBgguDcrQ/rcv4
	 SFHOJe8M0a3Ng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C30D806D9;
	Tue, 20 Jan 2026 08:24:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C0D89160
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 08:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B44D857C9
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 08:24:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2IY4H9cVbJ7W for <buildroot@buildroot.org>;
 Tue, 20 Jan 2026 08:24:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 48EE4857C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48EE4857C5
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 48EE4857C5
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 08:24:11 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b8719aeebc8so869301166b.3
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 00:24:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768897449; x=1769502249;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MqpG7LSd8+KfEMToOarVuON5b/WrnZ6Y94nngAYvOno=;
 b=vgxvjTSyGy3jSyDeeimMl4jcyra+dpK2enGXMiYJIvpKCgWq0GkRjO+4iHMibr99gv
 TRjwZtSuT5j3QPPmgAfbnutY3tZkVMA47fQiG5Wgq6LKFWI46ka1Clr01VZ3sDGkH2jW
 gx4zKwBe8kpdU9sQ877AgLGs+I7/IJk6ZWv1BzLLmef0sEY3x8HgS5dBUZCrCLdpFBnp
 OLcwhaoCcjdJOgdbO8vpgfB4sSUE1BxmX+vubM68pKP3Zs+9GFZ5OUogktS2j2Xo5AfL
 os5AjpkjPli8xr1TYoHT+9OHJe1voGfWqKjyyW/k678BbY+Iu479rYQawWVfuQm2afiC
 z9bw==
X-Gm-Message-State: AOJu0YyX/sQov47dJEdiOW2PYFrhMdETud86tp7FMNPaEyBzr9G77y7F
 WL6nae4/dx6xQSk8pNyHMypwuV2mcQZx4gxoyerEYXON1EuM8OYZ2A4qII7rqX6JA3TWOUNvstS
 Ij72a
X-Gm-Gg: AY/fxX4U1GH71u4Y7FUq83Axce52f3+9LykLhH3N/23LeZG+cG7ZYpto1ygNsuJIoxG
 iXC7PerajspjuNLNzcEC/mh1oUtD1XZag6LkJ63u7NXGIMDqVX24zksVgLrTNBhQWbeQg33rf3R
 yiEsvmjvbXtknX+0bR50/axCoUg8r/NTt53n/gdxvTwlNxYzsVckebW2tTny+4eUjFlkqkm/1Bm
 opulKVsPRViMji0xabyj768sdyPfEgZqjX/SmrkGsWOVz1JlDT2BDH4ta24DvTRf0ljsK4bA7ZS
 ngcg8/TNDcVpmN2D24ilOYOy0vOhaRv6Xv8CjsBtH+t5ZjnHAHugRatEtsxKMcHDp++90nfb/F/
 TVbNb0d/YNayB86luD7B/iwZnXbUGK07jEMAxSwWcS1nAZQlmChz/u9oRfiueyJM+soz6Qpg8oy
 2Dh0DlM4//Xs8zKaGyzdKtpDSSI18J++qMksU=
X-Received: by 2002:a17:907:7b9b:b0:b87:173f:630 with SMTP id
 a640c23a62f3a-b8792f85a10mr1170661766b.40.1768897448890; 
 Tue, 20 Jan 2026 00:24:08 -0800 (PST)
Received: from arch (94.105.116.200.dyn.edpnet.net. [94.105.116.200])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b87959fbefdsm1307568566b.55.2026.01.20.00.24.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 00:24:08 -0800 (PST)
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Julien Viard de Galbert <julien@vdg.name>, Nimai Mahajan <nimaim@gmail.com>
Date: Tue, 20 Jan 2026 09:24:03 +0100
Message-ID: <20260120082405.46683-4-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120082405.46683-1-thomas.perale@mind.be>
References: <20260120082405.46683-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1768897449; x=1769502249; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MqpG7LSd8+KfEMToOarVuON5b/WrnZ6Y94nngAYvOno=;
 b=ZRK2QP7rSrXnkGu4o+GCDec1gxnNm3vqXEu0oeri1teqq9zpDjKEANNe7z2oVareCw
 PBJGRdLmM3Icgu7vn5EvuL3UmSVeyXjsTMl44I93TlqyglAXE8DHm/SNTlHdTF/ZKXe9
 wNjhbeJqntG5CZHY4aOnaoTEciMeepo9PzHSPT9Sar7miU1C/ejmvYPkbc1TDRicYztr
 J9/CivKIZmOsmNkhQ/8BvOyIsy7nMemFupwRyXMuQ0mM9q4ckD6qtfY6o594RsP+0N84
 iW0rM4ODjAnX7ZkylPVMgZPa+0VcbAjR9r8u7Kxvwf6z7H27yXOAjBmK3sM97/JEaRiX
 Ajtg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZRK2QP7r
Subject: [Buildroot] [PATCH 4/6] package/easy-rsa: add CPE
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

The CPE `openvpn:easy-rsa` is valid for the EasyRsa package. The last
CVE is CVE-2024-13454 [1] that is reference in the upstream bug tracker
[2].

[1] https://nvd.nist.gov/vuln/detail/CVE-2024-13454
[2] https://github.com/OpenVPN/easy-rsa/issues/1122

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/easy-rsa/easy-rsa.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/easy-rsa/easy-rsa.mk b/package/easy-rsa/easy-rsa.mk
index 7266943f5b..2d70dfd05f 100644
--- a/package/easy-rsa/easy-rsa.mk
+++ b/package/easy-rsa/easy-rsa.mk
@@ -10,6 +10,8 @@ EASY_RSA_SITE = https://github.com/OpenVPN/easy-rsa/releases/download/v$(EASY_RS
 EASY_RSA_LICENSE = GPL-2.0
 EASY_RSA_LICENSE_FILES = COPYING.md gpl-2.0.txt
 
+EASY_RSA_CPE_ID_VENDOR = openvpn
+
 # shell script, so no build step
 
 define EASY_RSA_INSTALL_TARGET_CMDS
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
