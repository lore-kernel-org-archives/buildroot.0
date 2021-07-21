Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9FFFC07E9B
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 06:24:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E3D56120A
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 06:24:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E3D56120A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nklabs.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C2B783077;
	Wed, 21 Jul 2021 06:24:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tm8dcL0dsdHh; Wed, 21 Jul 2021 06:24:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E61A8254D;
	Wed, 21 Jul 2021 06:24:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 877811BF5A5
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 06:23:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E9D28254D
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 06:23:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gDF_LkQeyBUK for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 06:23:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7FDC882540
 for <buildroot@busybox.net>; Wed, 21 Jul 2021 06:23:58 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id c13so1213244qtc.10
 for <buildroot@busybox.net>; Tue, 20 Jul 2021 23:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nklabs-com.20150623.gappssmtp.com; s=20150623;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=h8BZ/H+s+p9Jx3NrJAcABX0yryvHlnAV8d2lKQVW2kE=;
 b=eJK+T0fy6uEReFMhLSCRRLMVgjxSKNzjXWBN74zKh2lZ25Gg99DOWKutYhdVs73X7R
 jSmK6Rbf1J2VfvR+aJtKOyA+3dhSE2yOsjT1D6szUKZtrHrva41FgpR+baklMgEzk4PV
 f3G4pUmcwCJTtdyZ5xScv1mdCAx9+gywAj/PyJFIgZBAdm1zazBY0CSmFM3jyHw4bSPA
 i68L5e6uv0OakRNwimsO7qolUbpRQAB1dR1qcgptiaxqv3qNBqhYDL5RgC9PbeyIfGMD
 FPSGuf+aUpdVKY24nNoQ9lrH+mj2rGhGVtCvQbQrCoXI7ju8+M7jBA0y+dmQIJY0Oab8
 vVuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=h8BZ/H+s+p9Jx3NrJAcABX0yryvHlnAV8d2lKQVW2kE=;
 b=GdTo3KmqVRfLo7T3aPY6y5Tf9qRWSgDu6jzeKeMGFf+f1aFe+je6EzB22tP+YToD1C
 st4hJ6LSxJuprGrFd7eV7/DnHaoWeRN6rMNvfNyA5rzyTDevqkpBkW7G7gxtXgdF/FD4
 4PZpP6a+41h+cMctoPnR+CDGgrWwSf3jHLpS1Vt7Jx+TISbkxZSodDYza0kZNFwLxG4+
 8R+tw680JfexDN9SSbrOcAUwRdHh8jmp1N7RF5WieqlUd/xoYVfn7JId9iLyd5yz1u1M
 JPAxlDgbNFWwPI+vFc0D7NHoLJoW5wkiR46bbrRs0pptGIw7PEuwkO25WZ1KX1EhK5rG
 wpGA==
X-Gm-Message-State: AOAM531bOCpfJ7VbwWEbGaLsRx0ZxDqJM7cCAQKeXB0HMli4OAkKy5yA
 +p6q5c7DKmUD5CB9JearGTMEkFpLrYiK9Q==
X-Google-Smtp-Source: ABdhPJy6nFqadiQHlawXZKAnnYI6Lc3gRlyhVLCAFjnjwgP5l0GcjWpfUWLBvcz3ZtVSmFHvQDYZ3w==
X-Received: by 2002:ac8:7601:: with SMTP id t1mr24900532qtq.381.1626848637226; 
 Tue, 20 Jul 2021 23:23:57 -0700 (PDT)
Received: from smtpclient.apple ([2601:190:580:cce0:2920:830:f1d1:b63c])
 by smtp.gmail.com with ESMTPSA id w19sm6126417qkb.66.2021.07.20.23.23.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 23:23:56 -0700 (PDT)
From: Patricia Holden <pholden@nklabs.com>
Mime-Version: 1.0 (1.0)
Date: Wed, 21 Jul 2021 02:23:55 -0400
Message-Id: <BAACA597-C3FC-4275-9931-4D3F619F94EE@nklabs.com>
References: <20210720224806.09e5a5b2@windsurf>
In-Reply-To: <20210720224806.09e5a5b2@windsurf>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: iPhone Mail (18F72)
Subject: Re: [Buildroot] Question about pkg-config pc files
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

WWVzLCBRUW1sQXBwbHVjYXRpb24gSSBhbSBwb3J0aW5nIGZvciBhIGNsaWVudCBpdCBpcyB1c2lu
ZyBwYyBhdCBydW50aW1lLiAgV291bGQgaXQgaGVscCB0byBzZWUgd2hhdCB0aGV5IGFyZSBkb2lu
Zz8KClNlbnQgZnJvbSBteSBpUGhvbmUKCj4gT24gSnVsIDIwLCAyMDIxLCBhdCA0OjQ4IFBNLCBU
aG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKPiAK
PiDvu79IZWxsbyBQYXRyaWNpYSwKPiAKPj4gT24gVHVlLCAyMCBKdWwgMjAyMSAxNjo0MTo0MCAt
MDQwMAo+PiBQYXRyaWNpYSBIb2xkZW4gPHBob2xkZW5AbmtsYWJzLmNvbT4gd3JvdGU6Cj4+IAo+
PiBJIGFtIGFkZGluZyBhIHBhY2thZ2UgdGhhdCBoYXMgZGVwZW5kZW5jaWVzIG9uIFFUIHBrZy1j
b25maWcgcGMgZmlsZXMuICBJCj4+IHNlZSB0aGUgcGtnLWNvbmZpZyBwYyBmaWxlcyBpbgo+PiBv
dXRwdXQvaG9zdC9hcm0tYnVpbGRyb290LWxpbnV4LWdudWVhYmloZi9zeXNyb290L3Vzci9zaGFy
ZS9wa2djb25maWcvLCBidXQKPj4gSSBkb24ndCBzZWUgYW55IHBrZy1jb25maWcgZmlsZXMgaW5z
dGFsbGVkIHRvIHRhcmdldC4gIHRoZSBRUW1sQXBwbGljYXRpb24KPj4gY29kZSBpcyB0cnlpbmcg
dG8gaW5jbHVkZSBtdWx0aXBsZSBxdCBwYWNrYWdlcyBidXQgdGhleSBhcmUgbm90IGZvdW5kLgo+
PiBSdW5uaW5nICJwa2ctY29uZmlnIC0tbGlzdC1hbGwiIHJlc3VsdHMgaW4gbm9uZSBmb3VuZCBh
dCBhbGwuCj4+IAo+PiBIb3cgZG8gSSBnZXQgcGtnLWNvbmZpZyBwYyBmaWxlcyBpbnN0YWxsZWQg
dG8gdGhlIHRhcmdldD8KPiAKPiBZb3UgZG9uJ3Q6IEJ1aWxkcm9vdCBkb2Vzbid0IHN1cHBvcnQg
ZG9pbmcgZGV2ZWxvcG1lbnQgb24gdGhlIHRhcmdldC4KPiBXaHkgd291bGQgeW91IG5lZWQgLnBj
IGZpbGVzIG9uIHRoZSB0YXJnZXQgPyBJcyBRUW1sQXBwbGljYXRpb24gdXNpbmcKPiBwa2ctY29u
ZmlnIGF0IHJ1bi10aW1lIG9uIHRoZSB0YXJnZXQgPwo+IAo+IFRob21hcwo+IC0tIAo+IFRob21h
cyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KPiBFbWJlZGRlZCBMaW51eCBh
bmQgS2VybmVsIGVuZ2luZWVyaW5nCj4gaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidXN5Ym94Lm5ldApodHRwOi8vbGlzdHMuYnVzeWJveC5uZXQvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
