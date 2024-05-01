Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD01C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 20:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 113734178A;
	Wed,  1 May 2024 20:47:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nycQshdQkNEc; Wed,  1 May 2024 20:47:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1723441799
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1723441799;
	Wed,  1 May 2024 20:47:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DBD6F1BF400
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 20:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C93F660BF9
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 20:47:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yp4ti8ELfqFL for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 20:47:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F02B960BEC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F02B960BEC
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F02B960BEC
 for <buildroot@buildroot.org>; Wed,  1 May 2024 20:47:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4036CFF803;
 Wed,  1 May 2024 20:47:06 +0000 (UTC)
Date: Wed, 1 May 2024 22:47:05 +0200
To: Jan =?UTF-8?B?xIxlcm3DoWs=?= <sairon@sairon.cz>
Message-ID: <20240501224705.29e35b6f@windsurf>
In-Reply-To: <20240426071304.2564147-1-sairon@sairon.cz>
References: <20240426071304.2564147-1-sairon@sairon.cz>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1714596426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ocE8dAMn+WP/67sB0yZ9ZkWmNshAFX6PVQadsRKG3VY=;
 b=XPtOmaGhghR4lAuTCaePwuw1oGQmKNRkCnHMELZeuoG8v1BTNlR1r9zaH8Q+gU77mn7PBp
 nztaHWQYTOPVm5JqzAHlHo+x5oYgBcPZ0OPP2Lu7NqRIIDb9vuGhMyPEumRwsiv6uSuaVv
 2QB5vRh3/dmY08zdVu6OUskalpIqWDfc4uPH3kD1x0ksx8hdmv8D0e5wOqAoi+dB2FgHyi
 P9sl7B3eUuzCVmWDBbitmo7FW188RO9FYIxCgVyaYdJnJYaV9NEcowNwrrfqaAaEXYj4cJ
 MOhbLCagFXCSvLWimfkcaAJOD4X29Ik40H8/V68gFx6l06Nv6mKMOF/mmL8SsQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XPtOmaGh
Subject: Re: [Buildroot] [PATCH] package/linux-pam: bump to version 1.6.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCAyNiBBcHIgMjAyNCAwOToxMzowMyArMDIwMApKYW4gxIxlcm3DoWsgPHNhaXJvbkBz
YWlyb24uY3o+IHdyb3RlOgoKPiBCdW1wIHRvIGxhdGVzdCB2ZXJzaW9uLCBmaXhpbmcgY291cGxl
IG9mIGJ1Z3MuIFJlbW92ZSBwYXRjaCBhbHJlYWR5Cj4gaW5jbHVkZWQgaW4gdGhpcyByZWxlYXNl
Lgo+IAo+IGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eC1wYW0vbGludXgtcGFtL3JlbGVhc2VzL3Rh
Zy92MS42LjEKPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gxIxlcm3DoWsgPHNhaXJvbkBzYWlyb24u
Y3o+Cj4gLS0tCj4gIC4uLi8wMDAxLXBhbV9uYW1lc3BhY2UtaW5jbHVkZS1zdGRpbnQtaC5wYXRj
aCB8IDQyIC0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgcGFja2FnZS9saW51eC1wYW0vbGludXgtcGFt
Lmhhc2ggICAgICAgICAgICAgIHwgIDQgKy0KPiAgcGFja2FnZS9saW51eC1wYW0vbGludXgtcGFt
Lm1rICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKyksIDQ1IGRlbGV0aW9ucygtKQo+ICBkZWxldGUgbW9kZSAxMDA2NDQgcGFja2FnZS9saW51
eC1wYW0vMDAwMS1wYW1fbmFtZXNwYWNlLWluY2x1ZGUtc3RkaW50LWgucGF0Y2gKCkFwcGxpZWQg
dG8gbWFzdGVyLCB0aGFua3MuCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIENUTywgQm9v
dGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxp
bi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
