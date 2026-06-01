Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC032CD5BD1
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 09:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72F4760ABC;
	Mon,  1 Jun 2026 09:31:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qlhTJKUQ9T8z; Mon,  1 Jun 2026 09:31:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 914B660BCE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780306312;
	bh=k8GQWf3BJbKJTr8ZACOeh8NmbBA6d+daiY1Zll3qFuQ=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eMbNGb+Uia6hX2j3LD+7Ryq1G1w/HVyzj1IgpHgcoTxgu0VM2R6zTvH5bm/eWiELE
	 BUntLPTgaXFoN2VfJz76raYPmwqHO8IsmiviGqXT4UXJXWZH8qoCYHwLMgVXEVfVAU
	 u9ffPcyiCHvNgEmHFfaRioh3n83021pwYwTNd7bvlMjn3EtsagqmobxOlKK8Ps2zWL
	 DltF+5u1w+ZD+7tMEp98S/k6wQ/DA8U6NDDnDRBHlXWbxhyHQtLNAqCnA9QbBz6Om2
	 N+YuSwZOChdG8j0TETRnftW/oRtjG5yjPr5H/oHmYHhVlqGiHBd7rOWk/1NcFLdt6Q
	 tgsqDtDCDXrNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 914B660BCE;
	Mon,  1 Jun 2026 09:31:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6805A257
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 09:31:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65DE160BCE
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 09:31:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pRXFd5o4L4jp for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 09:31:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3479660ABC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3479660ABC
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3479660ABC
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 09:31:49 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1629640134; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 01 Jun 2026 09:31:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wTyzo-00000007YCi-2zZP;
 Mon, 01 Jun 2026 11:31:44 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Olivier Schonken <olivier.schonken@gmail.com>
In-Reply-To: <20260531214400.1996805-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 31 May 2026 23:44:00 +0200")
References: <20260531214400.1996805-1-bernd@kuhls.net>
Date: Mon, 01 Jun 2026 11:31:44 +0200
Message-ID: <875x42ehdr.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=WB0ERPlu4zqsRF7+LFqIPC7McYDyDDnQ9T2QLyhhSoe3/XJdQ+HOYZyXB3mAb4cItBvbjKDxvlu+qtcnhf/wv1z+wdxt6ck0fuZiGytdbxjC+AZjiR/xd3/ZlyWXdjFy+SYUjNJq7aEO2ZnCAq3c5yat7LPn2M0zNqJo6CgkC5f9ikEoTFhsqUWsAj/tYvklwFEbCq3fPtubMlRI06XgtYP9JDmj6Vbm2znjdSoOBNh5fIrQjcnQZrt6X3fCXmNh2JPc2+DlRZIhmRSohb5z+DUR5KLo33OsPbJZVCgNCqSaVJS1Uw4NCg2GYuFbQnMbZcVEQxffNeT+j8TjsPwZKw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=bfpp7vidk3HpIfbXAHotxaUyTZdBSMcWh7TwXfC0qx8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=WB0ERPlu
Subject: Re: [Buildroot] [PATCH 1/1] package/poppler: needs zlib
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Buildroot commit cdd1c5ca55620a4bdd1574d41fc5538d50f7359a bumped the
 > package from version 22.12.0 to 25.10.0 but forgot to change zlib into
 > a mandatory dependency. This is necessary due to upstream commit
 > https://gitlab.freedesktop.org/poppler/poppler/-/commit/7d87c7d2c6ca4f814f87329534a17dbf30203313
 > since version 23.07.0.

 > Fixes:
 > https://autobuild.buildroot.net/results/85f/85fb6c2945101b8d4ee86dbc32700293e7b35a86/

 > CMake Error at /usr/share/cmake/Modules/FindPackageHandleStandardArgs.cmake:290 (message):
 >   Could NOT find ZLIB (missing: ZLIB_LIBRARY ZLIB_INCLUDE_DIR)
 > Call Stack (most recent call first):
 >   /usr/share/cmake/Modules/FindPackageHandleStandardArgs.cmake:654 (_FPHSA_FAILURE_MESSAGE)
 >   /usr/share/cmake/Modules/FindZLIB.cmake:242 (find_package_handle_standard_args)
 >   CMakeLists.txt:309 (find_package)

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
