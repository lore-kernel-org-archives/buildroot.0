Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0E8C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 21:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92D17611E4;
	Sun, 24 Jul 2022 21:29:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92D17611E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ArsDa3Hxgalq; Sun, 24 Jul 2022 21:29:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92001611E1;
	Sun, 24 Jul 2022 21:29:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92001611E1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8BC111BF33C
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 21:29:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64C00611E1
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 21:29:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64C00611E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3dw4xt5IGayl for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 21:29:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68EFB611DD
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 68EFB611DD
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 21:29:31 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id q18so3079824wrx.8
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 14:29:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=G85i94ZNMHcryLwhI9831Vb76rfZ2BWBxgs2eSrPnNA=;
 b=OWpLqJkNz+SHLvavpkNRKGGysbS2QO2kinf9HYj2PJ3ZbzOiE5tn+qxlDp5qHB8d68
 V/ZvlFNb9YRBsKdC+v1HPw9zQAnvFBVyjrxLWGURSm8iPD2Q3R0goAY8MKtGkooAp3La
 ttAlXX8T1f3zchQAMFl+wyHafbVkACf4HyHEOfw+6if8NTlzzaBPo+DnxO5bSNUJtK3H
 CMYGnUDQ6zzAcWIGMUWY+YorBZ1P6LGs1VAtXWZVey5LuJ0iFVqYPp7DMg5SNQUb0/9+
 WvhwrnDSNZDQ3M4G1x34m8LEzL9Fy2CGf0qJzmo60+2kQ+7ad/6+vjpAMmC3LoEHtzaA
 FFMw==
X-Gm-Message-State: AJIora9nPMrLtkFXBo0wSNEaIyKCY1wcwHcQwv4WSAcKc42X8Iz1uZip
 Q5sZGA9cWDdfkj+B58ysf/IUpj1GxHxLng==
X-Google-Smtp-Source: AGRyM1vLahS/aje9EZ40VxNswXreEboDeVIgpXl1D18IsKQm/p2tZ+PbqdX7yP/gqUfGoRHHN/VfHg==
X-Received: by 2002:adf:f90f:0:b0:21e:7e3d:6af6 with SMTP id
 b15-20020adff90f000000b0021e7e3d6af6mr4056551wrr.183.1658698169453; 
 Sun, 24 Jul 2022 14:29:29 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:86bb:8231:62d7:1874?
 ([2a01:cb19:8acf:5600:86bb:8231:62d7:1874])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a5d5148000000b0021e74ef5ae8sm4385320wrt.21.2022.07.24.14.29.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 14:29:29 -0700 (PDT)
Message-ID: <bd3baa17-8a7a-d43c-c8b8-478be35c86e8@smile.fr>
Date: Sun, 24 Jul 2022 23:29:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20220723210523.293598-1-romain.naour@smile.fr>
 <8b554be7-d9c3-74ce-2684-c6ab2d6c9a05@mind.be>
 <dafab4f2-f861-3646-13c4-b49f0d7493b8@mind.be>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <dafab4f2-f861-3646-13c4-b49f0d7493b8@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=G85i94ZNMHcryLwhI9831Vb76rfZ2BWBxgs2eSrPnNA=;
 b=VkKnX032muAHnxS7CIl4NWS30d7iKDiZKKffOwqIz5mq6hlTg6Fvyw0bA5mcBClvGb
 iAjOUspKcrDatOOYMP+gWN5DJrs76+HIPtHJqgWaqMv25rCRRe4EABHmKOM5oQ//4A/k
 x8GFdulRqXb4X22qG+uWbbV/TQhqLbBsqc0+Oq/0737rlrFHM0a2iZrIKV1Ye6191qXc
 4tYnkTpIytVzI1HFiKX2PDugC1lBcXAqeNE+I3hAAkwKeQz6O/CFBRosMonW9XMyIsRy
 4bnBGovRh44L2PdUDimUafSnL/VN2ExzfyuXpR6iqmiNu6AudAckiVCFBOF/Prz2SrTu
 r56A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=VkKnX032
Subject: Re: [Buildroot] [PATCH] package/mender: remove single hyphen
 command (2)
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
Cc: Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMjQvMDcvMjAyMiDDoCAxNjoxNCwgQXJub3V0IFZhbmRlY2FwcGVsbGUgYSDDqWNyaXTCoDoK
PiAKPiBPbiAyNC8wNy8yMDIyIDEyOjMxLCBBcm5vdXQgVmFuZGVjYXBwZWxsZSB3cm90ZToKPj4K
Pj4KPj4gT24gMjMvMDcvMjAyMiAyMzowNSwgUm9tYWluIE5hb3VyIHdyb3RlOgo+Pj4gU2luZ2xl
IGh5cGhlbiBjb21tYW5kcyBoYXMgYmVlbiByZW1vdmVkIHNpbmNlIE1lbmRlciAzLjAuMCBbMV0K
Pj4KPj4gwqBJIGp1c3QgYWRkZWQgbWVuZGVyLWNvbm5lY3Qgd2hpY2ggYWxzbyBoYXMgdGhlIGh5
cGhlbi4gSXMgaXQgd3JvbmcgdGhlcmUgYXMKPj4gd2VsbD8KPj4KPj4+Cj4+PiBUaGUgaHlwaGVu
IHdhcyBhZGRlZCBiYWNrIHdoaWxlIGZpeGluZyBjaGVjay1wa2cgYW5kIHNoZWxsY2hlY2sgd2Fy
bmluZ3MgWzJdCj4+Pgo+Pj4gWzFdCj4+PiBodHRwczovL2dpdGh1Yi5jb20vbWVuZGVyc29mdHdh
cmUvbWVuZGVyL2NvbW1pdC9mZDgzOGVjMWIwOGYzZDQyOWIxZDgxNjA3ZTljMzVhODdhMTA0ZWU2
Cj4+Pgo+Pj4gWzJdIDBiMzUwY2Y3NTY5MDA1ZDNlZWM2YmI1NWEzYWNkNDY4OGQyZmJkNGUKPj4+
Cj4+PiBTaWduZWQtb2ZmLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4K
Pj4+IENjOiBBZGFtIER1c2tldHQgPGFkdXNrZXR0QGdtYWlsLmNvbT4KPj4KPj4gwqBBcHBsaWVk
IHRvIG1hc3RlciwgdGhhbmtzLgo+Pgo+Pj4gLS0tCj4+PiBXZSBzdGlsbCBoYXZlIGEgcGF0Y2gg
YWRkaW5nIGEgc2ltcGxlIE1lbmRlciBydW50aW1lIHRlc3RpbmcgdGhhdCB3b3VsZAo+Pj4gY2F0
Y2ggc3VjaCBpc3N1ZToKPj4+Cj4+PiBodHRwOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVj
dC9idWlsZHJvb3QvcGF0Y2gvMjAyMjAxMDYxNDQzMDEuMTAyMjY0NC0xLXJvbWFpbi5uYW91ckBz
bWlsZS5mci8KPj4+Cj4+Cj4+IMKgSSdsbCBnZXQgYXJvdW5kIHRvIHRoYXQgb25lIC0gZXZlbnR1
YWxseSA6LSkKPiAKPiDCoEFjdHVhbGx5LCB0aGF0IHBhdGNoIGp1c3QgYWRkcyBhIGRlZmNvbmZp
Zywgbm90IGEgcnVudGltZSB0ZXN0Li4uIEhvdyB3b3VsZCBpdAo+IGhhdmUgZGV0ZWN0ZWQgdGhl
IGlzc3VlPwoKWW91J3JlIHJpZ2h0LCBJIHdhcyByZWZlcnJpbmcgdG8gYSBwYXRjaCB0aGF0IGlz
IGFjdHVhbGx5IG5vdyBtZXJnZWQgOgoKaHR0cHM6Ly9naXQuYnVpbGRyb290Lm5ldC9idWlsZHJv
b3QvY29tbWl0Lz9pZD1iYzkxZDM1ZGE3YTA0ZDhkMjhiMjBiYTRjYTMyNjcyYTJkZDFjNzM2CgpT
bywgdGhpcyBpc3N1ZSBzaG91bGQgYmUgaW4gZ2l0bGFiLWNpIHRvby4uLgoKU2VlOiBodHRwczov
L2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzI3MzMxMjE4NDkKClNv
cnJ5IGZvciB0aGUgY29uZnVzaW9uLgoKQmVzdCByZWdhcmRzLApSb21haW4KCj4gCj4gCj4gwqBS
ZWdhcmRzLAo+IMKgQXJub3V0Cj4gCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
