Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F80C28B20
	for <buildroot@archiver.kernel.org>; Wed,  2 Apr 2025 17:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7621D40DA3;
	Wed,  2 Apr 2025 17:09:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BeHpdStxHc4s; Wed,  2 Apr 2025 17:09:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A617E4094D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A617E4094D;
	Wed,  2 Apr 2025 17:09:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 60D94117
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 17:09:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 46A456F797
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 17:09:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uXs6yqZc8pT1 for <buildroot@buildroot.org>;
 Wed,  2 Apr 2025 17:09:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4C7EC61B25
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C7EC61B25
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4C7EC61B25
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 17:09:42 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5e5b6f3025dso81949a12.1
 for <buildroot@buildroot.org>; Wed, 02 Apr 2025 10:09:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743613780; x=1744218580;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dzknpH8sABmZfgOeOg+V1DC2xHRcahAEjKyhLFJ7FY0=;
 b=gyJ42QKaToYfrng3h21wM0ZzGWm1gw2upQrz4OZqXwULhgGOqF7iPg2Uyb3sx1PwWU
 7GJGSS2IjJiE9FWIYrHvVsGkJuRdwILrlrQ0bwIwri6KHd6DVbfygqQoPRtRvea59kvp
 tpWqIV/jubCytYR7CYkUMSzRgD09Jgsgwb98KI3WES5eVW9auxou3wWY27Z+GAF4f00L
 a+iOIqbgSVm5gRd85eexjnplDxldFieXBaYmZvq87lQbHXucaqzUixsdzcbXvoL0m5zM
 JYdCHlBDB3ZtAPEt0TRp+q21Vv0bK+Q9V7TtCc4PlN/TTmVvCPL3bxP5fHcpuKLla23o
 DMCg==
X-Gm-Message-State: AOJu0YwoZhAW17dLFRXmPU4rvys/ZFihNzFe9Ad8bGNAKR2a9VP4jQrj
 4cADF6j51538lqZzjTqQ5O1px2MbwOGL52AGASCG3QAELvClpCCCBP/R
X-Gm-Gg: ASbGncv/0c2zrZlKTAtGAdQLMJ9wBfD2GPXMsTBvU1LLOmyI6yGLRT76B8R7RPwHCGQ
 txuS0UxCvO5yJB0bOHukXRGW9RUgYtmSYnB2Up27Pl8bS3vsW2Kk4hUxTMI3wVY0jGq7Fh9gN1s
 bnbYmlb7cDDBO8VaZU7AZflQ6BBKesKYhKXnthCxjbCwIIjxy3V4mSSBmSEPHT0r6aFwuvdAxvu
 n2lrlZXphzALf976aKPX86ZoyTe7XFKhruNHlHfRCPTmuAvImy0lR1F5uKx6GJDuwW3/9wxL27q
 Sp6PtudxWi8i3UwisqP1Mammd1QgOmyZCW+wXGRiIv45IuyznMlw1PcN1Fk=
X-Google-Smtp-Source: AGHT+IEFwBXERFMWLjF8UjspGPVJLQyGx81ldjYMmA5QDzZlsBQ26rS8113GLQEMv2vVJg2Hi76YvQ==
X-Received: by 2002:a17:907:6e88:b0:ac4:5f1:a129 with SMTP id
 a640c23a62f3a-ac7a16c1307mr258994066b.15.1743613779879; 
 Wed, 02 Apr 2025 10:09:39 -0700 (PDT)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac71967ff9asm951949866b.137.2025.04.02.10.09.39
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 10:09:39 -0700 (PDT)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Apr 2025 19:09:38 +0200
Message-ID: <20250402170938.43757-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20230317151802.1242858-1-sebastian.weyer@smile.fr>
References: <20230317151802.1242858-1-sebastian.weyer@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743613780; x=1744218580; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dzknpH8sABmZfgOeOg+V1DC2xHRcahAEjKyhLFJ7FY0=;
 b=jRT8z2utXN/8J5XSoiD8Wun7W0ULYZ1huEjgxK9f5JATrtjX9/cEeACFAQ2nWaHQyL
 W1tk/ubGhvSgSmpPGA6AM3KDPeAoZpOI4BmejbUpfYHuUU2wfTzpVvgiyx8iMfuCo5Tc
 Xpxqk+jJU6v8J+OI10X4bTpe17jB/3jCrGjRBLj7fEmx5XLmJaoJF8RcRqqiMpTRFaMH
 0SUdfIrwO5kdBZNrTquH3Mt/ZF+FhHQG06/1njiPFB76DRSOy6rb+kzJVNmRNcxkHMa5
 zkAoBxihzjUfmZE8piafS5jfFdbXBw+tpyyXl1pBe03/L6tVzY48zcuCRObIOQa0hsoQ
 p4lQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jRT8z2ut
Subject: [Buildroot] [v3,1/2] package/uutils-coreutils: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The new version with fixes and improvements is
here:https://patchwork.ozlabs.org/project/buildroot/patch/20250402165913.39797-2-shirokovalexs@gmail.com/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
