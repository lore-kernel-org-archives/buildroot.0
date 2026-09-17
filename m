Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E29BC982C1
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 06:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FDCC60623;
	Thu, 17 Sep 2026 06:50:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VovZM-_xTN5a; Thu, 17 Sep 2026 06:50:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5CC246062C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789627812;
	b=Yt+Bg2XHwCUufsh2YHpCwnq89Okta8jiPUsE/HNQMPFe+iSW0cy1MH2mkuG3+2dZe9TX
	 hRfR6tAJwvN96kfFmH97mcigZj5kk9OUbZAMPaWA0lhwne5trHUxLAEa/j892KbUGn/Gl
	 6Mt5uYK3m4qcIs/5E1sGGXXZSx9araLEI7Kr1RINLvT2uMwe87G/ubMFCO3d6reLnlgNa
	 QSg4UHIbiyk7LvRJgGWUNP/GGyETymifTzSgzBfd31X15nHP0Safbx26pMh8QcnYc/0PP
	 FiRQKFxUQSaB96+VLO2ohSt4gn5rE8zXIxFKv1MjYURa9jtgtMmDwPlOQw+FhekuBRw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789627812;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=l4wsNtfs5HMOZ6OViAFC5FtfNFTPSnxdrxnYCPC2cGE=;
	b=m2I7MpKGtqF6TI4uezzSLiTrqQX95OmDVB9U7lqFT2eJPr8ELYsS/TPqzkXdgV9DuUBD
	 5mmgiYg80ZLWDN3uoGWu4q13Ka3zJVwqGJF54DjhcXvGr8/STCQ0FmNgCXobbYUnHntDC
	 HHBmriOi3KaCXbhbpGdcHVaNTd95TogXvBmitG7sHwdVABrXzymIyCvtrHMke1hXFmdtl
	 FE4jtmIpsTWaUImbb0EGElDBvJiPyRzMiTvgVXOqfwjrI6V8NZx6s2EenB5YqzseE5lwi
	 peUEF5P5UB9p1FsqwMrZvuCmMlMXoBqWPqhRBWdtL5HRqN8e36BE80yiWhGmIkU+V8A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=none header.from=korsgaard.com;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=GQ7iEA5t;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789627812;
	bh=l4wsNtfs5HMOZ6OViAFC5FtfNFTPSnxdrxnYCPC2cGE=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZL6JjJ68NQUeDL6ED3AIez9FuePYOoTtvgXfSd5o/yhG2ATK5qHwZPsSyRtLHpA+D
	 yCC0m1R0AJMA/rc+1CsNHs+6hx9QM0ulmmN8iwto6C1SmFlYFT/ywfsX1D2937piXS
	 p6tCXyhphUf1EJwycNcoo8XYtK4fUUp9oyPeJZkMelnOlBWK3DQCSw0ZWk6/3ccy/O
	 3mluWNB/ZBWouoGXM85mrH9bhT1rViVT36dP0gELpdrpHIP+oIFpg/tlATcfq24+8a
	 iMg6TylkZIcRX0659lBii6ZkR0tHHpWwZ3KwPebGQchIrfQz7sdlfS1sn+M4XxnEZc
	 1i+RgJo/cACYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CC246062C;
	Thu, 17 Sep 2026 06:50:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BEC6C13D
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 06:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BBCDF60645
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 06:50:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g5hUESOI07Zv for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 06:50:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5886760623
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789627809;
 b=W4AXcbIG/Joa/nBeqzcPX3TG01mZaiNvO4gSkDn2oS+AJV1oTdWU7aASzV+Fxa1iwwdU
 qshr1xHpLKTqskrsTCova7lyGCvdkP1zYNvNFQu3lAUlpsGrKcPLJ9MK9s3G792HyAcOl
 5Q29MO2fP37+OpqN5fJs4z6UdgL6WAGNCZLV/solC81P8AUBqpkX5CyLPDBTMImvINEVN
 nu1R+IiGZWLAH3AxyOkS3mQeqoFcCKzODJIdzqb0Npklf2y30Pyj7zfEpl5dIT2ZPwtp2
 Pr7QeX0h6i1EV8AqDgJOqtRXeOArlqfIa2VC6/uyQe3MSLTK8bBg11HePr5V7D5mpFw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789627809;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=KEcWRw+B2WJLJNXQvb+LC+pFOKYJoG5a/hGCHidElLY=;
 b=AfTeG5GA6gfNapQJYg8D9hy6gVgfIa4i4u+IsZW0kr3z0KkfjwyD/SCTqq/hIUTy2yee
 dKa2wBF9MSLHg7TCSg3+M60Z37ia34XfR+t0Vztw9febjV5McrxW8KIc0PHzFzNrxcY3R
 xQZWacwq2rW5Mlsq4gJztOjb+lXwBDs2uVyNdAdnvcI4eI/ZEppuK5bnmyMK2zvSFZ593
 eG2IKCwBd3shqVUiDSRkileWZp/U+We4umWUNolGgUY1SvNT549GHsUBbDof+LMI328+V
 fugf2tWwV2ydKYPxwU9VoMXAGMrolDRyXY1G3S3eK+5eUSNNKg+fWdl87Nu3ciZTzPg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=none header.from=korsgaard.com; 
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail2 header.b=GQ7iEA5t; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=GQ7iEA5t
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5886760623
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 06:50:07 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=GQ7iEA5tmSS+CvtNyyVAELp1um533MduuAMW2Mzxjdlo5GX6rSmO38pUUqUpSIX9JhNUhg5Jl+1UeLAzrnIZzOs0IEX33miWpMzoVePQcDsHYoju2n1XNzgsSLMh++VzJtTmmhCBjbvdfuDoQfsJdypCD+in/u+2nsSdtaG5SskUfAhqvqxCbtgf2xIwwql8LHvY1pRY/xTgXeOtKU3vSSIHfhpgkYiQuFhnwi38kwGqDxmKuaH8mOOPLDUg7JUxWBjgQdGprhrEiEQ68ZKB0bOjOBAhwIQ7UNjKt7Z1jLsJbFj2KPeHtBahtqWTRO0Ehn5dH0hWAIJWHD/wsPB9xw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=28FROLaEV9H9n3BP8GfjunoGnAlQsKtO8ZCFA5S++yU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -262820062; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 17 Sep 2026 06:50:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1x75wX-0000000Gw6R-0GEC;
 Thu, 17 Sep 2026 08:50:01 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: =?utf-8?Q?Rapha=C3=ABl_M=C3=A9lotte?= <raphael.melotte@mind.be>,
 buildroot@buildroot.org,
 arnout@rnout.be,  romain.naour@smile.fr,  Julien Olivain <ju.o@free.fr>,
 Fiona Klute <fiona.klute@gmx.de>,  Marcus Hoffmann <bubu@bubu1.eu>
In-Reply-To: <aqsLoHzcU6UWyYGg@windsurf> (Thomas Petazzoni's message of "Wed, 
 16 Sep 2026 23:37:23 +0200")
References: <20260820105705.1502630-1-raphael.melotte@mind.be>
 <20260820105705.1502630-2-raphael.melotte@mind.be>
 <aqsLoHzcU6UWyYGg@windsurf>
Date: Thu, 17 Sep 2026 08:50:00 +0200
Message-ID: <87o6dwmkx3.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/3] package/gumbo-parser: update hash
 following Codeberg changes
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

Pj4+Pj4gIlRob21hcyIgPT0gVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290
bGluLmNvbT4gd3JpdGVzOgoKSGksCgogPj4gKysrIGIvcGFja2FnZS9ndW1iby1wYXJzZXIvZ3Vt
Ym8tcGFyc2VyLmhhc2gKID4+IEBAIC0xLDUgKzEsNSBAQAogPj4gIyBMb2NhbGx5IGNvbXB1dGVk
OgogPj4gLXNoYTI1NiAgZGJkYzE1OWRjOGU1YzZmM2YyNTRlNTBiY2U2ODlkZDllNDM5MDY0ZmYw
NmMxNjVkNTY1MzQxMGE1NzE0YWI2NiAgMC4xMy4yLnRhci5negogPj4gK3NoYTI1NiAgOTBiZWE4
MzI4Mzc2MDMzOWRhMTk0ZmI5MDExMmE1MzI4NTRjMTNjZDFlYWJkYWJjN2VmN2E0ZGVkZTFkYmM5
ZCAgMC4xMy4yLnRhci5negoKID4gVW5mb3J0dW5hdGVseSBJIGRvbid0IHRoaW5rIHdlIGNhbiBk
byB0aGF0LiBzb3VyY2VzLmJ1aWxkcm9vdC5uZXQgaGFzCiA+IG1vc3QgbGlrZWx5IGNhY2hlZCB0
aGUgcHJldmlvdXMgdmVyc2lvbiBvZiB0aGUgdGFyYmFsbC4KClllczoKCndnZXQgaHR0cHM6Ly9z
b3VyY2VzLmJ1aWxkcm9vdC5vcmcvZ3VtYm8tcGFyc2VyLzAuMTMuMi50YXIuZ3oKLS0yMDI2LTA5
LTE3IDA4OjQ4OjMwLS0gIGh0dHBzOi8vc291cmNlcy5idWlsZHJvb3Qub3JnL2d1bWJvLXBhcnNl
ci8wLjEzLjIudGFyLmd6ClJlc29sdmluZyBzb3VyY2VzLmJ1aWxkcm9vdC5vcmcgKHNvdXJjZXMu
YnVpbGRyb290Lm9yZykuLi4gMTM4LjIwMS4yMDUuNjEsIDJhMDE6NGY4OjE3MzoxNTI2OjoyCkNv
bm5lY3RpbmcgdG8gc291cmNlcy5idWlsZHJvb3Qub3JnIChzb3VyY2VzLmJ1aWxkcm9vdC5vcmcp
fDEzOC4yMDEuMjA1LjYxfDo0NDMuLi4gY29ubmVjdGVkLgpIVFRQIHJlcXVlc3Qgc2VudCwgYXdh
aXRpbmcgcmVzcG9uc2UuLi4gMjAwIE9LCkxlbmd0aDogMjE0NTQwMyAoMi4wTSkgW2FwcGxpY2F0
aW9uL3gtZ3Rhci1jb21wcmVzc2VkXQpTYXZpbmcgdG86IOKAmDAuMTMuMi50YXIuZ3rigJkKCjAu
MTMuMi50YXIuZ3ogICAgICAgICAgIDEwMCVbPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
Pl0gICAyLjA1TSAgNy40NU1CL3MgICAgaW4gMC4zcwoKMjAyNi0wOS0xNyAwODo0ODozMSAoNy40
NSBNQi9zKSAtIOKAmDAuMTMuMi50YXIuZ3rigJkgc2F2ZWQgWzIxNDU0MDMvMjE0NTQwM10KCnNo
YTI1NnN1bSAwLjEzLjIudGFyLmd6CmRiZGMxNTlkYzhlNWM2ZjNmMjU0ZTUwYmNlNjg5ZGQ5ZTQz
OTA2NGZmMDZjMTY1ZDU2NTM0MTBhNTcxNGFiNjYgIDAuMTMuMi50YXIuZ3oKCgpEaWQgd2UgcmVw
b3J0IHRoaXMgaXNzdWUgdG8gY29kZWJlcmcgYWxyZWFkeT8KCi0tIApCeWUsIFBldGVyIEtvcnNn
YWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
