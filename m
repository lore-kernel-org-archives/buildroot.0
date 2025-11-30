Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8AFBD111A8
	for <buildroot@archiver.kernel.org>; Sun, 30 Nov 2025 07:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD01B607E4;
	Sun, 30 Nov 2025 07:51:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oqfkSksf45rn; Sun, 30 Nov 2025 07:51:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCA84607C5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCA84607C5;
	Sun, 30 Nov 2025 07:51:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F7C01A9
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 07:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15450607C5;
 Sun, 30 Nov 2025 07:51:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z5z-vy92ILm0; Sun, 30 Nov 2025 07:51:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CAAAF606CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAAAF606CA
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CAAAF606CA
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 07:51:52 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4779adb38d3so21475265e9.2
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 23:51:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764489111; x=1765093911;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:sender
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e/EG5VUBIWCFG/CMd6JnIZN3PThirVyyS4tE3KLsy2Q=;
 b=qhr/Pb+7iHob92JJ4T7h73Z2qOjxh7QgvkrGeuonJOAS67oDzbioqrm/5IIX7iZA9c
 ScUlPeNt14iLNhcrXXJFdkSDhqE9C51T3fXHluGFmMNlohe2nsSmbIwryoAxuqmNDP3P
 8/xVUfOW92bf+lUWmgH0lHEW9kIhfhEtjYVN9/V3f1vuXkiNrns9R3XHtwcNxDirGF46
 DrXuzguS4Hm8OMCFGkDMUunITO02jfj4vJui6tfTSEIhOcDOwbY8fZNrfDy/kneAp07r
 qorVZz9QZcmZduscvIVimCFiWW0+f1h2Tj2cMvQLehGVkK/UiUX+f+Dr+Vq39TXy7v+b
 keMQ==
X-Gm-Message-State: AOJu0YwulQne7MpduIzGmWGdztMKWM/cHuZsIN9C+JgPbOKwqtCno4VR
 O/jc9a+RqmpCCmLT4iWDzk6+Skvr1SH/Mwo9oc6hojv4jt0Jruhz9f0KXzaanw==
X-Gm-Gg: ASbGncsquzAMu/PG3RPpxpfYA7eI/LUNFMBEbxfkp1vzwzW4vSdeLHu1Xxbure3Mk5G
 /235YV426O/EaI2ux1TezSQE+95z/OWH3wM4OnQb8l0gGCjtNr2YefEQjyv+Yp2LbxK6Oj8ySHk
 1PyLDk0qBtwC+hJ2kHEzEgnzbQUyDPYlt35lYV9LXWCSubrqEe7Em8XAKunXrhurhvmu3qd2yjw
 d5WiAU8q5fp+s7p+AkS01UgFtIlpi015fsAkytQjkdADndP7wT/tJSbV0MlKPzoxXuBW4adQS1h
 fV4mEeNA+L3HpD4U5TxTox5aBkK1q4HOR4jXmA/JflkDIeTDLNedDK9Qe8RZfWn0awF0EAea6eT
 5B3MQhzq9hdcRdoXuwo9j9eE8HqPS5ty1O8BJ5UjjBWvM9UJPINKc6gsW/5upahqvRGQRDztPHu
 /rzjNpHLbxpV8YrSGuTHwjes9Xi+IInD18
X-Google-Smtp-Source: AGHT+IGd4qSekUAzL1NhA9JrrS/PCkbPk2RQdruvjDkO7MNVBACLlNtbFpCUD+oaWjrndIoUbj3vuQ==
X-Received: by 2002:a05:600c:8b37:b0:477:79f8:da9d with SMTP id
 5b1f17b1804b1-47904b1b270mr218939765e9.24.1764489110466; 
 Sat, 29 Nov 2025 23:51:50 -0800 (PST)
Received: from ymorin.is-a-geek.org ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-479111438b9sm193050895e9.2.2025.11.29.23.51.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Nov 2025 23:51:50 -0800 (PST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 30 Nov 2025 08:51:48 +0100
Date: Sun, 30 Nov 2025 08:51:48 +0100
To: =?utf-8?B?Sm9zw6k=?= Luis Salvador Rufo <salvador.joseluis@gmail.com>
Cc: buildroot@buildroot.org, Edgar Bonet <bonet@grenoble.cnrs.fr>
Message-ID: <aSv3lJlD1bNlcRGs@landeda>
References: <20251129203454.4193005-2-salvador.joseluis@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251129203454.4193005-2-salvador.joseluis@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764489111; x=1765093911; darn=buildroot.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:sender
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e/EG5VUBIWCFG/CMd6JnIZN3PThirVyyS4tE3KLsy2Q=;
 b=B4rDsBj9fz/Q0Y1M70q2dIb3CW5Cp6C1fNt5Gxo/WUC5NoFo0fXlkq2kOj9rrE/nmv
 DfEHEtHdxHdKgktoztt1jfW1uER29N4ak1G/NSAE1d3EWxzRQbL/qVJGjtqfRqjCDUFy
 t4uuUGwkKCfQ+ImpR6A6ERtv78plymZN0J/0oh+n8naYtGt+rhMfWEo+H9+GR993uo3j
 eyiELKpJVX1XuqEHdRt6Oj6OQ104tabVe3+iXd4kd4mxr8ALGhLLL23cE93kWjRWh3mF
 VEE55t39eZDGzYBSZYHxOjS3BbEr/s4RFTtoUQHwbIMu2JOohILTYWv4DVLpYXE8t7cd
 Gmkg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=B4rDsBj9
Subject: Re: [Buildroot] [PATCH 1/1] support/scripts/check-merged: shift
 args processed by getopts
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Sm9zw6ksIEFsbCwKCk9uIDIwMjUtMTEtMjkgMjE6MzQgKzAxMDAsIEpvc8OpIEx1aXMgU2FsdmFk
b3IgUnVmbyBzcGFrZSB0aHVzbHk6Cj4gU2hpZnQgdGhlIGFyZ3VtZW50cyBwcm9jZXNzZWQgYnkg
Z2V0b3B0cyBzbyB0aGF0IG9ubHkgdGhlIHJvb3QgZGlyZWN0b3JpZXMKPiB0byBjaGVjayByZW1h
aW4gYXMgYXJndW1lbnRzIGZvciB0aGUgc3Vic2VxdWVudCBgZm9yIHJvb3Q7IGRvYCBsb29wLgoK
VGhlIGFjdHVhbCBpc3N1ZSB0aGlzIHRyaWdnZXJzIGlzIHRoYXQgc2hlY2tzIGluIGN1c3RvbSBz
a2VsZXRvbiBjYXVzZQpidWlsZCBmYWlsdXJlOgoKICAgIHN1cHBvcnQvc2NyaXB0cy9jaGVjay1t
ZXJnZWQgLXQgc2tlbGV0b24gLXUgLWIgL3Vzci9zcmMvc2ltcGxlazhzL3Jvb3Rmcy1za2VsZXRv
bgogICAgVGhlIHNrZWxldG9uIGluIC10IGlzIG5vdCBwcm9wZXJseSBzZXR1cDoKICAgICAtIC91
c3IvYmluIHNob3VsZCBleGlzdCwgYmUgYSBkaXJlY3RvcnksIGFuZCBub3QgYmUgYSBzeW1saW5r
CiAgICAgLSAvdXNyL2xpYiBzaG91bGQgZXhpc3QsIGJlIGEgZGlyZWN0b3J5LCBhbmQgbm90IGJl
IGEgc3ltbGluawogICAgVGhlIHNrZWxldG9uIGluIHNrZWxldG9uIGlzIG5vdCBwcm9wZXJseSBz
ZXR1cDoKICAgICAtIC91c3IvYmluIHNob3VsZCBleGlzdCwgYmUgYSBkaXJlY3RvcnksIGFuZCBu
b3QgYmUgYSBzeW1saW5rCiAgICAgLSAvdXNyL2xpYiBzaG91bGQgZXhpc3QsIGJlIGEgZGlyZWN0
b3J5LCBhbmQgbm90IGJlIGEgc3ltbGluawogICAgVGhlIHNrZWxldG9uIGluIC11IGlzIG5vdCBw
cm9wZXJseSBzZXR1cDoKICAgICAtIC91c3IvYmluIHNob3VsZCBleGlzdCwgYmUgYSBkaXJlY3Rv
cnksIGFuZCBub3QgYmUgYSBzeW1saW5rCiAgICAgLSAvdXNyL2xpYiBzaG91bGQgZXhpc3QsIGJl
IGEgZGlyZWN0b3J5LCBhbmQgbm90IGJlIGEgc3ltbGluawogICAgVGhlIHNrZWxldG9uIGluIC1i
IGlzIG5vdCBwcm9wZXJseSBzZXR1cDoKICAgICAtIC91c3IvYmluIHNob3VsZCBleGlzdCwgYmUg
YSBkaXJlY3RvcnksIGFuZCBub3QgYmUgYSBzeW1saW5rCiAgICAgLSAvdXNyL2xpYiBzaG91bGQg
ZXhpc3QsIGJlIGEgZGlyZWN0b3J5LCBhbmQgbm90IGJlIGEgc3ltbGluawogICAgWy4uLl0KClRo
ZSByZWFzb24gdGhpcyB3YXMgbm90IGNhdWdodCBlYXJsaWVyLCBpcyB0aGF0IHRoZSBzY3JpcHQg
d2FzIG9ubHkKdGVzdGVkIGFnYWluc3Qgb3ZlcmxheXMsIG5vdCBjdXN0b20gc2tlbGV0b25zLiBU
aGUgZGlmZmVyZW5jZSBiZXR3ZWVuCnNrZWxldG9ucyBhbmQgb3ZlcmxheXMsIGlzIHRoYXQgdGhl
IHRlc3RzIGFyZSBzdHJpY3QgZm9yIHNrZWxldG9ucywgYW5kCmxheCBmb3Igb3ZlcmxheXMuIFRo
dXMsIHdpdGggYSBjdXN0b20gc2tlbGV0b24sIHdoZXJlIHRoZSBtZXJnZWQKc3ltbGlua3MgYXJl
IG1pc3NpbmcsIHRoZSB0ZXN0cyBnbyB3cm9uZyBhbmQgcmVwb3J0IGFtIGluY29ycmVjdCBpc3N1
ZSwKd2hpbGUgd2l0aCBvdmVybGF5cywgdGhlIGNoZWNrcyBmYWlscywgYnV0IHRoZXkgYXJlIG5v
dCBjcml0aWNhbCBmb3IKb2J2ZXJsYXlzLCBzbyAgdGhlIHNjcmlwdCBpcyBzaWxlbnQgYW5kIHN1
Y2VlZHMuCgpJIHRoaW5rIGEgYmV0dGVyIGNvbW1pdCBsb2cgd291bGQgYmU6CgogICAgc3VwcG9y
dC9zY3JpcHRzL2NoZWNrLW1lcmdlZDogZml4IGNoZWNraW5nIGN1c3RvbSBza2VsZXRvbnMKCiAg
ICBXaGVuIHVzaW5nIGEgY3VzdG9tIHNrZWxldG9uIHdoZXJlIHRoZSBtZXJnZWQgc3ltbGlua3Mg
YXIgZW1pc2luZywKICAgIHRoZSBidWlsZCBmYWlscyB3aXRoIGVycm9ycyBsaWtlOgoKICAgICAg
ICBzdXBwb3J0L3NjcmlwdHMvY2hlY2stbWVyZ2VkIC10IHNrZWxldG9uIC11IC1iIC91c3Ivc3Jj
L3NpbXBsZWs4cy9yb290ZnMtc2tlbGV0b24KICAgICAgICBUaGUgc2tlbGV0b24gaW4gLXQgaXMg
bm90IHByb3Blcmx5IHNldHVwOgogICAgICAgICAtIC91c3IvYmluIHNob3VsZCBleGlzdCwgYmUg
YSBkaXJlY3RvcnksIGFuZCBub3QgYmUgYSBzeW1saW5rCiAgICAgICAgIC0gL3Vzci9saWIgc2hv
dWxkIGV4aXN0LCBiZSBhIGRpcmVjdG9yeSwgYW5kIG5vdCBiZSBhIHN5bWxpbmsKICAgICAgICBU
aGUgc2tlbGV0b24gaW4gc2tlbGV0b24gaXMgbm90IHByb3Blcmx5IHNldHVwOgogICAgICAgICAt
IC91c3IvYmluIHNob3VsZCBleGlzdCwgYmUgYSBkaXJlY3RvcnksIGFuZCBub3QgYmUgYSBzeW1s
aW5rCiAgICAgICAgIC0gL3Vzci9saWIgc2hvdWxkIGV4aXN0LCBiZSBhIGRpcmVjdG9yeSwgYW5k
IG5vdCBiZSBhIHN5bWxpbmsKICAgICAgICBbLi4uXQoKICAgIENvbW1pdCA3OTNlYmQ1ZDI4MDkg
KHN1cHBvcnQvc2NyaXB0cy9jaGVjay1tZXJnZWQ6IHVzZSBnZXRvcHRzCiAgICBpbnN0ZWFkIG9m
IGdldG9wdCkgaW50b2R1Y2VkIGEgZmxhd2VkIHVzZSBvZiBnZXRvcHRzOiB1bmxpa2UgZ2V0b3B0
LAogICAgZ2V0b3B0cyBkb2VzIG5vdCBjb251bWUgdGhlIHBvc2l0aW9uYWwgYXJndW1lbnRzLiBU
aGlzIGNhdXNlcyB0aGUKICAgIGNoZWNrIGZvciBkaXJlY3Ryb3J5IHZhbGlkaXR5IHRvIGFsbCBj
aGVjayBlYWNoIG9wdGlvbiBhcyBpZiB0aGV5CiAgICB3ZXJlIGRpcmVjdG9yaWVzLgoKICAgIEZv
ciBvdmVybGF5cywgdGhpcyBpcyB0cmFuc3BhcmVudGx5IGlnbm9yZWQsIGJlY2F1c2UgdGhlIGNo
ZWNrcyBhcmUKICAgIG9ubHkgbGF4IGZvciBvdmVybGF5cyAobWlzc2luZyBzeW1saW5rcyBhcmUg
T0spLgoKICAgIEhvd2V2ZXIsIGZvciBza2VsZXRvbnMsIHRoZSBjaGVja3MgYXJlIHN0cmljdC4g
QmVjYXVzZSBvZiB0aGF0LCBhCiAgICBtaXNzaW5nIHN5bWxpbmsgaXMgY29uc2lkZXJlZCBhbiBl
cnJvciwgd2hlbiBpdCBzaG91bGQgYmUgY29uc2lkZXJlZAogICAgYXMgYmVpbmcgT0suCgogICAg
VGhlIGZpeCBpcyB0byBhY3R1YWxseSBjb25zdW1lIHRoZSBwb3NpdGlvbmFsIGFyZ3MgdG8gb25s
eSBrZWVwIHRoZQogICAgbGlzdCBvZiBkaXJlY3RwcmllcyB0byB2YWxpZGF0ZSwgbGlrZSBpcyBk
b25lIGZvciBleGFtcGxlIGluCiAgICBzdXBwb3J0L2Rvd25sb2FkL2RsLXdyYXBwZXIuCgogICAg
Rml4ZXM6IDc5M2ViZDVkMjgwOTVjOGRmNDVhMGQxODNkMjczZDhhODRiM2YwYTQKICAgIFJldmll
d2VkLWJ5OiBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4KICAgIEFja2Vk
LWJ5OiBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4KICAgIENjOiBFZGdh
ciBCb25ldCA8Ym9uZXRAZ3Jlbm9ibGUuY25ycy5mcj4KICAgIFNpZ25lZC1vZmYtYnk6IEpvc8Op
IEx1aXMgU2FsdmFkb3IgUnVmbyA8c2FsdmFkb3Iuam9zZWx1aXNAZ21haWwuY29tPgoKVGhhbmsg
eW91IEpvc8OpIGZvciByZXBvcnRpbmcgYW5kIGZpeGluZyB0aGUgaXNzdWUhIFRoYW5rIHlvdSBF
ZGdhciBmb3IKZ2l2aW5nIGEgaGVscGluZyBoYW5kIQoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4K
Cj4gRml4ZXM6IDc5M2ViZDVkMjgwOTVjOGRmNDVhMGQxODNkMjczZDhhODRiM2YwYTQKPiBSZXZp
ZXdlZC1ieTogWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+Cj4gQ2M6IEVk
Z2FyIEJvbmV0IDxib25ldEBncmVub2JsZS5jbnJzLmZyPgo+IFNpZ25lZC1vZmYtYnk6IEpvc8Op
IEx1aXMgU2FsdmFkb3IgUnVmbyA8c2FsdmFkb3Iuam9zZWx1aXNAZ21haWwuY29tPgo+IC0tLQo+
ICBzdXBwb3J0L3NjcmlwdHMvY2hlY2stbWVyZ2VkIHwgNCArKysrCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC9zY3JpcHRzL2NoZWNr
LW1lcmdlZCBiL3N1cHBvcnQvc2NyaXB0cy9jaGVjay1tZXJnZWQKPiBpbmRleCA0NDdhYmZkODE1
Li41N2RiOGFiZDIxIDEwMDc1NQo+IC0tLSBhL3N1cHBvcnQvc2NyaXB0cy9jaGVjay1tZXJnZWQK
PiArKysgYi9zdXBwb3J0L3NjcmlwdHMvY2hlY2stbWVyZ2VkCj4gQEAgLTQ3LDYgKzQ3LDEwIEBA
IHdoaWxlIGdldG9wdHMgInQ6dWIiIE9QVDsgZG8KPiAgCWVzYWMKPiAgZG9uZQo+ICAKPiArIyBS
ZW1vdmUgdGhlIG9wdGlvbnMgcHJvY2Vzc2VkIGJ5IGdldG9wdHMgZnJvbSAkQCwKPiArIyBzbyB0
aGF0ICRAIG5vdyBjb250YWlucyBvbmx5IHRoZSByb290IGRpcmVjdG9yaWVzIHRvIGNoZWNrLgo+
ICtzaGlmdCAkKChPUFRJTkQgLTEpKQo+ICsKPiAgaWYgWyAiJHt0eXBlfSIgPSAic2tlbGV0b24i
IF07IHRoZW4KPiAgCXN0cmljdD10cnVlCj4gIGVsc2UKPiAtLSAKPiAyLjUyLjAKPiAKCi0tIAou
LS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0t
Li0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJl
ZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIg
Mzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAg
ICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBY
ICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMt
YS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5
LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0t
LS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
