Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 042D6C433F5
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:58:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE2AB61165
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:58:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BE2AB61165
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F77D83EA1;
	Tue, 21 Sep 2021 20:58:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3DBWmR5_iGPj; Tue, 21 Sep 2021 20:58:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFE5683E7B;
	Tue, 21 Sep 2021 20:57:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7023F1BF47E
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:57:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BF0D60ECD
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:57:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G7IZLanlD4Sh for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 20:57:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8195860A3C
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 20:57:57 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id v5so1459495edc.2
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 13:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=054avgxmoC6t+8cOtT8F6zTrfGO8aPYONw79A2NMPpQ=;
 b=jHjhZWH2CJyE82kcu40Z0QuoHOTkJEsNhOiBdayUV/39FWR2ckFoOybnLTYan445WB
 hk7XAWGux8T/plBGiNVWyvZqVNrFOZtck4Uc2m0yqnLmlAnSozi5FqG2lWQsrVdVgLlb
 cNvIxUBKenYQv491NoBZtPt8qqqV4YLWsAJV3Ur13IE7760dRP07MwhOBejRnKdTFpPD
 2QAqCHTi2/dwewRfgNwFJ3LM+8nB/pvyM7fdY+OaGgmOx5theP51OINAE/FRGHQ//ZnX
 KXH9CzpOkKqVDpWUbGKKFL6BS3olgfmifaUsaWjr4dfTEbl4TvIOSHp7Hbty3YkRTBUu
 bkKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=054avgxmoC6t+8cOtT8F6zTrfGO8aPYONw79A2NMPpQ=;
 b=je4fSzV0jX759Xkf/oK8AfbeNjL15RINLxebgMIFxseRng2TTOzSD3fcbXAYi9375C
 IYDEfnAumsLN4aAg5XuPlNwkK4jfo5Gf3r6pcttXLGwYzeGgg72s4oSEqVt6kA2ttOpu
 ZJyCRSZWgltArH0Lqj8mZoufmujbveTwApZqQRafd2K51S7FOOi2iznawBoh5FSbyGVA
 PG/65/QGaJNLU+bfQGEYEGd+mUJoCzCSc53x5WNWSyo9G4e/O24WPNsb+oPY7VCoaOzk
 GSOD4xO5YnwAdiXlGabX3wyaAAAfUtAUkFvJIQ8aXW4UlnPP5z7su0tlx+kSwk2HVAvQ
 0P+Q==
X-Gm-Message-State: AOAM532iLT7HIh0POK/dtxZMlJGafqmJDyO9eOod2thrFJFjelCKtzP7
 lmwHt12my7tYS9AYYyhLVdI=
X-Google-Smtp-Source: ABdhPJz/caA6/DltiTwNqUhIlZyUZ6Yz4sRRSGO3J55fVMsx+ftDE46crVA545Tq9wdwh+ZFZFNKfg==
X-Received: by 2002:a17:906:8981:: with SMTP id
 gg1mr37342391ejc.95.1632257875701; 
 Tue, 21 Sep 2021 13:57:55 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id p8sm27377ejo.2.2021.09.21.13.57.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 13:57:54 -0700 (PDT)
Date: Tue, 21 Sep 2021 22:57:52 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <YUpHUKClwm4frUx9@pevik>
References: <20210915194839.22122-1-petr.vorel@gmail.com>
 <20210915194839.22122-2-petr.vorel@gmail.com>
 <41cb0bdf-845d-ab94-0322-c4d1393f40b8@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <41cb0bdf-845d-ab94-0322-c4d1393f40b8@gmail.com>
Subject: Re: [Buildroot] [PATCH v2 1/4] support: utils: use python3
 explicitly
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: David Laight <David.Laight@aculab.com>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

SGkgUm9tYWluLAoKPiBIZWxsbyBQZXRyLAoKPiBMZSAxNS8wOS8yMDIxIMOgIDIxOjQ4LCBQZXRy
IFZvcmVsIGEgw6ljcml0wqA6Cj4gPiBQeXRob24gMiBpcyBFT0wgc2ljZSAyMDIwIFsxXSwgaXQn
cyBzdGlsbCBhdmFpbGFibGUgb24gZGlzdHJvcywgYnV0IG1heSBub3QKPiA+IGJlIGluc3RhbGxl
ZCBieSBkZWZhdWx0IChhcyBiZWluZyByZXBsYWNlZCBieSBweXRob24zKS4KCj4gPiBUaHVzIHJl
bW92ZSBjb21wYXRpYmlsaXR5IGltcG9ydHM6Cj4gPiBmcm9tIF9fZnV0dXJlX18gaW1wb3J0IHBy
aW50X2Z1bmN0aW9uCj4gPiBmcm9tIF9fZnV0dXJlX18gaW1wb3J0IGFic29sdXRlX2ltcG9ydAoK
PiA+IFRlc3RlZCB3aXRoIHB5dGhvbjMgLW0gcHlfY29tcGlsZS4KCj4gPiBbMV0gaHR0cHM6Ly93
d3cucHl0aG9uLm9yZy9kb2Mvc3Vuc2V0LXB5dGhvbi0yLwoKPiA+IFNpZ25lZC1vZmYtYnk6IFBl
dHIgVm9yZWwgPHBldHIudm9yZWxAZ21haWwuY29tPgo+ID4gLS0tCgo+ID4gZGlmZiAtLWdpdCBh
L3V0aWxzL2dldC1kZXZlbG9wZXJzIGIvdXRpbHMvZ2V0LWRldmVsb3BlcnMKPiA+IGluZGV4IDkx
ODJiMmQ4NWYuLjIyYWNjYWYxODEgMTAwNzU1Cj4gPiAtLS0gYS91dGlscy9nZXQtZGV2ZWxvcGVy
cwo+ID4gKysrIGIvdXRpbHMvZ2V0LWRldmVsb3BlcnMKPiA+IEBAIC0xLDQgKzEsNCBAQAo+ID4g
LSMhL3Vzci9iaW4vZW52IHB5dGhvbgo+ID4gKyMhL3Vzci9iaW4vZW52IHB5dGhvbjMKCj4gPiAg
aW1wb3J0IGFyZ3BhcnNlCj4gPiAgaW1wb3J0IGdldGRldmVsb3BlcmxpYgoKPiBUaGVyZSBpcyBv
bmUgcmVtYWluaW5nIF9fZnV0dXJlX18gdG8gcmVtb3ZlOgoKPiB1dGlscy9nZXRkZXZlbG9wZXJs
aWIucHk6ZnJvbSBfX2Z1dHVyZV9fIGltcG9ydCBwcmludF9mdW5jdGlvbgpUaGFua3MhCgo+IEl0
IHdhcyByZW1vdmVkIGJ5IHlvdXIgcGF0Y2ggMy80IGJ1dCBpdCB3YXMgcmVqZWN0ZWQ6Cj4gaHR0
cDovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjEwOTE1
MTk0ODM5LjIyMTIyLTQtcGV0ci52b3JlbEBnbWFpbC5jb20vCgpJIHNldCBpdCBhcyByZWplY3Rl
ZC4KCj4gTWF5YmUgaXQgY2FuIGJlIHJlbW92ZWQgZGlyZWN0bHkgZnJvbSB0aGlzIHBhdGNoLgpO
YWgsIEkgY2FuIHNlbmQgdjMgd2l0aCB0aGlzIGZpeGVkLgoKPiBCZXN0IHJlZ2FyZHMsCj4gUm9t
YWluCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGxpc3RzLmJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
