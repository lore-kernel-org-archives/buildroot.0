Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1815C433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Mar 2022 21:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AABCF41924;
	Thu, 17 Mar 2022 21:05:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uLIbRPCewvet; Thu, 17 Mar 2022 21:05:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8B624191A;
	Thu, 17 Mar 2022 21:05:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 12F291BF315
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 21:05:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0007360B38
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 21:05:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QtclIBikzPT6 for <buildroot@lists.busybox.net>;
 Thu, 17 Mar 2022 21:05:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A906860A7B
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 21:05:02 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id d10so13239534eje.10
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 14:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=alANgOJVgRsSRmwEx+3XU9D9fvFYCrf1B5I17r5WslM=;
 b=Gbi0z/voszt5D4M1yw75144YR1aujvSIxAjGuHsAFXQR0iCHv3c2JHQN0R0K9+ZFNr
 I3vRlufnLD9GDhgE+WWUeOhCOPkswJ88v6f1gUvjhlux0BjgQV5hv1MUTpQdpRdjhKe7
 8i72Qg/ZQJag1DOeHPvualHuw0jmjraKTnmNTzFjdTBUsMCAWDVluqJwInar9A4cyens
 nEA+cIbeG+Y6NIT+CiwaQUVpC+vhpK8zONjO+4UAREy6OvhXQ7+z4sRSoq5OxBI6V7Zm
 WeSKvrT663zeHVCibxiujE8VSy9wxbruVH2r0pjy247oAuLGh91zoYRSsye7Qoh9ZFGl
 5d6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=alANgOJVgRsSRmwEx+3XU9D9fvFYCrf1B5I17r5WslM=;
 b=v0ravAycWgSF2yeQXo5LiS+EH1crbj6q9Kirvc0A6qKjdb5+59NLo4ub7KtlzDm+wt
 c7wB9PtktS/98XSZrG2nzq3cZLSM+2NYJkYfTivmuzD1zwrB9FBDYhoUeALZ0p94k2b+
 Ddt6KDcKaHnSt2peQ+BbSTE6JAbVmbR4m0KbFwGXx6RVEEIHSAoobfsbXfyzN2idjAiY
 11A57dWi4HjlljcNfuQJleX/8Ts9ek4GN7tLgKBuDYXqBS8cuvlhh3xBDHa66K2/hiUu
 KZ5Tj/aiwcfMLB30VMD+vgWcWiiMuoddOJgXwZJtQcIoSxfEyafvIX6dsJaHHmxeNdVk
 5zIQ==
X-Gm-Message-State: AOAM5303uYKWCMWlvvl1EhsWqFSteBCGb7GQYXgubJ6kcRHZ3L2ESiMb
 qztGlfsEkUXbJ/M241wt7vUyiw==
X-Google-Smtp-Source: ABdhPJyRaQlFe/Ah8FRYl2qWGjB3j7fHtWbXPboMMX/HBz86dTjYMJfqJQ1uw+JO/mR8mfsr93SO+Q==
X-Received: by 2002:a17:907:72d0:b0:6db:4788:66a9 with SMTP id
 du16-20020a17090772d000b006db478866a9mr6564047ejc.516.1647551100845; 
 Thu, 17 Mar 2022 14:05:00 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 h17-20020a05640250d100b004185745f856sm3238174edb.74.2022.03.17.14.05.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 14:05:00 -0700 (PDT)
Message-ID: <9fd77043-72b7-d337-d871-76918570ef35@mind.be>
Date: Thu, 17 Mar 2022 22:04:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Sourabh Hegde <hrsourabh011@gmail.com>, buildroot@buildroot.org
References: <CADYjeSuE2XuTiRYno_TJ=2RmJxjeSSca=Lx8vc5iYfhNRkx44Q@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CADYjeSuE2XuTiRYno_TJ=2RmJxjeSSca=Lx8vc5iYfhNRkx44Q@mail.gmail.com>
Subject: Re: [Buildroot] How to run sshd deamon with read-only fs?
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxNy8wMy8yMDIyIDE1OjQ1LCBTb3VyYWJoIEhlZ2RlIHdyb3RlOgo+IEhlbGxvIEFsbCwK
PiAKPiBJIGFtIGZhY2luZyBhbiBpc3N1ZSB3aGlsZSBydW5uaW5nIE9wZW5TU0ggZGVtb27CoGlu
IEJ1aWxkcm9vdCAyMDIyIHJlbGVhc2UuCj4gCj4gVGhlIG91dHB1dCBvZiAic3lzdGVtY3RsIHN0
YXR1cyBzc2hkIiByZXN1bHRzIGluCj4gCj4gc3NoZC5zZXJ2aWNlIC0gT3BlblNTSCBzZXJ2ZXIg
ZGFlbW9uCj4gIMKgIMKgIMKgTG9hZGVkOiBsb2FkZWQgKC91c3IvbGliL3N5c3RlbWQvc3lzdGVt
L3NzaGQuc2VydmljZTsgZW5hYmxlZDsgdmVuZG9yIHByZXNlCj4gIMKgIMKgIMKgQWN0aXZlOiBm
YWlsZWQgKFJlc3VsdDogZXhpdC1jb2RlKSBzaW5jZSBUdWUgMjAyMi0wMS0xOCAxMzoxNjowMyBV
VEM7IDltaW4KPiAgwqAgwqAgUHJvY2VzczogMTcwMyBFeGVjU3RhcnRQcmU9L3Vzci9iaW4vc3No
LWtleWdlbiAtQSAoY29kZT1leGl0ZWQsIHN0YXR1cz0wL1NVQwo+ICDCoCDCoCBQcm9jZXNzOiAx
NzA0IEV4ZWNTdGFydD0vdXNyL3NiaW4vc3NoZCAtRCAtZSAoY29kZT1leGl0ZWQsIHN0YXR1cz0x
L0ZBSUxVUkUpCj4gIMKgIMKgTWFpbiBQSUQ6IDE3MDQgKGNvZGU9ZXhpdGVkLCBzdGF0dXM9MS9G
QUlMVVJFKQo+ICDCoCDCoCDCoCDCoCBDUFU6IDI3bXMKPiAKPiBKYW4gMTggMTM6MTY6MDIgYnIy
cmF1YyBzeXN0ZW1kWzFdOiBTdGFydGluZyBPcGVuU1NIIHNlcnZlciBkYWVtb24uLi4KPiBKYW4g
MTggMTM6MTY6MDMgYnIycmF1YyBzc2gta2V5Z2VuWzE3MDNdOiBzc2gta2V5Z2VuOiBnZW5lcmF0
aW5nIG5ldyBob3N0IGtleXM6Cj4gSmFuIDE4IDEzOjE2OjAzIGJyMnJhdWMgc3NoLWtleWdlblsx
NzAzXTogc3NoLWtleWdlbjogZ2VuZXJhdGluZyBuZXcgaG9zdCBrZXlzOgo+IEphbiAxOCAxMzox
NjowMyBicjJyYXVjIHNzaC1rZXlnZW5bMTcwM106IHNzaC1rZXlnZW46IGdlbmVyYXRpbmcgbmV3
IGhvc3Qga2V5czoKPiBKYW4gMTggMTM6MTY6MDMgYnIycmF1YyBzc2gta2V5Z2VuWzE3MDNdOiBz
c2gta2V5Z2VuOiBnZW5lcmF0aW5nIG5ldyBob3N0IGtleXM6Cj4gSmFuIDE4IDEzOjE2OjAzIGJy
MnJhdWMgc3lzdGVtZFsxXTogU3RhcnRlZCBPcGVuU1NIIHNlcnZlciBkYWVtb24uCj4gSmFuIDE4
IDEzOjE2OjAzIGJyMnJhdWMgc3NoZFsxNzA0XTogc3NoZDogbm8gaG9zdGtleXMgYXZhaWxhYmxl
IC0tIGV4aXRpbmcuCj4gSmFuIDE4IDEzOjE2OjAzIGJyMnJhdWMgc3lzdGVtZFsxXTogc3NoZC5z
ZXJ2aWNlOiBNYWluIHByb2Nlc3MgZXhpdGVkLCBjb2RlPWV4aXQKPiBKYW4gMTggMTM6MTY6MDMg
YnIycmF1YyBzeXN0ZW1kWzFdOiBzc2hkLnNlcnZpY2U6IEZhaWxlZCB3aXRoIHJlc3VsdCAnZXhp
dC1jb2RlJwo+IAo+ICMgcHMgYXV4IHwgZ3JlcCBzc2gKPiAgwqAgMjUzIHJvb3QgwqAgwqAgZ3Jl
cCBzc2gKPiAKPiBTbywgdGhlcmUgaXMgbm90IHNzaGQgZGVhbW9uwqBydW5uaW5nLiBBbmQgYWxz
byBubyBrZXkgZmlsZXMgcHJlc2VudCBpbiAvZXRjL3NzaC8KPiAKPiBJIHJhbiAiL3Vzci9iaW4v
c3NoLWtleWdlbiAtQSIgbWFudWFsbHkgYnV0IHRoaXMgZ2l2ZXM6Cj4gCj4gc3NoLWtleWdlbjog
Z2VuZXJhdGluZyBuZXcgaG9zdCBrZXlzOiBSU0EgQ291bGQgbm90IHNhdmUgeW91ciBwcml2YXRl
IGtleSBpbiAKPiAvZXRjL3NzaC9zc2hfaG9zdF9yc2Ffa2V5LlhYWFhVQkhBSXY6IFJlYWQtb25s
eSBmaWxlIHN5c3RlbQo+IHNzaC1rZXlnZW46IGdlbmVyYXRpbmcgbmV3IGhvc3Qga2V5czogRFNB
IENvdWxkIG5vdCBzYXZlIHlvdXIgcHJpdmF0ZSBrZXkgaW4gCj4gL2V0Yy9zc2gvc3NoX2hvc3Rf
ZHNhX2tleS5YWFhYcTBLaUlsOiBSZWFkLW9ubHkgZmlsZSBzeXN0ZW0KPiBzc2gta2V5Z2VuOiBn
ZW5lcmF0aW5nIG5ldyBob3N0IGtleXM6IEVDRFNBIENvdWxkIG5vdCBzYXZlIHlvdXIgcHJpdmF0
ZSBrZXkgaW4gCj4gL2V0Yy9zc2gvc3NoX2hvc3RfZWNkc2Ffa2V5LlhYWFhpYnliVFY6IFJlYWQt
b25seSBmaWxlIHN5c3RlbQo+IHNzaC1rZXlnZW46IGdlbmVyYXRpbmcgbmV3IGhvc3Qga2V5czog
RUQyNTUxOSBDb3VsZCBub3Qgc2F2ZSB5b3VyIHByaXZhdGUga2V5IGluIAo+IC9ldGMvc3NoL3Nz
aF9ob3N0X2VkMjU1MTlfa2V5LlhYWFh6STJKbkI6IFJlYWQtb25seSBmaWxlIHN5c3RlbQo+IAo+
IFllcywgSSBkbyBoYXZlIGEgUmVhZC1vbmx5IGZpbGUgc3lzdGVtLiBCdXQgaXMgaXQgbm90IHBv
c3NpYmxlIHRvIHdvcmsgd2l0aCBhIAo+IHJlYWQtb25seSBmaWxlc3lzdGVtIGFuZCBzc2g/Cgog
IEluZGVlZCwgc3NoIGRhZW1vbiB3aXRoIHJlYWRvbmx5IHJvb3RmcyByZXF1aXJlcyBzcGVjaWFs
IHRyZWF0bWVudC4gU29tZW9uZSAKaGFzIGdvbmUgdGhyb3VnaCB0aGUgZWZmb3J0IGZvciBkcm9w
YmVhciwgYnV0IG5vdCBmb3Igb3BlbnNzaC4KCiAgQmFzaWNhbGx5LCBob3cgaXQgaXMgc29sdmVk
IGZvciBkcm9wYmVhciBpczoKCi0gYnVpbGQgdGltZSwgY3JlYXRlIGEgc3ltbGluayBmcm9tIC9l
dGMvZHJvcGJlYXIgdG8gL3Zhci9ydW4vZHJvcGJlYXIgKC92YXIvcnVuIAppcyBhIHdyaXRlYWJs
ZSB0bXBmcykuCi0gcnVudGltZSwgaW4gdGhlIGluaXQgc2NyaXB0IGFuZCBpbiB0aGUgc3lzdGVt
ZCBzZXJ2aWNlIGZpbGUsIGNoZWNrIGlmIAovZXRjL2Ryb3BiZWFyIGlzIGEgc3ltbGluayB0byB0
bXBmcy4gSWYgeWVzLCB0cnkgdG8gcmVtb3ZlIHRoZSBzeW1saW5rLiBJZiB0aGF0IApzdWNjZWVk
cywgdGhlIHJvb3RmcyBpcyB3cml0ZWFibGUgYW5kIHRoZSBrZXlzIGNhbiBiZSBnZW5lcmF0ZWQg
dGhlcmUuIElmIHRoZSAKcmVtb3ZlIGZhaWxlZCwgdGhlIHN5bWxpbmsgaXMgc3RpbGwgdGhlcmUs
IGFuZCB0aGUga2V5IGdlbmVyYXRpb24gc3VjY2VlZHMuIElmIAppdCdzIG5vdCBhIHN5bWxpbmss
IHRoZSByb290ZnMgd2FzIG1vZGlmaWVkIHNvIGVpdGhlciBpdCdzIHdyaXRlYWJsZSwgb3IgdGhl
IAprZXlzIGFyZSBhbHJlYWR5IHRoZXJlIChvciB0aGV5J3JlIG5vdCBhbmQgdGhlcmUncyBub3Ro
aW5nIHdlIGNhbiBkbyBhYm91dCBpdCkuCgogIEZvciBvcGVuc3NoIGl0IHdpbGwgYmUgZXZlbiBt
b3JlIGNvbXBsaWNhdGVkLCBiZWNhdXNlIC9ldGMvc3NoZCBjb250YWlucyB0aGUgCmNvbmZpZyBm
aWxlIGFzIHdlbGwgYXMgdGhlIGtleXMuIFNvIHlvdSBwcm9iYWJseSBuZWVkIHRvIGNoYW5nZSB0
aGUgY29uZmlnIHRvIApwdXQgdGhlIGtleXMgaW4gYSBkaWZmZXJlbnQgcGxhY2UgYmVmb3JlIHlv
dSBjYW4gdXNlIHRoZSBzYW1lIHRyaWNrLgoKICBJZiB5b3UgbWFuYWdlIHRvIHNvbHZlIHRoaXMs
IHBsZWFzZSBzZW5kIGEgcGF0Y2ggdG8gdGhlIGxpc3QgZm9yIG90aGVycyB0byBlbmpveSEKCgog
IE9oLCBhbmQgdGhlIHVzdWFsIHNvbHV0aW9uIGlzIHRoYXQgeW91IGhhdmUgYSBkaWZmZXJlbnQg
cGFydGl0aW9uIHRoYXQgaXMgCndyaXRlYWJsZSwgYW5kIG1ha2UgL2V0Yy9zc2hkIGEgc3ltbGlu
ayB0byB0aGF0IGluIHRoZSByb290ZnMgb3ZlcmxheS4gQnV0IHlvdSAKc3RpbGwgaGF2ZSB0byBt
YWtlIHN1cmUgdGhlbiB0aGF0IHRoZSBkaXJlY3RvcnkgaXMgY3JlYXRlZCBpZiBpdCBkb2Vzbid0
IGV4aXN0IAp5ZXQsIGFuZCB5b3Ugc3RpbGwgaGF2ZSB0aGUgcHJvYmxlbSBvZiB0aGUgY29uZmln
IGZpbGUgYmVpbmcgaW4gdGhlIHNhbWUgCmRpcmVjdG9yeSBhcyB0aGUga2V5cy4KCgogIFJlZ2Fy
ZHMsCiAgQXJub3V0CgoKPiAKPiBJbiB0aGUgbWVudWNvbmZpZyBJIGhhdmU6Cj4gCj4gT3BlblNT
SC5QTkcKPiAKPiBDYW4gYW55b25lIHBsZWFzZSBsZXQgbWUga25vdyBpZiB0aGVyZSBpcyBhIHdv
cmthcm91bmQ/IElzIGNoYW5naW5nwqByb290ZnMgdG8gIAo+IHIvdyBpcyB0aGUgb25seSBzb2x1
dGlvbj8KPiAKPiBEb2VzIHNlbGVjdGluZyAiU3lzdGVtIENvbmZpZ3VyYXRpb24iLS0+InJlbW91
bnQgcm9vdCBmaWxlc3lzdGVtIHJlYWQtd3JpdGUgCj4gZHVyaW5nIGJvb3QiIHdpbGwgZG8gdGhl
IHRyaWNrPwo+IAo+IFlvdXIgaGVscCB3aWxsIGJlIG11Y2ggYXBwcmVjaWF0ZWQuCj4gCj4gVGhh
bmtzIGluIGFkdmFuY2UsCj4gCj4gLVNvdXJhYmgKPiAKPiAKPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
