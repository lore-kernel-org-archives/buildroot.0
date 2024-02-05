Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7605C48295
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 15:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FF6F41764;
	Mon,  5 Feb 2024 15:37:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FF6F41764
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3uy7Dc3euKKI; Mon,  5 Feb 2024 15:37:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AECBE416DE;
	Mon,  5 Feb 2024 15:37:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AECBE416DE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7C3F41BF2F6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 15:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 578C340377
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 15:37:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 578C340377
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sksT3T2D9-tW for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 15:37:00 +0000 (UTC)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E212140320
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 15:36:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E212140320
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-51124d86022so7016172e87.0
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 07:36:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707147418; x=1707752218;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bQeYWRMoY/RBT6qXmdTSqZh9A4AECoKGIaJdW5c7qoA=;
 b=SNryyieiqDbzqngRWj/TcAUDC/5i9GnqRaFcmLELPxWy7V9C/ehwg2qaOzDF6x+rYV
 +NdmEjl14BrLBZ8NdhymFHyL45pAYxBZkKghzsZzN7In2yoRgHHW9/CdWcQs1LngzRbm
 NXfwDkpEdQhle1zLgAa0GiAP4r7y4yWGy6hl1hCnsa7f+gCm1ZNPrgqme3xba44YCiP1
 sNU++VJ/OzKzKnN12n3Zm5cS/mfY/W69qYy3sm1YPcoD/wkBOd682OdcSpSnZsigQb4P
 iXPYhnG8+He+l1UR94abC0b6s38Pw7nvTOj+WwCvtM5bJRhpUzlU+AgiECf4d1uVJqFz
 KclQ==
X-Gm-Message-State: AOJu0YxJ/u8htyaF49E2MDHU0HzEgBO9r388qy+mjaggbp4JSyHrapV3
 vqsl+gXMbEvRDXIT4Tspn+y8qvBL4fB7uOE/QSukyevhIVOzwhFNuMgDDd4fAgxdrRVBd27iPmh
 uiTWSXDyRvWZytBh0zsfPtT5CN/jY+LY1IjZrJg==
X-Google-Smtp-Source: AGHT+IE5mnnnbNs7hLj08lU3rLhDygqTicsHIoMaPVGCeRuVM1BlM8XlyochGTwW5Frj/XCXIApvHszxr/soJ8t4nR4=
X-Received: by 2002:a19:4359:0:b0:511:4a01:2faa with SMTP id
 m25-20020a194359000000b005114a012faamr3192390lfj.32.1707147417507; Mon, 05
 Feb 2024 07:36:57 -0800 (PST)
MIME-Version: 1.0
References: <20240116214427.945514-1-fontaine.fabrice@gmail.com>
 <20240205163358.7752aec0@windsurf>
In-Reply-To: <20240205163358.7752aec0@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 5 Feb 2024 16:36:45 +0100
Message-ID: <CAPi7W82Bn1_zo8dxaghGDifmaiwOz8SWR1JiFgV6FFhPru2B6Q@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707147418; x=1707752218; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bQeYWRMoY/RBT6qXmdTSqZh9A4AECoKGIaJdW5c7qoA=;
 b=ENE7YmZMjtQPdINVPQXYVuoZ3amZFyg1KXbB6E2vTrBQ62sI4F8I5spBEppzwzPDa4
 QBn2c4kcYFJlNkJrAynkdXBJWwbpw3PtncgAZlnX0qS613ioz1Hyka/LEkOQpp/RJVNs
 djQNo+5fMj8gi89g9/GUsv+gnUqAHJUm9ms4BAezuaOQbW8sNfO1XoTgcDfnu8dYmIWf
 GEC9OD4gmrSpgQ0i9njpqLfC8g9dOdTXxeADNji92Vc7oNAOxjaAEw7ntvYNYM8VI5PK
 D/ASaGqHfLLJ9vLwJJlAQjnXIuLxzVWv558R18rVvDheI6l46cy+jYoghwxkXvU5p8fF
 rEew==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ENE7YmZM
Subject: Re: [Buildroot] [PATCH 1/1] package/libtracefs: needs threads
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKTGUgbHVuLiA1IGbDqXZyLiAyMDI0IMOgIDE2OjM0LCBUaG9tYXMgUGV0YXp6
b25pCjx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiBhIMOpY3JpdCA6Cj4KPiBPbiBUdWUs
IDE2IEphbiAyMDI0IDIyOjQ0OjI3ICswMTAwCj4gRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUu
ZmFicmljZUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiBsaWJ0cmFjZWZzIG5lZWRzIHRocmVhZHMg
cmVzdWx0aW5nIGluIHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVyZSBzaW5jZQo+ID4gaXRzIGFk
ZGl0aW9uIGluIGNvbW1pdCBiMWRiZDNmNjc5ZTY2NjAzMjU0NzJlM2ZkY2E3MjEyN2Q3NGU2OTI5
Ogo+ID4KPiA+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSAvaG9tZS9hdXRvYnVpbGQvYXV0b2J1aWxk
L2luc3RhbmNlLTIvb3V0cHV0LTEvaG9zdC94dGVuc2EtYnVpbGRyb290LWxpbnV4LXVjbGliYy9z
eXNyb290L3Vzci9pbmNsdWRlL3N0ZGlvLmg6MjcsCj4gPiAgICAgICAgICAgICAgICAgIGZyb20g
Li4vc3JjL3RyYWNlZnMtaW5zdGFuY2UuYzoxMDoKPiA+IC9ob21lL2F1dG9idWlsZC9hdXRvYnVp
bGQvaW5zdGFuY2UtMi9vdXRwdXQtMS9ob3N0L3h0ZW5zYS1idWlsZHJvb3QtbGludXgtdWNsaWJj
L3N5c3Jvb3QvdXNyL2luY2x1ZGUvZmVhdHVyZXMuaDoyMTg6NTogd2FybmluZzogI3dhcm5pbmcg
cmVxdWVzdGVkIHJlZW50cmFudCBjb2RlLCBidXQgdGhyZWFkIHN1cHBvcnQgd2FzIGRpc2FibGVk
IFstV2NwcF0KPiA+ICAgMjE4IHwgIyAgIHdhcm5pbmcgcmVxdWVzdGVkIHJlZW50cmFudCBjb2Rl
LCBidXQgdGhyZWFkIHN1cHBvcnQgd2FzIGRpc2FibGVkCj4gPiAgICAgICB8ICAgICBefn5+fn5+
Cj4gPiAuLi9zcmMvdHJhY2Vmcy1pbnN0YW5jZS5jOjIwOjEwOiBmYXRhbCBlcnJvcjogcHRocmVh
ZC5oOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5Cj4gPiAgICAyMCB8ICNpbmNsdWRlIDxwdGhy
ZWFkLmg+Cj4gPiAgICAgICB8ICAgICAgICAgIF5+fn5+fn5+fn5+Cj4gPgo+ID4gRml4ZXM6Cj4g
PiAgLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy9lMGE4ZGQwNzgxYTFk
MTgyNGE0Y2I3OGY0N2RjZmY0MDU1MDgzOTU5Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRmFicmlj
ZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICBwYWNr
YWdlL2xpYnRyYWNlZnMvQ29uZmlnLmluICB8IDUgKysrLS0KPiA+ICBwYWNrYWdlL2xpbnV4LXRv
b2xzL0NvbmZpZy5pbiB8IDUgKysrLS0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IFRoYW5rcyBhIGxvdCEgSXQgbG9va3MgbGlrZSB5b3Ug
bWlzc2VkIHRyYWNlLWNtZCBwYWNrYWdlLCB3aGljaCBhbHNvCj4gc2VsZWN0cyBsaWJ0cmFjZWZz
LCBzbyBJIGZpeGVkIHRoYXQgdXAgd2hlbiBhcHBseWluZy4gVGhhbmtzIQoKSSBkaWRuJ3QgbWlz
cyB0cmFjZS1jbWQsIGl0IGFscmVhZHkgaGFzIGEgZGVwZW5kZW5jeSBvbgpCUjJfVE9PTENIQUlO
X0hBU19USFJFQURTX05QVEwuCgo+Cj4gVGhvbWFzCj4gLS0KPiBUaG9tYXMgUGV0YXp6b25pLCBD
VE8sIEJvb3RsaW4KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCj4gaHR0
cHM6Ly9ib290bGluLmNvbQoKQmVzdCBSZWdhcmRzLAoKRmFicmljZQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
