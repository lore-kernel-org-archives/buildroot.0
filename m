Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D9D7CC6B03
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 09:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB68760763;
	Tue, 13 Oct 2026 09:43:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DERllI331-vp; Tue, 13 Oct 2026 09:43:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EAE3560751
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791884606;
	b=A5s0V2OO0bZFg0P17oMrovPWYZah/FUf6N7L2cMSTw/3UeKy8zYDg1W7P2Fh7nB5G4nY
	 M/xCZbbblrbQ8pDD4RASq34yP0hjAHSCwf22Fs8UJ3lpjyAiY9IIWduqAprUoY0D8G9di
	 zA3xBh/EIFlQUlB1k7YQw2MqbPPppU2eySy5PrNnPRW0HU/eVb+qS6nSw9d/GnsfYJqk9
	 8hZJx2ZpbER+QN2QS9XTiMQtl6n0CmSvKLeAyJpmYmiOu8NhFYyGht6kfIV9HOBl38Ekc
	 qR7f8/aSzkqUEv3i/nlMguzvVfwGZwOeSNl988nmbUOAkTXIcdA4TIK/bN8DVgo3UqQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791884606;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=1sLn3XjhKlIhDbf/9zsFnTPNaWgEKbGdmpfT0f/P/6M=;
	b=EvJ54SsDyoUIxypK5/0Kl5cVVJrGSUun66luZIej7P03cO9HB9K/eY3yQYJ/+jq6g685
	 yMuMqzLLagZTtYefTHOod1AaL212b13mfQdCEM7eOUjDmWuRmxEBcSd+jx3rjrHZ2Tika
	 ey4lyAMIm7nzCsWxTJSCSA7VDK6DEY4iDlxTYLPeLprux/CsUAjQXi4txrtU5SPTQyTvE
	 09XrzXyGmoLB++CX7bbup8e43QK4rug+yoFNSCU7XsyWgQAxTMGoMHcgyWrvL6i2wzOfl
	 Q6/JvOMuvXztwLpfBiApLZFhTGeujsqciGqbzIq6XIWJ5zgxJhjxUwpEbgZIy2xE2qQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791884606;
	bh=1sLn3XjhKlIhDbf/9zsFnTPNaWgEKbGdmpfT0f/P/6M=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lcgzehi+lwWrTIpn5DTrFJPrWFHGJ15HdZjHlbv6Vn1ZOEi4XzMlHE+FJIp4A/IbZ
	 vYM+OfPW58/Q3uBAOzMWXmBmRkAUiLUcKfvOD/TWH9Cm0Y9fWVBIbYrmsus2uTQXdy
	 PTYxluOWakmmk8y1zYu2FSo9dUsrqE1zpkFbhT5KkMhSC5cIevkBdgMPhG3zabPXyP
	 XJlCHqXwW4qigU0fDrBxGXqyPn+NemRBE9tDRRmdvYu4SwzhVVsuhQH2F9k6IgP8cW
	 wm7v7Kzy1W/fOu8jonHcZ5sTedc85npqzXfGCZAYjXfEZfhlfj81VVbzeQRbVSH5B2
	 h5sIiijw3sUaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAE3560751;
	Tue, 13 Oct 2026 09:43:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BCEC975
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A313F80B97
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pa5oJb77KL7F for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 09:43:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9AEED80C8A
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791884588;
 b=fzXooOdgDrxNJGJjsCK7tI+51h1n4aIlc8+lho5fhnGTC8k6fEmGUtu3S8QDuTi+nqVY
 aI58ZE1AYOnEPYcb/rYcvyO0pSzqNbRhlKXvA3VPnQBKWPbuYnvTth0JTV0lBiCuR9Td0
 1oKTOVRWhxHC19wdYbyTqorFFGL6sb/6gGa/fj38yuMsYOpJAbjbCOS4Q3OtfHhKC/rJA
 MzXbQysw4PGAOvYK/7ovrMSRbPDdhsw3HxaWtT4Uw1/QPgU+lUhg2FyE/eTyJR7fqsEXu
 W9JXf0Q/xWF8TgCKObFLik1VRYFP42oOHMecJZMcjyGz0VVSapYjNMuqYyz5VlTmwBw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791884588;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=CiX9qbCHxkXHKwJmWOTkxB3AJ05tOrocmDdTJNe4TFk=;
 b=o3ia6yfo/edKwzkTRu44JSitkMv8EvZpobRoS54gKAiyxievvgva5Fls3AHaoCAhqm0t
 icnGzK0PF7maflRBmdI0EODg5gZZqyMfEhEteoQBvsaqIPsc9GihMb4iAKHkTyGvuYwKY
 cqsPi6CyPvzQRufitecCZMF3QAYmlw1NS4cBd8nGQ1G5/09g2YNfHjgQ3xo2xXyb135Dz
 oIdJOn52//uaelbObbKsVEWCAvTlv2kvrP6blt+cOVEYxX82T0DbdftSf7g/tF3pVPZLh
 M9JCtV2dSUyOFpDbddUibLog5A0XIRXydJEO0k5IHzZTYyohZrHSnaZnxFeDKF+jx3g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=XUhV4MfP; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=XUhV4MfP
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9AEED80C8A
 for <buildroot@busybox.net>; Tue, 13 Oct 2026 09:43:07 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4a0213948d3so16742565e9.2
 for <buildroot@busybox.net>; Tue, 13 Oct 2026 02:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791884586; x=1792489386; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=CiX9qbCHxkXHKwJmWOTkxB3AJ05tOrocmDdTJNe4TFk=;
 b=XUhV4MfP2qk6Gzop6Oz2gzKVG7yv63s9EzqQn28tISMhG6n8iytjRfBzwI6pvv0XTD
 VNY7O8gkxxfQDZ5mCr6gz7pkwpOYfIkje3IdTgl+9mYjstNT37IDf6qmkW1XsKzUa2AY
 OI9e1GlhlFrYNSojn/KoV2/RpwgOGmc4zrbO4RD5wRVPaHGtsYGm2Ht504BoPS+fiT6C
 s8qNlngW0OrDZDzWED0crjuFHfGeIVIBO7ZDZUS/2GQomWNQatiDguz0KqcRC1f7ZNQf
 Foy5zzsFtdC8lRoWurvyGubLdFU9Ln7w6cLFS54NYeViwf+gwfKwGNBHkpMW1QAD6Wid
 +ndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791884586; x=1792489386;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=CiX9qbCHxkXHKwJmWOTkxB3AJ05tOrocmDdTJNe4TFk=;
 b=qCbsh5x1K/J1ZWce4/6DvSIITwzVgn2dLm4fV8YT/Gv+MSPBmWvKvoEvVHm3NyLSAq
 fzfAXVNrmheRA0AejD2Ru2LW7twRfP4AgtuuZN+rwGi+sdmNuQv4/nCCJ/QYBzgiUQQI
 pbM30aew/gV2DMhm6LCMV4ih82JRKT7SmS97wTxBfAltbm+ykiALFJxJaLfNniujhpWo
 dDmzSofq4E40axO88pyFfL7olEPpYP0hlyzfGlLKfMy5CQSwBPHsLYyfkdY9nnEgL9Ua
 xBWtAUv2OBHpge+Ksf5aNyRDdi4ULgQsVlTqqtdm6XMlQapGKNC/agcMfLTcUtqgYzuY
 nekA==
X-Gm-Message-State: AFq9FYIOykIOXpLF5rE19fauAraF3kXiaSvL4u9mRllMwYrNtcXcm9GY
 vgIqultAb1mZNITChrqdoww0TuZUehNYq4SFjlEzkB+SjXJPj2rAca1oQeqi5w==
X-Gm-Gg: AYBFou1+VuKt0Fg+gS7okLB3eVfrlbTYHTeWqIEFbfD9JPgDoS/jBNDUrFEEa29LI5E
 SWmxYusC+1pVAd4FgSsmy3FKh6kdeeVUmjjiLVkPSPj9huK1BpCShEJIgoBk3sbuCWaLVm/2WD7
 SMDzae98FxxZFsonoOlxSYYgK8QJaPQH7Ca+rbQ8fr+Vptx6GB+COIye6J0TbMxBHKO8SGvfXYM
 V/1n41uaTpzYp0NMgSEwy6eyCgGDWpiAs/GR18m0n3gBZ+Kr/HSfQ10D6r0eipc0HEFMH5Hlkwp
 b/yHmeM9ZBWfRtVaHEV0T+OlmtU6YrROXVkBw8XeAAqFRhzXTtzs5BlPchfXNlCWzolNI7EPZo4
 EsD2vDzZO5j5bvjjy8VlnQqh718pvbKHf+be/zyVJkxYC5D1CSH0Ufrvh6YVljwx20NWe0nLwnA
 r7yspoqTVIVqw+Ftl/uyfs6eW5vHxzadd+ui6c60qVsCA077gYp6zQarrL087TrNVhWNeWYIJMP
 BPbMF2F5wLmkkoHzJCdebGJX+yJM7Qb+LVfrGpY
X-Received: by 2002:a05:600c:a088:b0:4a0:2644:80db with SMTP id
 5b1f17b1804b1-4a18e4d55a2mr229263785e9.35.1791884585301; 
 Tue, 13 Oct 2026 02:43:05 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1972eaed8sm238665595e9.1.2026.10.13.02.43.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 02:43:05 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Tue, 13 Oct 2026 11:42:52 +0200
Message-ID: <20261013094252.96761-14-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013094252.96761-1-francois.perrad.86@gmail.com>
References: <20261013094252.96761-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 14/14] package/perl-www-robotrules: bump to
 version 6.03
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

now, it has its own LICENSE file

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/perl-www-robotrules/perl-www-robotrules.hash | 8 ++++----
 package/perl-www-robotrules/perl-www-robotrules.mk   | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/perl-www-robotrules/perl-www-robotrules.hash b/package/perl-www-robotrules/perl-www-robotrules.hash
index 38fd06209..037b7f912 100644
--- a/package/perl-www-robotrules/perl-www-robotrules.hash
+++ b/package/perl-www-robotrules/perl-www-robotrules.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  b7186e8b8b3701e70c22abf430742403  WWW-RobotRules-6.02.tar.gz
-sha256  46b502e7a288d559429891eeb5d979461dd3ecc6a5c491ead85d165b6e03a51e  WWW-RobotRules-6.02.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  9c821b8f6eb0f5ddb86f1d338b493879  WWW-RobotRules-6.03.tar.gz
+sha256  8522b532935a11bfa688c2e113bac66729df4851be50c2c26d4b06f45fade472  WWW-RobotRules-6.03.tar.gz
 
 # computed by scancpan
-sha256  fa375c4f771b92fc076b6c66e19440a0fff51dacf489fecd94bf560091279e05  README
+sha256  994ab45a4f8ef43f47b7baabc48d100838c42d226d8d161d6ac1f49c5f9d7c84  LICENSE
diff --git a/package/perl-www-robotrules/perl-www-robotrules.mk b/package/perl-www-robotrules/perl-www-robotrules.mk
index 052d9a674..1b6df6b53 100644
--- a/package/perl-www-robotrules/perl-www-robotrules.mk
+++ b/package/perl-www-robotrules/perl-www-robotrules.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PERL_WWW_ROBOTRULES_VERSION = 6.02
+PERL_WWW_ROBOTRULES_VERSION = 6.03
 PERL_WWW_ROBOTRULES_SOURCE = WWW-RobotRules-$(PERL_WWW_ROBOTRULES_VERSION).tar.gz
-PERL_WWW_ROBOTRULES_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
+PERL_WWW_ROBOTRULES_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_WWW_ROBOTRULES_LICENSE = Artistic or GPL-1.0+
-PERL_WWW_ROBOTRULES_LICENSE_FILES = README
+PERL_WWW_ROBOTRULES_LICENSE_FILES = LICENSE
 PERL_WWW_ROBOTRULES_DISTNAME = WWW-RobotRules
 
 $(eval $(perl-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
