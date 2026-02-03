Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA6EE87846
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 16:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B0F840AB3;
	Tue,  3 Feb 2026 16:13:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OjEG_uWu2Xzt; Tue,  3 Feb 2026 16:13:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1C83409A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770135182;
	bh=5Im6urg1Pj/cNilQPClN176RLPsNsPur6lm0DWWF9VA=;
	h=From:Date:References:In-Reply-To:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=bp9fzF859vpRbLvVzIwT9URRozf+4mQLN/7fUWAGKL9OXitX2DTuAVV7U+jT5Ripq
	 75aCMGiTJOvSmCCM5TBQIywSXTFttHg+aIySQRmQ6ZsUA5+CnOMYGAdqRmH2tnuauA
	 VXaKhjvi9PFb7TwHwPnhgdQpznlFayJU12OVeu/tpljDw0QZPv+ZkEYGvCLdCah9JE
	 2L6brWNwhrFWdO1WyBNMLCx3bSgL6LcfdGcJmQlM/a32Bw3KihitL5sFKXbxlHIooI
	 YwH2DSuDh7M2CoLy2lj7qo4m9SoHNP3gcLfRROAVweS4puKKZniR/e/g4qPPv67djH
	 h/paIRKvmoHWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1C83409A6;
	Tue,  3 Feb 2026 16:13:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A35B1F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 16:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 84A2A6087F
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 16:13:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oj8HIrLE1sZu for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 16:13:00 +0000 (UTC)
X-Greylist: delayed 4474 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 03 Feb 2026 16:13:00 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8225F60870
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8225F60870
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.72.36;
 helo=2.mo584.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 2.mo584.mail-out.ovh.net (2.mo584.mail-out.ovh.net
 [46.105.72.36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8225F60870
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 16:13:00 +0000 (UTC)
Received: from director5.ghost.mail-out.ovh.net (unknown [10.110.37.160])
 by mo584.mail-out.ovh.net (Postfix) with ESMTP id 4f55h45Yyyz89CL
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:38:28 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-5twcp (unknown [10.110.101.93])
 by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 7B7B3100178;
 Tue,  3 Feb 2026 14:38:28 +0000 (UTC)
Received: from armadeus.com ([37.59.142.98])
 by ghost-submission-7d8d68f679-5twcp with ESMTPSA
 id DBaCFGAIgmkRehQA2wKZ7w:T10
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Tue, 03 Feb 2026 14:38:28 +0000
X-OVh-ClientIp: 90.126.104.208
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Tue, 03 Feb 2026 15:38:20 +0100
MIME-Version: 1.0
Message-Id: <20260203-bump-imx-packages-lf-6-12-49-2-2-0-v1-9-548f3fc77a59@armadeus.com>
References: <20260203-bump-imx-packages-lf-6-12-49-2-2-0-v1-0-548f3fc77a59@armadeus.com>
In-Reply-To: <20260203-bump-imx-packages-lf-6-12-49-2-2-0-v1-0-548f3fc77a59@armadeus.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.3
X-Ovh-Tracer-Id: 604608250783066997
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTFiGJ4mxrtvv1FGSAzK8Pub1I1sNZWsVFWL0zzmeZLJUb1a0n38QOXILyOCdOyjJB0fBdh+/q5//JvdDg3sIFD4jVQZZycKH2PItmbAfd4QWvaR5KHjfrV9QHqsmBx728ThymzGvpm1hOgraYxOsTrlPoAeKmjuofLDLUZNv49tVN+z3lJboluuQNLKp67hxB+QLmYkmPbfZlsA0gXotfIoIJdhId/opeiQ6E565Z7/658eb4ykusFlOYDoDtuWDX47IoK7g7Pl0+wVJhmZ5uGBznuJNenyDFJhY1nQHuZAflad5dSskz0UM5TDf+z4sAWB67d7T3TkcGqyrlpI/dNCELvw8FJLGsODeYZj3y7oiTV40WNP4rtTcIr/aLx86zjojvcdnY4P9E7jlnuMVlX3mA2cKQ/BF7xA26qUBvSDI8mnEqyCe2pkIXg6gDKYng5WHLrx7QxXkUUU0Pili8kSwNoO/tawtkGMYqQZ9JfPsejPyAzCs26WkViJuLkPCOpW7/Wl91PUL4IUAzrnkP4Ptee0JBG3LgFWbE20j+QCx4/cFQLOTNrO1dVSM5Q/1cA0Cvw+jDLwXpFc2FFX72uB0CaowPKmQtxqsBF8SJbcXjJ/zhqwODtvhE1KkTOisXHoxfu+/d3ABtAwVC2BZd5tLCuR7lsbYq7AKk9tetlWPw
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=qKE4IG9iJXDcl3Pp7wX1/lDlMlH3PTnaC2/TOj3dW0I=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1770129508; v=1;
 b=QPgedYm5NHk97gOcwC4GHgUeffjcxp4qXy8/BN93ziITUgkk+zaV9VkrB1Go+zoRwh6uWRni
 K/pUwZtc8WZP7SLCISdQNuJhYlhEvu4xH1z4nhpDZ00pWwGooIouelHutH6Cqp6IbsmS7ALU2ID
 hojKOrYBPdt/DCBY+rndYt6MuvTDwhqdPVyiiBvN2jHCTuVzi7VEru1IIGlr5sICMcoDkO6ozk5
 sY5YA4ntkHH9VH3cOihlOmdzNMyIYrEHSFJu/u8Sx0w5Yq5g/FXZC9oADkyVSG4f/IzWGTlA8SK
 PAokE8faYUsd01FXvKPyRC3+3Ij2roSz2fFhx+VSPT+0A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=QPgedYm5
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002560c4f4a-542d-4348-8df3-301a7208add8,
 004BD5E907DC429EAD4B1A0856BA767B03FD8B65)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 9/9] package/imx-mkimage: bump to version
 lf-6.12.49-2.2.0
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Erik Larsson <karl.erik.larsson@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyB2ZXJzaW9uIGlzIGFsaWduZWQgd2l0aCBOWFAgTGludXggQlNQIHZlcnNpb24gIkxGNi4x
Mi40OV8yLjIuMCIuCgpGb3IgY2hhbmdlIGxvZywgc2VlOgpodHRwczovL2dpdGh1Yi5jb20vbnhw
LWlteC9pbXgtbWtpbWFnZS9jb21wYXJlL2xmLTYuNi4yMy0yLjAuMC4uLmxmLTYuMTIuNDktMi4y
LjAKClNpZ25lZC1vZmYtYnk6IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFu
c2tpQGFybWFkZXVzLmNvbT4KLS0tCiBwYWNrYWdlL2lteC1ta2ltYWdlL2lteC1ta2ltYWdlLmhh
c2ggfCAyICstCiBwYWNrYWdlL2lteC1ta2ltYWdlL2lteC1ta2ltYWdlLm1rICAgfCAyICstCiAy
IGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9wYWNrYWdlL2lteC1ta2ltYWdlL2lteC1ta2ltYWdlLmhhc2ggYi9wYWNrYWdlL2lteC1t
a2ltYWdlL2lteC1ta2ltYWdlLmhhc2gKaW5kZXggMDIyMDVkZWYxZWJjLi40ODI4YzI1ZWFmNTIg
MTAwNjQ0Ci0tLSBhL3BhY2thZ2UvaW14LW1raW1hZ2UvaW14LW1raW1hZ2UuaGFzaAorKysgYi9w
YWNrYWdlL2lteC1ta2ltYWdlL2lteC1ta2ltYWdlLmhhc2gKQEAgLTEsMyArMSwzIEBACiAjIExv
Y2FsbHkgY2FsY3VsYXRlZAotc2hhMjU2ICAwYTU2NTQyMjljMDYzZTRlODdiNWQ2OWY0N2E0YTkx
M2VjZWU1MWY4YTgxN2FlMjM0NmEyYTQwN2U3NjVlZDNiICBpbXgtbWtpbWFnZS1sZi02LjYuMjMt
Mi4wLjAudGFyLmd6CitzaGEyNTYgIDJiMGFjNTYxNzk4YjEyNjk1OTE2N2VmZDc2N2E3YmVkN2Uy
Y2NhMzk2NjVhMzIwMWIzNDBiNzdjOTFkZDVjNmQgIGlteC1ta2ltYWdlLWxmLTYuMTIuNDktMi4y
LjAudGFyLmd6CiBzaGEyNTYgIDIzMWY3ZWRjYzczNTJkNzczNGE5NmVlZjBiODAzMGY3Nzk4MjY3
OGM1MTY4NzZmY2I4MWUyNWIzMmQ2ODU2NGMgIExJQ0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
aW14LW1raW1hZ2UvaW14LW1raW1hZ2UubWsgYi9wYWNrYWdlL2lteC1ta2ltYWdlL2lteC1ta2lt
YWdlLm1rCmluZGV4IGY3Mzk2YmExYjIzNC4uYWM2NGIzNmVhNzkwIDEwMDY0NAotLS0gYS9wYWNr
YWdlL2lteC1ta2ltYWdlL2lteC1ta2ltYWdlLm1rCisrKyBiL3BhY2thZ2UvaW14LW1raW1hZ2Uv
aW14LW1raW1hZ2UubWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IwogCi1JTVhfTUtJTUFHRV9WRVJTSU9OID0gbGYtNi42LjIzLTIuMC4wCitJTVhfTUtJTUFHRV9W
RVJTSU9OID0gbGYtNi4xMi40OS0yLjIuMAogSU1YX01LSU1BR0VfU0lURSA9ICQoY2FsbCBnaXRo
dWIsbnhwLWlteCxpbXgtbWtpbWFnZSwkKElNWF9NS0lNQUdFX1ZFUlNJT04pKQogSU1YX01LSU1B
R0VfTElDRU5TRSA9IEdQTC0yLjArCiBJTVhfTUtJTUFHRV9MSUNFTlNFX0ZJTEVTID0gTElDRU5T
RQoKLS0gCjIuNTIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
