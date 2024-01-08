Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13AE8C3DA6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 20:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8665741E0F;
	Mon,  8 Jan 2024 20:20:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8665741E0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y29J7wmH7gei; Mon,  8 Jan 2024 20:20:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D760E41DA4;
	Mon,  8 Jan 2024 20:20:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D760E41DA4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B51791BF2BA
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 20:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C32941749
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 20:20:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C32941749
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OsSjA8JUmfJW for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 20:20:09 +0000 (UTC)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DEEA041721
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 20:20:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEEA041721
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a2a1a584e8bso201113166b.1
 for <buildroot@buildroot.org>; Mon, 08 Jan 2024 12:20:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704745206; x=1705350006;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5CoA5YnRdjm5fsJHmkqFJKSI07wM5U9gXAbQA8rdeXo=;
 b=rCRLVEqMp7EW7yvsYLufYNTXYX5WjJOUNBASsihHm0XECpnc8g3UlzoMRkalx0yPB6
 i6Y0HjLSp4O7GDD2BHpnzhSTrDgtTy0vyCaXOMkTq1pvURQXVZn2ZTb2Kahhi31GttI5
 b4phqzI5rHMc7FIZwwFPbOZnDkklcDzeDO/3LR9PYQgXzBH9E2whv411uCfFV3dUPo5c
 q8fyxqPgBHMlh7xy6xAGp2Oi/Jw39u8IyD1X+VXkDFzjujMCp3H11do7IyAKX1wnHivx
 JFmfEKvb4g/Hp5o5Ow2HdujKyaD4ES3HcnPwX2AsspNXGdQ3vnkxXMro2WLFqnstasOp
 hftg==
X-Gm-Message-State: AOJu0Yx+WKL6c0H6x7xKZnlSy7tNC7mIDoKUMNrOVCQFTzEFaIgAt5lz
 l9vGtizXsRvirnbTrEVN8oA2s9WvFZCNB1RetJj3Kr4BzrsLNjHNVr91om8RiIw=
X-Google-Smtp-Source: AGHT+IHxuV7+YQ6z+WUIrakRjxdvjJQvqNudEmbAEQOpllKSR5EUaAO38qW4l0C5J62Yl9UCrFKo/buePYVA6oRkIGg=
X-Received: by 2002:a17:906:8742:b0:a28:c89b:6f68 with SMTP id
 hj2-20020a170906874200b00a28c89b6f68mr1363885ejb.125.1704745206667; Mon, 08
 Jan 2024 12:20:06 -0800 (PST)
MIME-Version: 1.0
References: <20240106220531.3285689-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20240106220531.3285689-1-fontaine.fabrice@gmail.com>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Mon, 8 Jan 2024 13:19:55 -0700
Message-ID: <CAHDQB6O=u7-qE3ScT-yOq6OaKUe=dPkb6DWu6kshL==3hH3D8A@mail.gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1704745206; x=1705350006;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5CoA5YnRdjm5fsJHmkqFJKSI07wM5U9gXAbQA8rdeXo=;
 b=bty7Qv3/YWhC0W7CAXTnjsJ23Wwy0tQugO9UGDhc7wNrWQSbpJXhWptkHlykjmi//3
 FBtBQAS/JUAEzqgtQMAJlCc2DXBhnA5l2Tpl2WsmEaBybDBgHekQvpw4vbfz2heBHaRL
 sOtuQzpxhflNT2ap83TIGfuvnF515E0OT3nUs=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=bty7Qv3/
Subject: Re: [Buildroot] [PATCH 1/1] package/libutempter: fix dependencies
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWxsOwoKVGhhbmsgeW91IEZhYnJpY2UgZm9yIHRoZSBwYXRjaCEgTG9va3MgZ29vZCB0byBtZSEK
ClJldmlld2VkLWJ5OiBBZGFtIER1c2tldHQgPGFkYW0uZHVza2V0dEBhbWFydWxhc29sdXRpb25z
LmNvbT4KVGVzdGVkLWJ5OiBBZGFtIER1c2tldHQgPGFkYW0uZHVza2V0dEBhbWFydWxhc29sdXRp
b25zLmNvbT4KCgoKT24gU2F0LCBKYW4gNiwgMjAyNCBhdCAzOjA14oCvUE0gRmFicmljZSBGb250
YWluZQo8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gQ29tbWl0IDAyYzgx
OGJjNWM3YTY5NjdhMjEyZjEyZTRjYWE4Y2NkZmEwYjQ1MmIgZm9yZ290IHRvIGFkZAo+IGRlcGVu
ZGVuY2llcyByZXN1bHRpbmcgaW4gdGhlIGZvbGxvd2luZyBzdGF0aWMgYnVpbGQgZmFpbHVyZToK
Pgo+IC9ob21lL2F1dG9idWlsZC9hdXRvYnVpbGQvaW5zdGFuY2UtNS9vdXRwdXQtMS9ob3N0L2Jp
bi9hcm0tYnVpbGRyb290LWxpbnV4LXVjbGliY2dudWVhYmktZ2NjIC1XbCwteixyZWxybyAtV2ws
LXN0YXRzICAtc3RhdGljICAtc2hhcmVkIFwKPiAgICAgICAgIC1XbCwtc29uYW1lLGxpYnV0ZW1w
dGVyLnNvLjAsLS12ZXJzaW9uLXNjcmlwdD1saWJ1dGVtcHRlci5tYXAsLXosZGVmcyBcCj4gICAg
ICAgICAtbGMgaWZhY2Uub3MgLW8gbGlidXRlbXB0ZXIuc28KPiAvaG9tZS9hdXRvYnVpbGQvYXV0
b2J1aWxkL2luc3RhbmNlLTUvb3V0cHV0LTEvaG9zdC9saWIvZ2NjL2FybS1idWlsZHJvb3QtbGlu
dXgtdWNsaWJjZ251ZWFiaS8xMi4zLjAvLi4vLi4vLi4vLi4vYXJtLWJ1aWxkcm9vdC1saW51eC11
Y2xpYmNnbnVlYWJpL2Jpbi9sZDogL2hvbWUvYXV0b2J1aWxkL2F1dG9idWlsZC9pbnN0YW5jZS01
L291dHB1dC0xL2hvc3QvYXJtLWJ1aWxkcm9vdC1saW51eC11Y2xpYmNnbnVlYWJpL3N5c3Jvb3Qv
bGliL2xpYmMuYShfX3VDbGliY19tYWluLm9zKTogaW4gZnVuY3Rpb24gYF9fdUNsaWJjX2Zpbmkn
Ogo+IF9fdUNsaWJjX21haW4uYzooLnRleHQrMHgxOTApOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRv
IGBfX2ZpbmlfYXJyYXlfc3RhcnQnCj4KPiBGaXhlczoKPiAgLSBodHRwOi8vYXV0b2J1aWxkLmJ1
aWxkcm9vdC5vcmcvcmVzdWx0cy83ODFhYjM5MzQ1NWYwZTY4MjNiODUwZjQ3NGY2ZmUzOGIyN2Q4
ZWZhCj4KPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNl
QGdtYWlsLmNvbT4KPiAtLS0KPiAgcGFja2FnZS9saWJ1dGVtcHRlci9Db25maWcuaW4gfCAyICsr
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9wYWNr
YWdlL2xpYnV0ZW1wdGVyL0NvbmZpZy5pbiBiL3BhY2thZ2UvbGlidXRlbXB0ZXIvQ29uZmlnLmlu
Cj4gaW5kZXggYTA2YTI0MDQxOC4uNWI3OWMxZTQ0ZCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2xp
YnV0ZW1wdGVyL0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvbGlidXRlbXB0ZXIvQ29uZmlnLmlu
Cj4gQEAgLTEsNSArMSw3IEBACj4gIGNvbmZpZyBCUjJfUEFDS0FHRV9MSUJVVEVNUFRFUgo+ICAg
ICAgICAgYm9vbCAibGlidXRlbXB0ZXIiCj4gKyAgICAgICBkZXBlbmRzIG9uIEJSMl9UT09MQ0hB
SU5fSEVBREVSU19BVF9MRUFTVF80XzE0Cj4gKyAgICAgICBkZXBlbmRzIG9uICFCUjJfU1RBVElD
X0xJQlMKPiAgICAgICAgIGhlbHAKPiAgICAgICAgICAgVGhlIGxpYnV0ZW1wdGVyIGxpYnJhcnkg
cHJvdmlkZXMgaW50ZXJmYWNlIGZvciB0ZXJtaW5hbAo+ICAgICAgICAgICBlbXVsYXRvcnMgc3Vj
aCBhcyBzY3JlZW4gYW5kIHh0ZXJtIHRvIHJlY29yZCB1c2VyCj4gLS0KPiAyLjQzLjAKPgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
