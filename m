Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B33EB64D7
	for <buildroot@archiver.kernel.org>; Wed, 28 Jun 2023 18:58:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E70C40904;
	Wed, 28 Jun 2023 18:58:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E70C40904
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4wX2EJUPlyrs; Wed, 28 Jun 2023 18:58:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72887405F1;
	Wed, 28 Jun 2023 18:58:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72887405F1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3F4501BF4E4
 for <buildroot@lists.busybox.net>; Wed, 28 Jun 2023 18:58:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1895B60C0A
 for <buildroot@lists.busybox.net>; Wed, 28 Jun 2023 18:58:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1895B60C0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c15ngiAtGzXq for <buildroot@lists.busybox.net>;
 Wed, 28 Jun 2023 18:58:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E247D60B35
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E247D60B35
 for <buildroot@buildroot.org>; Wed, 28 Jun 2023 18:58:17 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4f76a0a19d4so8868361e87.2
 for <buildroot@buildroot.org>; Wed, 28 Jun 2023 11:58:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687978695; x=1690570695;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PfN52X9RHaGI5lrDlEBwX8SXI0K/TVXVVEZ0G3Npppk=;
 b=Nhn3GaPi5m7YQkunNi7ARJz9yNmg+gXtIWlehspfeHiBA6rVYu4m+WpwTARTEyt55r
 obLGA6KsQVRJUaH4Kt/ZOkSyPZqmu8Uj+ERuvk307oKU/I6F63xsxHmjBCpmqdGFIvbh
 7B/HjB5OEDRRRcLxFAGKmtyOre4XOQjDugxuDzLjFOg+jp+ctGDaVLA9yOMac4gHgHoJ
 655t0q5NBQaYBoYDnfGWKZsFMxp5O/z0KEaKptIwKUEhSnb0Ho9uhLQhNzvZ8DROGHLC
 ZfHm4zaWqOpg1qt3Yqrp6+4a5r2O45AjPHwwwlGJt2Xa80RKYITyzIJ58xifg7kTnllC
 Hg8g==
X-Gm-Message-State: AC+VfDwAwRxdavnlXld6xASjkxZ9pphd2NP9nT9H05eQcpoRfH4oSUBd
 ZmMrWNwaTEwBvDsT2HypohgqYHzmoBfYEBCPvFs=
X-Google-Smtp-Source: ACHHUZ6UHO2aryICq91ghe928uoGVKWs3e0GMarOI0UzvAmDxFfMYf7jhd6vsm/lyjICxvvcm7Y5VQ==
X-Received: by 2002:a19:e044:0:b0:4f9:52f3:9a2b with SMTP id
 g4-20020a19e044000000b004f952f39a2bmr16502237lfj.54.1687978695241; 
 Wed, 28 Jun 2023 11:58:15 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com.
 [209.85.167.44]) by smtp.gmail.com with ESMTPSA id
 t11-20020ac2548b000000b004f8730eecf4sm785775lfk.184.2023.06.28.11.58.14
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jun 2023 11:58:14 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-4fb761efa7aso5756556e87.0
 for <buildroot@buildroot.org>; Wed, 28 Jun 2023 11:58:14 -0700 (PDT)
X-Received: by 2002:a05:6512:304f:b0:4fb:8de9:ac13 with SMTP id
 b15-20020a056512304f00b004fb8de9ac13mr2854488lfb.23.1687978693552; Wed, 28
 Jun 2023 11:58:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230606214556.174086-1-christian@aperture.us>
In-Reply-To: <20230606214556.174086-1-christian@aperture.us>
Date: Wed, 28 Jun 2023 11:58:02 -0700
X-Gmail-Original-Message-ID: <CA+h8R2rSBHVR_9KwRJjN2E8=xaV+aGZhqUEaqn3XBY3m1LsxvQ@mail.gmail.com>
Message-ID: <CA+h8R2rSBHVR_9KwRJjN2E8=xaV+aGZhqUEaqn3XBY3m1LsxvQ@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1687978695; x=1690570695;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PfN52X9RHaGI5lrDlEBwX8SXI0K/TVXVVEZ0G3Npppk=;
 b=E7rKZSaOhyZzk40Am3B2lPq4WlsrVAcK8ejC4afyk24u0RfDlCMOuNY5eAg2pMthT+
 mJ0SR8rXF/N0Bl8MGTNeQs7makst9Zhsmsf224bBPSdZa38AwjsVVyh8kN5J27YrD1S0
 /OP6cCbPF9iVMXou6YOrj3nO9zidk+Pw5t8gWbHgfKiX5jIFM4xaXId6eZY7Fx7uVsXa
 jjYWOYOmZg2rZztOEnCNHvQSgi1AQtr/25yUmxWiXeWW2Mjq/j8VA/12NgTUZoisryH1
 xhZHUBxZzEHZbJ6nfhmYu/0hBCmBE5x96+XRk1vUFMM6WgY2URlVK2KNhkIm4hDo4fIZ
 pmnw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=E7rKZSaO
Subject: Re: [Buildroot] [PATCH v6 1/3] package/go-bootstrap: split into two
 stages: go1.4 and go1.19.10
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgYWxsLAoKT24gVHVlLCBKdW4gNiwgMjAyMyBhdCAyOjQ24oCvUE0gQ2hyaXN0aWFuIFN0ZXdh
cnQgPGNocmlzdGlhbkBhcGVydHVyZS51cz4gd3JvdGU6Cj4KPiBHbyAxLjIwIHJlcXVpcmVzIGEg
bWluaW11bSB2ZXJzaW9uIG9mIGdvIDEuMTcuMTMgdG8gYm9vdHN0cmFwLgo+Cj4gaHR0cHM6Ly9n
by5kZXYvZG9jL2dvMS4yMCNib290c3RyYXAKPgo+IEFzIEdvIDEuNCB3YXMgdGhlIHByZXZpb3Vz
IHZlcnNpb24gdGhhdCBjb3VsZCBiZSBjb21waWxlZCB3aXRoIEMsIHRoZXJlIGlzIG5vdwo+IG5v
IHdheSB0byBib290c3RyYXAgZ28gd2l0aCBhIEMgY29tcGlsZXIsIHVubGVzcyB3ZSB1c2UgYSB0
d28tc3RhZ2UgYm9vdHN0cmFwOgo+Cj4gIC0gYnVpbGQgaG9zdC1nby1ib290c3RyYXAtMS40LTIw
MTcwNTMxCj4gIC0gYnVpbGQgaG9zdC1nby1ib290c3RyYXAtMS4xOS4xMCB3aXRoIGhvc3QtZ28t
Ym9vdHN0cmFwLTEuNC0yMDE3MDUzMQo+ICAtIGJ1aWxkIGhvc3QtZ28tMS4yMCB3aXRoIGhvc3Qt
Z28tYm9vdHN0cmFwLTEuMTkuOQo+Cj4gVGhpcyBpcyBpbXBsZW1lbnRlZCBpbiB0aGlzIGNvbW1p
dCBmaXJzdCwgYmVmb3JlIHVwZ3JhZGluZyBob3N0LWdvIHRvIDEuMjAuCgo+IHY1IC0+IHY2Ogo+
Cj4gIC0gdXBkYXRlIHN0YWdlMiB0byBnbzEuMTkuMTAKCkkgYmVsaWV2ZSBhbGwgY29tbWVudHMg
aGF2ZSBiZWVuIHJlc29sdmVkIG9uIHRoaXMgcGF0Y2ggc2VyaWVzLCBhbmQKSSd2ZSBiZWVuIHVz
aW5nIGl0IGluIHByb2R1Y3Rpb24gc3VjY2Vzc2Z1bGx5IGZvciBtYW55IG1vbnRocyBub3cuCgpX
aGF0IG5lZWRzIHRvIGJlIGRvbmUgdG8gbWVyZ2UgdGhpcyBzZXJpZXM/CgpUaGFua3MhCkNocmlz
dGlhbiBTdGV3YXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
