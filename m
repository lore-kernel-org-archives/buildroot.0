Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE34C3DA5D
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 08:06:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC5F640012;
	Thu, 25 Jul 2024 08:06:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 73mTYE2QKjdh; Thu, 25 Jul 2024 08:06:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64C814025C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64C814025C;
	Thu, 25 Jul 2024 08:06:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0F9761BF425
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 08:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0AF80406C8
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 08:06:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tO1bQi8PIs0F for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 08:05:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com;
 envelope-from=gael.portay@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7F35E406C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F35E406C7
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7F35E406C7
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 08:05:58 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2ef2d7d8854so7350281fa.0
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 01:05:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721894756; x=1722499556;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=lWCiIYCdXpNkyjM8DGRc8xM3+Td9hWut7TFd0lJzttE=;
 b=MEehnk6FXDSULysZn0oCyl7Cp5JkbQ/3H2baZiBOqVGD0mJPf7Icmi+iiSnYq6pDXa
 Xkjkpv2VOiT54x3Ixf0BMpQangmo2exdBLvBFwfks5PppkynPKGTDR8MFJxpHh2zPvHA
 5LMUgBiX49NlkmJLWutFG1gQ8iPE5BtNUzccUFPrZol0gATue8x7sFDdo5+xNaffxbRp
 KpbXtMC5tpqGdeBdWgszjRmpgYnWGaili2Ui0tYrznVpi+nwHVj37KroajQg+be3WUce
 wsnjRYCvg/VDMZSqdiEDJpkd/EgO2y5Z2+RTyB6dY6EfDq9K2Y/tnx0PFwxTGshSWNGq
 YVjw==
X-Gm-Message-State: AOJu0Yw/13EB9vKUKdNjEVkF+Dd+MKfZJqKnaYTYqjV/qjPRHWCiE7Gq
 Vt4veaqM9pUI8UqULYlY87Nhx0ssJN9PsBnSYxpA44bXSv4QoXhC7x4XGR66QvU=
X-Google-Smtp-Source: AGHT+IGRxB9DdhpeNsbkRLF4Zpu9kV+izkWzOUJfOLLh/d+TQA8X6ecVoD4Dsi+t98K0MD2nq5iroA==
X-Received: by 2002:a2e:978b:0:b0:2ef:2b53:c77e with SMTP id
 38308e7fff4ca-2f039c8f060mr13994081fa.7.1721894755627; 
 Thu, 25 Jul 2024 01:05:55 -0700 (PDT)
Received: from localhost ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427f9413547sm64064015e9.44.2024.07.25.01.05.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jul 2024 01:05:55 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 25 Jul 2024 10:05:54 +0200
Message-Id: <D2YGQXWLNLWG.2S6K4TCJ7EDN6@gmail.com>
From: =?utf-8?q?Ga=C3=ABl_PORTAY?= <gael.portay@gmail.com>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
X-Mailer: aerc 0.18.1-0-gaa8319bc591f
References: <20240723212011.23048-1-gael.portay@rtone.fr>
 <20240723212011.23048-2-gael.portay@rtone.fr>
 <20240724182122.6a1f75ee@windsurf>
In-Reply-To: <20240724182122.6a1f75ee@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721894756; x=1722499556; darn=buildroot.org;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lWCiIYCdXpNkyjM8DGRc8xM3+Td9hWut7TFd0lJzttE=;
 b=R0TwRaod+54DJFHzIb9MpC0KiCvrQrSpe/yquA/2idtVfwKePpDi/KBN5M5jAfOiJs
 cZ6Q16ykFxxwykDNh/OZcINeUPTb118rcfjtvGAzYJxfrT+jsGl3vjXbgxEgrYaXD+fu
 pdvE0uInkaSv4+mSeIepDdVhV4LTyNaqS17T/jaiO+a3EInJgrGzAyaZQ/gCqMKz5NGC
 fUuTzkAgApPCDfIB3hFMEQNLrZyo1TMqKHy+xz8Vbi67MIxfR/2vmI3PwJe/lzJhyQ8S
 8jIIKzAJUrGxQoX2iDsdgeTviASZ1rYi44jpO0zR5CiG2gA82ij7GrwMKiIycu3xDseY
 RUtg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=R0TwRaod
Subject: Re: [Buildroot] [PATCH 1/2] package/rpi-utils: new package
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 =?utf-8?q?Ga=C3=ABl_PORTAY?= <gael.portay@rtone.fr>, Mahyar
 Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKT24gV2VkIEp1bCAyNCwgMjAyNCBhdCA2OjIxIFBNIENFU1QsIFRob21h
cyBQZXRhenpvbmkgd3JvdGU6Cj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9ycGktdXRpbHMvcnBp
LXV0aWxzLm1rIGIvcGFja2FnZS9ycGktdXRpbHMvcnBpLXV0aWxzLm1rCj4gPiBuZXcgZmlsZSBt
b2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMC4uMWM3NDk1MWU0YQo+ID4gLS0tIC9kZXYv
bnVsbAo+ID4gKysrIGIvcGFja2FnZS9ycGktdXRpbHMvcnBpLXV0aWxzLm1rCj4gPiBAQCAtMCww
ICsxLDE2IEBACj4gPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiA+ICsjCj4gPiArIyBycGkt
dXRpbHMKPiA+ICsjCj4gPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiA+ICsKPiA+ICtSUElf
VVRJTFNfVkVSU0lPTiA9IGExZDUyMmYwZjFiNTA4NThhNDRmYWM4MDUyM2EyYmQ4MDA5OGU3ODkK
PiA+ICtSUElfVVRJTFNfU0lURSA9ICQoY2FsbCBnaXRodWIscmFzcGJlcnJ5cGksdXRpbHMsJChS
UElfVVRJTFNfVkVSU0lPTikpCj4gPiArUlBJX1VUSUxTX0xJQ0VOU0UgPSBCU0QtMy1DbGF1c2UK
PiA+ICtSUElfVVRJTFNfTElDRU5TRV9GSUxFUyA9IExJQ0VOQ0UKPiA+ICtSUElfVVRJTFNfSU5T
VEFMTF9TVEFHSU5HID0gWUVTCj4gPiArUlBJX1VUSUxTX0RFUEVOREVOQ0lFUyA9IGR0Ywo+ID4g
Kwo+ID4gK1JQSV9VVElMU19DT05GX09QVFMgPSAtRFNUQVRJQz1TVEFUSUMKPgo+IFdoYXQgaXMg
dGhpcyB0aGluZyBkb2luZz8gSXQgc2VlbXMgYSBiaXQgb2RkLgo+CgpUaGUgQ01ha2VMaXN0cy50
eHQgb2YgdGhlIGR0bWVyZ2UgdXRpbHMgY3JlYXRlcyBhbiBpbnRlcm5hbCBsaWJyYXJ5IGJ5CmRv
aW5nWzFdOgoKCWFkZF9saWJyYXJ5IChkdG92bCAke1NUQVRJQ30gZHRvdmVybGF5LmMpCgpBY2Nv
cmRpbmcgdG8gb25saW5lIGRvY3VtZW50YXRpb24gb2YgY21ha2VbMl06CgoJYWRkX2xpYnJhcnko
PG5hbWU+IFs8dHlwZT5dIFtFWENMVURFX0ZST01fQUxMXSA8c291cmNlcz4uLi4pCgoJCUFkZCBh
IGxpYnJhcnkgdGFyZ2V0IGNhbGxlZCA8bmFtZT4gdG8gYmUgYnVpbHQgZnJvbSB0aGUKCQlzb3Vy
Y2UgZmlsZXMgbGlzdGVkIGluIHRoZSBjb21tYW5kIGludm9jYXRpb24uCgoJCVRoZSBvcHRpb25h
bCA8dHlwZT4gc3BlY2lmaWVzIHRoZSB0eXBlIG9mIGxpYnJhcnkgdG8gYmUKCQljcmVhdGVkOgoK
CQkJU1RBVElDIEFuIGFyY2hpdmUgb2Ygb2JqZWN0IGZpbGVzIGZvciB1c2Ugd2hlbgoJCQkgICAg
ICAgbGlua2luZyBvdGhlciB0YXJnZXRzLgoKCQkJU0hBUkVEIEEgZHluYW1pYyBsaWJyYXJ5IHRo
YXQgbWF5IGJlIGxpbmtlZCBieQoJCQkgICAgICAgb3RoZXIgdGFyZ2V0cyBhbmQgbG9hZGVkIGF0
IHJ1bnRpbWUuCgoJCQlNT0RVTEUgQSBwbHVnaW4gdGhhdCBtYXkgbm90IGJlIGxpbmtlZCBieSBv
dGhlcgoJCQkgICAgICAgdGFyZ2V0cywgYnV0IG1heSBiZSBkeW5hbWljYWxseSBsb2FkZWQgYXQK
CQkJICAgICAgIHJ1bnRpbWUgdXNpbmcgZGxvcGVuLWxpa2UgZnVuY3Rpb25hbGl0eS4KCgkJSWYg
bm8gPHR5cGU+IGlzIGdpdmVuIHRoZSBkZWZhdWx0IGlzIFNUQVRJQyBvciBTSEFSRUQKCQliYXNl
ZCBvbiB0aGUgdmFsdWUgb2YgdGhlIEJVSUxEX1NIQVJFRF9MSUJTIHZhcmlhYmxlLgoKSW4gcnBp
LXV0aWxzLCB0aGUgb3B0aW9uYWwgdHlwZSBpcyBjb250cm9sbGVkIHRoYW5rcyB0byB0aGUgZW52
aXJvbm1lbnQKdmFyaWFibGUgJHtTVEFUSUN9OyBpdCBpcyB1bnNldCBieSBkZWZhdWx0LiBJdCBp
cyBleHBlY3RlZCBjbWFrZSBidWlsZHMKYSBTVEFUSUMgbGlicmFyeTsgYnV0Li4uCgpjbWFrZSBj
cmVhdGVzIGEgU1RBVElDIGxpYnJhcnkgaWYgY29uZmlndXJpbmcgdGhlIHByb2plY3QgZm9yIG15
IGhvc3QKc3lzdGVtIChBcmNoIExpbnV4KS4KCkFuZCwgY21ha2UgY3JlYXRlcyBhIFNIQVJFRCBs
aWJyYXJ5IHRocm91Z2ggYnVpbGRyb290IChtYXliZSBiZWNhdXNlIG9mCkJVSUxEX1NIQVJFRF9M
SUJTPykuCgpUaGUgZmlsZSBDTWFrZUxpc3RzLnR4dCBkb2VzIG5vdCBpbnN0YWxsIHRoZSBzaGFy
ZWQgbGlicmFyeSwgYW5kIGl0CnJlc3VsdHMgaW4gYSBydW4tdGltZSBpc3N1ZSBzYXlpbmcgdGhl
IGxpYnJhcnkgbGliZHRvdmwuc28gaXMgbm90IGZvdW5kLgoKU28sIEkgaGF2ZSBkZWNpZGVkIHRv
IGVuc3VyZSB0aGUgbGlicmFyeSBpcyBzdGF0aWNhbGx5IGJ1aWxkIGJ5IHNldHRpbmcKdGhlIGVu
dmlyb25tZW50IHZhcmlhYmxlIFNUQVRJQyB0byBTVEFUSUMuCgpEbyB5b3UgcHJlZmVyIEkgaW5z
dGFsbCB0aGUgc2hhcmVkIGxpYnJhcnkgZnJvbSBhbiBpbnN0YWxsIGhvb2sgb3IKd2hhdHNvdmVy
PwoKPiBBbHNvLCBjb3VsZCB5b3UgZ2l2ZSBhIHRlc3QgdG8gdGhpcyBwYWNrYWdlIHVzaW5nIHRo
ZSAuL3V0aWxzL3Rlc3QtcGtnCj4gdXRpbGl0eT8KPgoKV2VsbCwgSSB3YW50ZWQgdG8gZ2l2ZSBh
IHRyeSBiZWZvcmUgc2VuZGluZyB0aGUgcGFja2FnZSwgYnV0IHRoZQp0b29sY2hhaW4gYWxsIHNr
aXBwZWQuCgpHaXZlIG1lIHNvbWUgdGltZSB0byB0ZXN0IGl0LgoKPiBUaGFua3MgYSBsb3QhCj4K
PiBUaG9tYXMKCkdhw6tsCgpbMV06IGh0dHBzOi8vZ2l0aHViLmNvbS9yYXNwYmVycnlwaS91dGls
cy9ibG9iL21hc3Rlci9kdG1lcmdlL0NNYWtlTGlzdHMudHh0I0wxNApbMl06IGh0dHBzOi8vY21h
a2Uub3JnL2NtYWtlL2hlbHAvbGF0ZXN0L2NvbW1hbmQvYWRkX2xpYnJhcnkuaHRtbApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
