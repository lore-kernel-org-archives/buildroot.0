Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D6D2C433F5
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 19:02:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFAAC603E8
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 19:02:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AFAAC603E8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E12B401FD;
	Sun, 24 Oct 2021 19:02:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TVaNnfUwkOTN; Sun, 24 Oct 2021 19:02:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B8314024B;
	Sun, 24 Oct 2021 19:02:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 49E101BF420
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 19:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3894480EDA
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 19:02:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4kUZHSHodDoK for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 19:02:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2B03380ED7
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 19:02:08 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id w15so9550588edc.9
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 12:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lxX69WNsZpWIpTUQlEo497PLWs1Ta8Tu26ilmbGfvWo=;
 b=YFKIvujQqm20oVdRhNI/msb1ZUJPz0E+G6Eyf39b8sxT1UgNUohN+B4bUAVsViLOk5
 wLbyiQm86a6crh1qZT6YlJpc9EDsAznHcBfCfaBdW6TGxrQkt5dPmus7NwVRUGfK1BsG
 ZLSzOhqCbE690hqAX15cVdQtV7mKMHGcnpZUCCCDmqIQ+gFfYDl93BFmp4gthUcwEkGU
 xu0kRl4gj7dIEqBtbA1Np3tSUvzO+RwgJ/PAKrE/4RAtthuWwHPYUGsxL2N0TwcSo4ya
 rl1EmcJNXvMEwjcefn2v2TIfNxX77I/Wz8n8QaTdzdgy/DKZjYz5q+duxWaUACZ1uEj/
 ZhPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lxX69WNsZpWIpTUQlEo497PLWs1Ta8Tu26ilmbGfvWo=;
 b=IeJbFdeWdQlFPMHESkjqIfoliu5HN9kYGmmv3CpswwVibR9eJStdxYOPffTFsP+d48
 DpQ8zlskzNVQ9r1BihPTyrvCw12Cbdel47w5OMw+HDoPrlaCcPxv/9Typ7PqPsZkxEiM
 YdW3jRfN+io6t+UqWXSFWgENp6TeaDEmr2p4JVvePL9RiPj/qez6wW6ZVxKZmPX3xXvJ
 WmIASk2PK1XsiCdYtqXAEvFK5Z9wS0E/Rcl+6ngNF8Zz4n0+vzArv3LVE+N367aoqTBe
 QSitBg+rZJxAqvwXF7RC/tsN9sJZs6JjinpLHby4rgzqTqNAH0xqk1j/hZcEAsN4qD9d
 SiFw==
X-Gm-Message-State: AOAM531Nk/fQeVTbWs81ti6CDsVU13LYxD+mfvrxCmSZgTGZ6uyMEiEa
 DkdQnFbCYqGdDZF5+SNPg/xyZuZ6GTHHaDaQ
X-Google-Smtp-Source: ABdhPJyx7eIUQQqPkC976KS+pAaHFpUaF3EMoXQ3h5ujUmNgVwrf4qmN2X9RBzi+ijVMHGZwIMpoqA==
X-Received: by 2002:a17:906:c009:: with SMTP id
 e9mr16799628ejz.509.1635102127163; 
 Sun, 24 Oct 2021 12:02:07 -0700 (PDT)
Received: from localhost.localdomain (5.26-130-109.adsl-dyn.isp.belgacom.be.
 [109.130.26.5])
 by smtp.gmail.com with ESMTPSA id m9sm3723346eje.102.2021.10.24.12.02.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Oct 2021 12:02:06 -0700 (PDT)
From: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
To: buildroot@buildroot.org
Date: Sun, 24 Oct 2021 21:01:53 +0200
Message-Id: <20211024190154.2613390-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211024181221.2608908-2-raphael.melotte@mind.be>
References: <20211024181221.2608908-2-raphael.melotte@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,
 2/5] package/python-botocore: add missing dependencies
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIG5ld2x5LWFkZGVkIHRlc3QgdW5jb3ZlcmVkIHNvbWUgbWlzc2luZyBjb3JlIG1vZHVsZXMs
IHNvIGFkZCB0aGVtCm5vdy4KClNpZ25lZC1vZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRlIDxyYXBo
YWVsLm1lbG90dGVAbWluZC5iZT4KLS0tCkNoYW5nZXMgdjEgLT4gdjI6CiAgLSBGaXggc3BhY2Vz
IGJlaW5nIHVzZWQgaW5zdGVhZCBvZiB0YWJzLgogcGFja2FnZS9weXRob24tYm90b2NvcmUvQ29u
ZmlnLmluIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL3BhY2thZ2UvcHl0aG9uLWJvdG9jb3JlL0NvbmZpZy5pbiBiL3BhY2thZ2UvcHl0aG9uLWJv
dG9jb3JlL0NvbmZpZy5pbgppbmRleCA0ZGY4MmY2MTRjLi41MWNiNjYwNDc3IDEwMDY0NAotLS0g
YS9wYWNrYWdlL3B5dGhvbi1ib3RvY29yZS9Db25maWcuaW4KKysrIGIvcGFja2FnZS9weXRob24t
Ym90b2NvcmUvQ29uZmlnLmluCkBAIC00LDYgKzQsOCBAQCBjb25maWcgQlIyX1BBQ0tBR0VfUFlU
SE9OX0JPVE9DT1JFCiAJc2VsZWN0IEJSMl9QQUNLQUdFX1BZVEhPTl9EQVRFVVRJTCAjIHJ1bnRp
bWUKIAlzZWxlY3QgQlIyX1BBQ0tBR0VfUFlUSE9OX0pNRVNQQVRIICMgcnVudGltZQogCXNlbGVj
dCBCUjJfUEFDS0FHRV9QWVRIT05fVVJMTElCMyAjIHJ1bnRpbWUKKwlzZWxlY3QgQlIyX1BBQ0tB
R0VfUFlUSE9OM19QWUVYUEFUICMgcnVudGltZQorCXNlbGVjdCBCUjJfUEFDS0FHRV9QWVRIT04z
X1NTTCAjIHJ1bnRpbWUKIAloZWxwCiAJICBMb3ctbGV2ZWwsIGRhdGEtZHJpdmVuIGNvcmUgb2Yg
Ym90byAzLgogCi0tIAoyLjMzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
