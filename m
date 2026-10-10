Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A2ECA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 14:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 187F26064F;
	Sat, 10 Oct 2026 14:37:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id puXB7phCoBke; Sat, 10 Oct 2026 14:37:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 415AD605B1
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791643039;
	b=k3fXULT2yuFKmD29oKhipwcg6wdClOTVZIw7fd+1VDAMKJKhH45DHD//p5wQ3EzjOM0H
	 kBeznw0I0XymIZvgexGlL3DqLHTlJlVBlCPpLLBs8yTBi/ro2aHQ8MlG2GCKfRpXvdlKI
	 UqRDhP+9E4JljcfB7aUXRS1APz1JojaG+aCldAthJP43ORYtOyp3t/XSZ8huwwVwuEaQS
	 /XtCBT804TMJ578nsN902xJn9GiQ2+iUkfym5Ow0rNMw5C8FWmfKMcEeOUE97nQjb4BlX
	 W6lPOgY0oQBomV6hzJdhajqSvGluQQHzYE42BMS58QEWOn4kE7WY7b7W5D/zi1YESPA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791643039;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-MIME-Autoconverted:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=e0nrgB5j4mZ5g+LaYEanAEg7+IXHpe88QoHAqWUDFRQ=;
	b=LU+t+SaA+VxQL4ulaLCWQBJwIYgPTXVQa71je5XTOjQBCF0QZnUDZBVcqHJe1xrJgKi2
	 XpY/kTQV5UwKdkJ48jOOeQzowaZ/UbST/0mWQv0u5LCSMEp+wWPT7BZn2lOE2v++m2I+1
	 v/M3UDSdvuoqK605HsYjskgutHer8NMsnrlHuBki5ja1Apju7dwn2NE89vuzx+/3LjWO1
	 h4EN2vhXxlApx/P9+mwOXoISC1tGo9KDnymzKGDfiB3RZFHudlTtFpHg7OSa88DLNUmvG
	 +cP/il0WJUMlkdciaBOMk2ItR6s7xzTjF4/NBoeSjYMrO52kkUEbYNxA4YChreHZ61Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=none header.from=korsgaard.com;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=chl6kx2L;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791643039;
	bh=e0nrgB5j4mZ5g+LaYEanAEg7+IXHpe88QoHAqWUDFRQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=DL/8EHFKgHlWwbqAMjU5uXOB5LXrNW13yKZLHbTm2pPuup4dZ4zUdMMi+hYIB8dPP
	 SJ3ca81Fj8BTjWKwsk8ZIw3PfriZBGGBjOtdlo9jJm89X+UY7AsiRL4HkYvfE0ZQgC
	 q7Q8CBRGnWLtp0Fg34UyNNpm0l+mLJn21KlSuAKjbijHG0FzRibjO+Nc2zXrjPr1Y0
	 uEEU3SkZdCz9rcE7JBqvuvjy7CL/wKTet+edu68mmyeWmixIEKsqtL5IuvHdO8Si2p
	 PkMFaY/HXczuXkhUlHr5HOkMGuHlP1PlEzom/+CqcwbTIV2jw/Q4vhqBQZLiG9deTe
	 el64rSspE6VMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 415AD605B1;
	Sat, 10 Oct 2026 14:37:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B9CF105
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 14:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4618A605A7
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 14:37:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id svI6tOMG74wl for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 14:37:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 854D06064D
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791643037;
 b=ToMzlOhmV9Pk42MGTpgk/22zMObsCcbt2A5916CVnrsArsYtbC7jdAR7Sfuef9A4Ezwq
 z5O+dJia26k5b/rfZTZfjDQzBN2oX+DVYE4yXUdQvPN13DdtNuUbYlmqz7re4bk82EtBD
 IQnzVeWSZchsRnU2MejSiUD+VjZp6f2z2Yi06zcs4vNm7rMvPLNoJ67/vmrEg2KImPzaK
 h09/Td/Jd0epjNtHVUdy/dU09urJMWjNmqy0naMc+R28Uuxip5O5cLNetdpiMfYdsnNok
 4psaHrUqtHTCilvHsa+ckWRI3dOP5Zlw/W1c+adzP7QpvP+It03YFRSRJEJXPglDxbQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791643037;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:
 X-MIME-Autoconverted:Content-Type;
 bh=10t80EI/cPKCr3fuBoLOEQ+We6yOJHgtxISPQEMn8gc=;
 b=IPtcfSCS+lW9+vpUJw28KQuK8c6bRYwS+Ar4H9/Z9Ez31TNe5/fi7hQ0iNe5JRmTI/bX
 y9PvcbMc1XYspmxTyhJSqYMSxL29Ya/rgohtISv6Jom4i+fYKvBL8xgx8HUA6RK+8pP6H
 mlnNwgfBMjYi00K6QxnJt2E3Mlo0o0u7a/4sggEdy0rxeFItcGspZJo5jssYdMjQjMKpq
 dTcwP5hk9LmiUmrT0SOG7Gd/qZsG3nAWuXMrKaf91q46BQ+eIPzX4LQ/CUcTtGNCLP4Gj
 WUKxkTt+OZTlf5b4v15VRW3BYf69ZJ9oUlzpCHt/rQu0yJb8CF7+TblUh143DbTTv0Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail2 header.b=chl6kx2L; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=chl6kx2L
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 854D06064D
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 14:37:15 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=chl6kx2LfBSV4+xIEY6zrmmTAOGxZe9vjoOSMqnajBvB3bV9BTOLWq24Y51HfE+eJN9ah3gBZ//uMNbe3yJrN6KV8gVlqcQKbaglkABelldGIG0nHG0mdjoxO3h0nVbL7RrZrQQohq33APNTLQfTf/BSZQG8Nzy6P+IGlQL08d7NMI919lsuHGu8vF/yNkvZsTYcHmpZeRSch2sjxUY8r0ZqDxiM4xEQI5xNpsMGytqHwWPya6HyMHlCQ99rJMjpss5iWkDbt3KU+druWvVKFr/DH6Nx6fTtPWwZMJAEmrMpPc86d34O+zZp+lhK281Y2bKuGXkVecO4R5AbXScGWg==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=10t80EI/cPKCr3fuBoLOEQ+We6yOJHgtxISPQEMn8gc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1241376598; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 10 Oct 2026 14:37:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1xFYCG-00000001lY2-2Cra;
 Sat, 10 Oct 2026 16:37:12 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 16:37:06 +0200
Message-ID: <20261010143708.421070-3-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261010143708.421070-1-peter@korsgaard.com>
References: <20261010143708.421070-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Subject: [Buildroot] [PATCH 3/3] package/pkg-generic.mk: drop PKGDIR
 variable for {, actual-}source step
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This was added in commit 2d4fd5d358 ("pkg-infra: also set PKGDIR for the
download step") for the DOWNLOAD macro, which was reworked in commit
155f752d8a ("core/download: do not hard-code the path to the package hash
file") to instead use <FOO>_HASH_FILE, so drop it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index c69bc96237..4e2ce2e7a0 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1087,9 +1087,7 @@ $$($(2)_TARGET_RSYNC):			PKG=$(2)
 $$($(2)_TARGET_PATCH):			PKG=$(2)
 $$($(2)_TARGET_EXTRACT):		PKG=$(2)
 $$($(2)_TARGET_SOURCE):			PKG=$(2)
-$$($(2)_TARGET_SOURCE):			PKGDIR=$(pkgdir)
 $$($(2)_TARGET_ACTUAL_SOURCE):		PKG=$(2)
-$$($(2)_TARGET_ACTUAL_SOURCE):		PKGDIR=$(pkgdir)
 $$($(2)_TARGET_DIRCLEAN):		PKG=$(2)
 $$($(2)_TARGET_DIRCLEAN):		NAME=$(1)
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
