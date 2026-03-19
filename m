Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B47891090223
	for <buildroot@archiver.kernel.org>; Thu, 19 Mar 2026 13:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69765841D9;
	Thu, 19 Mar 2026 13:00:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n9FiF-3YUfEY; Thu, 19 Mar 2026 13:00:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BCA1841DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773925220;
	bh=u5bBcRu5MZRRhXpAvePGUUm5QTkaUp4WAcerQbfzIog=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=evKAbudSs3l7qyaXGWc//cYv9Ij9t6anZSxl5IYLemeS98lzaa/tTY4bpNeRyvQJy
	 +tb5dTuYeJEnh2sQmMzm3GGuHWmXAf35CRYGa0y3Jhapf8tOkYhnD6VY8T8ichaorV
	 l/BfwXyPg1s3AXOWUFcN9lI5rXo+6v8RLZNnRTh07dKvUc2gIUjElSJWbyBQ/92PJ1
	 UeO0telZEQMKE0N113mtIaWSHJOFsqjs6iZZFYre1LdUF7AYsXbwDvCVqx1gU38XQ7
	 8zLiEnsINxAEiTerj2Qy3bLw6XCunIRH7uwPJPPhMtsFunwMYUdpMqdaZG3FRoS6Td
	 GZUk46NfRTztg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BCA1841DA;
	Thu, 19 Mar 2026 13:00:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B92A1BD
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 13:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41355841DA
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 13:00:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wBbOeSVugbN9 for <buildroot@buildroot.org>;
 Thu, 19 Mar 2026 13:00:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 362E7841D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 362E7841D9
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 362E7841D9
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 13:00:17 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-48540d21f7dso9943205e9.0
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 06:00:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773925215; x=1774530015;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=p7FDLHK+hWZ0S5zRxhwdvwlaYg8D3CrHA0Hq37mnjPk=;
 b=HSG4XeDHiFZazMOsMuv+ZwDotX/dXWwbGZN5qhpGyCjXWiSDv6Xr7P+0u8zpAq+gTS
 ojO+46dBXsTXvA7T4Aww/LYlDcX4+ibymS5Qs5tT5+ZXa2Ex7X/ySRNfT7NixR3z84/a
 tRhTZhd9cHJefR42E+MuLx2wsyrbVwQJeXuIvZwwr4E4lweJiwAxcZ8G8RnC5TsAb9pQ
 LC/We6aYaa+d9p3EDWHNe1ZmD8QrRCXOPrpv8ssNUcXboqlfldHlIp/S4fGOg7bXnpIj
 8zt+hku3ZH5WFpbhEHL7AfWjs6fY/7UrOBHypsxgNFYrc1Ac05Dc5cercZuN6LoUM5ql
 Mjtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVM+rKz/AcVZFlMMQQa3WmOJfTjLkBRGM2JRUSikw6QzTWATQhVp3sdMxtbVYRMkPaquFqPvicwuDQ=@buildroot.org
X-Gm-Message-State: AOJu0YxIisDyzqobviA90D1V3DR0O3tQHRndWo5XkLAeQS8xflhQpA9M
 m46lqWVOLtP/51D3Y8RAY0NjTeCvPeDcO0IkHEvec9SX6HbdOZEdn/YIywrUiyTcT9fXTUNLyN3
 W+kANDrU=
X-Gm-Gg: ATEYQzygvPrR/tbUo6lry6o4zWMxwc3jl+nVc24IldDCTzgdMLLKd+vhZlR7dsqkUPR
 zKh9HglyFS25xrB73W1AbWXnjTfqvblFFBurwrEqFSWcIWn4UEpw0vMb55pYabgpksXZ3yZWKqR
 KctbSHQGeCaDOePCuOOD7boCslLWCD4QkhHN9UEDz/tiig3q9F8pm6lGMUZnNUc04CAxZLuqz4W
 XNd474VjDVtlagkVN2fmrwTLhUlqxgKmmrHmEa6dfLzafXLZ+IgiXct9Xhx95v8hM112idHxArR
 KnrOxuJSZFT3+SYC38GLi506PoVM1T7eSaKQ4h4M3C7E+X/Wy0WJKa6x77BUvoQ6difOSo0+Whi
 a4aLR+modwDQz/pywyPsU4QEQDNa9fy4t3iMAlYyGPRjwJ2xqWryMo8HhIOFn7r1w4Wua0fzmsw
 3EvDMicilKIAauNgU=
X-Received: by 2002:a05:6000:2011:b0:439:b744:c5fe with SMTP id
 ffacd0b85a97d-43b527ccb15mr12007468f8f.52.1773925215255; 
 Thu, 19 Mar 2026 06:00:15 -0700 (PDT)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b518a3e3csm14864501f8f.35.2026.03.19.06.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2026 06:00:14 -0700 (PDT)
To: Martin Willi <martin@strongswan.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 19 Mar 2026 14:00:13 +0100
Message-ID: <20260319130014.120393-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <36f45eeb35bb33fa068060c77ba22b06fc34550a.camel@strongswan.org>
References: <36f45eeb35bb33fa068060c77ba22b06fc34550a.camel@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1773925215; x=1774530015; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p7FDLHK+hWZ0S5zRxhwdvwlaYg8D3CrHA0Hq37mnjPk=;
 b=bt455uDk4LTNSCbBqbWYPrC+KRUdh7SI2yRfFZui7tWIwoyxDqQYSsLSXsZewirj5z
 w6yKSXjEVsbe6Mb2uqEc2n3YS0lI7UpP6vBnwWq0+CjJUhTo2c3SrSPlnWALQi9eqoVr
 aXD2pn6P8JmGQXgbg62uHBdK1RSF7EDcTsUFq7X6WT1JICrnXvkztU8INGkPSjspaU8v
 7UmCoCU4dI4/NojFug3kGmase85IdFuCK7FJ0vNWOVeiV0B4smyhVY+geyG8G1BwHJVL
 qvKQN0hN+lfefR4pwvAiojUOvQcgjjg8NBP/LOxIy6PUYXFXE6J2fJBbytC6Wp2+wUNE
 AqZw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=bt455uDk
Subject: Re: [Buildroot] [PATCH v2 8/8] utils/generate-cyclonedx: add hashes
 from .hash files to externalReferences
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTWFydGluLAoKSW4gcmVwbHkgb2Y6Cj4gSGkgVGhvbWFzLAo+IAo+ID4gPiArwqDCoMKgIHBh
dGggPSBicnBhdGggLyBjb21wWyJwYWNrYWdlX2RpciJdIC8gZiJ7cGtnbmFtZX0uaGFzaCIKPiA+
IAo+ID4gQnkgdXNpbmcgdGhpcyBwYXRoIHlvdSB3aWxsIG1pc3Mgc29tZSBzcGVjaWFsIGNhc2Vz
IGZvciB0aGUgaGFzaAo+ID4gZmlsZXMuIFsuLi5dIFlvdSBzaG91bGQgZmlyc3QgZXhwb3NlIHRo
ZSBoYXNoIGZpbGVzIGZyb20gdGhlIHNob3cKPiA+IGluZm8gb3V0cHV0Cj4gCj4gVGhhbmtzIGZv
ciB0aGUgc3VnZ2VzdGlvbiwgbWFrZXMgc2Vuc2UuIEkndmUgaW50ZWdyYXRlZCB0aGlzIGFwcHJv
YWNoCj4gd2l0aCBBcm5vdXQncyBhZGRpdGlvbiBhbmQgaXQgc2VlbXMgdG8gd29yayBmaW5lLgo+
IAo+IFdoYXQgaXMgYSB3YXkgZm9yd2FyZCB3aXRoIHRoaXMgYW5kIHRoZSBvdGhlciBzZXJpZXMg
WzFdPwo+IAo+ICAqIEFyZSB0aGVyZSBjb250cm92ZXJzaWFsIHBhcnRzIEkgc2hvdWxkIGRyb3A/
CgpGb3IgdGhlIGZpcnN0IHNlcmllcyBwZXJzb25uYWx5LCBJIHdvdWxkIG5vdCBpbmNsdWRlIGB1
dGlscy9nZW5lcmF0ZS1jeWNsb25lZHg6CmFkZCBvcHRpb24gdG8gY29udHJvbCBwYXRjaCBkaWZm
IGluY2x1c2lvbiBpbiBTQk9NYCAmCmB1dGlscy9nZW5lcmF0ZS1jeWNsb25lZHg6IGFsbG93IHJl
ZmVyZW5jaW5nIHBhdGNoZXMgYnkgdXBzdHJlYW0gVVJMYCBJIGFncmVlCndpdGggdGhlIGNvbW1l
bnRzIGZyb20gRmlvbmEsIHRoZSBgVXBzdHJlYW06YCB0cmFpbGVyIGlzIHVzZWQgdG8gcmVwcmVz
ZW50IG5vdApvbmx5IHRoZSBwYXRjaCBjb250ZW50LgoKVGhlIHNwZWMgZGVmaW5lcyB0aGUgYHVy
bGAgcHJvcGVydHkgb2YgdGhlIHBhdGNoZXMgbGlrZSB0aGUgZm9sbG93aW5nOgoKIlNwZWNpZmll
cyB0aGUgVVJMIHRvIHRoZSBkaWZmIgoKV2hlbiBJIHVzZSB0aGUgYFVwc3RyZWFtOmAgdHJhaWxl
ciBzb21ldGltZSBJIHJlZmVyZW5jZSB0aGUgZGlmZiBkaXJlY3RseSB0aGF0CmNhbiBiZSBkaXJl
Y3RseSBkb3dubG9hZGVkIG9yIHNvbWV0aW1lIHRoZSBncmFwaGljYWwgY29tbWl0IGhhc2ggZnJv
bQpnaXRodWIvZ2l0bGFiLy4uLgoKVG8gbW92ZSBmb3J3YXJkIHdpdGggdGhpcyBmZWF0dXJlIEkg
dGhpbmsgaXQgd291bGQgYmUgbmljZSB0byBmaXJzdCBiZXR0ZXIKZGVmaW5lIHdoYXQgdGhlIGBV
cHN0cmVhbTpgIHRyYWlsZXIgbmVlZHMgdG8gcmVmZXJlbmNlIGluIHRoZSBkb2MuIFRoZW4gaGF2
ZQpzb21lIGtpbmQgb2YgYW5hbHlzaXMgb2YgdGhlIGN1cnJlbnQgc3RhdGUgb2YgdGhvc2UgdGFn
cy4gSG93IG1hbnkgYXJlIGxpbmtlZApkaXJlY3RseSB0byB0aGUgZGlmZiBvciBjb3VsZCBiZSBm
aXhlZCwgaG93IG1hbnkgYXJlIGxpbmtlZCB0byBhbiBpc3N1ZS9NTCwgaG93Cm1hbnkgYXJlICJO
L0EiLgoKUmVnYXJkaW5nIHRoaXMgc2VyaWVzIHdpdGggdGhlIGFkZGl0aW9uYWwgbWV0YWRhdGEs
IEkgdG90YWxseSB1bmRlcnN0YW5kIHRoZQpuZWVkcyB0byBhbGwgdGhvc2UgbmV3IG1ldGFkYXRh
IGJ1dCBJJ20gd29uZGVyaW5nIGlmIHRoZXJlIGlzbid0IGEgYmV0dGVyIHdheQp0byBhZGQgc29t
ZSBvZiB0aGUgbWV0YWRhdGEgaW5mb3JtYXRpb24gd2l0aG91dCBhZGRpbmcgdG8gbWFueSBDTEkg
b3B0aW9ucy4KTWF5YmUgc29tZSBTQk9NIHRlbXBsYXRlIHlvdSBjYW4gcGFzcyB3aXRoIHRoZSBi
YXNpYyBpbmZvcm1hdGlvbjogdmVyc2lvbiwKc2VyaWFsTnVtYmVyLCBtYW51ZmFjdHVyZXIgaW5m
b3JtYXRpb24uIE15IG1haW4gY29uY2VybiBpcyB0aGF0IHdlIGtlZXAgYWRkaW5nCm5ldyBDTEkg
b3B0aW9ucyBmb3IgZXZlcnkgc2luZ2xlIHByb3BlcnR5IHdlIHdhbnQgdG8gYWRkIGFuZCB0aGF0
IHNvbWUgb3B0aW9ucwptaWdodCBiZSBub3Qgc2VlbiBhbW9uZyBhbGwgdGhvc2Ugb3B0aW9ucy4K
Ckkgd2lsbCBhZGQgc29tZSBjb21tZW50cyB0byB0aGUgZGlmZmVyZW50IGVudHJpZXMgb2YgdGhh
dCBzZXJpZXMuCgo+ICAqIFNoYWxsIEkgcmViYXNlICBvbiB0b3Agb2YgeW91ciBDeWNsb25lRFgg
MS43IHBhdGNoZXM/CgpJIGRvbid0IGtub3cgSSBzdGlsbCBuZWVkIHRvIHJlYmFzZSBpdCBvbiBt
YXN0ZXIgd2l0aCB0aGUgbGFzdCBjaGFuZ2VzLiBJZgpuZWVkZWQgSSBjYW4gZm9yIHN1cmUgYWRk
IHlvdXIgY2hhbmdlcyBvbiB0b3Agb2YgbWluZSBpZiB5b3UgZG9uJ3Qgd2FudCB0bwpib3RoZXIg
cmViYXNpbmcuCgpJbiB0aGUgbWVhbnRpbWUgSSB3b3VsZCBhcHByZWNpYXRlIGlmIHlvdSBjb3Vs
ZCBnaXZlIGl0IGEgcmV2aWV3LgoKTGV0IG1lIGtub3cgd2hhdCB5b3UgdGhpbmsuCkJlc3QgcmVn
YXJkcywKUEVSQUxFIFRob21hcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
