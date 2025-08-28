Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DEB1CA0EED
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 07:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2EBB81220;
	Thu, 28 Aug 2025 07:51:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jEbPnHSXB56r; Thu, 28 Aug 2025 07:51:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 235FC81449
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 235FC81449;
	Thu, 28 Aug 2025 07:51:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A5A2D17D
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 07:51:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87DE381442
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 07:51:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CwvtDcjLETbx for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 07:51:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E6C868133E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6C868133E
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E6C868133E
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 07:51:10 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -741129575
 for <buildroot@buildroot.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 28 Aug 2025 07:51:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1urXPX-005E1u-0S
 for buildroot@buildroot.org; Thu, 28 Aug 2025 09:51:07 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 28 Aug 2025 09:51:07 +0200
Message-ID: <87cy8flw9g.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=hM5qbh93GgaMrzMCDAMAlN7s6VuJ/uoLMA5m2FBjNmTKByc8NrvgVrtQheul9Rh1KaHHsnn0I2/SYSSK/dK3abz7cN5jPizJFMbOleOlyvcPsaLIM4W7UrsaZOw8rQxLpImT4rGJFclww/FyZXPwj5Jbyb/IrjhPq8MB1k5oIHgi7RVHzelDj3tzd07/2DgDbOtpZf8TkLi8NGFIYp+yKmZn1+3CFgBa+tHJRn7lT42q18FVlTQcgSEN3SpQugiQ1ppaD4WkENMLh3wxvaxsXZ+BfV+Citub8hffJjkSRcGznRTAoHEEoQHg0Gm0nKPljbL7GnyDWHEKcKTqC126ag==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=ILlGri4YpxsgUu42Ryw/+dIYZoacsWGQclc6VPoNxko=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=hM5qbh93
Subject: [Buildroot] Buildroot 2025.08-rc3 released
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

SGksCgpCdWlsZHJvb3QgMjAyNS4wOC1yYzMgaXMgcmVsZWFzZWQgLSBHbyBkb3dubG9hZCBpdCBh
dDoKCmh0dHBzOi8vYnVpbGRyb290Lm5ldC9kb3dubG9hZHMvYnVpbGRyb290LTIwMjUuMDgtcmMz
LnRhci5negoKb3IKCmh0dHBzOi8vYnVpbGRyb290Lm5ldC9kb3dubG9hZHMvYnVpbGRyb290LTIw
MjUuMDgtcmMzLnRhci54egoKT3IgZ2V0IGl0IGZyb20gR2l0OgoKaHR0cHM6Ly9naXRsYWIuY29t
L2J1aWxkcm9vdC5vcmcvYnVpbGRyb290LmdpdCAoMjAyNS4wOC1yYzMgdGFnKQoKQW5vdGhlciB3
ZWVrLCBhbm90aGVyIHJlbGVhc2UgY2FuZGlkYXRlLiBGb3IgZGV0YWlscywgc2VlIHRoZSBDSEFO
R0VTCmZpbGU6CgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9i
bG9iLzIwMjUuMDgtcmMzL0NIQU5HRVMKClBsZWFzZSBnaXZlIGl0IGEgc3BpbiBhbmQgcmVwb3J0
IGFueSBwcm9ibGVtcyB0byB0aGUgbWFpbGluZyBsaXN0IG9yCmJ1ZyB0cmFja2VyLiBNYW55IHRo
YW5rcyB0byB0aGUgcGVvcGxlIGNvbnRyaWJ1dGluZyB0byB0aGlzIHJlbGVhc2U6CgpnaXQgc2hv
cnRsb2cgLXNuIDIwMjUuMDgtcmMyLi4KCiAgICAyMyAgVGhvbWFzIFBldGF6em9uaQogICAgIDQg
IEJlcm5kIEt1aGxzCiAgICAgNCAgUGV0ZXIgS29yc2dhYXJkCiAgICAgNCAgUm9tYWluIE5hb3Vy
CiAgICAgMiAgRmxvcmlhbiBMYXJ5c2NoCiAgICAgMSAgQWxleGlzIExvdGhvcsOpCiAgICAgMSAg
QW5kcmVhcyBaaWVnbGVyCiAgICAgMSAgRGFuaWVsIExhbmcKICAgICAxICBFZGdhciBCb25ldAog
ICAgIDEgIEZyYW5rIENodW5nCiAgICAgMSAgSGVucmkgUm9vc2VuCiAgICAgMSAgSnVsaWVuIE9s
aXZhaW4KICAgICAxICBNaWNoYWVsIFRyaW1hcmNoaQogICAgIDEgIE5lYWwgRnJhZ2VyCiAgICAg
MSAgVGhvbWFzIFBlcmFsZQogICAgIDEgIFlhY2luIEJlbG1paG91Yi1NYXJ0ZWwKCi0tIApCeWUs
IFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
