Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F26C27C52
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 19:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 029524179F;
	Thu,  6 Jun 2024 19:40:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OwQkwY4zXGiB; Thu,  6 Jun 2024 19:40:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC1DD41888
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC1DD41888;
	Thu,  6 Jun 2024 19:40:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9CD6E1BF57B
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 19:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9427E40360
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 19:40:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S4ywuwq0WKPv for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 19:40:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4448B40322
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4448B40322
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4448B40322
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 19:40:21 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4215b0c4b7dso14093325e9.0
 for <buildroot@buildroot.org>; Thu, 06 Jun 2024 12:40:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717702820; x=1718307620;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oU0TUxksNO7oUBkT2/wA0+QO20EU+dnSJPgwCmJRQ5E=;
 b=n4kApn+46K8F3E1vGuVhThAyOTIKokZ4wWCIYhOQ3NsdhzEAEFB8M+YxzuJSXDS4kz
 Y+ehaZfbcy7oIW3v706yA0bsvqXAZbBSay6EyZC/+4ygG7EUIwXtdlasqzMMPD5NXtqN
 wE3ezkuRrm95R77lQ8N+/IEUEuYmfK8f0kWD3KMm03l11Erm51aSs7EoE9JRNGhT9Ytu
 uedk6XjagfGEYYdrZMhzHrETscnQRes/JlZz6D1p+CM9SohBkvh1qyOv7EUAyMHdYYd+
 D4hidN05ahlwdSxWaCcDBucfvuSTxPoHYYyCe+tQrI9e6TQfwW7Axf3gpMZpsD4Z9b9z
 tz/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfBQGXffCIudTKvLSWV+u6Ift8MO16DEtnHp/WxDIC+A/DVHKJdnKXOzsfHse9Vgp8BSgKpLSwK4CuifcRCsFI3XZ6h/yxPw==
X-Gm-Message-State: AOJu0YzK8PqxCbU2D5fVdFYA5MOdLDfn3Gvdxg6JdA90PYPreSmQi9dn
 ePix8DhxVZ1RcRSqePzgNVLG3tdARMn6V9dULJhBTpwI3lEoxRVhmaKe+k/0/IA=
X-Google-Smtp-Source: AGHT+IGIByk/yo+su2GenqFRQUcSrzBqGQyX2UlFkAdZsZ9STudR2GC7E+bAldZWNORKNMTkmbQSpQ==
X-Received: by 2002:a05:6000:511:b0:355:230:e2d3 with SMTP id
 ffacd0b85a97d-35efed3f914mr422232f8f.20.1717702819723; 
 Thu, 06 Jun 2024 12:40:19 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5e99123sm2301861f8f.85.2024.06.06.12.40.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jun 2024 12:40:19 -0700 (PDT)
Message-ID: <5de715e1-531d-462c-9b8c-71fa0139082d@mind.be>
Date: Thu, 6 Jun 2024 20:48:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bryan Brattlof <bb@ti.com>, buildroot@buildroot.org
References: <20240508-clk-fix-backport-v1-0-92b8e66fcac7@ti.com>
 <20240531113213.GA3595244@theia>
Content-Language: en-GB
In-Reply-To: <20240531113213.GA3595244@theia>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1717702820; x=1718307620; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oU0TUxksNO7oUBkT2/wA0+QO20EU+dnSJPgwCmJRQ5E=;
 b=IlJLJ97+DKMjN0AuZcLVqJzCZ17AJ+KFnIZNpSEpSpRetCBbPhehZiVx56I3GmO9J+
 mxGbsG5F91Ea+PcnlivtGCvNE3ohatsLPr8Cc+KZZ4xLGJX6jvnuMP0GCOoG0bpOIMOi
 CXBAxfORytGZoyLHgWEQqCwe1o0Fzsq0hkdxHrcXhYl9VCvlOP6gStg67hf0FMD9+qHb
 kETw8QQSqzHYZ0VmOjzPCMMnoDhMRg7blhGaGBfDBegiAynTTZOnATZXtHgZX9u/M7ns
 qOgSBJuWjA0ptJzZYAYPQ0fF+zQ8aAVPNYSxbGraD5YbEChzsXxgPZX0nJRTRvYHjtP6
 uvPg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IlJLJ97+
Subject: Re: [Buildroot] [PATCH 0/2] board/ti: manually backport Linux patch
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAzMS8wNS8yMDI0IDEzOjMyLCBHZXJvIFNjaHfDpHJpY2tlIHZpYSBidWlsZHJvb3Qgd3Jv
dGU6Cj4gSGkgQnJ5YW4sCj4gCj4gdGhhbmtzIGZvciB0aGUgcGF0Y2g6IEkgaW5kZWVkIGhhZCB0
aGlzIGlzc3VlIHdpdGggdGhlIGxvZyBzcGFtIGFuZCB0aGUKPiBwYXRjaCBmaXhlZCBpdC4KPiAK
PiBUZXN0ZWQtYnk6IEdlcm8gU2Nod8Okcmlja2UgPGdlcm8uc2Nod2Flcmlja2VAZ3JhbmRjZW50
cml4Lm5ldD4KCiAgUGF0Y2h3b3JrIGRpZG4ndCBwaWNrIHRoaXMgdXAsIHNvIEkgYWRkZWQgaXQg
bWFudWFsbHkuCgo+IAo+IEhvd2V2ZXIsIEkgdGhpbmsgdGhpcyBwYXRjaCBtaWdodCBiZSBhIGJp
dCB0b28gY2h1cm4teSB0byBiZSBtZXJnZWQ6IFRoZQo+IDYuOCBrZXJuZWwgaXMgYWxyZWFkeSBF
T0wgWzFdIGFuZCBpdCdzIG1lcmdlZCBpbiA2LjkgWzJdLiBJIHN1Z2dlc3Qgd2UKPiBpbnN0ZWFk
IGJ1bXAgdGhlIGtlcm5lbCB2ZXJzaW9uIGluIHRpX2FtNjJ4X3NrX2RlZmNvbmZpZyBhbmQKPiB0
aV9hbTY0eF9za19kZWZjb25maWcgb25jZSA2LjkgaXMgaW4gYnVpbGRyb290LgoKICA2LjkgaXMg
c3RpbGwgbm90IGluIEJ1aWxkcm9vdCBhbmQgd2UncmUgaW4gdGhlIC1yYyBwZXJpb2QsIHNvIEkg
YXBwaWVkIHRoZXNlIAphZnRlciBhbGwuCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IAo+IFsxXSBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1rZXJuZWwtYW5ub3VuY2UvMjAyNDA1MzAwODEw
NDMucmVsZWFzZS02LjguMTJAa2Rpc3QubGludXgua2VybmVsLm9yZy9ULwo+IFsyXSBnaXQgdGFn
IC0tY29udGFpbnMgIjovY2xrOiBrZXlzdG9uZTogc2NpLWNsazogQWRkaW5nIHN1cHBvcnQgZm9y
IG5vbiBjb250aWd1b3VzIGNsb2NrcyIKPiAgICAgIHY2LjEwLXJjMQo+ICAgICAgdjYuOQo+ICAg
ICAgdjYuOS1yYzEKPiAgICAgIHY2LjktcmMyCj4gICAgICB2Ni45LXJjMwo+ICAgICAgdjYuOS1y
YzQKPiAgICAgIHY2LjktcmM1Cj4gICAgICB2Ni45LXJjNgo+ICAgICAgdjYuOS1yYzcKPiAKPiBC
ZXN0LAo+IEdlcm8KPiAKPiBPbiBUaHUsIE1heSAwOSwgMjAyNCBhdCAwOTo0OToyNkFNIC0wNTAw
LCBCcnlhbiBCcmF0dGxvZiB2aWEgYnVpbGRyb290IHdyb3RlOgo+PiBIZWxsbyBldmVyeW9uZSwK
Pj4KPj4gVGhpcyBzaG9ydCBzZXJpZXMgYmFja3BvcnRzIGEga2VybmVsIGNsb2NrIGRyaXZlciBm
aXggdG8gcmVkdWNlIGEgZmFpcgo+PiBhbW91bnQgb2YgbG9nIHNwYW0gd2hlbiB1c2luZyBuZXdl
ciBETSBhbmQgRE1TQyBmaXJtd2FyZXMgdXNlZCBpbiBhbGwKPj4gVEkncyBLMyBkZXZpY2VzLiBU
aGUgZml4IGlzIGFscmVhZHkgbWVyZ2VkIGFuZCBpbiB0aGUgdjYuOS1yY1ggY3ljbGVzCj4+IHRo
b3VnaCB3aGlsZSB3ZSB3YWl0IGZvciB0aGUgdjYuOSBrZXJuZWwgcmVsZWFzZSwgYmFja3BvcnQg
dGhpcyBmaXguCj4+Cj4+IFRoYW5rIHlvdSBmb3IgcmV2aWV3aW5nCj4+IH5Ccnlhbgo+Pgo+PiBT
aWduZWQtb2ZmLWJ5OiBCcnlhbiBCcmF0dGxvZiA8YmJAdGkuY29tPgo+PiAtLS0KPj4gQnJ5YW4g
QnJhdHRsb2YgKDIpOgo+PiAgICAgICAgYm9hcmQvdGkvYW02NHgtc2svcGF0Y2hlcy9saW51eDog
YmFja3BvcnQgbGludXggY2xvY2sgZml4Cj4+ICAgICAgICBib2FyZC90aS9hbTYyeC1zay9wYXRj
aGVzL2xpbnV4OiBiYWNrcG9ydCBsaW51eCBjbG9jayBmaXgKPj4KPj4gICAuLi5lLXNjaS1jbGst
QWRkaW5nLXN1cHBvcnQtZm9yLW5vbi1jb250aWd1by5wYXRjaCB8IDc0ICsrKysrKysrKysrKysr
KysrKysrKysKPj4gICAuLi5lLXNjaS1jbGstQWRkaW5nLXN1cHBvcnQtZm9yLW5vbi1jb250aWd1
by5wYXRjaCB8IDc0ICsrKysrKysrKysrKysrKysrKysrKysKPj4gICAyIGZpbGVzIGNoYW5nZWQs
IDE0OCBpbnNlcnRpb25zKCspCj4+IC0tLQo+PiBiYXNlLWNvbW1pdDogYzM3ZTk4ZjQ4NmUxZjky
MDFkMGZmOTFkOWU4MTY2ODQ5YWU0MjJhYwo+PiBjaGFuZ2UtaWQ6IDIwMjQwNTA4LWNsay1maXgt
YmFja3BvcnQtMWU2MjUyOGYwZjMzCj4+Cj4+IEJlc3QgcmVnYXJkcywKPj4gLS0gCj4+IEJyeWFu
IEJyYXR0bG9mIDxiYkB0aS5jb20+Cj4+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPj4gYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKPj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
