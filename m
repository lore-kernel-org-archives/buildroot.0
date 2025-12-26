Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4913E8FDA7
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 16:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD20580CB5;
	Fri, 26 Dec 2025 16:46:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NdiFwbnQDfzn; Fri, 26 Dec 2025 16:46:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D31A680C6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766767601;
	bh=9ftyC6o+PZ0v13UWKDqcCZJzzIPj1RHr5mkwZlo/AFU=;
	h=Date:To:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=Q42tjNWmPwRN8uw5D1ReIOWU+3PXoQ0NmmOej1z8ln5ip95WlMnBtFuvb6BSO72yy
	 3moPSWgUwVi6SNU9RhQvsMX5QmT+BzWpgTSgO7FxqvnBQpfzJHww5Bre8DavhhP0+z
	 APVzTtDdX9Z3Tpkk6uMjzdiEOBN96a23+ThOFUewogClLY1DTOYAc1Jzjnex7Lj8yl
	 eK2LaNL9WpBOiZOTbB7edwNKytnFEJQFqg3JUPWmFTL5GFwaVfX1gO7KuZBgOzOpfU
	 YkTLgIOnQp1kmEg288w4DM+bnXcxX4c0Opo6LhQLGjOHRp8StfTeHwi36DNss0S/1s
	 LAK/0oe0A5EWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D31A680C6A;
	Fri, 26 Dec 2025 16:46:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 93B52EC
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 16:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8527D80C6A
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 16:46:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IqWMRCoiW5Tx for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 16:46:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D730180C5F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D730180C5F
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D730180C5F
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 16:46:37 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 8DD64C1D186
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 16:46:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CFCBC606E4;
 Fri, 26 Dec 2025 16:46:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 63609103C8D10; Fri, 26 Dec 2025 17:46:32 +0100 (CET)
Date: Fri, 26 Dec 2025 17:46:31 +0100
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Message-ID: <20251226174631.16e970ee@windsurf>
In-Reply-To: <20251103115220.2911208-2-buildroot@heine.tech>
References: <20251103115220.2911208-2-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766767595; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ae0ytFoD44Fp5gkVC28EtSn7A8q1ejMeuJTD0JcT2a0=;
 b=nXz5DJ1FUQ/4EYvHwWkCQZKW2DJmEYSBfiYrlWNsODAh30BN1bXGFQgy+5RJPXX6yHGjBZ
 TkTC794/qxnTJ52ATfn19a7NlsocajwGPobaYi0LKxLySZNcR2LX85z/f+43jKxawXVNEV
 u2BQWPSPk15Mamb3FzTRZgqkSZyzu7KBZxoEivFWuPZ6WogaAwYaMWwENS/fGyBRYri9wY
 bkYEMIFClPyfmsOWqQ/Q6pVzXyOBuOw349fnrwhClwmMvyihiuutIiD3B+o5PiXFK4Hqfo
 tYv4qjeccHODXjz1JNcqtTBuEE1zxYJn/OGcjVul2u//bW5X1ixGKeybCWfOFg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=nXz5DJ1F
Subject: Re: [Buildroot] [PATCH 1/2] package/gerbera: bump to version 2.6.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gTWljaGFlbCwKCk9uIE1vbiwgIDMgTm92IDIwMjUgMTI6NTI6MDcgKzAxMDAKTWljaGFl
bCBOb3N0aG9mZiB2aWEgYnVpbGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6
Cgo+IC0gbmV3IGRlcGVuZGVuY2llcyBvbiBpY3UgYW5kIGpzb25jcHAKPiAtIGZpeGVzIG1vc3Qg
ZGVwcmVjYXRpb25zIG9mIGZtdCA+PSAxMgo+IAo+IC0gYWRkIHVwc3RyZWFtIHBhdGNoIHdoaWNo
IGZpeGVzIGFub3RoZXIgZGVwcmVjYXRpb24gb2YgZm10ID49MTIKClRoYW5rcyBmb3IgdGhpcyBw
YXRjaC4gSG93ZXZlciwgSSBiZWxpZXZlIGl0IGJyZWFrcyB0aGUgYnVpbGQgZm9yIHRoZQpmb2xs
b3dpbmcgY29uZmlndXJhdGlvbjoKCkJSMl9hYXJjaDY0PXkKQlIyX1RPT0xDSEFJTl9FWFRFUk5B
TD15CkJSMl9UT09MQ0hBSU5fRVhURVJOQUxfQk9PVExJTj15CkJSMl9UT09MQ0hBSU5fRVhURVJO
QUxfQk9PVExJTl9BQVJDSDY0X0dMSUJDX1NUQUJMRT15CkJSMl9JTklUX05PTkU9eQpCUjJfU1lT
VEVNX0JJTl9TSF9OT05FPXkKIyBCUjJfUEFDS0FHRV9CVVNZQk9YIGlzIG5vdCBzZXQKQlIyX1BB
Q0tBR0VfTElCTlBVUE5QPXkKQlIyX1BBQ0tBR0VfR0VSQkVSQT15CiMgQlIyX1RBUkdFVF9ST09U
RlNfVEFSIGlzIG5vdCBzZXQKCk5vdGU6IHRoaXMgY29uZmlndXJhdGlvbiB1c2VzIEJSMl9QQUNL
QUdFX0xJQk5QVVBOUCBpbnN0ZWFkIG9mIHRoZQpkZWZhdWx0IEJSMl9QQUNLQUdFX0xJQlVQTlAg
c2VsZWN0ZWQgYnkgZ2VyYmVyYS4KClRoZSBidWlsZCBmYWlsdXJlIGdvZXMgbGlrZSB0aGlzOgoK
SW4gZmlsZSBpbmNsdWRlZCBmcm9tIC9ob21lL3Rob21hcy9wcm9qZXRzL2JyL2FsbC1maXhlcy9v
dXRwdXQvYnVpbGQvZ2VyYmVyYS0yLjYuMS9zcmMvdXBucC9jb250X2Rpcl9zZXJ2aWNlLmNjOjUx
OgovaG9tZS90aG9tYXMvcHJvamV0cy9ici9hbGwtZml4ZXMvb3V0cHV0L2J1aWxkL2dlcmJlcmEt
Mi42LjEvc3JjL3VwbnAvY29udF9kaXJfc2VydmljZS5jYzogSW4gbWVtYmVyIGZ1bmN0aW9uIOKA
mHZpcnR1YWwgYm9vbCBDb250ZW50RGlyZWN0b3J5U2VydmljZTo6cHJvY2Vzc1N1YnNjcmlwdGlv
blJlcXVlc3QoY29uc3QgU3Vic2NyaXB0aW9uUmVxdWVzdCYp4oCZOgovaG9tZS90aG9tYXMvcHJv
amV0cy9ici9hbGwtZml4ZXMvb3V0cHV0L2J1aWxkL2dlcmJlcmEtMi42LjEvc3JjL3VwbnAvY29u
dF9kaXJfc2VydmljZS5jYzo0NTE6NTc6IGVycm9yOiBjYW5ub3QgY29udmVydCDigJhjb25zdCBz
dGQ6OnN0cmluZ+KAmSB7YWthIOKAmGNvbnN0IHN0ZDo6X19jeHgxMTo6YmFzaWNfc3RyaW5nPGNo
YXI+4oCZfSB0byDigJhjb25zdCBjaGFyKuKAmQogIDQ1MSB8ICAgICAgICAgICAgICAgIHNlcnZp
Y2VJRCwgeG1sLCByZXF1ZXN0LmdldFN1YnNjcmlwdGlvbklEKCkpOwogICAgICB8ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Xn4KICAgICAg
fCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwKICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGNvbnN0IHN0ZDo6c3RyaW5nIHtha2EgY29uc3Qgc3RkOjpfX2N4eDExOjpiYXNp
Y19zdHJpbmc8Y2hhcj59Ci9ob21lL3Rob21hcy9wcm9qZXRzL2JyL2FsbC1maXhlcy9vdXRwdXQv
YnVpbGQvZ2VyYmVyYS0yLjYuMS9zcmMvdXBucC9jb21wYXQuaDo4MzoxNDc6IG5vdGU6IGluIGRl
ZmluaXRpb24gb2YgbWFjcm8g4oCYR3JiVXBucEFjY2VwdFN1YnNjcmlwdGlvbuKAmQogICA4MyB8
ICNkZWZpbmUgR3JiVXBucEFjY2VwdFN1YnNjcmlwdGlvbihoYW5kbGUsIHVkbiwgc2VydmljZUlk
LCB4bWwsIHN1YnNJZCkgVXBucEFjY2VwdFN1YnNjcmlwdGlvblhNTChoYW5kbGUsICh1ZG4pLmNf
c3RyKCksIChzZXJ2aWNlSWQpLmNfc3RyKCksIHhtbCwgc3Vic0lkKQogICAgICB8ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+CkluIGZpbGUgaW5jbHVkZWQgZnJvbSAvaG9t
ZS90aG9tYXMvcHJvamV0cy9ici9hbGwtZml4ZXMvb3V0cHV0L2J1aWxkL2dlcmJlcmEtMi42LjEv
c3JjL3VwbnAvdXBucF9zZXJ2aWNlLmg6MzQsCiAgICAgICAgICAgICAgICAgZnJvbSAvaG9tZS90
aG9tYXMvcHJvamV0cy9ici9hbGwtZml4ZXMvb3V0cHV0L2J1aWxkL2dlcmJlcmEtMi42LjEvc3Jj
L3VwbnAvY29udF9kaXJfc2VydmljZS5oOjM3LAogICAgICAgICAgICAgICAgIGZyb20gL2hvbWUv
dGhvbWFzL3Byb2pldHMvYnIvYWxsLWZpeGVzL291dHB1dC9idWlsZC9nZXJiZXJhLTIuNi4xL3Ny
Yy91cG5wL2NvbnRfZGlyX3NlcnZpY2UuY2M6MzU6Ci9ob21lL3Rob21hcy9wcm9qZXRzL2JyL2Fs
bC1maXhlcy9vdXRwdXQvaG9zdC9hYXJjaDY0LWJ1aWxkcm9vdC1saW51eC1nbnUvc3lzcm9vdC91
c3IvaW5jbHVkZS9ucHVwbnAvdXBucC5oOjE1MTQ6MjA6IG5vdGU6ICAgaW5pdGlhbGl6aW5nIGFy
Z3VtZW50IDUgb2Yg4oCYaW50IFVwbnBBY2NlcHRTdWJzY3JpcHRpb25YTUwoVXBucERldmljZV9I
YW5kbGUsIGNvbnN0IGNoYXIqLCBjb25zdCBjaGFyKiwgY29uc3Qgc3RkOjpzdHJpbmcmLCBjb25z
dCBjaGFyKinigJkKIDE1MTQgfCAgICAgY29uc3QgVXBucF9TSUQgU3Vic0lkKTsKICAgICAgfCAg
ICAgfn5+fn5+fn5+fn5+fn5+Xn5+fn5+CgpJIGFtIG5vdCAxMDAlIHN1cmUgdGhhdCB0aGlzIHJl
Z3Jlc3Npb24gaXMgY2F1c2VkIGJ5IHRoaXMgYnVtcDogSSB0cmllZAp0byByZXZlcnQgdGhlIGJ1
bXAsIGJ1dCB0aGVuIHRoZSBidWlsZCBmYWlscyBiZWNhdXNlIGZtdDo6bG9jYWx0aW1lKCkKbm8g
bG9uZ2VyIGV4aXN0cyAodGhpcyBpc3N1ZSB3YXMgZml4ZWQgaW4gZ2VyYmVyYSAyLjYuMSkuCgpJ
IGJlbGlldmUgZ2VyYmVyYSBuZWVkcyBhIGxhdGVyIHZlcnNpb24gb2YgbGlibnB1cG5wLCBldmVu
IHRob3VnaCB0aGUKdGFibGUgaW4gUkVBRE1FLm1kIHN0YXRlcyB0aGF0IDQuMi4xIGlzIHRoZSBt
aW5pbXVtIHZlcnNpb24gKGFuZCB3ZQpoYXZlIDQuMi4xIGluIEJ1aWxkcm9vdCkuCgpDb3VsZCB5
b3UgaGF2ZSBhIGxvb2sgYXQgdGhpcyBpc3N1ZT8KClRoYW5rcyBhIGxvdCEKClRob21hcwotLSAK
VGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51
eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29t
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
