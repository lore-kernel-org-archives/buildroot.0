Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B3BC5DF80
	for <buildroot@archiver.kernel.org>; Tue, 18 Aug 2026 09:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A78F581062;
	Tue, 18 Aug 2026 09:18:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xsuzl_ukRLUN; Tue, 18 Aug 2026 09:18:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69BD080FB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787044709;
	bh=JYj+dzRkYh3s5ntozoLB5O6bqr3XDH4jdKmOIZEH6r4=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OIBW6KgHOuWAEuOFyUDuBjPqFdanPNH9yPRnD1MI9B2BlfBGFz5TLNt5R9mTROdfe
	 b7c6tkw4Rp5V44IS9lz7UTNYC6adCchq3tnVhNcBAvngx05JUhfB3hGI4eg//RZ//j
	 /HQV+IWHbblrqiRCBIuj+QpuiEUerf5QTLuMJL7fHysm4lLWGbh0FMW2BeHEAb9Fam
	 umjUd1uNETg/hK4KMvwdYAT1RDNYlhiChpXg87MM5Z+yw28irXOmcFbn8z+qxxipou
	 OkWsz19CjTLEs0XTdqVkVIfJL+pjcP/t/VNR25iYgyEbF5YHcC73PcAmJI3qMeFWVc
	 1UMXzNkyt3mxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69BD080FB4;
	Tue, 18 Aug 2026 09:18:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 30C97333
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 09:18:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1389880FB4
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 09:18:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5PF3S_gIGrA7 for <buildroot@buildroot.org>;
 Tue, 18 Aug 2026 09:18:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 24A1180FAC
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24A1180FAC
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=n9jC6Xe5
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 24A1180FAC
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 09:18:25 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=n9jC6Xe5QqGzKEyCXzMQNHAZT/L+6I2Z5Dj/hgIYGrXJ/PT6JESjmHJiXAjvN54P7Dg+sLA/EjRCaon2CxHckm6E4hUsL1myNkToqRnvJ56LoggidFH3gpMf8whqm+5KduUXx4itzCi7BWMrVb2CI7GJwKhV+2QKlOiRVwqrbndZ/86VlDLY/n11Kz5eUmP8LzeHqp0I4bTMeATCJVa+guDIYVtt2qeMO1lZHdJnhcwrfXOw8/MHbXjr185aMImwwaMRgpX2bwOn3WlCsx7vzchK9cgPYNqMVYvUa6wuFeIdeb17mQeor9ARgNPcYgUiSJY9JGCpSUVa5TrCMBVJvA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=KoEDzYaX9Ex4ipjCFh2ZE8mkk8So3bR3WKricVJaUGM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1086900103; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 18 Aug 2026 09:18:24 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wwFxf-00000003UuW-0bc4;
 Tue, 18 Aug 2026 11:18:23 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?Rapha=C3=ABl_M=C3=A9lotte?= via buildroot
 <buildroot@buildroot.org>
Cc: =?utf-8?Q?Rapha=C3=ABl_M=C3=A9lotte?= <raphael.melotte@mind.be>,  Bernd
 Kuhls <bernd@kuhls.net>,  Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20260818082809.952856-1-raphael.melotte@mind.be>
 (=?utf-8?Q?=22Rapha=C3=ABl=09M=C3=A9lotte?= via buildroot"'s message of
 "Tue, 18 Aug 2026 10:28:07 +0200")
References: <20260818082809.952856-1-raphael.melotte@mind.be>
Date: Tue, 18 Aug 2026 11:18:22 +0200
Message-ID: <87wltnvlb5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/postgresql: security bump
 to v17.11
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlJhcGhhw6tsIiA9PSBSYXBoYcOrbCBNw6lsb3R0ZSB2aWEgYnVpbGRyb290IDxidWls
ZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JpdGVzOgoKID4gRm9yIG1vcmUgaW5mb3JtYXRpb24gYWJv
dXQgdGhlIHJlbGVhc2UsIHNlZToKID4gICAtIGh0dHBzOi8vd3d3LnBvc3RncmVzcWwub3JnL2Rv
Y3MvMTcvcmVsZWFzZS0xNy0xMS5odG1sCgogPiBGaXhlcyB0aGUgZm9sbG93aW5nIHZ1bG5lcmFi
aWxpdGllczoKCiA+IC0gQ1ZFLTIwMjYtNjQ3MQogPiAtIENWRS0yMDI2LTE0NjYzCiA+IC0gQ1ZF
LTIwMjYtNjQ2NAogPiAtIENWRS0yMDI2LTE2MjM5CiA+IC0gQ1ZFLTIwMjYtMTQ2NjkKID4gLSBD
VkUtMjAyNi0xNDY2NAogPiAtIENWRS0yMDI2LTE4MDI0CiA+IC0gQ1ZFLTIwMjYtMTYyMzgKID4g
LSBDVkUtMjAyNi0xNDY2OAogPiAtIENWRS0yMDI2LTE0NjYyCiA+IC0gQ1ZFLTIwMjYtMTQ2NzkK
ID4gLSBDVkUtMjAyNi0xNDY4MAogPiAtIENWRS0yMDI2LTY0NjkKID4gLSBDVkUtMjAyNi0xNTc0
MQogPiAtIENWRS0yMDI2LTY0NzAKID4gLSBDVkUtMjAyNi0xNDY2NgogPiAtIENWRS0yMDI2LTE0
NjgxCiA+IC0gQ1ZFLTIwMjYtMTQ2NzIKID4gLSBDVkUtMjAyNi0xNjI0MQogPiAtIENWRS0yMDI2
LTE4NDA4CiA+IC0gQ1ZFLTIwMjYtMTkzODUKID4gLSBDVkUtMjAyNi0xNDY3MAogPiAtIENWRS0y
MDI2LTE0Njc3CiA+IC0gQ1ZFLTIwMjYtMTQ2NzMKID4gLSBDVkUtMjAyNi0xNTc0MgogPiAtIENW
RS0yMDI2LTE0Njc2CiA+IC0gQ1ZFLTIwMjYtMTQ2NzgKID4gLSBDVkUtMjAyNi0xNDY3MQoKID4g
QXNzaXN0ZWQtYnk6IENsYXVkZTpjbGF1ZGUtc29ubmV0LTUKCldlIGRvbid0IHJlYWxseSB1c2Ug
YXNzaXN0ZWQtYnkgdGFncyBpbiBCdWlsZHJvb3QuIERpZCB5b3UgcmVhbGx5IHJlYWNoCm91dCB0
byBhIExMTSB0byBjaGFuZ2UgYSAxMCB0byBhbiAxMT8KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFy
ZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
