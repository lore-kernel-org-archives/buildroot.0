Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA6CAE9128F
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 14:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C307408BC;
	Thu,  5 Feb 2026 14:43:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hxp6rceBaAOp; Thu,  5 Feb 2026 14:43:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B70640B9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770302596;
	bh=eOoQmruOnT8iQSVTk8LS3EmCCQA0NpNwSUhcQ6V25B0=;
	h=Date:Cc:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fSPh0pvVPhpDVbNCKi4r0mZhT6EMkj20bI1UCjVwg8QqrajNRHkArCg2AXo8hY9Qg
	 KIOTKpF3IMkeEUyU2nbrzcz4BvIuRpuEpPCKPZHvQ6P72QU9x9YlC1CyzUlSoMe6uq
	 Vy1pdr2dkMqmwsOajQzo4+kbysF4r0h4S6+6fSZLoQJd1yGAS+FCZbkzhGTO5p+e2y
	 e3rW4CB7A7CnZrY5Z25lL51M4SvWbIO2FCr/ADbflkpaq7/p9R7qPZ1Y3cp3P3Wx3Y
	 KO5WczAOuejhnPfkAyNt0omn8w+tkPJLoeQgPJTZ6PAeoPpwWSStMz/XbUQjajNQEm
	 ZymI9ptlAzToQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B70640B9A;
	Thu,  5 Feb 2026 14:43:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 73761117
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 14:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54C0661103
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 14:43:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KrtB3NFf6IFm for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 14:43:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0B3F06064F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B3F06064F
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0B3F06064F
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 14:43:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 91FF5C243AC;
 Thu,  5 Feb 2026 14:43:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 47C3C606FD;
 Thu,  5 Feb 2026 14:42:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3923C119A865B; Thu,  5 Feb 2026 15:42:55 +0100 (CET)
Date: Thu, 05 Feb 2026 15:42:55 +0100
Message-Id: <DG73VZS2GY3F.2MNGH5BX4A5JR@bootlin.com>
Cc: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Romain Naour" <romain.naour@smile.fr>, "Peter Korsgaard"
 <peter@korsgaard.com>, "Romain Naour via buildroot"
 <buildroot@buildroot.org>
Mime-Version: 1.0
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260202213637.396090-1-romain.naour@smile.fr>
 <87jywt8mwf.fsf@dell.be.48ers.dk>
 <23949c8d-e427-419d-8ad6-325b6277a2cc@smile.fr>
In-Reply-To: <23949c8d-e427-419d-8ad6-325b6277a2cc@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770302578; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ZQ7QleO+J1o/ISCdPlk/Gjgb6qypl4gXt+hcHoPppMg=;
 b=k7nnVfQ0X9HM5oEWH7cfJUaEEorCO0FngCehRQob+CFlnH+S37gJqyMpskX3i3NRHFngdl
 guXV1m5Nu3+Y7tMe/Aw3+tjcq+9OPOnxsNjY5f0dVqe/mykIl7XLX+YuBaB6MuUFxVEkvh
 cYcZRxjv8L6g5FzYvjotBbSnuBukcnthfFEoy5ZWv9AOwFrT3U6ADNfxXphDIM797T4USp
 B/BhrtGmFJWj1C6BjSSRG8khIxLgDgGTZInvbhIeIz7Xdsz+SUlszR5TnntcmAJQzLcF+X
 kzWrfENjRczv4hDeMX1oTjh/hMjgWO6ZMA5yONJFEQslt+EQ3ixzZyXKp7+c+A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=k7nnVfQ0
Subject: Re: [Buildroot] [PATCH] package/php-lua: add support for php >= 8.5
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluLApzb3JyeSBmb3IgdGhlIGxhdGVuY3kKCk9uIFdlZCBGZWIgNCwgMjAyNiBhdCA5
OjM1IEFNIENFVCwgUm9tYWluIE5hb3VyIHdyb3RlOgo+IEFsbCBQZXRlciwgQWxsLAo+Cj4gQWRk
aW5nIEFsZXhpcyBpbiBDYy4KPgo+IExlIDAzLzAyLzIwMjYgw6AgMjM6NDcsIFBldGVyIEtvcnNn
YWFyZCBhIMOpY3JpdMKgOgo+Pj4+Pj4+ICJSb21haW4iID09IFJvbWFpbiBOYW91ciB2aWEgYnVp
bGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JpdGVzOgoKWy4uLl0KCj4+IElmIGl0
IGlzIGRlYWQsIHNob3VsZCB3ZSB0aGVuIG5vdCBkcm9wIHRoZSBwYWNrYWdlPwo+PiAKPj4gQW55
d2F5LCBmb3Igbm93IC0gQ29tbWl0dGVkLCB0aGFua3MuCj4+IAo+Cj4gWW91J3JlIHJpZ2h0LCBi
dXQgaXQncyBhIG9uZSBsaW5lIGNoYW5nZSBvbmx5IGZvciB0aGUgc2FrZSBvZiB0aGUgcnVudGlt
ZQo+IHRlc3Rpbmcgd2UgaGF2ZSBpbiBCdWlsZHJvb3QgKGFuZCBmb3IgdGhlIHdlZWtseSBnaXRs
YWItY2kgcmVzdWx0cykuCj4KPiBBbGV4aXMsIGRvIHlvdSBrbm93IGlmIHBocC1sdWEgY2FuIGJl
IHJlbW92ZWQ/ICh5b3UgYWRkZWQgUEhQOC9HQ0MxNCBzdXBwb3J0Cj4gcmVjZW50bHkpCgpUaGUg
dXNlciBmb3Igd2hvbSBJIHVwZGF0ZWQgdGhlIHBhY2thZ2UgaXMgc3RpbGwgdXNpbmcgaXQsIGJ1
dCBpbiB0aGUKcHJvY2VzcyBvZiBnZXR0aW5nIHJpZCBvZiBpdC4gQXMgdGhlIHVwc3RyZWFtIHJl
cG9zaXRvcnkgaW5kZWVkIGxvb2tzCmRlYWQsIGhlIGhhcyBiZWVuIHdhcm5lZCB0aGF0IHRoZSBw
YWNrYWdlIGlzIG9uIHRoZSB2ZXJnZSBvZiBiZWluZwpyZW1vdmVkLiBUaGFua3MgZm9yIHRoZSBu
b3RpZmljYXRpb24gOikKCkFsZXhpcwoKPgo+IEJlc3QgcmVnYXJkcywKPiBSb21haW4KCgoKCi0t
IApBbGV4aXMgTG90aG9yw6ksIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdp
bmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
