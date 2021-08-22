Return-Path: <SRS0=qqE2=NN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 434D4C4338F
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 19:22:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E674061262
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 19:22:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E674061262
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6F9D80CAC;
	Sun, 22 Aug 2021 19:22:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NvCOYrhQvv2N; Sun, 22 Aug 2021 19:22:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C90580CDE;
	Sun, 22 Aug 2021 19:22:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 861B31BF41A
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 19:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FA5C80CDE
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 19:22:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CMP6zkPr6v1q for <buildroot@lists.busybox.net>;
 Sun, 22 Aug 2021 19:22:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 58E2080CAC
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 19:22:34 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id k29so22836928wrd.7
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 12:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=f911DWUROgPW3IZm+XvcFLSe2AqotPNGHsYfdn+UGsc=;
 b=KCjYYWr2aSSP1mHxEGjlzWwRw1wyUlghAvTVU9O/2ekRD4GCTZoDIT2KOqjT6OuVL9
 WhI7VblSWCVpuzBCHQQkWytknlOQmkSOuOtZRkiyeqYpdp4GSNd7nes2Rg2xByEWez1K
 uyZGWdb0nbUY/fYT78UzzDEA/OU+zhdvg+LtJ2fnUrYZQEiCB3EwAqzFuVvMO7ZQjUlS
 75zxCruurhD5o41idQ6Lox45rOFavYEpNBHkQ7O0bQfFpeN1NYoQCOtWh5Vo10ihszeK
 uJNi0yl5DrNbonZXcW5iyFwGL7ue+cBjcOAHHdLkgfdM+jicYGiVFReiRCqpPDFjQwiN
 GHyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=f911DWUROgPW3IZm+XvcFLSe2AqotPNGHsYfdn+UGsc=;
 b=T/u4+bOmr3T+Oo6ND8pZlBlFOHGSmB3WHCVfWpdoDWrFeXn5euMBTnlBLXsd7yPzpV
 McmA5GySbYk7tvfo4p4PNcs6zpjrSAIcAhNccctG9aPCN9SMP50mzCSYWz4q3gVOLTsA
 aVZoneK6WRL+yMkOOwkFXlhR6ZyWuG0ShucqCJPbiSkyB4DWHFPJR8oL4aeYjU1CT4ki
 CtBrOcCwW4mMDYv2sISXen3mOlHDPQvqS71alEmXpxUWyEaU43OVUQNLLKPQMod2qnJ+
 LaXJUPM+04sVRDjHfw3aB+RrK/2h5bFGD2qVk4418fX+QRV+OgwkD2zRfnmQ5VTzWDhh
 RtxQ==
X-Gm-Message-State: AOAM531UGGCO68KXpKTADC/PGzC0/O6sZmjryOx4BTtu/8rr7x9SJzDn
 LoaPznGFU7LQgpevcXv1hAc7K63Wz86EQ9iW
X-Google-Smtp-Source: ABdhPJzby9jmCm57H0d/GU3thKEo1KdN2Mqgn9W8gxzE7MySN6AIfDJrq/8DHVnsatXdQqM3i3layg==
X-Received: by 2002:adf:fc06:: with SMTP id i6mr9524273wrr.206.1629660152465; 
 Sun, 22 Aug 2021 12:22:32 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id f10sm12658366wrx.40.2021.08.22.12.22.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Aug 2021 12:22:31 -0700 (PDT)
Date: Sun, 22 Aug 2021 21:22:29 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <YSKj9XQJbZ4jMQZB@pevik>
References: <20210822190251.280313-1-petr.vorel@gmail.com>
 <20210822190251.280313-2-petr.vorel@gmail.com>
 <1bf16d0e-12bf-db14-5f1a-9c24534be795@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1bf16d0e-12bf-db14-5f1a-9c24534be795@gmail.com>
Subject: Re: [Buildroot] [PATCH v2 2/2] package/localedef: bump to version
 2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGkgUm9tYWluLAoKPiBIZWxsbyBQZXRyLAoKPiBMZSAyMi8wOC8yMDIxIMOgIDIxOjAyLCBQZXRy
IFZvcmVsIGEgw6ljcml0wqA6Cj4gPiByZXN5bmMgdGhlIHZlcnNpb24gd2l0aCBnbGliYyBwYWNr
YWdlLgoKPiA+IERyb3BwZWQgMiBwYXRjaGVzIChmaXhlcyBiYWNrcG9ydGVkIGZyb20gcHJldmlv
dXMgcmVsZWFzZXMpLAo+ID4gcmViYXNlZCAyIHdoaWNoIGFyZSBrZXB0IChvbmx5IGxpbmUgbnVt
YmVycyBjaGFuZ2VkKS4KCj4gPiBTdWdnZXN0ZWQtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5h
b3VyQGdtYWlsLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IFBldHIgVm9yZWwgPHBldHIudm9yZWxA
Z21haWwuY29tPgoKPiBUaGFua3MgZm9yIHRoaXMgbmV3IHZlcnNpb24uCgo+IEJ1dCBpdCB3aWxs
IGNvbmZsaWN0IHdpdGggbXkgcGF0Y2ggdGhhdCByZXN5bmMgdGhlIGdsaWJjIHZlcnNpb24gZm9y
IDIuMzMKCj4gaHR0cDovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3Bh
dGNoLzIwMjEwODIxMTMxMjU2LjExMzgwMDItMS1yb21haW4ubmFvdXJAZ21haWwuY29tLwpPSywg
SSdsbCByZWJhc2UgaXQgb25jZSB5b3VyIGNvbW1pdCBnZXRzIG1lcmdlZC4KQnV0IGlmIGJ1bXAg
Y29uc2lkZXJlZCBzYWZlLCBtYXliZSBteSBjb21taXRzIGNvdWxkIGJlIHRha2VuIGFzIGl0IGlz
LgoKPiBTaW5jZSBnbGliYyBhbmQgbG9jYWxlZGVmIGFyZSByZWFsbHkgdGhlIHNhbWUgcHJvamVj
dCwgSSB3b3VsZCBzdWdnZXN0IHRvIGJ1bXAKPiB0aGUgdmVyc2lvbiB3aXRoIG9uZSBjb21taXQu
Cgo+IEkgYWdyZWUsIEl0J3Mgbm90IGNvbnZlbmllbnQgdG8gdGFrZSBjYXJlIG9mIGxvY2FsZWRl
ZiBwYWNrYWdlIGF0IHRoZSBzYW1lIHRpbWUKPiBvZiBnbGliYy4KSSB3YXMgdGhpbmtpbmcgYWJv
dXQgaXQgYXMgd2VsbCwgYnV0IHdoZW4gcGFja2FnZXMgYXJlIGluZGVwZW5kZW50IGl0J3MgSU1I
TwpzbGlnaHRseSBiZXR0ZXIgdG8gc3BsaXQgaXQuCgpLaW5kIHJlZ2FyZHMsClBldHIKCj4gQmVz
dCByZWdhcmRzLAo+IFJvbWFpbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidXN5Ym94Lm5ldApo
dHRwOi8vbGlzdHMuYnVzeWJveC5uZXQvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
