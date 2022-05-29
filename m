Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D4A5C433F5
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 13:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82B9F41BD2;
	Sun, 29 May 2022 13:19:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y3jZaDQJmfkQ; Sun, 29 May 2022 13:19:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72C1B41BC1;
	Sun, 29 May 2022 13:19:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9E2D81BF4D8
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 13:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C27C846C6
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 13:18:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SoWzKoWpAqyb for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 13:18:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B41288451C
 for <buildroot@buildroot.org>; Sun, 29 May 2022 13:18:28 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id e2so11513415wrc.1
 for <buildroot@buildroot.org>; Sun, 29 May 2022 06:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KJVkH1CyWkR7eGhCwMYBirmhn0EXetfSzzHWBArIN0o=;
 b=BFrT5GD9kUQ3Uaz1FdlUcEVOKB4F3iy4QsxwXunScJQIcuGI4hvHv/DVTI1iT4ZcQG
 V1Xvxnmono/CRTML/zsIAgtHIz1Lr1jh1z+TVjOU85Rq4Xu7/yuSb7grusGcoSajV6JZ
 vuBzEzIADW03vJuFA2UAoxk2V3p/UEheQUTkH5UnM99xq5SzlKG3qY/BeOdSCR+hURsI
 853CcUPd7eozJVCZk1v7wACNd/CAqednmWMKr3KxFS+uLRZK4+xP0TzxNwplKlqTqi9Q
 igEKib5lrJDOnsEcRJRG0qTSGxxDCFzApKwKcjNwE7BP4PpFkT8mCEKYmq9qZ5qTGZKr
 WN2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KJVkH1CyWkR7eGhCwMYBirmhn0EXetfSzzHWBArIN0o=;
 b=aaj/AHinenTvMxBrYG6JYFWbvOeRLMUB7a/g0NcT18ZnQhfvoP+Qt0OgTvdU91LyvR
 mYZDiM9puGPgUQJ4rbpYcsOB5J4W2DAcHgE9Owax/8n/2eaOkyBC+h2GUAsMY84bKmaT
 5cORl2VnymFhIZuuQ5AYdux+aQUk6WV8twEhE+dBMRZDyvBraP4S0OFa80BKW+k7l0oh
 wBm7s6S2zjdtYYQUbefbmK4yLWqBAk52ABKO8qY7/2W3y01UerF1el8JoCME+PBCwAVZ
 5//K/h/ZExkNg0hTfEn9SsRQbTgYM4u/dEZF3KJiqyPnAzyJXP9yOdbzopLK3WTju+WZ
 aI3w==
X-Gm-Message-State: AOAM530ifGqy2FHCfcGXcUQ3pRLRa3b2KBKskDgOvUKYYmYpNVaMlKCl
 CUQ7fmLIC5NB793oGhn2GrAMLbtRcII=
X-Google-Smtp-Source: ABdhPJyEb1c3lUpFOx2mJK8deRF+I9BiqwCN+6vWBz84+SfZ7WgebmYAa9ferXWeUi3Oisdz5Pj/GQ==
X-Received: by 2002:a5d:4572:0:b0:20f:ca8a:bc5a with SMTP id
 a18-20020a5d4572000000b0020fca8abc5amr31710958wrc.514.1653830306799; 
 Sun, 29 May 2022 06:18:26 -0700 (PDT)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a05600c34cf00b003949dbc3790sm7492562wmq.18.2022.05.29.06.18.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 May 2022 06:18:26 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 29 May 2022 15:18:06 +0200
Message-Id: <20220529131811.481017-6-romain.naour@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220529131811.481017-1-romain.naour@gmail.com>
References: <20220529131811.481017-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for-next 06/11] package/gcc: add missing
 --enable-libquadmath-support option
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

V2hlbiBCUjJfVE9PTENIQUlOX0hBU19MSUJRVUFETUFUSCBpcyBzZXQsIC0tZW5hYmxlLWxpYnF1
YWRtYXRoLXN1cHBvcnQKb3B0aW9uIGlzIG1pc3NpbmcuIFNvIHRoZSBmbG9hdDEyOCBzdXBwb3J0
IGlzIG5vdCBmdWxseSBlbmFibGVkIGluIGdjYy4KClRoaXMgbGVhZCB0byBhIGJ1aWxkIGlzc3Vl
IHdpdGggZ2NjIDEyIG9uIFBvd2VyUEMgcG93ZXI4IGR1ZSB0byBtaXNzaW5nCk1fMl9TUVJUUElx
IGRlZmluaXRpb24gKHByb3ZpZGVkIGJ5IGxpYnF1YWRtYXRoLmgpLgoKLi4vLi4vLi4vbGliZ2Zv
cnRyYW4vaW50cmluc2ljcy9lcmZjX3NjYWxlZC5jOiBJbiBmdW5jdGlvbiDigJhlcmZjX3NjYWxl
ZF9yMTfigJk6Ci4uLy4uLy4uL2xpYmdmb3J0cmFuL2ludHJpbnNpY3MvZXJmY19zY2FsZWQuYzox
NDM6MjI6IGVycm9yOiDigJhNXzJfU1FSVFBJceKAmSB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4g
dGhpcyBmdW5jdGlvbik7IGRpZCB5b3UgbWVhbiDigJhNXzJfU1FSVFBJZuKAmT8KICAxNDMgfCAj
IGRlZmluZSBfTV8yX1NRUlRQSSBNXzJfU1FSVFBJcQogICAgICB8ICAgICAgICAgICAgICAgICAg
ICAgIF5+fn5+fn5+fn5+CgpUaGlzIGlzIGZpeGVkIGJ5IGFkZGluZyAtLWVuYWJsZS1saWJxdWFk
bWF0aC1zdXBwb3J0IChsaWtlIGNyb3NzdG9vbC1uZwpoYW5kbGluZyBbMV0pLgoKRml4ZXM6Cmh0
dHBzOi8vZ2l0bGFiLmNvbS9rdWJ1OTMvdG9vbGNoYWlucy1idWlsZGVyLy0vam9icy8yNTEwMTc4
NzY2CgpbMV0gaHR0cHM6Ly9naXRodWIuY29tL2Nyb3NzdG9vbC1uZy9jcm9zc3Rvb2wtbmcvYmxv
Yi9jcm9zc3Rvb2wtbmctMS4yNS4wL3NjcmlwdHMvYnVpbGQvY2MvZ2NjLnNoI0wzNzAKClNpZ25l
ZC1vZmYtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4KLS0tCiBwYWNr
YWdlL2djYy9nY2MubWsgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2djYy9nY2MubWsgYi9wYWNrYWdlL2dj
Yy9nY2MubWsKaW5kZXggNzM0NDBlOWUzNS4uYzNjMWRmODMzYiAxMDA2NDQKLS0tIGEvcGFja2Fn
ZS9nY2MvZ2NjLm1rCisrKyBiL3BhY2thZ2UvZ2NjL2djYy5tawpAQCAtMTIxLDcgKzEyMSw3IEBA
IGVuZGlmCiAKICMgcXVhZG1hdGggc3VwcG9ydCByZXF1aXJlcyB3Y2hhcgogaWZlcSAoJChCUjJf
VVNFX1dDSEFSKSQoQlIyX1RPT0xDSEFJTl9IQVNfTElCUVVBRE1BVEgpLHl5KQotSE9TVF9HQ0Nf
Q09NTU9OX0NPTkZfT1BUUyArPSAtLWVuYWJsZS1saWJxdWFkbWF0aAorSE9TVF9HQ0NfQ09NTU9O
X0NPTkZfT1BUUyArPSAtLWVuYWJsZS1saWJxdWFkbWF0aCAtLWVuYWJsZS1saWJxdWFkbWF0aC1z
dXBwb3J0CiBlbHNlCiBIT1NUX0dDQ19DT01NT05fQ09ORl9PUFRTICs9IC0tZGlzYWJsZS1saWJx
dWFkbWF0aCAtLWRpc2FibGUtbGlicXVhZG1hdGgtc3VwcG9ydAogZW5kaWYKLS0gCjIuMzUuMwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
