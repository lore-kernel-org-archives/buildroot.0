Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA308C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 03:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AD6E405A4;
	Wed, 10 Jan 2024 03:51:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AD6E405A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X2-2fnlNnYYl; Wed, 10 Jan 2024 03:51:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D93AF404E9;
	Wed, 10 Jan 2024 03:51:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D93AF404E9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 338391BF322
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 03:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C04E611C2
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 03:50:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C04E611C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qq1oLwx_0xop for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 03:50:58 +0000 (UTC)
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2D6A660F35
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 03:50:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D6A660F35
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-7bee6a5ba1aso37782639f.1
 for <buildroot@buildroot.org>; Tue, 09 Jan 2024 19:50:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704858657; x=1705463457;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IZoCDtgZRVzJckL0ZYBBornaz6s9SMEVcSJEPDuPZ98=;
 b=D6z6iEQhD8r2nFDIDczY9ghMzuACxLrpqb79Z50bZ708EqkJZaqnSLeMxTDiufgxFI
 d1tS98hGb600gPkEtq+n7yPhBhWnE6w2InjCxJIxLWDrw+H1f+bOjlPd2Omx0IO/CGON
 jr3wFnL0IcGuhFhzUTFf0LR4uQx48cqQjGKL8ylnusldpMcrvDWGxKj9/YAIYFoVrXSH
 1FDs5KYRPvbqcOOScOzSqABqIbu1eCIWEkgUbQelPGAzMcIvjoVZW4Pf6rRNjaYnjWaT
 g9g9l5frO8YHnzVFAXL/H8s03Hkn71uIzJR6vdTcDyzPMvByc2I0WhCaoe9wcmoWjSkn
 XUyQ==
X-Gm-Message-State: AOJu0Yye2EhU2nP2MhEym1GKIBl/dmjQeqhjA1AoCnSUmJGRX1mrwuD/
 f/vXrKGUmH8eXQQiNmUMJT9Xp0oKCf1LJw==
X-Google-Smtp-Source: AGHT+IE1agUALdhwH1pZbghMyE7vDLE8UPFA75I07N6wLrirdzRKTUes79WBxSQFvTizkiHkvMMdlw==
X-Received: by 2002:a5e:c117:0:b0:7ba:9546:2d6b with SMTP id
 v23-20020a5ec117000000b007ba95462d6bmr149959iol.4.1704858656796; 
 Tue, 09 Jan 2024 19:50:56 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 u26-20020a6b491a000000b007beda5e9627sm716729iob.38.2024.01.09.19.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 19:50:56 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 20:50:54 -0700
Message-Id: <20240110035054.946683-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704858657; x=1705463457; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IZoCDtgZRVzJckL0ZYBBornaz6s9SMEVcSJEPDuPZ98=;
 b=cu5IwhGpDGs8zdRYKoIq/CwbKc11N68SFNBSVxoY2MKoKGjr5u6V2s1zJkp+2+tlo0
 ACRakb6gt1Wo2H7scj6H2eph2/aiIRDGUiRFlkWdVch361RMh9TK+qdwIOyrz+rjsfNo
 ztXuNo706eXd0AhamB/DUUzchW0mSwrPDi58mtYhVjnozDzf8l4uuClZSdVuD7R8PfHB
 TfI8mkslqvtX+VnLEm7WLjYsXLK9PvX72Q2C4DlxUAYKvrQERslduNHi3G7ElJHY6RL7
 MpiQ0g8UwOdzCJL9cJtHonA0YWbSQHslBH38PhB7a8jYcSFlZuVBNxDd8cr8mvm9IswM
 kGgw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cu5IwhGp
Subject: [Buildroot] [PATCH 1/1] package/python-maturin: bump to version
 1.4.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-maturin/python-maturin.hash | 2 +-
 package/python-maturin/python-maturin.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
index fcc6a25713..be6167afea 100644
--- a/package/python-maturin/python-maturin.hash
+++ b/package/python-maturin/python-maturin.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  7e2fdc083ae253c0f68f6313a2ad2de423219f09e7fa65ef55189d42128e4cff  maturin-1.3.1.tar.gz
+sha256  3757ed29fbaa87a7dde95dade795ea80f099a867343e920ccc471f75d141a6fa  maturin-1.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
 sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
index 170dee7649..91507468a2 100644
--- a/package/python-maturin/python-maturin.mk
+++ b/package/python-maturin/python-maturin.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MATURIN_VERSION = 1.3.1
+PYTHON_MATURIN_VERSION = 1.4.0
 PYTHON_MATURIN_SOURCE = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
-PYTHON_MATURIN_SITE = https://files.pythonhosted.org/packages/d6/a3/42ff26b2b3011ada67c73db32a9ccf9fa18d459cbef8ed6eefc3b283ee60
+PYTHON_MATURIN_SITE = https://files.pythonhosted.org/packages/20/90/43a3aa35f037e91582ec7516a92084a71f84e89e39ef580813bed072b154
 PYTHON_MATURIN_SETUP_TYPE = setuptools-rust
 PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
 PYTHON_MATURIN_LICENSE_FILES = license-apache license-mit
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
