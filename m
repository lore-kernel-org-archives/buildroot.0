Return-Path: <SRS0=Fkjy=NM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 788AEC4338F
	for <buildroot@archiver.kernel.org>; Sat, 21 Aug 2021 22:06:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21FA8604AC
	for <buildroot@archiver.kernel.org>; Sat, 21 Aug 2021 22:06:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 21FA8604AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E46E380BC9;
	Sat, 21 Aug 2021 22:06:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JNTwZB5xRKsy; Sat, 21 Aug 2021 22:06:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEE2180C4A;
	Sat, 21 Aug 2021 22:06:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4331D1BF59E
 for <buildroot@lists.busybox.net>; Sat, 21 Aug 2021 22:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 31AA6605D3
 for <buildroot@lists.busybox.net>; Sat, 21 Aug 2021 22:06:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8fXx07JM9-GD for <buildroot@lists.busybox.net>;
 Sat, 21 Aug 2021 22:06:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A5AE600D1
 for <buildroot@buildroot.org>; Sat, 21 Aug 2021 22:06:38 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id o1so10391807lft.9
 for <buildroot@buildroot.org>; Sat, 21 Aug 2021 15:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pDRDbY/+tSqezDlwAmIK4pgCjlLk0CYGUICbGlvZgrI=;
 b=dZDWLB9I8j6pOrJcjt8nXhn3diIK2od+DIYDW8BIBvqK3Wke8CaAREQe16Vn1CLwso
 4IfVN779cjsIdJfWhWWIVtaxyckLZPWZCeqZAgcYjiC9lA7Q70/VwzN0jQl9QV5qzYbB
 +K8NPp2HfYTXItjqaHWOYtFlFvVaRWiKZ5Xz308D4MN0q3g/A51cWnmnS0D4x8wWgu+A
 JdZL2u+n6xwr6eaBVB+24ZENRw68TamveHyDX/EC0ToRLFGanOpdh8/Sv784TD3XxAkI
 lY/qpkDViOP9zgxuymBJnxwzUcoO/lMWT/Ho9SM7SR9IG5v5Y5FcG10Igny5QPeoB4va
 h5xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pDRDbY/+tSqezDlwAmIK4pgCjlLk0CYGUICbGlvZgrI=;
 b=AzQYta4/9zbB6hhOT+6/ifmtF8xD7d9oqU5oVfDDjR0EF1xMbO08+ucFzU0bXC4TGd
 dITbq9AuG6sPpmOlbg3euWiV0ef4J9+dVndUMihrrnit2SGphwAvJOrAzHMszMAcdINn
 nZML5AaA+1TTOkXVIMq2n2GqYw+5Yxl9ort9DthY5u81p6bcQflcJ3zGgzcDyImkvRv/
 a9uCSJqRA9V77NZZhz8lcc+/Xnax9UIRHnMGkFIGoWz3UsrOm4ChxpUWSvcG2n88rxCO
 rp6aJihscCnHX7gRtOn/MLb/BUuWtS06n8WXxUpej6Jst74F6Q3FKsH5Uyhw7Fz2XIfT
 5XPg==
X-Gm-Message-State: AOAM533zaSqG/E9o58hqWwXhJ+omprUV36tel7hkFlEMdJO6KTegbYVf
 WLer1KZ62N85xwmlkDEsW1RFFA7b7rexyedMWBw=
X-Google-Smtp-Source: ABdhPJxLyKt5X0RwFKRbOECqa/hkdMIZD97EsAXwkVm7oJ+nRsNtjJYnCBsy/bPgAXIKo58OJqecFpssni53IiHBNxY=
X-Received: by 2002:a19:e002:: with SMTP id x2mr19650062lfg.84.1629583596551; 
 Sat, 21 Aug 2021 15:06:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210821160509.1514047-1-fontaine.fabrice@gmail.com>
 <20210821210807.2a05b670@windsurf>
In-Reply-To: <20210821210807.2a05b670@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 22 Aug 2021 00:06:25 +0200
Message-ID: <CAPi7W80znOLdCLW0eXkzktx7fAXt2msLetHBzyzzqm_2+RKbMA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/mesa3d: fix build on riscv32
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Romain Naour <romain.naour@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

TGUgc2FtLiAyMSBhb8O7dCAyMDIxIMOgIDIxOjA4LCBUaG9tYXMgUGV0YXp6b25pCjx0aG9tYXMu
cGV0YXp6b25pQGJvb3RsaW4uY29tPiBhIMOpY3JpdCA6Cj4KPiBPbiBTYXQsIDIxIEF1ZyAyMDIx
IDE4OjA1OjA5ICswMjAwCj4gRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gPiBGaXggdGhlIGZvbGxvd2luZyBidWlsZCBmYWlsdXJlIG9uIHJp
c2N2MzI6Cj4gPgo+ID4gLi4vc3JjL3V0aWwvZnV0ZXguaDogSW4gZnVuY3Rpb24gJ3N5c19mdXRl
eCc6Cj4gPiAuLi9zcmMvdXRpbC9mdXRleC5oOjM5OjE5OiBlcnJvcjogJ1NZU19mdXRleCcgdW5k
ZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pOyBkaWQgeW91IG1lYW4gJ3N5c19m
dXRleCc/Cj4gPiAgICAzOSB8ICAgIHJldHVybiBzeXNjYWxsKFNZU19mdXRleCwgYWRkcjEsIG9w
LCB2YWwxLCB0aW1lb3V0LCBhZGRyMiwgdmFsMyk7Cj4gPiAgICAgICB8ICAgICAgICAgICAgICAg
ICAgIF5+fn5+fn5+fgo+ID4gICAgICAgfCAgICAgICAgICAgICAgICAgICBzeXNfZnV0ZXgKPiA+
Cj4gPiBGaXhlczoKPiA+ICAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRz
LzY5MjcwMGE1Zjk2Nzc2MGEwYjhjZDM1OGIxNzEyZjFkNWE3YjY4MWUKPiA+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KPgo+
ID4gKysjaWZuZGVmIFNZU19mdXRleAo+ID4gKysjZGVmaW5lIFNZU19mdXRleCBTWVNfZnV0ZXhf
dGltZTY0Cj4gPiArKyNlbmRpZgo+Cj4gQXJlIHdlIHN1cmUgdGhhdCBTWVNfZnV0ZXggaXMgZXhh
Y3RseSBlcXVpdmFsZW50IHRvIFNZU19mdXRleF90aW1lNjQgPwo+IEluIGFub3RoZXIgZS1tYWls
IHRocmVhZCBBcm5vdXQgc2FpZCB0aGV5IGFyZSBub3QgZXhhY3RseSBlcXVpdmFsZW50LgpJJ2xs
IGxldCBBcm5vdXQgYW5zd2VycyBidXQgdGhlIHNhbWUga2luZCBvZiBwYXRjaCB3YXMgYXBwbGll
ZCBmb3IgY2FwbnByb3RvOgpodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVp
bGRyb290L3BhdGNoLzIwMjEwNTI3MjEwNDAyLjU1NTMzNC0xLWZvbnRhaW5lLmZhYnJpY2VAZ21h
aWwuY29tCgpBbm90aGVyIG9wdGlvbiB3b3VsZCBiZSB0byBkaXNhYmxlIG1lc2EzZCBvbiByaXNj
djMyLCBlc3BlY2lhbGx5IGlmCnVwc3RyZWFtIHJlamVjdHMgdGhlIE1SLgo+Cj4gVGhvbWFzCj4g
LS0KPiBUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCj4gRW1iZWRk
ZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwo+IGh0dHBzOi8vYm9vdGxpbi5jb20KQmVz
dCBSZWdhcmRzLAoKRmFicmljZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidXN5Ym94Lm5ldApo
dHRwOi8vbGlzdHMuYnVzeWJveC5uZXQvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
