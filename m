Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A35C4332F
	for <buildroot@archiver.kernel.org>; Sun, 12 Nov 2023 22:12:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF00C60B31;
	Sun, 12 Nov 2023 22:12:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF00C60B31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yvXnal6jZq7e; Sun, 12 Nov 2023 22:12:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7B3260B2C;
	Sun, 12 Nov 2023 22:12:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7B3260B2C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 15B581BF2B3
 for <buildroot@lists.busybox.net>; Sun, 12 Nov 2023 22:12:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E83C84177B
 for <buildroot@lists.busybox.net>; Sun, 12 Nov 2023 22:12:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E83C84177B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XPTquyxijR2O for <buildroot@lists.busybox.net>;
 Sun, 12 Nov 2023 22:12:12 +0000 (UTC)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B0B7941772
 for <buildroot@buildroot.org>; Sun, 12 Nov 2023 22:12:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0B7941772
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-32d9effe314so2313160f8f.3
 for <buildroot@buildroot.org>; Sun, 12 Nov 2023 14:12:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699827129; x=1700431929;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=he+HdPVFiA85pMusmwKXAL/apFnrPzmUyaX5rJVNJbw=;
 b=orMfiaiZCNO+SWnnMlA2+EiaUQeR5rqWgx6e/Yo5SOo62N4ZxdyQVBoePMWtZl91hN
 TCr3aoS4Xmzaq9tPJmMGnL4huyPK7bp9l12ObVg6JtRhykiG92YJOXBv53WMSzbQwphg
 Qu6fd00gfLzjIw2pC1TkYBc2FF710FrYE/aJzUsR46AQlKZgWXf3qETMkvRpgFPXLOCF
 /pzeseEKaBZbpqLP0ri7wRH2tu+Uyk9xN+GxMI95I+VowpkcvX0cXjHrimNJ7vvukEAT
 iXRoyEvnayTmfOxnN4sJId9wwuUd23Znl8YCChAcw53e04Cj44ouZkUiFxDKm8oyDPeC
 GElg==
X-Gm-Message-State: AOJu0YzbRQWSyw5CXbR5TXxcRTRvzlJla9hJQWlFGpDAQTXkUD1F1x+q
 H6f8Vr8H14E3IwnB0LWyEPno7ktncwyFiw==
X-Google-Smtp-Source: AGHT+IF9MNcPIGd2rjt1L3beKErNuV7DiaOwnL5ZtlirrzDdEIkkE1EjFr+bZwhgLZRVOSFI1ZHxjg==
X-Received: by 2002:a5d:65d0:0:b0:32d:9ed0:c31a with SMTP id
 e16-20020a5d65d0000000b0032d9ed0c31amr2852666wrw.64.1699827129297; 
 Sun, 12 Nov 2023 14:12:09 -0800 (PST)
Received: from cuervo.lan ([78.30.17.56]) by smtp.gmail.com with ESMTPSA id
 g26-20020adfa49a000000b0030647449730sm4077673wrb.74.2023.11.12.14.12.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Nov 2023 14:12:08 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Nov 2023 23:11:17 +0100
Message-ID: <20231112221115.2289525-3-salvador.joseluis@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20230726233012.50b0ac6c@windsurf>
References: <20230726233012.50b0ac6c@windsurf>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699827129; x=1700431929; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=he+HdPVFiA85pMusmwKXAL/apFnrPzmUyaX5rJVNJbw=;
 b=hiOhnmvM8rAuxdUvWjprKH2r2PbKdoAyTVrQdj0yMEPVi6amXHo9CQDI5yqbwlu9Bt
 FuRuBLE0apEJD+TxUkVPcalvfxr4GLotIi6UWVzNRdcmu6FdVUlxgf/tLbrLWByYCLwD
 jSklHLj35gebe7TgIoOHRBvlfnS4DXPZj+YY3R+27MNIoCgtDWCHEJifSAqmwpDcAKGZ
 zi0i7unKznITecxRt8v4Wptc7rsms4NXt7b3MQ9WFuRjMoUl2FNWzDrT+NBc8LJraGDL
 015PvBmeeryo2jnOwJtlaWIClH8TWidQcPQq+hS1a2BnBJZFxV30NmFwYEtpGfgySqTW
 79tA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hiOhnmvM
Subject: [Buildroot] [PATCH] package/zfs: fix zfs autotools cross-compilation
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
Cc: Alexander Mukhin <alexander.i.mukhin@gmail.com>,
 =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>, Philippe.Serbruyns@ugent.be,
 Michael Zimmermann <sigmaepsilon92@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBjb21taXQgYWRkcmVzc2VzIGEgbG9uZy1zdGFuZGluZyBidWcgZW5jb3VudGVyZWQgZHVy
aW5nIFpGUwpjb21waWxhdGlvbiBpbiBjcm9zcy1wbGF0Zm9ybSBlbnZpcm9ubWVudHMuIFRoZSBp
c3N1ZSBhcmlzZXMgYmVjYXVzZSBaRlMKYXV0b2NvbmYgdHJpZ2dlcnMgYSBgbWFrZSBtb2R1bGVz
YCB0byBkZXRlY3QgaWYgdGhlIGtlcm5lbCBjYW4gY29tcGlsZQptb2R1bGVzIFsxXS4gVGhlIHBy
b2JsZW0gb2NjdXJzIHdoZW4gYXV0b2NvbmYgdXNlcyB0aGUgaG9zdCBlbnZpcm9ubWVudAppbnN0
ZWFkIG9mIHRoZSBjcm9zcy1wbGF0Zm9ybSBlbnZpcm9ubWVudC4KClRvIGZpeCB0aGlzLCB3ZSBl
eHBvcnQgbmVjZXNzYXJ5IGVudmlyb25tZW50IHZhcmlhYmxlcyB0byBlbnN1cmUgdGhhdCBaRlMK
YXV0b2NvbmYgdXRpbGl6ZXMgdGhlIGNyb3NzLXBsYXRmb3JtIGVudmlyb25tZW50IGNvcnJlY3Rs
eS4KClRoaXMgcGF0Y2ggcmVzb2x2ZXMgWkZTIGNyb3NzLXBsYXRmb3JtIGNvbXBpbGF0aW9uczoK
LSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy9lYmVhYjI1NjEwMWJjYmEz
OGMzNWZkNTUwNzVjNDE0ZTYyZjkyY2FhLwotIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5l
dC9yZXN1bHRzLzAzYjlmMTJhMTA2YmYxMDBlZWM2OTVhOTJiODNiZjA5YjIyYzY4YjAvCi0gaHR0
cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvYzJkYTkwMzM3NDYzNjA3YzJmYWRm
ZWFjN2FkNzJlNWMzODk5YTYxZi8KLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVz
dWx0cy80NjVhMjQ5ZjkyZDJmNWRiN2FjNGI2MWI0MTExZTZjYmFhYTE1Njg4LwotIGh0dHA6Ly9h
dXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzdlMmQzMjc3ZTI2ZmE1YjBjODA3M2EwZThi
OWU4MmY0N2FkZTk2OTcvCi0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMv
YThmYjg3MzM2YjA5ZmVmODc4N2E3ODg5ZGZjY2NmMTRmZTEyMTViOS8KLSBodHRwczovL2dpdGxh
Yi5jb20va3VidTkzL2J1aWxkcm9vdC8tL2pvYnMvMTUyMjg0ODQ4MwoKQW5kIGZpeCBhIGZldyBl
bWFpbHM6Ci0gYWxwaW5lLkRFQi4yLjIyLjM5NC4yMTA4MTgxNjMwMjgwLjIwMjgyNjJAcmlkem8g
W2J1aWxkIHpmcyBpbnRvIGJ1aWxkcm9vdCBmb3IgcmFzcGJlcnJ5IHBpIDRdCi0gaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL3BpcGVybWFpbC9idWlsZHJvb3QvMjAyMS1BdWd1c3QvNjIxNjk2
Lmh0bWwKLSBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvcGlwZXJtYWlsL2J1aWxkcm9vdC8y
MDIxLUF1Z3VzdC82MjEzNDUuaHRtbAotIGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9waXBl
cm1haWwvYnVpbGRyb290LzIwMjItSnVseS82NDYzNzkuaHRtbAotIGh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9waXBlcm1haWwvYnVpbGRyb290LzIwMjMtSnVuZS82Njg0NjcuaHRtbAoKWzFd
IFRoaXMgaXMgdGhlIGZ1bGwgY2FsbGJhY2ssIHlvdSBjYW4ganVzdCBjaGVjayB0aGUgbGFzdCBs
aW5rOgotIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuemZzL3pmcy9ibG9iL3pmcy0yLjEuMTIvY29u
ZmlnL2tlcm5lbC1kZWNsYXJlLWV2ZW50LWNsYXNzLm00I0w3QzExLUw3QzExCi0gaHR0cHM6Ly9n
aXRodWIuY29tL29wZW56ZnMvemZzL2Jsb2IvemZzLTIuMS4xMi9jb25maWcva2VybmVsLm00I0w4
ODMKLSBodHRwczovL2dpdGh1Yi5jb20vb3Blbnpmcy96ZnMvYmxvYi96ZnMtMi4xLjEyL2NvbmZp
Zy9rZXJuZWwubTQjTDg2OAotIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuemZzL3pmcy9ibG9iL3pm
cy0yLjEuMTIvY29uZmlnL2tlcm5lbC5tNCNMNjY4CgpTaWduZWQtb2ZmLWJ5OiBKb3PDqSBMdWlz
IFNhbHZhZG9yIFJ1Zm8gPHNhbHZhZG9yLmpvc2VsdWlzQGdtYWlsLmNvbT4KLS0tCiBwYWNrYWdl
L3pmcy96ZnMubWsgfCA4ICsrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvcGFja2FnZS96ZnMvemZzLm1rIGIvcGFja2FnZS96ZnMvemZzLm1rCmlu
ZGV4IGYwNDYxZWE5ZWMuLmFiNTMwY2JjZjAgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvemZzL3pmcy5t
aworKysgYi9wYWNrYWdlL3pmcy96ZnMubWsKQEAgLTU5LDYgKzU5LDE0IEBAIGVsc2UKIFpGU19D
T05GX09QVFMgKz0gLS1kaXNhYmxlLXBhbQogZW5kaWYKIAorIyBTZXRzIHRoZSBlbnZpcm9ubWVu
dCBmb3IgdGhlIGBtYWtlYCB0aGF0IHdpbGwgYmUgcnVuIFpGUyBhdXRvdG9vbHMgY2hlY2tzLgor
WkZTX0NPTkZfRU5WICs9IFwKKwlBUkNIPSQoS0VSTkVMX0FSQ0gpIFwKKwlDUk9TU19DT01QSUxF
PSIkKFRBUkdFVF9DUk9TUykiCitaRlNfTUFLRV9FTlYgKz0gXAorCUFSQ0g9JChLRVJORUxfQVJD
SCkgXAorCUNST1NTX0NPTVBJTEU9IiQoVEFSR0VUX0NST1NTKSIKKwogIyBaRlMgdXNlcmxhbmQg
dG9vbHMgYXJlIHVuZnVuY3Rpb25hbCB3aXRob3V0IHRoZSBMaW51eCBrZXJuZWwgbW9kdWxlcy4K
IFpGU19NT0RVTEVfU1VCRElSUyA9IFwKIAltb2R1bGUvYXZsIFwKLS0gCjIuNDIuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
