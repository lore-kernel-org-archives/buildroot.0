Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 371E7C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 22:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D57274014B;
	Tue,  2 Jan 2024 22:28:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D57274014B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UDyUVlW5Hp7L; Tue,  2 Jan 2024 22:28:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D62C6404C2;
	Tue,  2 Jan 2024 22:28:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D62C6404C2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3EC211BF276
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:28:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1130360F39
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:28:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1130360F39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O0TTrXvNnR-G for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 22:28:54 +0000 (UTC)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1484D60EF8
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 22:28:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1484D60EF8
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-336c9acec03so5899881f8f.2
 for <buildroot@buildroot.org>; Tue, 02 Jan 2024 14:28:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704234531; x=1704839331;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Aw5eOLb5B6BDUQtz684p9qZbsSCpd4qxdsdGR98u66U=;
 b=tOtiRMjKWoZakPbihu5/2kHhn4sfmlE403maInSgIB3MMxc+QwkmdErwNoWe/UgohO
 d2O8APlFqCYjh9Yet3XxcwMsWVANR+AUOadewzuEEjIvmb7hllOK6lGSA68UpiJoVq0b
 hPYVcMH6kAow5XJMaGV38UTGZTPNyw9AJlQP0hqRBoFCWG5C2u63qJouR1qfigmTjBBj
 iGAmfzwLqdT729dyDydH1ZlNpAY3BoadwFJj+5+0D93ecm6Fav65mxqiL9Oy1qfoUqOr
 sUK/HgaCknlFcblWWRmoNxaHLe55LNGHcF7Ig7hfUU1yns9WGBtkdycy0r5jJf7Q6Cif
 6nQg==
X-Gm-Message-State: AOJu0Yz6MTxJlRuHaVIfD24mRFnMKEuwuByxMmWA0kodkJaxN4gte8rr
 X2QLdNyloAAUD9Z9y0IrpRjv6bTE6p0=
X-Google-Smtp-Source: AGHT+IHMxWkhyxrJwnrUq6fdMhi4JSmviIn/Kg3OcPyTRo0GFPOeQ/YdTNxZ4ax/qde6PLa7Bqikwg==
X-Received: by 2002:adf:ce0c:0:b0:337:4928:4e39 with SMTP id
 p12-20020adfce0c000000b0033749284e39mr661517wrn.16.1704234531127; 
 Tue, 02 Jan 2024 14:28:51 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 j18-20020a5d5652000000b00336ca349bdesm20112673wrw.47.2024.01.02.14.28.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 14:28:50 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 23:28:47 +0100
Message-ID: <20240102222847.2460245-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704234531; x=1704839331; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Aw5eOLb5B6BDUQtz684p9qZbsSCpd4qxdsdGR98u66U=;
 b=bujWbvq7lSv1zsgTEiNbHnAnbfB3NKu5AK3NzPTVB8GkTLo7y1pIfStTrA8waqQwfz
 OzAA188Wutnvq6Ve0fECZPpBxVshc6lqBnnhgiaw83lgzxv5aRX9coRqqplrEKsF34qQ
 Ya3BZePnGJuEkEG/XUOvdX5bcbVEAa/Q6TOIbZQ1A8WdQAQVtOAmmw6e+a/I3T+yE8OA
 wrfPIKWcnWGX9hcx4d9XtX22Yvfsg3lJTieZZB79BzpDJkS2Qx86GQE6ODTrXX4+owIM
 SsuE+Ktc6IpB7zQBzN50rfO0KTRqx6ta7xMTmBZ1XqDKJYqaiwzN4tSRP1+B41Y6UgPX
 cFkQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bujWbvq7
Subject: [Buildroot] [PATCH 1/1] package/inih: bump to version 57
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/benhoyt/inih/releases/tag/r57

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/inih/inih.hash | 2 +-
 package/inih/inih.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/inih/inih.hash b/package/inih/inih.hash
index e2ed923c7a..476b544ce6 100644
--- a/package/inih/inih.hash
+++ b/package/inih/inih.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4f2ba6bd122d30281a8c7a4d5723b7af90b56aa828c0e88256d7fceda03a491a  inih-56.tar.gz
+sha256  f03f98ca35c3adb56b2358573c8d3eda319ccd5287243d691e724b7eafa970b3  inih-57.tar.gz
 sha256  9ae3b39e83e9158e44b67733baa3bb2d84e80efdcfb14a5820210a42c7abdf7f  LICENSE.txt
diff --git a/package/inih/inih.mk b/package/inih/inih.mk
index c43412894a..93032f1ed5 100644
--- a/package/inih/inih.mk
+++ b/package/inih/inih.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INIH_VERSION = 56
+INIH_VERSION = 57
 INIH_SITE = $(call github,benhoyt,inih,r$(INIH_VERSION))
 INIH_INSTALL_STAGING = YES
 INIH_LICENSE = BSD-3-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
