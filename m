Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C236C27C52
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 18:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2343E417AB;
	Wed,  5 Jun 2024 18:10:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NctSt430M81K; Wed,  5 Jun 2024 18:10:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8667D417BB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8667D417BB;
	Wed,  5 Jun 2024 18:10:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EF1CA1BF5AE
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 18:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA34B40975
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 18:10:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UnfW5npcKUd7 for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 18:10:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6322740377
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6322740377
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6322740377
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 18:10:19 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-7ead8882735so5376739f.3
 for <buildroot@buildroot.org>; Wed, 05 Jun 2024 11:10:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717611018; x=1718215818;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vMniryS5AuWkUab6NL17qtg/8U6Pb4Z8T6rNudvwvd8=;
 b=aLokInDKe2xtAtIis9vLEwGtC9teTkJnFiXQ7mDzYw4jmQTS6EBeGBFfo3SBNk4tOJ
 7c2r1HfL7G0J9YWHWwTMFxHiUHLxb5C2msIUqt6/BkP7Xl2ABFtHSzbISbE6RK3h2Pkm
 F7uPuRfKD9YFENANPK1kQ6fIyB+OuTqqt5jjYbQHsOBPJxFWAjeUjObGGDGIqQq93x2/
 b2U1EI08pHkUhfXVlcfznRtQknH1rYgGZOjZBqL94GueFCeKuntoNqIZyqy463yj/91b
 b9tejElIwjXncgAM9C7Mubq2//scLs7Z+fWKrhPj+o2Xxi9WL8dc+3FqLyw8fKtM8sEj
 DA1w==
X-Gm-Message-State: AOJu0YzKgED/cqbQg3RjVa9wAQ7HUGkMxgj810Nn5OfJAaptK+Jsyy20
 wUuhZYZ6LdeplALFa3bTvMiGUjh2iF5ctOQ5QmOIgvE8zBTfu4fE3dtLfkv3
X-Google-Smtp-Source: AGHT+IGh7UPOVlxHls07KoLKmuMjRX3l/Lx9WDJJF+tZpHWDe5XDt1idYxs3kowYQCDco5LxlFdt1g==
X-Received: by 2002:a05:6602:60cc:b0:7de:e6f5:b1ab with SMTP id
 ca18e2360f4ac-7eb3c4b8f33mr403301939f.6.1717611017917; 
 Wed, 05 Jun 2024 11:10:17 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4b5de33cfdasm1456456173.21.2024.06.05.11.10.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 11:10:17 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  5 Jun 2024 12:10:14 -0600
Message-Id: <20240605181014.2250616-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717611018; x=1718215818; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vMniryS5AuWkUab6NL17qtg/8U6Pb4Z8T6rNudvwvd8=;
 b=axZAitXlQkax+7eLFOy0dDh9E1nMihtIL7jwYBbyQ89vaKZTu9hxOLqqCYkjEaFC/k
 Gcs2GpMlQl7zOhIoThWM/4VW8TU4v6Wq0dToGvLgUAYKeoonDMxUQW0nMjrKqy6eg2JY
 woeA10woheFotrmxCQGvvYTIaqimilb6TCjZtTHfGOuGXBDZjHuIiYSW/k3uCEWLrduz
 W0P1L6HdgAlv0OCsGX2V9vrW+TnhPUpH5zoE3cP0xDGCefZmTrkPFXIGR//dyyfjefwG
 iM/gEQb/ZtpNyaRmFxYcZLq1MyM5/j9KKJVfRS4RRZhw62FcrZQnhkC8YcI3S3UBit25
 TJdw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=axZAitXl
Subject: [Buildroot] [PATCH 1/1] package/python-lxml: bump to version 5.2.2
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

Fixes:
http://autobuild.buildroot.net/results/99c/99c28a0b0bf0fd20b02289d7a73c5c2f7664778e

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-lxml/python-lxml.hash | 2 +-
 package/python-lxml/python-lxml.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-lxml/python-lxml.hash b/package/python-lxml/python-lxml.hash
index a23cdcec9e..3eb427a80d 100644
--- a/package/python-lxml/python-lxml.hash
+++ b/package/python-lxml/python-lxml.hash
@@ -1,5 +1,5 @@
 # From https://pypi.org/project/lxml/
-sha256  3eea6ed6e6c918e468e693c41ef07f3c3acc310b70ddd9cc72d9ef84bc9564ca  lxml-5.1.0.tar.gz
+sha256  bb2dc4898180bea79863d5487e5f9c7c34297414bad54bcd0f0852aee9cfdb87  lxml-5.2.2.tar.gz
 # Locally computed
 sha256  41d49dd406aa0e1548a6d5f21a30d6bf638b3cd96eb7289dd348d83ed2e40392  LICENSES.txt
 sha256  69edb445c1335a8312d4c09271847e9956d84f0d9f724d125340cc3fad767b2a  doc/licenses/BSD.txt
diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
index 2da8b8056c..2a26c132a7 100644
--- a/package/python-lxml/python-lxml.mk
+++ b/package/python-lxml/python-lxml.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_LXML_VERSION = 5.1.0
-PYTHON_LXML_SITE = https://files.pythonhosted.org/packages/2b/b4/bbccb250adbee490553b6a52712c46c20ea1ba533a643f1424b27ffc6845
+PYTHON_LXML_VERSION = 5.2.2
+PYTHON_LXML_SITE = https://files.pythonhosted.org/packages/63/f7/ffbb6d2eb67b80a45b8a0834baa5557a14a5ffce0979439e7cd7f0c4055b
 PYTHON_LXML_SOURCE = lxml-$(PYTHON_LXML_VERSION).tar.gz
 
 # Not including the GPL, because it is used only for the test scripts.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
