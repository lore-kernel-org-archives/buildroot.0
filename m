Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FCFBCD6E4A
	for <buildroot@archiver.kernel.org>; Thu,  4 Jun 2026 13:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C441D42EE0;
	Thu,  4 Jun 2026 13:55:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z1x_7cf1Xb5C; Thu,  4 Jun 2026 13:55:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC12242EE6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780581350;
	bh=IEO4J6vxVW5+GmVjCRYhoHU6FESs9kBbVj/jK6H1VVI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=U4fzJfznIfU61+20PWku+f1Qep/A/qy0qK7RJm8IKS0kkYnxHUAxd4rYpypOT976O
	 4/CgWWkkB4c5N1VXGFNu1OP0PmF4CHqbecn4oLXpyqC2ZNbAgrTjOCuMpBhj0XYKGV
	 naZsit1KIk43vK/K6+Hdmx73N/zEJuKNkU0XHDV3uzR8aJIc4n7oeaaekX9sh/osKT
	 xpZf0Rn0eeyEBtX6P68eVFFlv5Qyp/WdQhsCnrzdgDifcajAEMp6QofsKPmk6JeZzi
	 Ci+Z8Twr0mpe/vhe27PsaBacrgdHBRZhUpNDZRRH1tgLnRckuy/aDhc+SNnPUvBkhh
	 HZymhFyRnO1tg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC12242EE6;
	Thu,  4 Jun 2026 13:55:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C09E0192
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 13:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B30216F541
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 13:55:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ukrrGPoh0Znu for <buildroot@buildroot.org>;
 Thu,  4 Jun 2026 13:55:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 828CF6F4BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 828CF6F4BC
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 828CF6F4BC
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 13:55:48 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 56917412
 for <buildroot@buildroot.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 04 Jun 2026 13:55:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wV8Xx-0000000FhdY-2p5W
 for buildroot@buildroot.org; Thu, 04 Jun 2026 15:55:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 04 Jun 2026 15:55:45 +0200
Message-ID: <874ijijtpa.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=t9arKKTteeel0sVl6Ps9QTw5VIiLb3wQeQ4cr4UsoCNLPWGFyJgPP0YGExSDlygr9BCm1Nw1gzUOmQ5pw9Qg1kvgFV7HkWaz/tslHbAE4RHrx3hzRRlfontlCFRPzqrp6OM/IxLt1m6gJFGq/uNawfqObQ0DrDqGlMRK9ooLASEUM+irqqQpXIx1gulazJr0/Bp6W7fPfilLb8CCi7rZJFBIk4K8xKDYNczUY44dGMNaiw7sqE/7BKSpodPnwCGUIiLuZh0WcHddxn/oTdVS615N8GoMNAmCGwsxhUvltQ7Sk76kuDYoXgO3Q3y683hSC5F4Zp17YdEUSwee8TbzlA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=9yk+llSoPdDvhS/HVZYIOsnTDSN060fzMVctovQSgv8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=t9arKKTt
Subject: [Buildroot] Buildroot 2026.05-rc4 released
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

SGksCgpCdWlsZHJvb3QgMjAyNi4wNS1yYzQgaXMgcmVsZWFzZWQgLSBHbyBkb3dubG9hZCBpdCBh
dDoKCmh0dHBzOi8vYnVpbGRyb290Lm5ldC9kb3dubG9hZHMvYnVpbGRyb290LTIwMjYuMDUtcmM0
LnRhci5negoKb3IKCmh0dHBzOi8vYnVpbGRyb290Lm5ldC9kb3dubG9hZHMvYnVpbGRyb290LTIw
MjYuMDUtcmM0LnRhci54egoKT3IgZ2V0IGl0IGZyb20gR2l0OgoKaHR0cHM6Ly9naXRsYWIuY29t
L2J1aWxkcm9vdC5vcmcvYnVpbGRyb290LmdpdCAoMjAyNi4wNS1yYzQgdGFnKQoKVGhlIGhhY2th
dGhvbiBpbiBOaWNlIGJyb3VnaHQgYSBsYXJnZSBudW1iZXIgKH4xODApIG9mIChzZWN1cml0eSkg
Zml4ZXMsCnNvIGhlcmUgY29tZXMgYW5vdGhlciByZWxlYXNlIGNhbmRpZGF0ZS4gRm9yIGRldGFp
bHMsIHNlZSB0aGUgQ0hBTkdFUwpmaWxlOgoKaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5v
cmcvYnVpbGRyb290Ly0vYmxvYi8yMDI2LjA1LXJjNC9DSEFOR0VTCgpQbGVhc2UgZ2l2ZSBpdCBh
IHNwaW4gYW5kIHJlcG9ydCBhbnkgcHJvYmxlbXMgdG8gdGhlIG1haWxpbmcgbGlzdCBvcgpidWcg
dHJhY2tlci4gTWFueSB0aGFua3MgdG8gdGhlIHBlb3BsZSBjb250cmlidXRpbmcgdG8gdGhpcyBy
ZWxlYXNlOgoKZ2l0IHNob3J0bG9nIC1zbiAyMDI2LjA1LXJjMy4uCgogICAgNzcgIEJlcm5kIEt1
aGxzCiAgICAyOCAgVGhvbWFzIFBlcmFsZQogICAgMTEgIFBldGVyIEtvcnNnYWFyZAogICAgIDkg
IFF1ZW50aW4gU2NodWx6CiAgICAgOCAgUm9tYWluIE5hb3VyCiAgICAgNyAgVGhvbWFzIFBldGF6
em9uaQogICAgIDYgIE1hcnRpbiBXaWxsaQogICAgIDUgIEdpdWxpbyBCZW5ldHRpCiAgICAgNCAg
U2h1YmhhbSBDaGFrcmFib3J0eQogICAgIDQgIFRpdG91YW4gQ2hyaXN0b3BoZQogICAgIDMgIEFy
bm91dCBWYW5kZWNhcHBlbGxlCiAgICAgMyAgSnVsaWVuIE9saXZhaW4KICAgICAyICBGcmFuY29p
cyBQZXJyYWQKICAgICAyICBKb2huIEVybmJlcmcKICAgICAyICBNYXJjdXMgSG9mZm1hbm4KICAg
ICAyICBSYXBoYWVsIFBhdmxpZGlzCiAgICAgMiAgVmluY2VudCBTdGVobMOpCiAgICAgMiAgV2Fs
ZGVtYXIgQnJvZGtvcmIKICAgICAxICBBbGV4aXMgTG90aG9yw6kKICAgICAxICBDaHJpc3RpYW4g
U3Rld2FydAogICAgIDEgIERhcmlvIEJpbmFjY2hpCiAgICAgMSAgRGV2cmVlc2UgSm9yaWsKICAg
ICAxICBIZWlrbyBTdHVlYm5lcgogICAgIDEgIFBlbmdqaSBMaQogICAgIDEgIFZpYWNoZXNsYXYg
Qm9jaGFyb3YKICAgICAxICBWaW5jZW50IENydXoKCkV4cGVjdCB0aGUgZmluYWwgMjAyNi4wNSBy
ZWxlYXNlIHdpdGhpbiBhIGZldyBkYXlzLCB1bmxlc3MgYW55dGhpbmcgYmlnCnNob3dzIHVwLgoK
LS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
