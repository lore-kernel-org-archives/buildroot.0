Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D57C87FCB
	for <buildroot@archiver.kernel.org>; Fri,  1 Aug 2025 15:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3324B41265;
	Fri,  1 Aug 2025 15:07:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L6nNpl1phIBf; Fri,  1 Aug 2025 15:07:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60D1F41097
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60D1F41097;
	Fri,  1 Aug 2025 15:07:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4034C13D
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 15:07:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26F9E607B3
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 15:07:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WYkIGBJ-2SfB for <buildroot@buildroot.org>;
 Fri,  1 Aug 2025 15:07:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7E12A60A79
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E12A60A79
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E12A60A79
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 15:07:32 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4561607166aso16177415e9.2
 for <buildroot@buildroot.org>; Fri, 01 Aug 2025 08:07:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754060850; x=1754665650;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qPLIyNpRP/ksGoCf/p/R1URZ8t9qnotmRP9lSCjkVis=;
 b=p/d4t42fIS9eDOv3AxpBDTUgBivf6Ulg/ThdIGv7dvIMRkEBeFFDlq+/LHh8LO0ke8
 2VO2nq03wGtLTc049zlukNAV99gna8UYwMwwY1Uo3L9EvJ0EO4lb7Iu42AZVViKFIs/6
 5QSfsoj2tJ72Zp2RfPseXKB8ftglcYjKqozNwxKeuAA2+TwOp0oTKeQtT/crRUYZUEcL
 MmB6rWQyO6DRxTMveV3FruaNzsauqCQQbG9BLlh3yy+dV7BRQX8PDYBzkKGyVpYBwqDs
 uHb3ufZv63gWXaG8Ka1Mj3Yb1PDsPBSLQ/e3ODoxuPSdrrmUhPI43WMOzpkjr9aKsxqM
 9apg==
X-Gm-Message-State: AOJu0YyKkge1qbH4sEbdEmpdq6seDZ6w/ohv3Omes9rEMsss5vvvN7GR
 ulkDTYrVgojEYDOtbdsCTPKvI80jOJe101gVnnVb1LERaZyNKmQkunNQ37P3cFyPgyigmVo8Wel
 xvoZc
X-Gm-Gg: ASbGncuzqz3WfgCoOYp/BmZIWL5exopdLxR+CpDCQQpHosGXjn1Uz1am/dVsofTwel3
 Y2bvRIzknpL73JPyNWe48MJKWi5Lb6VEuOCt8bFiUYQDTcMa6VmHr+9l7Xo8vWTEKwqY8o8GehN
 FSuc1d+dvo65Z1AIL0LLNR0WH+EHnleD/7bHrP+JysYXTnS3nEHGH8CHx6IGgKhnwCKvo2nIvTk
 6YqPvAL28V1DTheWx86W1DrqmpWuZiv0NnpVX99REwaE70WWG0NdX3nR+rVmS0pI0qAaGakmKYb
 bSTrha9YOZsViGtg7obmVUVU5/d9rodDuo32eGSb80IKLMdXXymmjOYSIf9VpX4tZcyitXCkUte
 eI7+uR+oYLZi/TJlE3BVICWysisyXElm6Tu4zKX0Uxc4WL6Cj3JlGbN0K0aJHSvUaw1c/SeW4J6
 yuKVKYIhwi
X-Google-Smtp-Source: AGHT+IGdW7IfW+4ddwh63jIxrBBrRbG5hKAzfaVLUejx2FQYBZT6uEzvt5YAjPCwwhHt/w/d3uItFw==
X-Received: by 2002:a05:600c:1da2:b0:43c:ec4c:25b4 with SMTP id
 5b1f17b1804b1-45892b9dfc9mr151741705e9.10.1754060850086; 
 Fri, 01 Aug 2025 08:07:30 -0700 (PDT)
Received: from mind2.local.ess-mail.com (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4589ee5790dsm66731015e9.27.2025.08.01.08.07.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 08:07:29 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Daniel Lang <dalang@gmx.at>, Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Date: Fri,  1 Aug 2025 15:07:14 +0000
Message-Id: <20250801150722.4003476-2-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250801150722.4003476-1-raphael.melotte@mind.be>
References: <20250801150722.4003476-1-raphael.melotte@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754060850; x=1754665650; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qPLIyNpRP/ksGoCf/p/R1URZ8t9qnotmRP9lSCjkVis=;
 b=CkTD/PVHoRhqWZteLv0aOkmNFdGAZXBATcy2tHeX3Maq3OYah530kWwHpFGN64fVNc
 zqES0fzYbzxgWYEwqF6QWcNxehormbzdwMRp9fgfuIi5B2HYiZxjTU4PAdIvDuFfZgKA
 cPY3csnduPFLroo3lsGYsaCt3bMgycEpfarsR8Xd7oebEXaYvHpdPR3/EAnrb7T+6nU/
 TrQJsWmfv0UG4n0ZvqQo8vldzolEs/+mXufC24uHVbkhDqmBfBATl7+/mBUFRv31PPs+
 UoC/+3Fvq8FBHLu/pAVdDTfYartwGX6PyJUuZ9VlluEG4tipQIlTVVbmtyCk03n3Dy7k
 13fg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=CkTD/PVH
Subject: [Buildroot] [PATCH 1/6] package/llvm-project: enable clang python
 bindings
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SXQgc2hvdWxkIGJlIG5vdGVkIHRoYXQgYmVjYXVzZSB0aGUgcHl0aG9uIGJpbmRpbmdzIGhhdmUg
d3JvbmcgZGVmYXVsdAppbmNsdWRlIGRpcnMsIHRoZXkgYXJlIHVzZWxlc3MgaWYgdGhlIGluY2x1
ZGVzIGFyZSBub3QgcHJvdmlkZWQKZXh0ZXJuYWxseS4KClNpZ25lZC1vZmYtYnk6IFJhcGhhw6ts
IE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT4KLS0tCiBwYWNrYWdlL2xsdm0tcHJv
amVjdC9jbGFuZy9jbGFuZy5tayB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGx2bS1wcm9qZWN0L2NsYW5nL2NsYW5nLm1rIGIv
cGFja2FnZS9sbHZtLXByb2plY3QvY2xhbmcvY2xhbmcubWsKaW5kZXggYTVjOGI5OTBhYS4uMWVl
MGViMzIzZiAxMDA2NDQKLS0tIGEvcGFja2FnZS9sbHZtLXByb2plY3QvY2xhbmcvY2xhbmcubWsK
KysrIGIvcGFja2FnZS9sbHZtLXByb2plY3QvY2xhbmcvY2xhbmcubWsKQEAgLTEwOSw2ICsxMDks
MTAgQEAgQ0xBTkdfQ09ORl9PUFRTICs9IC1ETExWTV9MSU5LX0xMVk1fRFlMSUI9T04KIEhPU1Rf
Q0xBTkdfQ09ORl9PUFRTICs9IC1ETExWTV9EWUxJQl9DT01QT05FTlRTPWFsbAogQ0xBTkdfQ09O
Rl9PUFRTICs9IC1ETExWTV9EWUxJQl9DT01QT05FTlRTPWFsbAogCisjIGhvc3QtcHl0aG9uMyBp
cyBhIHBlcm1hbmVudCBkZXBlbmRlbmN5IG9mIGNsYW5nLCBzbyB3ZSBjYW4gYnVpbGQgdGhlCisj
IHB5dGhvbiBiaW5kaW5ncyB1bmNvbmRpdGlvbmFsbHk6CitIT1NUX0NMQU5HX0NPTkZfT1BUUyAr
PSAtRENMQU5HX1BZVEhPTl9CSU5ESU5HU19WRVJTSU9OUz0kKFBZVEhPTjNfVkVSU0lPTl9NQUpP
UikKKwogIyBIZWxwIGhvc3QtY2xhbmcgdG8gZmluZCBvdXIgZXh0ZXJuYWwgdG9vbGNoYWluLCB1
c2UgYSByZWxhdGl2ZSBwYXRoIGZyb20gdGhlIGNsYW5nCiAjIGluc3RhbGxhdGlvbiBkaXJlY3Rv
cnkgdG8gdGhlIGV4dGVybmFsIHRvb2xjaGFpbiBpbnN0YWxsYXRpb24gZGlyZWN0b3J5IGluIG9y
ZGVyIHRvCiAjIG5vdCBoYXJkY29kZSB0aGUgdG9vbGNoYWluIGFic29sdXRlIHBhdGguCi0tIAoy
LjM0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
