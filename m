Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7782EB64DA
	for <buildroot@archiver.kernel.org>; Fri,  7 Jul 2023 15:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AF3C822A0;
	Fri,  7 Jul 2023 15:01:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AF3C822A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bQQZVP817D6w; Fri,  7 Jul 2023 15:01:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8300382B08;
	Fri,  7 Jul 2023 15:01:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8300382B08
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 320EB1BF3C3
 for <buildroot@lists.busybox.net>; Fri,  7 Jul 2023 15:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D8236126D
 for <buildroot@lists.busybox.net>; Fri,  7 Jul 2023 15:01:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D8236126D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bS7uia9jnkOD for <buildroot@lists.busybox.net>;
 Fri,  7 Jul 2023 15:01:53 +0000 (UTC)
X-Greylist: delayed 00:09:02 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21C9E61259
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.163])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 21C9E61259
 for <buildroot@buildroot.org>; Fri,  7 Jul 2023 15:01:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1688741384; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=opVA3Ykecujwpw6uDCrvm50n0SiYkjeJE0WQqekwcYKAORzVctjBO/M0AbqNkSn/VJ
 t3cKwCFR/i3yzFYyu9zdv6jWz4z1quVTsr3QnKud8Qp20aiNTY1ORYOtXvxX++NV5q3R
 i9SapMDkrCGjxswf54zvbFQffL8XKTzc8LhbPG1Y+h2euTWltwqUBFaJqWpTr1bvKF0M
 CIS7W2OLvpitjj3+3ljcRLj4BRq7OPdTel4nCRbktIiLB+iC/Eo4Pm0zE09qqQxXKCfF
 dLgrtH1zVV5rT6FgN1pY/dCRhYRQN+9DCD1Z+NfgQk/uRO/Th/Vy4dLHxBY+JoyUJ9Lh
 uWhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1688741384;
 s=strato-dkim-0002; d=strato.com;
 h=Message-Id:Date:Subject:To:From:Cc:Date:From:Subject:Sender;
 bh=AnV737UXickctzUrCh1Y3dLFENHvuf7Lt03YGSCJSAg=;
 b=fonrnN1BZb+we4YNtLlduzsXDgvesraUD2tRnH3apYS02CZ5fXBkmwb6V0eXKpTMS1
 5hDbQ/Zt8JctAXEVABfdRFy5w5ag2KgOh21sz4fPeYPkLD2SfCN0oIbBVeG08SKG4VCO
 JYDPW9olBn/7ESDqEsnQss+Um9Y+Ngo8LZbOGhIaJPLFgkfRr43e1jjCc2P1XK6+A2Vm
 9biOOqm1tlLu4fWAf7WbqD/3m5WJFvNcvfq6WM4p094nYf0MsO3uJ0/QUYmACQdGCzJ6
 wloufQnnwAXnyrlLpcon5m5Y7pRDZpK/eq/wtFWo6ZlojIWDXA8P2dazcl/HhpwqeaO0
 HdRA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
X-RZG-AUTH: ":ImkWY2CseuihIZy6ZWWciR6unPhpN+aXzZGGjY6ptdusOK7nWzzuvt/yikxl/iaU"
Received: from tesla.fritz.box by smtp.strato.de (RZmta 49.6.0 DYNA|AUTH)
 with ESMTPSA id 028995z67Enibf7
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate) for <buildroot@buildroot.org>;
 Fri, 7 Jul 2023 16:49:44 +0200 (CEST)
From: =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>
To: buildroot@buildroot.org
Date: Fri,  7 Jul 2023 16:49:39 +0200
Message-Id: <20230707144939.1543141-1-nerv@dawncrow.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1688741384; 
 s=strato-dkim-0002; d=dawncrow.de;
 h=Message-Id:Date:Subject:To:From:Cc:Date:From:Subject:Sender;
 bh=AnV737UXickctzUrCh1Y3dLFENHvuf7Lt03YGSCJSAg=;
 b=pVqr/cGQvBIRpP6AM0tuy33Rd8qsdPW/KJDs+dKsxl628desEDdSNPH8gumCzzjd4Q
 og3dCa4HC8zhEQKAklacHXURbT5yET7Pfyoz9XoKnK4wH8vjQyHyHFQGYTvALYJdyOYM
 pmOjoZlWdtPOF3VG9v0Km1+FMg3djgWx1+Lt/Pt7NskQD+bM5jJptZke34qMXQfukV1R
 CTBg+AdUIy2U3yhNAn9Oq/TccN65t66rO5121nDxnMJlLB79bavzHvvvEgzpUfAaMI8R
 C08qOjsRgPFqS5cMghIndXEdDGAhpCdl+2JgZS3GNcy8WcYED4hiBtrLSdG9nfwMnnF4
 KmsQ==
X-Mailman-Original-DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 t=1688741384; 
 s=strato-dkim-0003; d=dawncrow.de;
 h=Message-Id:Date:Subject:To:From:Cc:Date:From:Subject:Sender;
 bh=AnV737UXickctzUrCh1Y3dLFENHvuf7Lt03YGSCJSAg=;
 b=RVTqGvME87UrBiXar7VkRJDpIlWPR04ufeqK/dZwUxJWs4hm7wn2AjBs5Y3OEpAe/b
 3QxloT5Btv1rd/CvZlAg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=dawncrow.de header.i=@dawncrow.de
 header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=pVqr/cGQ; 
 dkim=pass header.d=dawncrow.de header.i=@dawncrow.de header.a=ed25519-sha256
 header.s=strato-dkim-0003 header.b=RVTqGvME
Subject: [Buildroot] [PATCH] package/wine: bump to version 8.0.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogQW5kcsOpIFp3aW5nIDxuZXJ2QGRhd25jcm93LmRlPgotLS0KIHBhY2th
Z2Uvd2luZS93aW5lLmhhc2ggfCAyICstCiBwYWNrYWdlL3dpbmUvd2luZS5tayAgIHwgMiArLQog
MiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvcGFja2FnZS93aW5lL3dpbmUuaGFzaCBiL3BhY2thZ2Uvd2luZS93aW5lLmhhc2gKaW5k
ZXggYjg3OTY0ZGExMi4uNTgyNjFkM2IxOCAxMDA2NDQKLS0tIGEvcGFja2FnZS93aW5lL3dpbmUu
aGFzaAorKysgYi9wYWNrYWdlL3dpbmUvd2luZS5oYXNoCkBAIC0xLDUgKzEsNSBAQAogIyBMb2Nh
bGx5IGNhbGN1bGF0ZWQgYWZ0ZXIgY2hlY2tpbmcgcGdwIHNpZ25hdHVyZQotc2hhMjU2ICAwMjcy
YzIwOTM4Zjg3MjFhZTQ1MTBhZmFhOGIzNjAzNzQ1N2RkNTc2NjFlNGQ2NjQyMzEwNzliOWU5MWM3
OTJlICB3aW5lLTguMC50YXIueHoKK3NoYTI1NiAgMjIwMzVmMzgzNmI0ZjljM2IxOTQwYWQ5MGY5
YjllM2MxYmUwOTIzNDIzNmQyYTgwZDg5MzE4MDUzNWM3NWI3ZCAgd2luZS04LjAuMS50YXIueHoK
ICMgTG9jYWxseSBjYWxjdWxhdGVkCiBzaGEyNTYgIGUyMzdmYTU2NjY4MDMwZTkyODU1MWRkZDYw
ZjA1ZGY1ZmU5NTdmNzVlYWI4NzRiYmQwMTdlMDg1ZWQ3MjJlN2MgIENPUFlJTkcuTElCCiBzaGEy
NTYgIDc5M2QwNDU1NDY0NjdjOGY0OWUzNWZiZDZlMDI4NTllNTdlNzhmOGJiNTM1NzFlODIwMGJm
ZmQwZTk2NmRmYTggIExJQ0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvd2luZS93aW5lLm1rIGIv
cGFja2FnZS93aW5lL3dpbmUubWsKaW5kZXggYTYyOWJmMGRkNi4uY2NhZWFkZmY1ZSAxMDA2NDQK
LS0tIGEvcGFja2FnZS93aW5lL3dpbmUubWsKKysrIGIvcGFja2FnZS93aW5lL3dpbmUubWsKQEAg
LTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1XSU5FX1ZFUlNJT04g
PSA4LjAKK1dJTkVfVkVSU0lPTiA9IDguMC4xCiBXSU5FX1NPVVJDRSA9IHdpbmUtJChXSU5FX1ZF
UlNJT04pLnRhci54egogV0lORV9TSVRFID0gaHR0cHM6Ly9kbC53aW5laHEub3JnL3dpbmUvc291
cmNlLzguMAogV0lORV9MSUNFTlNFID0gTEdQTC0yLjErCi0tIAoyLjM0LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
