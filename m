Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936F3E67488
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 22:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 341CB405D6;
	Thu, 31 Oct 2024 22:12:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aJ4tHowcRdp1; Thu, 31 Oct 2024 22:12:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF42A405AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF42A405AE;
	Thu, 31 Oct 2024 22:12:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FBF85B1E
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 22:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B71960902
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 22:12:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2JFpn6o1MvM8 for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 22:12:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8EABC60720
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EABC60720
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8EABC60720
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 22:12:32 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4315eeb2601so15099605e9.2
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 15:12:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730412750; x=1731017550;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/ZGm4z3sLIdTC+VvbULHu8/vISpbzpFwlp6xka/a/t8=;
 b=d6s0zm4JNnCrddlqqqe+/R5u7siXX7TZFJlDQHeCgxajmYO6VlZH6fUtCPeuLiy2gN
 uwQgDPC/yBjPo9YiF9luoFt6xaeK/JrsA++FDWEsXY31pqYwEzvWA/7PAyS14TfG6kx/
 zZExFm153LaClyA6ftoxC+kVuH9AbwuCAl30vaUzf/IT4HHYOK20EmglLBRGPu1pR4Mf
 waxxASI3DuQWuoWsorvmfwEVwNAVO6VGpkRgb67VrvqE50B+NVt6GqHDXkQv8Ax09Avg
 kuGT0NtLFK2RWYjq1aQ8Mwv+cln8g7ziwU6LS7/Gs61Kh5Pkmfo2vVCJAmVwHEW8q3BK
 e+KQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1/fwAVKBwG5Iayd9CdKR/DfTSiki3LqSLhw5nBCGifzccHXs4Zolw7RuOFHGTOA8QBoAGmRSvR1g=@buildroot.org
X-Gm-Message-State: AOJu0Yzn8nRdDYoTVY3Hqbf7m0rfs7KX40qA5QBKXdhAGtCpg9Ql4kPA
 jddEKr348xHz38zIpoOhnlWgRcUo3hJOL11MC4aolMYH71V5a9fKk3toA2tHJN8=
X-Google-Smtp-Source: AGHT+IERtOLJMuG0OY42pJd7F9LoFM/cTnlK3hVLTKVLNzBL/TJKzKZybKF7l2xy5ORCRSYpkjHjGw==
X-Received: by 2002:a05:600c:3b04:b0:431:6083:cd30 with SMTP id
 5b1f17b1804b1-43283242a2bmr12608315e9.6.1730412750511; 
 Thu, 31 Oct 2024 15:12:30 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4327d5e8915sm39889425e9.27.2024.10.31.15.12.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2024 15:12:30 -0700 (PDT)
Message-ID: <49a0a3c1-93ae-4474-887e-ae007be648cd@smile.fr>
Date: Thu, 31 Oct 2024 23:12:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
References: <20241031213348.2057705-1-ju.o@free.fr>
 <20241031213348.2057705-9-ju.o@free.fr>
Content-Language: fr
In-Reply-To: <20241031213348.2057705-9-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1730412750; x=1731017550; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/ZGm4z3sLIdTC+VvbULHu8/vISpbzpFwlp6xka/a/t8=;
 b=uCQaPpP/LuJVWlct8R8Ew82MbDjA2TUBPTZdRmTW0/GFHg9PvfjiRrL/E6Yy/b8SnH
 C5W4tdV8ozOV0HjG6DgjQFURxgyA7OxczrxtxUOb2RGViNRkS/HI5Rce2h1scwQFlNP6
 3pOv/dhgiIca1HDO04PnkdjCmonMt8/XLZn+4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=uCQaPpP/
Subject: Re: [Buildroot] [PATCH v3 8/8] support/testing: test_grub: update
 and re-enable the test
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSnVsaWVuLAoKTGUgMzEvMTAvMjAyNCDDoCAyMjozMywgSnVsaWVuIE9saXZhaW4gYSDD
qWNyaXTCoDoKPiBUaGUgRURLMiBidW1wIHRvIHN0YWJsZTIwMjQwNSBpbnRyb2R1Y2VkIGFuIGlu
Y29tcGF0aWJpbGl0eSB3aXRoIHRoZQo+IFFlbXUgdmVyc2lvbiA1LjIuMCBwcmVzZW50IGluIHRo
ZSByZWZlcmVuY2UgRG9ja2VyIGltYWdlLiBGb3IgdGhhdAo+IHJlYXNvbiwgdGhpcyB0ZXN0IHdh
cyBkaXNhYmxlZC4KPiAKPiBUaGlzIGNvbW1pdCBlbmFibGVzIGhvc3QtcWVtdSBpbiB0aGUgYnVp
bGQsIHRvIGJlIHVzZWQgYnkgdGhlIHJ1bnRpbWUKPiB0ZXN0IGluZnJhc3RydWN0dXJlLgo+IAo+
IFNpbmNlIHRoaXMgY29tbWl0IHN3aXRjaCB0byBhIG1vcmUgcmVjZW50IGhvc3QtcWVtdSwgaXQg
YWxzbyByZW1vdmVzCj4gZmlybXdhcmUgb3B0aW9ucyB0byB3b3JrYXJvdW5kIG9sZCBxZW11IGJ1
Z3MuCj4gCj4gVGhvc2UgY2hhbmdlcyBhcmUgZml4aW5nIHRoaXMgdGVzdCwgd2hpY2ggaXMgd2h5
IHRoaXMgY29tbWl0IHJlLWVuYWJsZXMKPiBpdCBieSByZW1vdmluZyB0aGUgc2tpcFRlc3QoKSBp
bnZvY2F0aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBPbGl2YWluIDxqdS5vQGZyZWUu
ZnI+CgpTYW1lIHF1ZXN0aW9uIGFib3V0IG5lb3ZlcnNlLW4xLgoKUmV2aWV3ZWQtYnk6IFJvbWFp
biBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+
IC0tLQo+ICBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvYm9vdC90ZXN0X2dydWIucHkgfCA2ICsrLS0t
LQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvYm9vdC90ZXN0X2dydWIucHkgYi9z
dXBwb3J0L3Rlc3RpbmcvdGVzdHMvYm9vdC90ZXN0X2dydWIucHkKPiBpbmRleCA0MTIzNGRlMmI5
Li5jNzUzYTE2YzM0IDEwMDY0NAo+IC0tLSBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9ib290L3Rl
c3RfZ3J1Yi5weQo+ICsrKyBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9ib290L3Rlc3RfZ3J1Yi5w
eQo+IEBAIC0xNTMsMTMgKzE1MywxMSBAQCBjbGFzcyBUZXN0R3J1YkFBcmNoNjRFRkkoaW5mcmEu
YmFzZXRlc3QuQlJUZXN0KToKPiAgICAgICAgICBCUjJfUEFDS0FHRV9IT1NUX0dFTklNQUdFPXkK
PiAgICAgICAgICBCUjJfUEFDS0FHRV9IT1NUX01UT09MUz15Cj4gICAgICAgICAgQlIyX1BBQ0tB
R0VfSE9TVF9ET1NGU1RPT0xTPXkKPiArICAgICAgICBCUjJfUEFDS0FHRV9IT1NUX1FFTVU9eQo+
ICsgICAgICAgIEJSMl9QQUNLQUdFX0hPU1RfUUVNVV9TWVNURU1fTU9ERT15Cj4gICAgICAgICAg
IiIiLmZvcm1hdChwb3N0X2ltYWdlPWluZnJhLmZpbGVwYXRoKCJ0ZXN0cy9ib290L3Rlc3RfZ3J1
Yi9wb3N0LWltYWdlLWFhcmNoNjQtZWZpLnNoIiksCj4gICAgICAgICAgICAgICAgICAgICBsaW51
eF9mcmFnbWVudD1pbmZyYS5maWxlcGF0aCgidGVzdHMvYm9vdC90ZXN0X2dydWIvbGludXgtYWFy
Y2g2NC1lZmkuY29uZmlnIikpCj4gIAo+IC0gICAgZGVmIHNldFVwKHNlbGYpOgo+IC0gICAgICAg
IHNlbGYuc2tpcFRlc3QoIkluY29tcGF0aWJsZSBRRW11IDUuMi4wIChEb2NrZXIgaW1hZ2UpIC8g
Igo+IC0gICAgICAgICAgICAgICAgICAgICAgIkVESzIgKHN0YWJsZTIwMjQwNSkgdmVyc2lvbnMu
IikKPiAtCj4gICAgICBkZWYgdGVzdF9ydW4oc2VsZik6Cj4gICAgICAgICAgaGRhID0gb3MucGF0
aC5qb2luKHNlbGYuYnVpbGRkaXIsICJpbWFnZXMiLCAiZGlzay5pbWciKQo+ICAgICAgICAgIGJp
b3MgPSBvcy5wYXRoLmpvaW4oc2VsZi5idWlsZGRpciwgImltYWdlcyIsICJRRU1VX0VGSS5mZCIp
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
