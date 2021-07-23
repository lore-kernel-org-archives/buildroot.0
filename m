Return-Path: <SRS0=JV6j=MP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81848C4338F
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 09:51:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F072D60E8B
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 09:51:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F072D60E8B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 947D8401D6;
	Fri, 23 Jul 2021 09:51:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pwb5tE4Tr8te; Fri, 23 Jul 2021 09:51:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3C3840259;
	Fri, 23 Jul 2021 09:51:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8676C1BF295
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 09:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75C4A8100D
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 09:51:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20150623.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MzE9boViUaBV for <buildroot@lists.busybox.net>;
 Fri, 23 Jul 2021 09:51:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2E71E803C0
 for <buildroot@busybox.net>; Fri, 23 Jul 2021 09:51:18 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id y34so1109404lfa.8
 for <buildroot@busybox.net>; Fri, 23 Jul 2021 02:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Wac3vPNL/DgpCteVns45TAo/VgbmOQTHFy2AXxvu+dc=;
 b=nlcEpi13/3WHTb1a8/3puqBetnf0W3etiowczOqiaWFzS4UnIkFZ11lhuOIXuSe4sZ
 tOyn/Uw0ZQth6yuH+zkN4YOKBXQchpXahwDJSTG5k9LnrcNLQlEVW4Jr10ZnLYnLSuVh
 Z++gQZ08Zx6MWT96q4HklHMs9z2KPq4OiaOVifi0xBdhWZyQnrNUET8YVKJpipoy5Zrh
 XkZmLqunJ+GKyq+P8YDDv03gN9TBbDFElC0BmY1lYqZFyd57Chhc6ytzEBsZIs2404zB
 XEAGQRZavPEPyZo2dRuBndziuwHzFrjp0lsbLs3j5x0ukQJJU6B8hrjBOFTjsP1UnSlk
 tsGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Wac3vPNL/DgpCteVns45TAo/VgbmOQTHFy2AXxvu+dc=;
 b=aAAXZbDM2VQJ+FXQx1gXdYFY8nc46tqk5sDebFYGqlf6jGTPj2LRdTl201nC7TYSHM
 V21Vx5Bz1jn8FUjtlb7zvpd9/IH3ZDfX7pfmlnYBx4WjHDEDdUqSabq1jn1UmJ/9IyL6
 HMeeSvA2oR29HEUe7/wMRZyyQdCGUmxuuGhks9m1fTHHgTkIELXMVpKg6ckGMzdxLaKt
 LuLwTyR3yA10N9gpONQ4YA3ww6qKZVzYjutwtQJWAtUx22Zr0rC/hX8qBi56UASkzkdX
 Jhjryr7adWnYk6I50nIhANibFSL9VjSVwQqKHkCQR3uq3My1/i3AFbVos2hz6x4LcsyH
 OdFQ==
X-Gm-Message-State: AOAM530Wc6i1Xpui3oZ2v8jMPiiLTCJccqzov7EOIdFi0RKnsua/JA2U
 nhN4tTaUuwxHyfIA4NQ7jySJwoR8I7DGBIff
X-Google-Smtp-Source: ABdhPJzQuup4f9gGtIEgoEidcIzt++3k93LNGGmBCCjwc8iuDz71jBmLSFMT2S/aD6Ck7t5eMCxTkQ==
X-Received: by 2002:a05:6512:1329:: with SMTP id
 x41mr2576620lfu.486.1627033875632; 
 Fri, 23 Jul 2021 02:51:15 -0700 (PDT)
Received: from Unikie-T14-Gen-2i.madriguera.foxhound.fi
 (dd707cygx2c-5zp601y5t-3.rev.dnainternet.fi.
 [2001:14ba:1efd:b100:b3b0:bf9a:335e:a833])
 by smtp.googlemail.com with ESMTPSA id n9sm2206234lfl.69.2021.07.23.02.51.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 02:51:15 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
To: buildroot@busybox.net
Date: Fri, 23 Jul 2021 12:51:13 +0300
Message-Id: <20210723095113.26189-1-jose.pekkarinen@unikie.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] Remove deprecated matchpathcon calls
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
Cc: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

VGhpcyBwYXRjaCByZW1vdmVzIG1hdGNocGF0aGNvbiBjYWxscyBmcm9tCnRoZSBhdWRpdGQgaW5p
dCBzY3JpcHQsIHJlbW92aW5nIHNvbWUgZGVwcmVjYXRlZAp3YXJuaW5nIGluIHRoZSBpbml0IHBy
b2Nlc3MuCgpTaWduZWQtb2ZmLWJ5OiBKb3PDqSBQZWtrYXJpbmVuIDxqb3NlLnBla2thcmluZW5A
dW5pa2llLmNvbT4KQ2hhbmdlLUlkOiBJMjJiZGY3M2RlNzMyZTlkMTA3ZWMwNmE0Yjk0MzRlNzBl
ZWM2NjJhNQotLS0KIHBhY2thZ2UvYXVkaXQvUzAyYXVkaXRkIHwgNCArKy0tCiAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2th
Z2UvYXVkaXQvUzAyYXVkaXRkIGIvcGFja2FnZS9hdWRpdC9TMDJhdWRpdGQKaW5kZXggMmVjZjBm
MWRmOS4uMGVlZjg4MWNlZSAxMDA2NDQKLS0tIGEvcGFja2FnZS9hdWRpdC9TMDJhdWRpdGQKKysr
IGIvcGFja2FnZS9hdWRpdC9TMDJhdWRpdGQKQEAgLTE4LDkgKzE4LDkgQEAgc3RhcnQoKXsKIAog
CSMgQ3JlYXRlIGRpciB0byBzdG9yZSBsb2cgZmlsZXMgaW4gaWYgb25lIGRvZXNuJ3QgZXhpc3Qu
IENyZWF0ZQogCSMgdGhlIGRpcmVjdG9yeSB3aXRoIFNFTGludXggcGVybWlzc2lvbnMgaWYgcG9z
c2libGUKLQljb21tYW5kIC12IG1hdGNocGF0aGNvbiA+L2Rldi9udWxsIDI+JjEKKwljb21tYW5k
IC12IHNlbGFiZWxfbG9va3VwID4vZGV2L251bGwgMj4mMQogCWlmIFsgJD8gPSAwIF07IHRoZW4K
LQkJbWtkaXIgLXAgL3Zhci9sb2cvYXVkaXQgLVogYG1hdGNocGF0aGNvbiAtbiAvdmFyL2xvZy9h
dWRpdGAKKwkJbWtkaXIgLXAgL3Zhci9sb2cvYXVkaXQgLVogYHNlbGFiZWxfbG9va3VwIC1iIGZp
bGUgLWsgL3Zhci9sb2cvYXVkaXRgCiAJZWxzZQogCQlta2RpciAtcCAvdmFyL2xvZy9hdWRpdAog
CWZpCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1c3lib3gubmV0Cmh0dHA6
Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
