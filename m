Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1459C3DA49
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 11:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D901408EF;
	Thu, 25 Jul 2024 11:05:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nrADWpZNtzV1; Thu, 25 Jul 2024 11:05:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17949408D2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17949408D2;
	Thu, 25 Jul 2024 11:05:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 73B711BF2CD
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 11:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6FAF260A65
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 11:05:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GTd3vwq26vJ0 for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 11:05:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=gael.portay@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 60AD560A64
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60AD560A64
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 60AD560A64
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 11:05:31 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-369cb9f086aso488591f8f.0
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 04:05:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721905529; x=1722510329;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4sBdAgNZiy2Wb6euQtnoyYTWlPwS7WerHEQSvDsHRhI=;
 b=L72cTIUKtYUGhsrFLy1L+PlNR50UwR5q6gxP3smvotcFPgDXx91aIV7F/v4hunPTjY
 5Ie2yNqC0/eqQI35NYkua4cR3vB/OwcwqwBAMwj36BMWXnChGW5T0BFK6zqXEoBI04Xc
 m3CE/BgcnYjhu4wnkl6CSYXVl3RLJfVTO0enC9bAGsFPg6irXRwLhjT0n8cgsyvU32Rp
 aKN/cIPLSJwQ9MQDQ3Ry3PmxcsE/44oGQ5nQnGpb+/9DqEhlMVHzPmWqX5a0rl5hT2Qc
 lk68y33DemGl6MKt/dbTmhm6aoWt4KFQBSs+Vtmbd17lfcdmcrsmrN4tLKVZC7a2upO8
 iAfQ==
X-Gm-Message-State: AOJu0YyJ1gVRD5O0GcOYjSCt6sb+x5p6kCvtDhc7rHu0xtX9/E2FxWMA
 RS4FH2uCSX6hI5qVwie/nwD2E/aNk12K0e8IrRkiNTo5gcGdyf9gz6FA5Xx87B7SYA==
X-Google-Smtp-Source: AGHT+IF7pQDsVrcS3IKljAnozUM9TZwPaVB4TSXbEXFAq5NUo3CtR/UGWgqCt05O55f6ECfV9U/OYw==
X-Received: by 2002:a05:6000:12cf:b0:367:9088:fecc with SMTP id
 ffacd0b85a97d-36b31ac9b9dmr1642828f8f.7.1721905528901; 
 Thu, 25 Jul 2024 04:05:28 -0700 (PDT)
Received: from localhost ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b36858197sm1809737f8f.68.2024.07.25.04.05.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jul 2024 04:05:28 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 25 Jul 2024 13:05:27 +0200
Message-Id: <D2YKKETZ0VW0.3G5BB391498UM@gmail.com>
From: =?utf-8?q?Ga=C3=ABl_PORTAY?= <gael.portay@gmail.com>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
X-Mailer: aerc 0.18.1-0-gaa8319bc591f
References: <20240723212011.23048-1-gael.portay@rtone.fr>
 <20240723212011.23048-3-gael.portay@rtone.fr>
 <20240724182158.07c7436b@windsurf> <D2YJ1IQ4XJ62.17GIHGKSB1ZYE@gmail.com>
 <20240725121537.7f987369@windsurf>
In-Reply-To: <20240725121537.7f987369@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721905529; x=1722510329; darn=buildroot.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4sBdAgNZiy2Wb6euQtnoyYTWlPwS7WerHEQSvDsHRhI=;
 b=ccox7IMqjLlPjodN6WOC5zP/5q014sRA2iGdtl1RutVD+MEkmXXb/d9js7cja3Qypm
 oIWv7atv4CDFDH++oDbAL32j6x0TRvv+tJhSuSByEKO0Wdn0wwlRa5cdWHFNFF0XND2X
 lwJjliz+p2+xgAJWQnAHEjJxASJlC6pRrmk8365DkMRsaVnFAYPay/r1hX4IEibdmHcy
 YxB/kZAnWORojyfs3xy2w4qphk7Ub+nMTH9xgskZBgFK2SmX5YTkt0DjBoHV+5Lv9DcA
 sUvTY0pJKaIMxixTz1wBk+mmGVewiE2l/FFnmFzmraexHVfrL59q9Fpv0JdDo93yFQjj
 Ockw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ccox7IMq
Subject: Re: [Buildroot] [PATCH 2/2] package/rpi-userland: package is
 deprecated
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

VGhvbWFzLAoKT24gVGh1IEp1bCAyNSwgMjAyNCBhdCAxMjoxNSBQTSBDRVNULCBUaG9tYXMgUGV0
YXp6b25pIHdyb3RlOgo+IFdlbGwsIHRoZW4gd2UgbmVlZCB0byBmaWd1cmUgb3V0IHRoaXMgYmVm
b3JlIGRlY2xhcmluZyBycGktdXNlcmxhbmQgYXMKPiBvYnNvbGV0ZS9kZXByZWNhdGVkLiBJbmRl
ZWQsIG5vdCBoYXZpbmcgc3VwcG9ydCBmb3IgdGhlIG9sZGVyIFJQaQo+IHBsYXRmb3JtcyBpcyBh
IHByb2JsZW0uCj4KCkkgYWdyZWUsIHRoaXMgaXMgd2h5IEkgaGF2ZSBsaW1pdGVkIG15IGNoYW5n
ZSB0byBhZGRpbmcgdGhlIG1lc3NhZ2UgaW4KdGhlIGhlbHAgbWVzc2FnZSBvZiB0aGUgcGFja2Fn
ZS4KCj4gWWVhaCwgSSBzcGVudCBxdWl0ZSBhIGxvdCBvZiB0aW1lIGR1cmluZyB0aGUgcmVjZW50
IEJ1aWxkcm9vdCBoYWNrYXRob24KPiB0byBmaXggdGhlIGJ1aWxkIG9mIHF0NXdlYmVuZ2luZS4g
Rm9yIEFSTSAzMi1iaXQsIGl0IHdhcyBidWlsZGluZwo+IGVudGlyZWx5IGFsbCB0aGUgd2F5IHRv
IHBvaW50IG9mIGxpbmtpbmcgUXRXZWJFbmdpbmUuc28sIHdoZXJlIHRoZQo+IGxpbmtlciB3YXMg
c2ltcGx5IHJldHVybmluZyBhbiBlcnJvciAobm9uIHplcm8gZXhpdCBjb2RlKSwgYnV0IHdpdGhv
dXQKPiBzcGl0dGluZyBhbnkgZXJyb3IgbWVzc2FnZS4gSSBkb3duZ3JhZGVkIHRvIGFuIG9sZGVy
IHZlcnNpb24gb2YKPiBiaW51dGlscyBqdXN0IHRvIGNoZWNrLCBhbmQgZXhhY3Qgc2FtZSBiZWhh
dmlvci4gSSByYW4gInN0cmFjZSIgb24gdGhlCj4gbGlua2VyLCBhbmQgaXQgZG9lcyB3cml0ZSB0
aGUgbGliUXRXZWJFbmdpbmUuc28gZmlsZSwgYXBwYXJlbnRseQo+IGVudGlyZWx5IGFuZCB0aGVu
IGF0IHNvbWUgcG9pbnQgaXQgZGVjaWRlcyBzb21ldGhpbmcgaXMgd3JvbmcsIGFuZCBpdAo+IGRl
bGV0ZXMgaXQgYW5kIGV4aXRzIHdpdGggYW4gZXJyb3IuIEkgY291bGRuJ3QgZmlndXJlIG91dCB3
aGF0IHdhcwo+IGhhcHBlbmluZy4KPgoKVGVzdGluZyB0aGUgY2hhbmdlIGluIFF0V2ViZW5naW5l
IGlzIHByZXR0eSBsb25nLi4uIGFuZCBldmVuIG1vcmUgb24gYQpsYXB0b3AuCgpJIGZhY2VzIGlz
c3VlcyB0d28gaXNzdWVzLgoKVGhlIGZpcnN0IHJhaXNlcyBpZiB0aGUgcHJvcHJpZXRhcnktY29k
ZWNzIGlzIHNldCBhcyB0aGUgYnVuZGxlIGZmbXBlZwpoYXMgaGFyZGNvZGVkIGNvbmZpZ3M7IGl0
IGJ1aWxkcyB0aGUgdnA4IHJlcXVpcmluZyB0aHVtYiBmb3IgYXJtICh3ZWxsCm1heWJlIGl0IGJ1
aWxkcyB2cDggZXZlbiBpZiB0aGUgcHJvcHJpZXRhcnkgY29kZWNzIGlzIHVuc2V0IDovKS4KCkhv
d2V2ZXIsIHFtYWtlIGNyZWF0ZXMgdGhlIGFybSBmbGFncyBnaXZlbiB0byB0aGUgY29tcGlsZXIg
aXRzZWxmLiBJdApndWVzc2VzIHRoZW0gZnJvbSB0aGUgJFFNQUtFIGFuZCAkUU1BS0VfQ0ZMQUdT
IHNldCBpbiB0aGUgcW1ha2UuY29uZgpnZW5lcmF0ZWQgaW4gcXQ1YmFzZTsgYnV0IGJ1aWxkcm9v
dCBkb2VzIG5vdCBzZXQgdGhlIC1tYXJjaCwgLW10dW5lLAotbWZsb2F0LWFiaSwgLW1mcHUgLW1h
cm0vLW10aHVtYiBmbGFncyB0byBpdC4KClNvIHFtYWtlIGlzIGxvc3QgYW5kIGJ1aWxkcyBhbnkg
QVJNIDMyLWJpcyB0YXJnZXQgd2l0aCB0aGUgZGVmYXVsdCBmbGFncwotbWFyY2g9YXJtdjctYSAt
bWZsb2F0LWFiaT1oYXJkIC1tdHVuZT1nZW5lcmljLWFybXY3LWEgLW1mcHU9dmZwdjMtZDE2Ci1t
YXJtLgoKVGhlIGZsYWcgLW1hcm0gcmFpc2UgcmFpc2VzIHRoZSBlcnJvciBiZWxvdyBmb3IgdnA4
LmMgKGJlY2F1c2UgaXQgaXMgYQp0aHVtYiBtbmVtb25pYyk6CgoJe3N0YW5kYXJkIGlucHV0fTog
QXNzZW1ibGVyIG1lc3NhZ2VzOgoJe3N0YW5kYXJkIGlucHV0fToxMTE5OiBFcnJvcjogYmFkIGlu
c3RydWN0aW9uIGBsZHJoY3MgcjAsW2lwXSwjMicKCk5vdGU6IGNocm9taXVtIGZhaWxzIGF0IGNv
bmZpZ3VyZSBpZiAtZmVhdHVyZS13ZWJlbmdpbmUtYXJtLXRodW1iIGlzCmZvcmNlZCB0byBpdHMg
Y29tbWFuZC1saW5lIGluc3RlYWQgb2YgZmFpbGluZyBhZnRlcndhcmQgYXQgYnVpbGQ7IHNvIGl0
CmlzIGludGVycmVzdGluZyB0byBlbmZvcmNlIGl0IGlmIENQVSBzdXBwb3J0cyBUaHVtYi4KCkFs
c28sIGl0IGlzIHdyb25nIGZvciByYXNwYmVycnkgcGkgMSAoYXJtdjYpLgoKVGhlIHNlY29uZCBy
YWlzZXMgYXQgbGlua2luZyBibGluazoKCgkvaG9tZS9ncG9ydGF5L3NyYy9idWlsZHJvb3Qvb3V0
cHV0L2hvc3QvbGliL2djYy9hcm0tYnVpbGRyb290LWxpbnV4LWdudWVhYmloZi8xMy4zLjAvLi4v
Li4vLi4vLi4vYXJtLWJ1aWxkcm9vdC1saW51eC1nbnVlYWJpaGYvYmluL2xkOiB3YXJuaW5nOiAv
aG9tZS9ncG9ydGF5L3NyYy9idWlsZHJvb3Qvb3V0cHV0L2J1aWxkL3F0NXdlYmVuZ2luZS01LjE1
LjE0L3NyYy9jb3JlL3JlbGVhc2Uvb2JqL3RoaXJkX3BhcnR5L2JsaW5rL3JlbmRlcmVyL3BsYXRm
b3JtL2hlYXAvYXNtL2FzbS9TYXZlUmVnaXN0ZXJzX2FybS5vOiBtaXNzaW5nIC5ub3RlLkdOVS1z
dGFjayBzZWN0aW9uIGltcGxpZXMgZXhlY3V0YWJsZSBzdGFjawoJL2hvbWUvZ3BvcnRheS9zcmMv
YnVpbGRyb290L291dHB1dC9ob3N0L2xpYi9nY2MvYXJtLWJ1aWxkcm9vdC1saW51eC1nbnVlYWJp
aGYvMTMuMy4wLy4uLy4uLy4uLy4uL2FybS1idWlsZHJvb3QtbGludXgtZ251ZWFiaWhmL2Jpbi9s
ZDogTk9URTogVGhpcyBiZWhhdmlvdXIgaXMgZGVwcmVjYXRlZCBhbmQgd2lsbCBiZSByZW1vdmVk
IGluIGEgZnV0dXJlIHZlcnNpb24gb2YgdGhlIGxpbmtlcgoJY29sbGVjdDI6IGVycm9yOiBsZCBy
ZXR1cm5lZCAxIGV4aXQgc3RhdHVzCgpJcyB0aGF0IHBvc3NpYmxlIHRoaXMgaXMgdGhlIGlzc3Vl
IHlvdSBtZW50aW9uZWQ/CgpBbHNvLCBJIGhhdmUgbm90aWNlZCB0aGF0IGNocm9taXVtIGNoZWNr
cyBmb3IganBlZy10dXJibyBzcGVjaWZpYwpzeW1ib2xzIGlmIC1mZWF0dXJlLXdlYmVuZ2luZS1z
eXN0ZW0tanBlZzsgcmFzcGJlcnJ5cGkgdXNlcyBsaWJqcGVnIGFzCmpwZWctdHVyYm8gY2Fubm90
IGJlIGJ1aWx0IGZvciB0aGlzIHRhcmdldCwgYW5kIHF0NXdlYmVuZ2luZSBmYWlscyBhdApjb25m
aWd1cmUuCgpOb3csIEkgYW0gYXQgdGhlIHBvaW50IHdoZXJlIEkgY2FuIGJ1aWxkIGV2ZXJ5IHJh
c3BiZXJyeSBjb25maWd1cmF0aW9uCmZvciAzMi1iaXRzIGJ1dCB3ZWJlbmdpbmUgZG9lcyBub3Qg
bmVjZXNzYXJpbHkgcnVuLgoKSSB3aWxsIHNlbmQgdGhlIHBhdGNoZXMgc2VwYXJhdGx5LgoKUmVn
YXJkcywKR2HDq2wKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
