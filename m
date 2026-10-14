Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15853CC6B1D
	for <buildroot@archiver.kernel.org>; Wed, 14 Oct 2026 14:20:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB96B6083B;
	Wed, 14 Oct 2026 14:20:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RhqWoFHp79wl; Wed, 14 Oct 2026 14:20:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BA136607C3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791987604;
	b=D7hTaWqontfUcr5FfgZKx4UGtxLPsQjW56JuYuDTJwdPpIOflWuTrw2qvk6Gl/z6Wc1H
	 SIWjxhpu7huBGlvMyLKIIRRs4lD4+40FcS/6E3zkGDnw5PYoHi4rNEcjE4ikqIh6D0OzK
	 QwKiTfLwbdTW07pb8aCzLGLmVmmS1AzBZehF0nb8K3zWPbQUsL7/zvdqD93zWGjfHB/NM
	 r422mTASZy/zr1PnPki29rthBduPNUY+ihpHd/zCr8H6GlB0STuo+JRCealPHgk20DWOY
	 +ZvZihAYY211HiXUB9aJf3OUKVVNrXnuNsczhO/h+mgTtRyyrNKARJvDIyeiLVwdG3Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791987604;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:X-Google-Original-From:To:Date:Message-Id:
	 X-Mailer:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=rLNwAtRKvDFBmejeCSaiqZNyq88UU15NMr4wJx6zLEI=;
	b=sv38eL58D+C5CMW3//BA9XSfl4uxoNUKV/XiEp+1JwRLzKN9GKcfakciXobNl7nkKrl5
	 QZJCbaYyfcng/qDQ1e3ITW0W+g3SLTGut2x28srXXGBuLmzWQptADL6YaBEOiQSLvCes1
	 FNWng6WdpgrRBQDL6MfG+wD3kxspKjzEQq74fLrCigkAJUUkDYAV3ab8/AQWzYzozVBh0
	 ArPgBXK6PApa0BJs0sdwOxa7AVMLAIeO9O6IIIopRcUwwJe9N3Fv6SdDagfhVFMqVPjGr
	 2tjvBmJ0BcMWgHOJQXpdc9Zo0qh8vnw6COLKiIcXY+MYHg0elPJljum067FD8NMEqDw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791987604;
	bh=rLNwAtRKvDFBmejeCSaiqZNyq88UU15NMr4wJx6zLEI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=SJbmps0w8ns4sfibMgqXMB2UrmAS0yc2rj+jMVyeO5N9QUpo7Sp4+y2lYU2QqCyu0
	 rJaZ8AB0ed7PmAn5aYDb08rZKA+Hp/TfzoEECJY3d/eiIcZst8oH0C4Flk5LEAFqri
	 wD8AfQ23KEquimxrHPD88g1yj3n2Df2VDtyddwncmyKRmBNWDaSjMzyGxC0jJKbBYq
	 Xjh2hQvxl0/TngO2wjlv97eWYp+5lGO8lJkiKfsQufh4g0FR+bIDzN/J8tepni6bSl
	 DqyY/RSlvDlxLdUc2isVmnglRVhlng66ioimN02X2LJ/X6JpnChh9E5T2aI7LN1rry
	 mPrOz+dcZj2wQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA136607C3;
	Wed, 14 Oct 2026 14:20:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A2B172E0
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 14:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94657406F9
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 14:20:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3qLzY3IFptoC for <buildroot@buildroot.org>;
 Wed, 14 Oct 2026 14:20:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AF4AE406E1
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::633"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791987603;
 b=SdMVmBOfj9YHk1BcFnuiCC6uGfS+1chGInvOO/i5pA/Tjk8K3HG+z91A83MorBXBHFsp
 08Jlf02N57agcZ03Ibv7pZhPlqH+AxM1lsb7ou6e5O/Sy3a6G36m+Hz4kAcZ27ogXeaTp
 anDQC+atrgZYtHaoUCypjyk2Z3RDqf/9d3V7lVPZiWQ+GU2f/63FQBqnt/ugxWsVlW0GX
 PLzGTSSNSaKsRlLDnwQrMBsTfWm3KOcDAcE5PnMtjZlcEHuDvtBl/3vKApLhlL2W6/vyR
 8Yubu1ezb4WP0ZVaMQNybO2RHWLYRr1oEYpz6hxDwPyR94mqSi38S9CAbgJv9dPTRkg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791987603;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 MIME-Version:Content-Transfer-Encoding;
 bh=kXJAgge2V3Ib2IJ+nDZquetTes2753SXfHfE8UOK9II=;
 b=nZ53Z6O/RI5vOtp5m82aQBzZT5RRBS+DOPbMBBzFQuVrJIFMrZvcHw/a4vK4/Fj6svwG
 v68zsqfBjrviLX6zCJy6fj6HTEte/MSJlNt7UcZps7hciKrTDTCjDHEhoI1smX3wQyEKa
 iIyJfiPMghZFFNF3mGy6zmMODxoEvyme2zQgHglvIX+6CxIWunoMyYasyWBGO8YD5HSsu
 72PgTaQTAOYaLSW27tS8m6Hy9xC9kn8bUfVETFbjxyCph4Xi2uRBjB2ag0pibvMxOqHMI
 d3rB17hDAzbd4+U0YMsRDuz3qsQxSx8fd63BQWoR6CaxVgS673J04/naOd///B1aOHA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=hWJBXLX0; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::633"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20251104 header.b=hWJBXLX0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AF4AE406E1
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 14:20:00 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-c2055573c8cso525763966b.3
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 07:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20251104; t=1791987598; x=1792592398; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=kXJAgge2V3Ib2IJ+nDZquetTes2753SXfHfE8UOK9II=;
 b=hWJBXLX0mYS91eHcS+PjoJzvKagoBuezyqCF4vjbNE8IJmxn0nUe8lQI9Urlc6iYuO
 J/8Fi4Z7k+iCEIzpwbfHKEc+Nl2YDurFG8Q5qPUdhS1AWZLlIp2gMIy8onj8MLnhII0F
 D9kWW2lixMZ5rr4cOo//+dNMN2Sh6kqGt0CDYrzm4DsmuDbr8FGUmyr5aW0zgH73GhxN
 vYF5XL96sPCPOR8wItuhToB5Da05lYmlpl/2g4PYNvZNwS2NZMOZqY8ctItRGTOvuB5A
 qAjf4R+AbpmAU28moJ4xgsYdn4F9rAe2wxWDKGUasshQzjGDkowQmxIPsdwA/c4ANAwK
 MeXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791987598; x=1792592398;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=kXJAgge2V3Ib2IJ+nDZquetTes2753SXfHfE8UOK9II=;
 b=pYa20NwrIJD0gPmIXBiTads46hXWpn0nF8ms6m6GQSgJ+caLq5YzX9OyP14P2SVeVk
 JEt9Y4Nfi+aOzYDG2Kj/XAZqzuj+WdwsIbHzJ+aRWsXeZ+7NQOTQOU3BhvNzHUloVExk
 AQOB60TAFUi/OwnlDQeFyMyQnqD9EJUxWGBq1H+3idU7OYWVmlrsQB5+MX0+Mm3LQOKD
 OcBLzaEkaG6ARrqzuF8kjrlOhSQvI3w2D5nPAfrfIjDprteIAEKWZx/vRk9GJFZbVImu
 Pam0aoRnCpLJkKgzRuqoDGugDubzMh/42ATkRG/lvYXI2R1deSNylTBezSmV0LOZF8xB
 ceRw==
X-Gm-Message-State: AFq9FYLItcZ6W8YjiTtprUQaBCZZqg/ed2PW/5OJsz78PWMbOY1Kg4tL
 WsLEA6j6h5QVMwphNgENvLaYI3fLC0W7ZRchDQduzTlNmJoALS0jbIkhY4RooA==
X-Gm-Gg: AYBFou3jIMJSVZiND6SLj9JPeoAOQdoxzFMHZaJ1j4GLYy/ZjyTI11N9PXBYzaP0d+P
 qv5wlSLiALq2MatIofY8mcFv3NRfwSpoIwFx7+UgHvWdwhgxD6cVkPCoAuC+79cAec2e7Pqoc8E
 +sqGY2BdIC/1VNRnr2AOlbVr4UglLVwGNnD1Fa5qq3NBlhHghBZBk1qyx099OwaBvFEyjYW3Vn5
 +Q2oGEp2rW6jniaxxPdpxInB+ypEPAVCbf3TJjqJYdovao1lfp4KuiZHvDQd1wSvSAzIy8CFt+a
 c6v3Di+O5al21DoHpiGh7YBkdAWnOiCLGUmWrRff79rGyqG/nStZJTCZHAl6P1cgy36HNxdE3Kz
 NxoGS/OSKnQN+kOKvu2lYQQuAq7eYZQG3rRT76uz0kWpUzhNJ9XsoMxTVoID5UN/PpTBIfqptHL
 c4eV5X7RWLHhi90KR63KwpJsnbteYH6a1t2+FP4qok32dzGfKJfrxlm/HpVI/eQOxtMj2frVR5p
 jnP6Y2xC+YFs9YOB1S4+xTD3YfEbm0Sy96dUe4z5VycVqE=
X-Received: by 2002:a17:907:3f12:b0:c21:450d:cd7e with SMTP id
 a640c23a62f3a-c31a9af76e8mr1608437766b.9.1791987598394; 
 Wed, 14 Oct 2026 07:19:58 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c31a9a3ae9fsm703301866b.26.2026.10.14.07.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2026 07:19:57 -0700 (PDT)
From: Yegor Yefremov <yegorslists@googlemail.com>
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 14 Oct 2026 16:19:56 +0200
Message-Id: <20261014141957.4171446-1-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/libplist: add host variant
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

shairport-sync 5.6 needs plistutil on the host to build with AirPlay 2
support. libplist builds its tools by default.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5-5
---
 package/libplist/libplist.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libplist/libplist.mk b/package/libplist/libplist.mk
index 2c7edd38ef..f4ffbdbd7b 100644
--- a/package/libplist/libplist.mk
+++ b/package/libplist/libplist.mk
@@ -15,5 +15,7 @@ LIBPLIST_CPE_ID_VENDOR = libimobiledevice
 # Disable building Python bindings, because it requires host-cython, which
 # is not packaged in Buildroot at all.
 LIBPLIST_CONF_OPTS = --without-cython
+HOST_LIBPLIST_CONF_OPTS = --without-cython
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
