Return-Path: <SRS0=nfe+=NH=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD978C4338F
	for <buildroot@archiver.kernel.org>; Mon, 16 Aug 2021 17:41:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72DC360E97
	for <buildroot@archiver.kernel.org>; Mon, 16 Aug 2021 17:41:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 72DC360E97
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2987540163;
	Mon, 16 Aug 2021 17:41:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DYlyIhuh9DuX; Mon, 16 Aug 2021 17:41:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92D73402A3;
	Mon, 16 Aug 2021 17:41:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ED53F1BF3F3
 for <buildroot@lists.busybox.net>; Mon, 16 Aug 2021 17:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD33880DC0
 for <buildroot@lists.busybox.net>; Mon, 16 Aug 2021 17:41:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=balena.io
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v80UVLwF8E0a for <buildroot@lists.busybox.net>;
 Mon, 16 Aug 2021 17:40:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D14F180DFC
 for <buildroot@busybox.net>; Mon, 16 Aug 2021 17:40:55 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id z5so34399413ybj.2
 for <buildroot@busybox.net>; Mon, 16 Aug 2021 10:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=balena.io; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=j6v8lxcUs0BrGG9x5rMGmnSpniRL8NDjV0qBLcMMOMM=;
 b=IcP98eyZN7fvKIYy7rjkva6FbLxjy2mjzrNEY1eTbDi/i6/6FbX2ctV+c/5Sgbms1c
 /6sdNf5rjnp1tL02rqmxIvFlFWRaHmHPVaKMRywgcWFKK+V+S+5JPfm5eSXc9wx5PYdE
 UmqWnjPEvUdRqzDSjVXWnjZf0hu1Ba9lAgf6O3g6B8NCPFTqVESyGTbGRcvjWQsVNQtn
 DIMyVvgOEJbPPIoZrjEca7HSKHkrnHK8UGbCku3o9mKVR2vxHnCqr7BL0tsCtI9xxzrk
 KccyPbXoJKhF3c5tpHofh35p1yG1wJ/+jBP52ISSf4d7bmIiX7MvuNzFBWU1rgt1C4v5
 r3Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=j6v8lxcUs0BrGG9x5rMGmnSpniRL8NDjV0qBLcMMOMM=;
 b=Rt3HAf4KZxaVSTUGH15v87vOa/VF/5Zgu+xSG+VIgehmWwMUL2xF9X4X5e9qoM4wGH
 fiotOEDCQTQuf5GBHz1KQoy5iNGxXcRmgj+eCzlmfjG1X4HNJ1WZl3Jty483wwjURygn
 OErCQDTF40J8MHKHDdL4s7dIKqGg9qt7L6HxNjTE88ZfN1VesES4Iwa4HzXQxrCWkXRt
 FfmMzBOt127+ifKlGNy4gS4u2hkZsaKZ2hd2nEByPKeIlBbAKRqKNJka637D65LqRDEZ
 ri6le2M3SQFq5EzWr708dCTh7SH812wPI86Wae6X83VDogfoegbFjWj64VQbcxfTK0OJ
 uPOA==
X-Gm-Message-State: AOAM533AvPPB4ANqYSQuHe45fbHwS17TDF649wh02v3YRAj2hwEDYeBI
 p6xeq5YrS/FoF4KUyWozosAIlSDLKX7S2BtPWePxdDqAIJYzqka8
X-Google-Smtp-Source: ABdhPJxpLbXwf2nj33ixmbJbBrsln5h8fSurhnWQ6YCKgPaTL5XTgl631SK/moykKhcaoIkhVQ836Gv5hXECl/31U7Q=
X-Received: by 2002:a5b:988:: with SMTP id c8mr22260642ybq.413.1629135654563; 
 Mon, 16 Aug 2021 10:40:54 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 16 Aug 2021 13:40:43 -0400
Message-ID: <CAMgvH3qJwXkinSjkSVvRLvgvfrm4S_gvHXSTAo_AcpT-NrsgtA@mail.gmail.com>
To: buildroot@busybox.net
Subject: [Buildroot] [PATCH] package/unbound: update to release 1.13.2
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
From: Kyle Harding via buildroot <buildroot@busybox.net>
Reply-To: Kyle Harding <kyle@balena.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

The release contains a bugfix to fix the make install of the python
module after build changes introduced in this release RC1.

This release contains a number of bug fixes. There is a crash fix for
broken internal structures in stream reuse, that is used when many TCP
or TLS upstream connections are made. Also a number of features are added.

https://github.com/NLnetLabs/unbound/releases/tag/release-1.13.2

Signed-off-by: Kyle Harding <kyle@balena.io>
---
package/unbound/unbound.hash | 4 ++--
package/unbound/unbound.mk | 2 +-
2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/unbound/unbound.hash b/package/unbound/unbound.hash
index ec7e940791..3c872aedf5 100644
--- a/package/unbound/unbound.hash
+++ b/package/unbound/unbound.hash
@@ -1,5 +1,5 @@
-# From https://nlnetlabs.nl/downloads/unbound/unbound-1.13.1.tar.gz.sha256
-sha256 8504d97b8fc5bd897345c95d116e0ee0ddf8c8ff99590ab2b4bd13278c9f50b8
unbound-1.13.1.tar.gz
+# From https://nlnetlabs.nl/downloads/unbound/unbound-1.13.2.tar.gz.sha256
+sha256 0a13b547f3b92a026b5ebd0423f54c991e5718037fd9f72445817f6a040e1a83
unbound-1.13.2.tar.gz
# Locally calculated
sha256 8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db LICENSE
diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index 140b7d278b..37456db416 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -4,7 +4,7 @@
#
################################################################################
-UNBOUND_VERSION = 1.13.1
+UNBOUND_VERSION = 1.13.2
UNBOUND_SITE = https://www.unbound.net/downloads
UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl
UNBOUND_LICENSE = BSD-3-Clause
-- 
2.30.2
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
