Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E62C3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:05:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98ADB82F31;
	Fri,  2 May 2025 11:05:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0LWx12hZdmk3; Fri,  2 May 2025 11:05:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF42B82D45
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF42B82D45;
	Fri,  2 May 2025 11:05:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 91760229
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 831376083A
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:05:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RFz0tZxgfwmH for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:05:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DB41F60721
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB41F60721
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DB41F60721
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:05:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E4ACB1C0D8C; Fri,  2 May 2025 13:05:50 +0200 (CEST)
Message-ID: <8d60ed67-6de4-44d2-936d-0d73c0dca36c@rnout.be>
Date: Fri, 2 May 2025 13:05:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 buildroot@buildroot.org
References: <20250423132539.836773-1-raphael.melotte@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250423132539.836773-1-raphael.melotte@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746183951; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=N+m1EOVy2BoeuxP19oEk/rRtgbDXorKDA0a/oUXoztU=;
 b=JccBIApJw2JLzxRZpCpvbicZATnmRC6sn1jesoJK39Bi+obssfXBEz7875qrKOrNwiRFLj
 Cc8KE9TH8uBvJCaRrs1bsjMvziQWUJpi+6ofh7SjPdnnE+aiex112a8IglJMemWab171rx
 iuludcpd3vLftDwWk+capaVB75ERVeZTDnF3ykl5C6XVV92NdPJLgcz851sPcHsFoU82qT
 7QBBDP3POGBVMwVlqav6+oJpvR/HxceD6mtqMXCU13+k/64baRvpvTvT7erCO3/4DJdOaL
 lDLfjtVnYeCDiLJ/XMicqQUKqcNlYMo/4g+ZMFlUBu1/rw1d9qJKGL2HKU06bQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=JccBIApJ
Subject: Re: [Buildroot] [PATCH 1/1] DEVELOPERS: remove Jugurtha BELKALEM
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyMy8wNC8yMDI1IDE1OjI1LCBSYXBoYcOrbCBNw6lsb3R0ZSB2aWEgYnVpbGRyb290IHdy
b3RlOgo+IEp1Z3VydGhhJ3MgZW1haWwgYWRkcmVzcyBpcyBib3VuZGluZzoKPiAKPiAgIDU1MCA1
LjEuMSBUaGUgZW1haWwgYWNjb3VudCB0aGF0IHlvdSB0cmllZCB0byByZWFjaCBkb2VzIG5vdCBl
eGlzdC4gUGxlYXNlIHRyeSBkb3VibGUtY2hlY2tpbmcgdGhlIHJlY2lwaWVudCdzIGVtYWlsIGFk
ZHJlc3MgZm9yIHR5cG9zIG9yIHVubmVjZXNzYXJ5IHNwYWNlcy4KPiAKPiBSZW1vdmUgaXQgZnJv
bSB0aGUgREVWRUxPUEVSUyBmaWxlIHNvIHRoYXQgdXRpbHMvZ2V0LWRldmVsb3BlcnMKPiBkb2Vz
bid0IHNlbmQgZW1haWxzIHRvIG5vbi1leGlzdGVudCBhZGRyZXNzZXMuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJlPgoKICBBcHBs
aWVkIHRvIDIwMjUuMDIueCwgdGhhbmtzLgoKICBSZWdhcmRzLAogIEFybm91dAoKPiAtLS0KPiAg
IERFVkVMT1BFUlMgfCA5IC0tLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDkgZGVsZXRpb25z
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCj4gaW5kZXggNmM3
MWFhY2M1ZS4uYTY5MmE5Nzc5YyAxMDA2NDQKPiAtLS0gYS9ERVZFTE9QRVJTCj4gKysrIGIvREVW
RUxPUEVSUwo+IEBAIC0xNzY4LDE1ICsxNzY4LDYgQEAgRjoJcGFja2FnZS91bmNsdXR0ZXIteGZp
eGVzLwo+ICAgTjoJSm9zaHVhIEhlbmRlcnNvbiA8am9zaHVhLmhlbmRlcnNvbkBtaWNyb2NoaXAu
Y29tPgo+ICAgRjoJcGFja2FnZS9xdDUvcXQ1d2F5bGFuZC8KPiAgIAo+IC1OOglKdWd1cnRoYSBC
RUxLQUxFTSA8anVndXJ0aGEuYmVsa2FsZW1Ac21pbGUuZnI+Cj4gLUY6CXBhY2thZ2UvYmNjLwo+
IC1GOglwYWNrYWdlL3B5dGhvbi1haW9maWxlcy8KPiAtRjoJcGFja2FnZS9weXRob24tY3JheW9u
cy8KPiAtRjoJcGFja2FnZS9weXRob24tY3ljbGVyLwo+IC1GOglwYWNrYWdlL3B5dGhvbi1tYXRw
bG90bGliLwo+IC1GOglwYWNrYWdlL3B5dGhvbi1vcGN1YS1hc3luY2lvLwo+IC1GOglwYWNrYWdl
L3B5dGhvbi1waWV4aWYvCj4gLQo+ICAgTjoJSnVoYSBSYW50YW5lbiA8anVoYUBjb2RlcmNvZGVk
LmNvbT4KPiAgIEY6CXBhY2thZ2UvYWNzY2NpZC8KPiAgIAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
