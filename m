Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25ABDCA9ECA
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 19:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA98760629;
	Sun, 11 Oct 2026 19:16:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pWeMbU3uKadc; Sun, 11 Oct 2026 19:16:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EC1D560622
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791746169;
	b=l+xdlAbSjQOlX3Bt+iYRyRodeLpxG3z7r648Vo/CyJ51qyAGuhmmZKp0BIi/c14/+EDH
	 GLHRfgo7dglY0uzWSdZiKpIOjDGyI2evZL2jW4kSSZz52KcOykQig81utStmbxv4+dbLa
	 W91Hp3+9lpovZtJ9yqcv32XaxIj5yjTTIi2kXdmK1CFjQNPpwV8TgHd7RzhU2AHAMC0yp
	 OrMQ8jTA8n+rkswADwjB3MXipMQ1hvK/ajOYYWyI4SaTIpk3X6nlfx6qNPE5XGrSh1Fac
	 BbkCeOiGYoEC5JDRUdcoVge1Ybmd6XfeAmZ/zApoI1hWm2lh51z2flajmPzGtkLu8cw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791746169;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=cpX8mm15tNz3Bdt+nl4x6QXFA7dhE5larNU1nPTjEQU=;
	b=Ti3XSMxHwytHzS57aGkpcGKys+wb0bi+JwfqvrPmIwKbs0FqGY/uR7BNBJjQehTZZE6Y
	 GH6W+SdrNRqm+y0Nm77QDuPT1wWNxTRzixhLQCzwvgXyi4mpzByjIMQg+EQstrPz90SnF
	 GjdhOs1DpLhWhZfnQJF8s1hkDoX+rnsGbS9ipxxfppeElWDxnGYC57LeUplkTT1IG3rU3
	 yRnD12rapLX1TAg8VcoWoAxPI26b3b7nrFdofkLLlltApHUhdepmpOyWq7MUDvNXJoMsB
	 WJT0wnwM/liA8DRo+8Ga2S2sLnKoqAEgF+oVJGKsVTcnY1qFEJre7Qv7/+T67S0cqfg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791746169;
	bh=cpX8mm15tNz3Bdt+nl4x6QXFA7dhE5larNU1nPTjEQU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PrfZQ7EJrik3b8qW4QvigXu1507uDt1/MeJGS66ffftyNCljyCSc37DktPi7ChQLd
	 E/xpB3aRUXDQQT98STk6QdAmheCODRAHFe9Vt4nmfIHNoYEWoY4k4hXB3jxZJoFF6d
	 E7qNX3Lk4Q0UJKZVFfUnqDIE9UwZyLPv3eoLsCtTiJfc0jYM1fQidSPZBjulFaaJH2
	 3gjbuWhQlNHZX2CNopqdDcdsnX1DtvAdodIvbCBFOcRA8kbfFyzVm5SSVRxEmn9nmS
	 jCECVMiQX+QMVnHZnE/YIOifXJv/Wi0BUgkivonM4CzU86xT7tL/nhY4yVZheEJ4jH
	 8SYLnmKe55chw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC1D560622;
	Sun, 11 Oct 2026 19:16:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5040475
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 19:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4DE1980C93
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 19:16:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xE8lekzPIE58 for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 19:16:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5CC2B80C4D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791746166;
 b=df/MRs0n70VK20+8BYO4XI70cyGDdtTdmJUVYKJKZOfQOEI4KbE9UAG5q3vnzv9HeHFD
 Ay0XB6xnHGtiIGQHsVJOv+2+wd5YnWa4QgWDkqMS169LbouqHK7VWnrxOweAgu9SZSoUM
 uaCq6050ComsLWAZ8c5T4RUMY/6kTN6ZziXcIx8XmeeE+DYzObPO95NA/EUdqiLdDz1Y4
 8ulbmfCkck7/rgqmieoQMpzo6lkMtCz5GwMnkkoHhabo8Bbj75d/l4A6OEmsyU8a3vkjL
 C9diOLlVLvyScqMQS6hjSynKLNMp/tpiGGYkVNK0dQDKv06Y1jQfQrws56RJOVMVhjw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791746166;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=vG/Cr3pA42KTqZCYmAbt58QE5RvpNC4ddczpvkLFXNA=;
 b=bVTcMB4QeQ3AgNN24/kYF2Di3MG4X2+c7WRv8Y9M+nA6cuJ+LQFPtxo3diU3UJDhHoK4
 f7b8NUJyazVSdagKQLj895si0jyPaJgpytDhXlTRAGavSJHwpqDStk5c2tXArzmmnxuFo
 w/OtXroVaHtuI45/AzFFUKxFqKgjYLbgZjqdH5dF5jJ2bREJDCbHPCWeYWDzY6Ptms05h
 0lBlkfjBJDWBU5L1Qw3DiwAOYHNkrC/L/hdMzY9i1c7lcAmpPTiqjHgBdAZrh6EGD8+LR
 KoovtvzHyNaG3pR2ScOz1StJg31HVZSzSrmP6+pv6bGRYvcRALMwm6CHV60gd7Rj9vw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=JADkjVFk; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5CC2B80C4D
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 19:16:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BE3BDB979F97; Sun, 11 Oct 2026 21:16:01 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Arnout Vandecappelle <arnout@rnout.be>,
 =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 =?UTF-8?q?Jos=C3=A9=20Mendes?= <jp.baltazar.mendes@gmail.com>,
 "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Sun, 11 Oct 2026 21:15:47 +0200
Message-ID: <179174589253.232021.12353315620763224152.b4-ty@b4>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20250207171458.1127620-2-fiona.klute@gmx.de>
References: <20250207171458.1127620-2-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v3 1/3] board/raspberrypi: Support boot.scr
 for U-Boot
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCAwNyBGZWIgMjAyNSAxODoxNDo1NiArMDEwMCwgRmlvbmEgS2x1dGUgdmlhIGJ1aWxk
cm9vdCB3cm90ZToKPiBGcm9tOiAiRmlvbmEgS2x1dGUgKFdJV0EpIiA8ZmlvbmEua2x1dGVAZ214
LmRlPgo+Cj4gSWYgdXNpbmcgVS1Cb290IGFzICJrZXJuZWwiIGZvciB0aGUgcmFzcGJlcnJ5cGkg
Ym9vdGxvYWRlciwgaW5jbHVkZQo+IGJvb3Quc2NyIGluIHRoZSBib290IHBhcnRpdGlvbiBpZiBp
dCBleGlzdHMuCj4KPiBUbyB1c2UgdGhpcywgdXNlIEJSMl9QQUNLQUdFX1JQSV9GSVJNV0FSRV9D
T05GSUdfRklMRSB0byBzZXQgYSBjb25maWcKPiBmaWxlIHRoYXQgdXNlcyBVLUJvb3QsIGFuZCBl
bmFibGUgYnVpbGRpbmcgYSBib290IHNjcmlwdCBpbiB0aGUgVS1Cb290Cj4gaG9zdCB0b29sIHNl
dHRpbmdzLgo+Cj4gU2lnbmVkLW9mZi1ieTogRmlvbmEgS2x1dGUgKFdJV0EpIDxmaW9uYS5rbHV0
ZUBnbXguZGU+Cj4gUmV2aWV3ZWQtYnk6IFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBm
cmVlLmZyPgo+IFRlc3RlZC1ieTogR2HDq2wgUE9SVEFZIDxnYWVsLnBvcnRheStydG9uZUBnbWFp
bC5jb20+CgogQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcyEKCiBSZWdhcmRzLAogQXJub3V0Cgo+
IC0tLQo+ICBib2FyZC9yYXNwYmVycnlwaS9wb3N0LWltYWdlLnNoIHwgNiArKysrKysKPiAgMSBm
aWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2JvYXJkL3Jhc3Bi
ZXJyeXBpL3Bvc3QtaW1hZ2Uuc2ggYi9ib2FyZC9yYXNwYmVycnlwaS9wb3N0LWltYWdlLnNoCj4g
aW5kZXggOWI5ZWFjOTcyYi4uZTQ2MTFkMDVkZCAxMDA3NTUKPiAtLS0gYS9ib2FyZC9yYXNwYmVy
cnlwaS9wb3N0LWltYWdlLnNoCj4gKysrIGIvYm9hcmQvcmFzcGJlcnJ5cGkvcG9zdC1pbWFnZS5z
aAo+IEBAIC0xOSw2ICsxOSwxMiBAQCBpZiBbICEgLWUgIiR7R0VOSU1BR0VfQ0ZHfSIgXTsgdGhl
bgo+ICAJS0VSTkVMPSQoc2VkIC1uICdzL15rZXJuZWw9Ly9wJyAiJHtCSU5BUklFU19ESVJ9L3Jw
aS1maXJtd2FyZS9jb25maWcudHh0IikKPiAgCUZJTEVTKz0oICIke0tFUk5FTH0iICkKPiAgCj4g
KwkjIElmIGNvbmZpZy50eHQgY2FsbHMgZm9yIHJ1bm5pbmcgVS1Cb290LCBpbmNsdWRlIHRoZSBi
b290Cj4gKwkjIHNjcmlwdCBpZiBhbnkuCj4gKwlpZiBbICIke0tFUk5FTH0iID0gInUtYm9vdC5i
aW4iIF0gJiYgWyAtZSAiJHtCSU5BUklFU19ESVJ9L2Jvb3Quc2NyIiBdOyB0aGVuCj4gKwkJRklM
RVMrPSggImJvb3Quc2NyIiApCj4gKwlmaQo+ICsKPiAgCUJPT1RfRklMRVM9JChwcmludGYgJ1xc
dFxcdFxcdCIlcyIsXFxuJyAiJHtGSUxFU1tAXX0iKQo+ICAJc2VkICJzfCNCT09UX0ZJTEVTI3wk
e0JPT1RfRklMRVN9fCIgIiR7Qk9BUkRfRElSfS9nZW5pbWFnZS5jZmcuaW4iIFwKPiAgCQk+ICIk
e0dFTklNQUdFX0NGR30iCj4gLS0gCj4gMi40Ny4yCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
