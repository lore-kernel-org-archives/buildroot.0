Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49134C61DD6
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 06:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44F5C4030F;
	Tue,  1 Sep 2026 06:41:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7eZ15Pv6rxOC; Tue,  1 Sep 2026 06:41:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788244874;
	bh=bwViwrRJ+XeHBG6HIrANPYiGFHwJwLxe9jvXtM+DD5Y=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BQiTISJDYZEc+O2baZtqb5XiWDpcLl5hnM0Z33I8YocBPssgDKtO6fRuE/2N58YpB
	 sLT/3iioaEuQqRIxBblcwLsmieoj2tQ7zFnwF9GTrDBe0C2iLk91kKlAAbmin9E+e6
	 gYXXTAwx/kREn/hr1CMCGksd3sSns4LxEo7w8sPvcvx+htLcdmAg19ivTRSe1NK99r
	 paOH916Vcf7oN11/Zbn/6MOGZlrUfJoZzsZfkNm2lJHDiu0pEaoXguPxunoowTPwtx
	 4dVPC2L6xjlieg7A14cg+oy6Q6UcWJFJ/TET/toEu/FdxqkrIN94OhNUWyi/wnIBWY
	 ye2SE9hVqdG5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F4484029B;
	Tue,  1 Sep 2026 06:41:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F05B377
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 06:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50C1840061
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 06:41:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bt4HZ0MPEsx7 for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 06:41:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=Y+2WcKnU
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C3D274013B
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 06:41:10 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=Y+2WcKnUU3C7/h+FU8fIOKKRtQbwc/phUjE1rcI7O3t3qHA+yYxHD6dP+vuvm007CSABnRViL/RraBQ/5UsuMIqPeM4ALxYrT+55IjhnIeMdj2fReAMcs9YqoHDK+KbqraIk6l5bEsk7vmGa1v+7zfMZ9tu00K/RUdv9nJ0Z0rpnPEwEA06KJXANxzyzZEexPQqbornjSk22iK46KwrABvs8lA+c6JB+IONaMEtDjDdGUUbPD6pu7WN8+hmz6ADBaRrrU6oroMozWFxo47Dusw3wZfH2BYJHPEUjnuEx/E7HRK0ET+gZ/7eViP6GDo3Xj2A7WmlQB0t4x6hRgIvtnA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=AhkZ93ijIZfwa2osvRWslkl6I3VrKWp4Thrf/gzbb2o=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1710549187; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 01 Sep 2026 06:41:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1x1IB7-00000002o6j-1SUK;
 Tue, 01 Sep 2026 08:41:05 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Fiona Klute via buildroot <buildroot@buildroot.org>
In-Reply-To: <76f38e09-f5c4-4b0c-8397-01061d7fbced@gmx.de> (Fiona Klute's
 message of "Mon, 31 Aug 2026 23:10:21 +0200")
References: <20260831125103.841338-1-fiona.klute@gmx.de>
 <87mru2je25.fsf@dell.be.48ers.dk>
 <76f38e09-f5c4-4b0c-8397-01061d7fbced@gmx.de>
Date: Tue, 01 Sep 2026 08:41:05 +0200
Message-ID: <878q5lh3su.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH next 1/3] fs/common.mk: add optional hook to
 build a verity hash tree
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

Pj4+Pj4gIkZpb25hIiA9PSBGaW9uYSBLbHV0ZSA8ZmlvbmEua2x1dGVAZ214LmRlPiB3cml0ZXM6
CgpIaSwKCiA+IEhvdyBhYm91dCBhbiBfRVhUUkFfQVJHUyBvcHRpb24/IEkgdGhpbmsgYWRkaW5n
IG9wdGlvbnMgZm9yIGFsbAogPiBwb3NzaWJsZSBwYXJhbWV0ZXJzIHdvdWxkIGJlIGEgbG90IG9m
IGNvZGUgZm9yIGxpdHRsZSBnYWluLgoKUG9zc2libHksIGJ1dCBzaG91bGQgdGhhdCB0aGVuIGJl
IHBlci1mcyBvciBnbG9iYWw/IEkgd29uZGVyIGlmIGl0IGlzCndvcnRoIHRoZSBjb21wbGV4aXR5
IHRvIGFkZCB0aGlzIGxvZ2ljIHZlcnN1cyBob3cgZmFpcmx5IHNpbXBsZSBpdCBpcyB0bwpqdXN0
IGRvIGl0IHdpdGggd2hhdGV2ZXIgb3B0aW9ucyB5b3Ugd2FudCBpbiBhIHBvc3QtaW1hZ2Ugc2Ny
aXB0LgoKCiA+IEZvciBoYXNoIGFsZ29yaXRobSBhIHNwZWNpZmljIG9wdGlvbiBtaWdodCBzZW5z
ZSBpZiB3ZSBjb3VsZCB1c2UgdGhhdAogPiB0byBlbnN1cmUgdGhlIG1hdGNoaW5nIGhhc2ggaXMg
ZW5hYmxlZCBpbiB0aGUga2VybmVsLiBCdXQgdGhhdCdkCiA+IHJlcXVpcmUgYWRkaW5nIExJTlVY
X0NPTkZJR19GSVhVUFMgaW5mcmFzdHJ1Y3R1cmUgZm9yIGZzLywgbm90IHN1cmUgaWYKID4gd29y
dGggaXQ/IFRob3VnaCBlbmFibGluZyBmaWxlc3lzdGVtcyBzZWxlY3RlZCBmb3Igcm9vdGZzIGlu
IHRoZQogPiBrZXJuZWwgY291bGQgYmUgdXNlZnVsLCB0b28gKEkndmUgYmVlbiB0aGVyZSwgY2hh
bmdlZCByb290ZnMgYW5kCiA+IGZvcmdvdCB0byBlbmFibGUgaXQgaW4gdGhlIGtlcm5lbCDigJMg
bm90IG9mdGVuLCBidXQgaXQgaGFwcGVucykuCgpJIHdvdWxkIGJlIE9LIHdpdGggdGhhdC4gVGhl
c2UgZml4dXBzIGFyZSBhIGJpdCBpY2t5IHRob3VnaCBhcyB3ZSBkbyBub3QKa25vdyB3aGF0IGtl
cm5lbCB2ZXJzaW9uIHdpbGwgYmUgdXNlZCBhbmQgdGhlIGRlcGVuZGVuY2llcyBtYXkgY2hhbmdl
Cm92ZXIgdGltZSAtIFNvIG1haW50ZW5hbmNlIGFuZCB0ZXN0aW5nIGlzIG5vdCBzbyB0cml2aWFs
LgoKCiA+IFRoZSBvbmUgcmVhc29uIEkgY2FuIGltYWdpbmUgd2FudGluZyB0byBzZXQgdXVpZC9z
YWx0IGlzIGlmIHNvbWVvbmUKID4gd2FudHMgYSBieXRlLWlkZW50aWNhbCB2ZXJpdHkgcGFydGl0
aW9uLiBmcy9lcm9mcyBzZXRzIGFsbC16ZXJvIFVVSUQsCiA+IHdoaWNoIHdlIGNvdWxkIGRvIGZv
ciB2ZXJpdHkgdG9vLCBidXQgSSdtIG5vdCBzdXJlIHdoYXQgdGhlIHNlY3VyaXR5CiA+IGltcGxp
Y2F0aW9ucyBvZiBhIGZpeGVkIChvciBwc2V1ZG9yYW5kb20/KSBzYWx0IHdvdWxkIGJlLgoKWWVz
LCBpdCBpcyBhbHNvIG9ubHkgaW4gdGhlIGNvbnRleHQgb2YgcmVwcm9kdWNpYmxlIGJ1aWxkcyB0
aGF0IEkgaGF2ZQpldmVyIHVzZWQgYSBmaXhlZCB1dWlkL3NhbHQuCgpTZWN1cml0eSB3aXNlLCBh
cyB0aGlzIGlzIGFib3V0IGhhc2hpbmcgcmF0aGVyIHRoYW4gZW5jcnlwdGlvbiBJICpUSElOSyoK
aXQgaXMgZmluZSBhcyBsb25nIGFzIHRoZSBoYXNoaW5nIGFsZ29yaXRobSBpcyBzdHJvbmcgZW5v
dWdoIChFLkcuIHlvdQp3b3VsZCBuZWVkIGZpbmQgc2FtZS1zaXplIGNvbGxpc2lvbnMpLgoKLS0g
CkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
