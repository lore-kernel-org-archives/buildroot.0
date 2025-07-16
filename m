Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C39BFC83F1B
	for <buildroot@archiver.kernel.org>; Wed, 16 Jul 2025 18:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F94D6124B;
	Wed, 16 Jul 2025 18:15:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y2972Mdkm6Pv; Wed, 16 Jul 2025 18:15:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A07B610A8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A07B610A8;
	Wed, 16 Jul 2025 18:15:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 56AB7234
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 18:15:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48D6E40F5D
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 18:15:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K_YoKaOkB8Xz for <buildroot@buildroot.org>;
 Wed, 16 Jul 2025 18:15:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.173.1.68;
 helo=mailgw-out1.grenoble.cnrs.fr; envelope-from=bonet@grenoble.cnrs.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C782040F5C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C782040F5C
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C782040F5C
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 18:15:28 +0000 (UTC)
Received: from [IPV6:2a01:e0a:12:eba0:3cb9:e8a6:c6c7:308b] (unknown
 [IPv6:2a01:e0a:12:eba0:3cb9:e8a6:c6c7:308b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id E8976C2CE0;
 Wed, 16 Jul 2025 20:15:24 +0200 (CEST)
Message-ID: <af8e78be-f4ad-4543-a166-b2527c0e9c3a@grenoble.cnrs.fr>
Date: Wed, 16 Jul 2025 20:15:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, fr
To: Buildroot development <buildroot@buildroot.org>
Cc: Petr Vorel <petr.vorel@gmail.com>, Julien Olivain <ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1752689725;
 bh=CM2UisH8X5FtVdC4/oP8tueI/ZaYy3J+1MCynbiFeC8=;
 h=Date:To:Cc:From:Subject:From;
 b=ii7lC62OdjlvFxMFjC4RImeMdKkTP+i8MhG3+mQYRMXtwancU0ZAUY4Ol12q+SUc8
 VBPNERN+J2gBbYUd9SAYuWDwPzsLhQAiDGd1lkMJFb21tlmHk23USoUd+D/Lh4+q2w
 CZYW+QR06LtNWy9O7NfspnaTRaia1fLmljFic2C0Eez6YG4NYH9FFlafCY5WtG9c4I
 KwSFaTdZQIITLi2hddYamBmaecs0SIIKfMb5Kgi/TFVqlIMIi8c2Hxk4pY/6X6G3ha
 VlvzYA6ENxyCQrrxjimLAxA+vU0MWjC99X9o/fze75UPb9JHfmq9/4lF2xPzzIv1Dl
 kpFGiN4V8bWHg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=ii7lC62O
Subject: [Buildroot] [PATCH v2 0/4] Fix compiler warnings in support/kconfig
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
From: Edgar Bonet via buildroot <buildroot@buildroot.org>
Reply-To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBhIHJlc3BpbiBhbmQgYW4gZXh0ZW5zaW9uIG9mIGEgcHJldmlvdXMgcGF0Y2gsWzFdIHdo
aWNoIGhhcyBiZWVuCm1hcmtlZCBhcyDigJxDaGFuZ2VzIFJlcXVlc3RlZOKAnSBiZWNhdXNlIGl0
IGZhaWxlZCB0byB1cGRhdGUgdGhlCnN1cHBvcnQva2NvbmZpZy9wYXRjaGVzIGRpcmVjdG9yeS4K
ClRoZSBmaXJzdCB0d28gcGF0Y2hlcyBpbiB0aGlzIHNlcmllcyBhcmUgbWVhbnQgdG8gZW5zdXJl
IHRoZSBjb250ZW50cyBvZgpzdXBwb3J0L2tjb25maWcvcGF0Y2hlcyBpcyBpbiBzeW5jIHdpdGgg
dGhlIGN1cnJlbnQgc291cmNlcyBpbgpzdXBwb3J0L2tjb25maWcuIFRoZSBzZWNvbmQgcGF0Y2gg
Y3JlYXRlcyBhIG1pc3NpbmcgZmlsZSBpbiBwYXRjaGVzLy4gSXQKY291bGQgaGF2ZSBpbnN0ZWFk
IHVwZGF0ZWQgcGF0Y2ggMTQsIGJ1dCB0aGF0IHdvdWxkIGZvcmNlIHRoZSBmb3VydGgKcGF0Y2gg
aW4gdGhpcyBzZXJpZXMgdG8gY3JlYXRlIGFuIGluY29uc2lzdGVuY3kuCgpUaGUgdGhpcmQgcGF0
Y2ggaXMgYSByZXNwaW4gb2YgdGhlIHByZXZpb3VzIHZlcnNpb24gb2YgdGhpcyBzZXJpZXMuIEl0
Cm5vdyB1cGRhdGVzIHRoZSByZWxldmFudCBlbnRyeSBpbiBwYXRjaGVzLy4KClRoZSBmb3VydGgg
cGF0Y2ggZml4ZXMgYSB3YXJuaW5nIGluIOKAnG1ha2UgbmNvbmZpZ+KAnSB2ZXJ5IHNpbWlsYXIg
dG8gdGhlCndhcm5pbmcgZml4ZWQgYnkgdGhlIHRoaXJkIHBhdGNoLgoKQ2hhbmdlcyB2MSAtPiB2
MjoKICAtIHBhdGNoZXMgMSwgMiBhbmQgNCBhcmUgbmV3CiAgLSBwYXRjaCAzIG5vdyB1cGRhdGVz
IHBhdGNoZXMvMjQtZml4LS1XZm9ybWF0LXdhcm5pbmdzLnBhdGNoLCBhbmQgaXRzCiAgICBsb2cg
bWVzc2FnZSBpcyBzbGlnaHRseSByZXdvcmRlZC4KClsxXSBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9idWlsZHJvb3QvNGE0NDczZDMtNTZkNi00NTc2LTlhOGYtNWI3MDhhMTU2OWRmQGdyZW5vYmxl
LmNucnMuZnIvCgpFZGdhciBCb25ldCAoNCk6CiAgc3VwcG9ydC9rY29uZmlnL3BhdGNoZXM6IG1h
a2UgYWxsIHBhdGNoZXMgcXVpbHQtZnJpZW5kbHkKICBzdXBwb3J0L2tjb25maWcvcGF0Y2hlczog
YWRkIG1pc3NpbmcgcGF0Y2gKICBzdXBwb3J0L2tjb25maWc6IGZpeCBjb21waWxlciB3YXJuaW5n
IGluIHV0aWwuYwogIHN1cHBvcnQva2NvbmZpZzogZml4IGNvbXBpbGVyIHdhcm5pbmcgaW4gbmNv
bmYuYwoKIHN1cHBvcnQva2NvbmZpZy9uY29uZi5jICAgICAgICAgICAgICAgICAgICAgICB8ICAy
ICstCiAuLi5jb25maWctbHhkaWFsb2ctZml4LWNoZWNrLXdpdGgtR0NDMTQucGF0Y2ggfCAxMSAr
Ky0tCiAuLi5vbmZpZy1tbi1jb25mLWhhbmRsZS1iYWNrc3BhY2UtSC1rZXkucGF0Y2ggfCAzMSAr
KysrKystLS0tLS0KIC4uLi9wYXRjaGVzLzI0LWZpeC0tV2Zvcm1hdC13YXJuaW5ncy5wYXRjaCAg
ICB8IDUwICsrKysrKysrKysrKysrKysrKysKIHN1cHBvcnQva2NvbmZpZy9wYXRjaGVzL3Nlcmll
cyAgICAgICAgICAgICAgICB8ICAxICsKIHN1cHBvcnQva2NvbmZpZy91dGlsLmMgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAyICstCiA2IGZpbGVzIGNoYW5nZWQsIDcxIGluc2VydGlvbnMoKyks
IDI2IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHN1cHBvcnQva2NvbmZpZy9wYXRj
aGVzLzI0LWZpeC0tV2Zvcm1hdC13YXJuaW5ncy5wYXRjaAoKLS0gCjIuNDMuMApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
