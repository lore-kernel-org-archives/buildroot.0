Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9933C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 14:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54B5A40C3E;
	Sun, 24 Jul 2022 14:14:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54B5A40C3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kd7zHN-EYesF; Sun, 24 Jul 2022 14:14:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32A0D40443;
	Sun, 24 Jul 2022 14:14:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32A0D40443
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4D8381BF3D8
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 14:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F85540443
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 14:14:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F85540443
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aHumluKLEB-F for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 14:14:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D1454032A
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0D1454032A
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 14:14:41 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 x23-20020a05600c179700b003a30e3e7989so4954459wmo.0
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 07:14:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=yck0MxxE4EzDkwpLSgI2zIEz2z0gsKBt4Ix6Cx6SR5E=;
 b=B1bBS0pX6Eo5Zw+E48MK+pcOdGWIwZwExES5F5/4BARvQikrCQQn6jp4HuWx+BB1oC
 ZmNq0KW1zntfDIHlfyKi657f2oe5Pkhj0KbvuBIEgAYtpkyQS1HbcjpLFTuvye7BK+VA
 Z48AjNrZIMLpUZECZ148DnqIeafnzaU9ruYZOTKpmJt0WTgUJ79EypE00Dy+5vBM6rVt
 Q1CyvZEeEhrY5/O8utv0oFfbDMxJi3ZhSXDMRtfb4UcKEJW91xi0qRrzxthDYE+VWUxG
 U0a8yePt/lv3dIuvCvqW8Lndaal1G++lhD/CasHchCHYVHPnGk8Fx2fJL9MEK4B/jXbf
 pTKw==
X-Gm-Message-State: AJIora+lqrheATKR1t5VNV4iEdOCs1q/+9I8Ve45oPPZAW+3cthXAwMb
 xoIQMnj4VDGl9RXy/SUvKTrjC7Pq5TAoQQ==
X-Google-Smtp-Source: AGRyM1tsClxhHdyrHceTd6qsRn3ITzm16zbzr7j0hYCcfNbfdwbMYBetBglFg+0bJnhMyh6sjhBnlg==
X-Received: by 2002:a05:600c:154c:b0:3a3:4383:e13f with SMTP id
 f12-20020a05600c154c00b003a34383e13fmr5473159wmg.16.1658672080012; 
 Sun, 24 Jul 2022 07:14:40 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 x5-20020adfdcc5000000b0021d887f9468sm9463855wrm.25.2022.07.24.07.14.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 07:14:39 -0700 (PDT)
Message-ID: <dafab4f2-f861-3646-13c4-b49f0d7493b8@mind.be>
Date: Sun, 24 Jul 2022 16:14:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
From: Arnout Vandecappelle <arnout@mind.be>
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
References: <20220723210523.293598-1-romain.naour@smile.fr>
 <8b554be7-d9c3-74ce-2684-c6ab2d6c9a05@mind.be>
Organization: Essensium/Mind
In-Reply-To: <8b554be7-d9c3-74ce-2684-c6ab2d6c9a05@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=yck0MxxE4EzDkwpLSgI2zIEz2z0gsKBt4Ix6Cx6SR5E=;
 b=Mcl9XHunfBlOHDosFpKe4dCY23F2NwhYURixSMtUS1ok9GEz+Ssc5M/nu1pb7ajbjn
 gYZglpLVBvfM1xWmtsgM6Jxcykin/MlwCoWSSCNiH73yBuvePTr4MpeRcVf2SVplcNbq
 LDLWaqLvVw8RfIv0k+Kcg0Zvvc9ul6OAHMByyVf109xvuTLL0YaI9MGEupVnkpY0Ka6q
 poBJdaCSF14y1Z6ru7KdCWvrRQPDBhWVCULv2AsGAlI11UzBITELuLBqh5uuuan1+QEG
 4oIO8jS7tTpSP0SyvhUmK/M5PqlkuNBkD6710ycRtxt9OMATjaOHF0UYyJbZCRZwC8/V
 2Wyw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Mcl9XHun
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDI0LzA3LzIwMjIgMTI6MzEsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+Cj4KPiBP
biAyMy8wNy8yMDIyIDIzOjA1LCBSb21haW4gTmFvdXIgd3JvdGU6Cj4+IFNpbmdsZSBoeXBoZW4g
Y29tbWFuZHMgaGFzIGJlZW4gcmVtb3ZlZCBzaW5jZSBNZW5kZXIgMy4wLjAgWzFdCj4KPiDCoEkg
anVzdCBhZGRlZCBtZW5kZXItY29ubmVjdCB3aGljaCBhbHNvIGhhcyB0aGUgaHlwaGVuLiBJcyBp
dCB3cm9uZyB0aGVyZSBhcyAKPiB3ZWxsPwo+Cj4+Cj4+IFRoZSBoeXBoZW4gd2FzIGFkZGVkIGJh
Y2sgd2hpbGUgZml4aW5nIGNoZWNrLXBrZyBhbmQgc2hlbGxjaGVjayB3YXJuaW5ncyBbMl0KPj4K
Pj4gWzFdIAo+PiBodHRwczovL2dpdGh1Yi5jb20vbWVuZGVyc29mdHdhcmUvbWVuZGVyL2NvbW1p
dC9mZDgzOGVjMWIwOGYzZDQyOWIxZDgxNjA3ZTljMzVhODdhMTA0ZWU2Cj4+IFsyXSAwYjM1MGNm
NzU2OTAwNWQzZWVjNmJiNTVhM2FjZDQ2ODhkMmZiZDRlCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFJv
bWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgo+PiBDYzogQWRhbSBEdXNrZXR0IDxh
ZHVza2V0dEBnbWFpbC5jb20+Cj4KPiDCoEFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCj4KPj4g
LS0tCj4+IFdlIHN0aWxsIGhhdmUgYSBwYXRjaCBhZGRpbmcgYSBzaW1wbGUgTWVuZGVyIHJ1bnRp
bWUgdGVzdGluZyB0aGF0IHdvdWxkCj4+IGNhdGNoIHN1Y2ggaXNzdWU6Cj4+Cj4+IGh0dHA6Ly9w
YXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDIyMDEwNjE0NDMw
MS4xMDIyNjQ0LTEtcm9tYWluLm5hb3VyQHNtaWxlLmZyLyAKPj4KPgo+IMKgSSdsbCBnZXQgYXJv
dW5kIHRvIHRoYXQgb25lIC0gZXZlbnR1YWxseSA6LSkKCiDCoEFjdHVhbGx5LCB0aGF0IHBhdGNo
IGp1c3QgYWRkcyBhIGRlZmNvbmZpZywgbm90IGEgcnVudGltZSB0ZXN0Li4uIEhvdyB3b3VsZCBp
dCAKaGF2ZSBkZXRlY3RlZCB0aGUgaXNzdWU/CgoKIMKgUmVnYXJkcywKIMKgQXJub3V0CgoKPgo+
IMKgUmVnYXJkcywKPiDCoEFybm91dAo+PiAtLS0KPj4gwqAgcGFja2FnZS9tZW5kZXIvUzQybWVu
ZGVyIHwgMiArLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbWVuZGVyL1M0Mm1lbmRlciBiL3BhY2th
Z2UvbWVuZGVyL1M0Mm1lbmRlcgo+PiBpbmRleCAyOTAwOGJlY2EwLi4wZjIwNzdkMDg5IDEwMDY0
NAo+PiAtLS0gYS9wYWNrYWdlL21lbmRlci9TNDJtZW5kZXIKPj4gKysrIGIvcGFja2FnZS9tZW5k
ZXIvUzQybWVuZGVyCj4+IEBAIC01LDcgKzUsNyBAQAo+PiDCoCBEQUVNT049Im1lbmRlciIKPj4g
wqAgREFFTU9OX1BBVEg9Ii91c3IvYmluL21lbmRlciIKPj4gwqAgUElERklMRT0iL3Zhci9ydW4v
JHtEQUVNT059LnBpZCIKPj4gLURBRU1PTl9BUkdTPSItZGFlbW9uIgo+PiArREFFTU9OX0FSR1M9
ImRhZW1vbiIKPj4gwqAgwqAgc3RhcnQoKSB7Cj4+IMKgwqDCoMKgwqAgIyBJZiAvdmFyL2xpYi9t
ZW5kZXIgaXMgYSBzeW1saW5rIHRvIC92YXIvcnVuL21lbmRlciwgYW5kCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
