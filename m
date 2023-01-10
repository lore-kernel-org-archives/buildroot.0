Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89EDAC54EBE
	for <buildroot@archiver.kernel.org>; Tue, 10 Jan 2023 12:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E54E812A5;
	Tue, 10 Jan 2023 12:33:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E54E812A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4wkN1GwyQvjB; Tue, 10 Jan 2023 12:33:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 289EF81263;
	Tue, 10 Jan 2023 12:33:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 289EF81263
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2AE361BF307
 for <buildroot@lists.busybox.net>; Tue, 10 Jan 2023 12:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0DBEF60596
 for <buildroot@lists.busybox.net>; Tue, 10 Jan 2023 12:33:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DBEF60596
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Ca6e1kNOV4w for <buildroot@lists.busybox.net>;
 Tue, 10 Jan 2023 12:33:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9CF3600B8
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E9CF3600B8
 for <buildroot@buildroot.org>; Tue, 10 Jan 2023 12:33:42 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id s5so17283463edc.12
 for <buildroot@buildroot.org>; Tue, 10 Jan 2023 04:33:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ib63EP3RW5rE+KrSDY2AW++WTF357RBdPxqdr9i+TsU=;
 b=yDvvwn9RFYxcLOaaIUAz8L7U+FcBMdn6IgzjmmRPQF/kSOW3y/Vyxqqsc7zJxIGQej
 q/FpOIEAfKLwH00i3zzaORc4a822+RDlJ8584qX/3jnzQu6NGSenvzm1Gudev7s52Fpx
 kKYxCsmzjoWBa3yenYh+UOBE7Hj4FL18zL9iLydzm6DpXUvT1FM91ZNQmzAg3tnO2DQt
 77NCoxLc4dCoQSNS1MSoyQinITwbvSoTyNE3GB+zbjJtqgxMmuxu6r68VoJZhuYXi/pq
 3kF6w4PGZzqRkYOsT7T0rA7MMqv4JnvpfnqIh6bhE9zohGPXri4SXLvlQYsFrNuZ/s9p
 arVA==
X-Gm-Message-State: AFqh2kqj444RdjaYqrcy07F3N+90iMji70XLAuSNGuw1HIXoPtCedEqu
 snGJVzOVqa/S3jP7C1XwQ7/g54+QiLMhsgBv4rM=
X-Google-Smtp-Source: AMrXdXvpmGHs10vRlP9S142SgKZo9BzfGiZVRUSwxs6ydrMUTkOe+QB3PnYd0GA51VaRhDsj/VJq48K/q/NzpFDDq8Y=
X-Received: by 2002:a05:6402:378b:b0:499:bd67:c68f with SMTP id
 et11-20020a056402378b00b00499bd67c68fmr618099edb.177.1673354021204; Tue, 10
 Jan 2023 04:33:41 -0800 (PST)
MIME-Version: 1.0
References: <20221128175851.1913859-1-james.hilliard1@gmail.com>
 <20221128175851.1913859-4-james.hilliard1@gmail.com>
In-Reply-To: <20221128175851.1913859-4-james.hilliard1@gmail.com>
From: Gilles Talis <gilles.talis@gmail.com>
Date: Tue, 10 Jan 2023 13:33:29 +0100
Message-ID: <CAKcgs2y4yPR1=zDuSdJt5aVeGAnTgfA1JY2hGHz=vZy6rbiKAQ@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ib63EP3RW5rE+KrSDY2AW++WTF357RBdPxqdr9i+TsU=;
 b=i9vxh/jJ/5QBQ2jC5Oj9G686eO1VHmoYgS+fBb/SZfFhgQlkgGZdMjbJO/8fZq+L9V
 /b22H3aNdxf5olK+5Uv7GJZ1DAeNQ1d6k6uGSp4EBFyq0qBBkAVllURs2R2K1YLI/INE
 CHf5b6GVt7R51KJHqda8Fu/knnsH1tm8JhuDYag6yOQ1JvmdMAtejgEX2+Yd1k8FGmCp
 +eDWF0VjxP5W/GhdxQGd9/kpZzb2UTxueXdOS749oFx4qNigMwWAaORKNtvVQnQXg4/X
 kRGdBF8MKsFrpUJb/Uo1AIh2W0uLj2mOpO6vL1kOkDQsJsAafyBQVj6WzaGNqAI8n8NZ
 zLlQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=i9vxh/jJ
Subject: Re: [Buildroot] [PATCH v2 4/8] package/gemmlowp: new package
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
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSmFtZXMsIEhpIFN0ZWZhbiwKCkxlIGx1bi4gMjggbm92LiAyMDIyIMOgIDE4OjU5LCBKYW1l
cyBIaWxsaWFyZAo8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4gYSDDqWNyaXQgOgo+Cj4gRnJv
bTogU3RlZmFuIEhhZ2VyIDxzdGVmYW4uaGFnZXJAZ2luemluZ2VyLmNvbT4KPgo+IFRoaXMgcGFj
a2FnZSBpcyByZXF1aXJlZCBieSB0ZW5zb3JmbG93LWxpdGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBT
dGVmYW4gSGFnZXIgPHN0ZWZhbi5oYWdlckBnaW56aW5nZXIuY29tPgo+IFNpZ25lZC1vZmYtYnk6
IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgo+IC0tLQo+ICBwYWNr
YWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAgfCAgMSArCklmIHlvdSB3YW50IHRvIGJlIG1haW50
YWluZXJzIGZvciB0aGlzIHBhY2thZ2UsIGRvIG5vdCBmb3JnZXQgdG8KdXBkYXRlIHRoZSBERVZF
TE9QRVJTIGZpbGUuCgo+ICBwYWNrYWdlL2dlbW1sb3dwL0NvbmZpZy5pbiAgICAgfCAgNyArKysr
KysrCj4gIHBhY2thZ2UvZ2VtbWxvd3AvZ2VtbWxvd3AuaGFzaCB8ICA0ICsrKysKPiAgcGFja2Fn
ZS9nZW1tbG93cC9nZW1tbG93cC5tayAgIHwgMTUgKysrKysrKysrKysrKysrCj4gIDQgZmlsZXMg
Y2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9n
ZW1tbG93cC9Db25maWcuaW4KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvZ2VtbWxvd3Av
Z2VtbWxvd3AuaGFzaAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9nZW1tbG93cC9nZW1t
bG93cC5tawo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmlnLmluIGIvcGFja2FnZS9Db25m
aWcuaW4KPiBpbmRleCA0NWU2NmNhYThjLi5kMGQ5ZDI5MDVjIDEwMDY0NAo+IC0tLSBhL3BhY2th
Z2UvQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9Db25maWcuaW4KPiBAQCAtMTk5NCw2ICsxOTk0
LDcgQEAgbWVudSAiT3RoZXIiCj4gICAgICAgICBzb3VyY2UgInBhY2thZ2UvZmxhdGNjL0NvbmZp
Zy5pbiIKPiAgICAgICAgIHNvdXJjZSAicGFja2FnZS9nY29uZi9Db25maWcuaW4iCj4gICAgICAg
ICBzb3VyY2UgInBhY2thZ2UvZ2RhbC9Db25maWcuaW4iCj4gKyAgICAgICBzb3VyY2UgInBhY2th
Z2UvZ2VtbWxvd3AvQ29uZmlnLmluIgo+ICAgICAgICAgc291cmNlICJwYWNrYWdlL2dmbGFncy9D
b25maWcuaW4iCj4gICAgICAgICBzb3VyY2UgInBhY2thZ2UvZ2xpL0NvbmZpZy5pbiIKPiAgICAg
ICAgIHNvdXJjZSAicGFja2FnZS9nbGlibW0vQ29uZmlnLmluIgo+IGRpZmYgLS1naXQgYS9wYWNr
YWdlL2dlbW1sb3dwL0NvbmZpZy5pbiBiL3BhY2thZ2UvZ2VtbWxvd3AvQ29uZmlnLmluCj4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi4yNGJhNmU5NzY4Cj4gLS0tIC9k
ZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvZ2VtbWxvd3AvQ29uZmlnLmluCj4gQEAgLTAsMCArMSw3
IEBACj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9HRU1NTE9XUAo+ICsgICAgICAgYm9vbCAiZ2VtbWxv
d3AiCj4gKyAgICAgICBkZXBlbmRzIG9uIEJSMl9JTlNUQUxMX0xJQlNURENQUApSRUFETUUubWQg
bWVudGlvbnMgYSBDKysxMSBkZXBlbmRlbmN5LiBDYW4geW91IHNldCB0aGUgbWluaW11bSBnY2MK
dmVyc2lvbiByZXF1aXJlZD8gKDQuOCkKCj4gKyAgICAgICBoZWxwCj4gKyAgICAgICAgIExvdy1w
cmVjaXNpb24gbWF0cml4IG11bHRpcGxpY2F0aW9uLgo+ICsKPiArICAgICAgICAgaHR0cHM6Ly9n
aXRodWIuY29tL2dvb2dsZS9nZW1tbG93cApQbGVhc2UgbWVudGlvbiB0aGUgZGVwZW5kZW5jaWVz
IChDKysgYW5kIEMrKyB2ZXJzaW9uKQoKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9nZW1tbG93cC9n
ZW1tbG93cC5oYXNoIGIvcGFja2FnZS9nZW1tbG93cC9nZW1tbG93cC5oYXNoCj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi43YzU2YTE4YmI2Cj4gLS0tIC9kZXYvbnVs
bAo+ICsrKyBiL3BhY2thZ2UvZ2VtbWxvd3AvZ2VtbWxvd3AuaGFzaAo+IEBAIC0wLDAgKzEsNCBA
QAo+ICsjIExvY2FsbHkgY2FsY3VsYXRlZAo+ICtzaGEyNTYgIGNjOGEyMmI2ZjA3MWMzNzgxZTZi
NGI3MjY1NGM4OWIxY2RjMTk4ZTcyZWJhZGViYjE3NjM4ZWFjMjA1MzQ0YzEgIGdlbW1sb3dwLTA4
ZTRiYjMzOWUzNDAxN2EwODM1MjY5ZDRhMzdjNGVhMDRkMTVhNjkudGFyLmd6Cj4gKyMgTGljZW5z
ZSBmaWxlcywgbG9jYWxseSBjYWxjdWxhdGVkCj4gK3NoYTI1NiAgY2ZjNzc0OWI5NmY2M2JkMzFj
M2M0MmI1YzQ3MWJmNzU2ODE0MDUzZTg0N2MxMGYzZWIwMDM0MTdiYzUyM2QzMCAgTElDRU5TRQo+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL2dlbW1sb3dwL2dlbW1sb3dwLm1rIGIvcGFja2FnZS9nZW1t
bG93cC9nZW1tbG93cC5tawo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAw
MC4uMWEzNmZjNDhmNwo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL2dlbW1sb3dwL2dl
bW1sb3dwLm1rCj4gQEAgLTAsMCArMSwxNSBAQAo+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+
ICsjCj4gKyMgZ2VtbWxvd3AKPiArIwo+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICsKPiAr
R0VNTUxPV1BfVkVSU0lPTiA9IDA4ZTRiYjMzOWUzNDAxN2EwODM1MjY5ZDRhMzdjNGVhMDRkMTVh
NjkKPiArR0VNTUxPV1BfU0lURSA9ICQoY2FsbCBnaXRodWIsZ29vZ2xlLGdlbW1sb3dwLCQoR0VN
TUxPV1BfVkVSU0lPTikpCj4gK0dFTU1MT1dQX0xJQ0VOU0UgPSBBcGFjaGUtMi4wCj4gK0dFTU1M
T1dQX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCj4gK0dFTU1MT1dQX0lOU1RBTExfU1RBR0lORyA9
IFlFUwo+ICtHRU1NTE9XUF9JTlNUQUxMX1RBUkdFVCA9IE5PCj4gK0dFTU1MT1dQX1NVQkRJUiA9
IGNvbnRyaWIKPiArCj4gKyQoZXZhbCAkKGNtYWtlLXBhY2thZ2UpKQo+IC0tCj4gMi4zNC4xCj4K
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAp0aGFua3MKR2lsbGVz
LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
