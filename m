Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 644DAD111A8
	for <buildroot@archiver.kernel.org>; Sun, 30 Nov 2025 19:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78B0A40992;
	Sun, 30 Nov 2025 19:25:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cq7cpagqcVhn; Sun, 30 Nov 2025 19:25:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C75340995
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C75340995;
	Sun, 30 Nov 2025 19:25:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E3A611A9
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 19:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9EDA402E0
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 19:25:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V1BEr2NDMjgK for <buildroot@buildroot.org>;
 Sun, 30 Nov 2025 19:25:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 996CE40010
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 996CE40010
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 996CE40010
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 19:24:59 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1976608558
 for <buildroot@buildroot.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 30 Nov 2025 19:24:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vPn2X-0000000EMaR-1eng
 for buildroot@buildroot.org; Sun, 30 Nov 2025 20:24:57 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 30 Nov 2025 20:24:57 +0100
Message-ID: <87h5ubgw6u.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=TTK1w8+a78A6JK0v/m84QM9R2aUZVDDu6GWN3LiAuZviDqMDWOafZcyYTwgsvarcY9xpKWFJxUZIDe23G9AsEAxyarEN1eBZZECX7/WqE79Ah93N0P2jjMc5W9xSiB91SsBruRuISL9Qc/21bHklv3HQTf8ngkU/VBHZ1RoB8e6uaclfdiZdN2GGhtyPq6XyEnMAWfJ3ef90aeSf4th8HZE/LoYDNVn+paUaZNJ1YvCK85pBI0Xcl9jpd92lsHpbbfiTZwp3VuqV8oQ6CDKaCz8B57HUrHV4S61cDDBl1zoZ81JBHBHI3Jp9yGc9jfGkU9X7f+gpFvEEjenLXkGxnA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=YgdTe8cCU/SzbzNNQPqyrokO/7WM8woS7mMSuE/nC3U=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=TTK1w8+a
Subject: [Buildroot] Buildroot 2025.11-rc2 released
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

SGksCgpCdWlsZHJvb3QgMjAyNS4xMS1yYzIgaXMgcmVsZWFzZWQgLSBHbyBkb3dubG9hZCBpdCBh
dDoKCmh0dHBzOi8vYnVpbGRyb290Lm5ldC9kb3dubG9hZHMvYnVpbGRyb290LTIwMjUuMTEtcmMy
LnRhci5negoKb3IKCmh0dHBzOi8vYnVpbGRyb290Lm5ldC9kb3dubG9hZHMvYnVpbGRyb290LTIw
MjUuMTEtcmMyLnRhci54egoKT3IgZ2V0IGl0IGZyb20gR2l0OgoKaHR0cHM6Ly9naXRsYWIuY29t
L2J1aWxkcm9vdC5vcmcvYnVpbGRyb290LmdpdCAoMjAyNS4xMS1yYzIgdGFnKQoKQW5vdGhlciB3
ZWVrLCBhbm90aGVyIHJlbGVhc2UgY2FuZGlkYXRlLiBGb3IgZGV0YWlscywgc2VlIHRoZSBDSEFO
R0VTCmZpbGU6CgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9i
bG9iLzIwMjUuMTEtcmMyL0NIQU5HRVMKClBsZWFzZSBnaXZlIGl0IGEgc3BpbiBhbmQgcmVwb3J0
IGFueSBwcm9ibGVtcyB0byB0aGUgbWFpbGluZyBsaXN0IG9yCmJ1ZyB0cmFja2VyLiBNYW55IHRo
YW5rcyB0byB0aGUgcGVvcGxlIGNvbnRyaWJ1dGluZyB0byB0aGlzIHJlbGVhc2U6CgpnaXQgc2hv
cnRsb2cgLXNuIDIwMjUuMTEtcmMxLi4KCiAgICAzNSAgQmVybmQgS3VobHMKICAgICAzICBBcm5v
dXQgVmFuZGVjYXBwZWxsZQogICAgIDMgIEdpdWxpbyBCZW5ldHRpCiAgICAgMiAgQWRhbSBEdXNr
ZXR0CiAgICAgMiAgSnVsaWVuIE9saXZhaW4KICAgICAxICBKb3PDqSBMdWlzIFNhbHZhZG9yIFJ1
Zm8KICAgICAxICBNYXJjdXMgSG9mZm1hbm4KICAgICAxICBQZXRlciBLb3JzZ2FhcmQKICAgICAx
ICBUaG9tYXMgQm9ubmVmaWxsZQogICAgIDEgIFRob21hcyBQZXRhenpvbmkKICAgICAxICBZYW5u
IEUuIE1PUklOCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
