Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05D0C27C53
	for <buildroot@archiver.kernel.org>; Sun,  9 Jun 2024 17:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5963E60627;
	Sun,  9 Jun 2024 17:40:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c6BuW7qeJh5X; Sun,  9 Jun 2024 17:40:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 639206066B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 639206066B;
	Sun,  9 Jun 2024 17:40:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 70E741BF589
 for <buildroot@lists.busybox.net>; Sun,  9 Jun 2024 17:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E5606066B
 for <buildroot@lists.busybox.net>; Sun,  9 Jun 2024 17:40:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id alk3pid_M6e9 for <buildroot@lists.busybox.net>;
 Sun,  9 Jun 2024 17:40:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32e; helo=mail-ot1-x32e.google.com;
 envelope-from=vfazio@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9248060627
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9248060627
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9248060627
 for <buildroot@buildroot.org>; Sun,  9 Jun 2024 17:40:56 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-6f986b92acaso527305a34.2
 for <buildroot@buildroot.org>; Sun, 09 Jun 2024 10:40:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717954855; x=1718559655;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QiH0qKx+QCIC98OvdE1sx5LPSiHx26tkQMXkz2pBP4Y=;
 b=uxZ8ED3swIjs7DRMOCkdRdNiQwVMOgvO+faOKYyEtj7Zfmc+fThK/dh66awTqClLB3
 gYdttrjMzlvy71FGY1Y/8ZruwwPKwyvD36M0PKxlBNZ+QWKan2tfzs2OLyUGC0zW8osn
 UCZ7BPPm/XmGwO0qhEynz3/4elNsrMUxuRUAygP3lPVbNngpLEFsiMjdoCtUAwe41jzf
 DcfWrFMmA1/lDO+IawpBR6l32Fk69rknZBPWZ0HeCBIshMYbE9BHIgvpFry4uwq/otWw
 ZMOVw0Y6sSDmCgtQfY9C+AamYuIcJ34tlqd4pxpsiRTSdmjDQSNVrBTYqqxF1AjZpt+y
 rAlA==
X-Gm-Message-State: AOJu0YwUHGZ+C9SJBY7MLGi4pYQ3tDAD+EXB/MUPM6kdYu/nizAySC+l
 Rr7mUymlq+OOjjcpA+3FyYvNIXbXnO0zITDkOnFf5jSztUXhI+PAKk5K4eEQ
X-Google-Smtp-Source: AGHT+IHnNfD12i4CGhDg5BzMSaYO1P/5TizopNJgbKAVWo0LXmttcVFn8uqwGNs/vTBU80Z4LXQdPA==
X-Received: by 2002:a9d:65c8:0:b0:6f9:5dbf:d3b5 with SMTP id
 46e09a7af769-6f95dbfeb28mr6555138a34.12.1717954854716; 
 Sun, 09 Jun 2024 10:40:54 -0700 (PDT)
Received: from localhost.localdomain (syn-131-093-209-211.res.spectrum.com.
 [131.93.209.211]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b06f20e4a6sm15204406d6.32.2024.06.09.10.40.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jun 2024 10:40:54 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Jun 2024 12:40:48 -0500
Message-Id: <20240609174048.31062-1-vfazio@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717954855; x=1718559655; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QiH0qKx+QCIC98OvdE1sx5LPSiHx26tkQMXkz2pBP4Y=;
 b=Z2Ocd5/qJCNyg2GuNnmHgBVvwVQmI2euUotPfKtJxmdfU+mpZuoLibUFP4sb/6dNcW
 9YIN6nguzM+tSkI3TCUSpGB5evux9jtDiyrUAGdsHlE//7I4P/nXjOqZihet2anyHucF
 FpzBwh5McHBXBhxLyeJRKzYVTm2eLmnwMKmgo2GaXTfrpQlATXkgWzzVspWV9rEn28oQ
 haoIDJnn0pbcX6YoSwjtyl7cXd9ah3z3Dy6bO8ADl+A63GAVFUGaOLSUOCmWD2de2w3Y
 yuryEMLXesppiYMuRD0dvbbCk5cfrz6gXUwHfKoMZ6mato0OGnO5oHRxqfZZtrI6AGAI
 T53A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Z2Ocd5/q
Subject: [Buildroot] [PATCH 1/1] package/python3: fix config directory
 pattern
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Vincent Fazio <vfazio@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Previously, when running `PYTHON3_REMOVE_USELESS_FILES`, the hook to
clean up files from the python config directory assumed a pattern of
"config-$(VERSION)m-$(PLATFORM_TRIPLET)".

However, the "m" ABI suffix was dropped in python 3.8, so the hook would
never actually find files to delete. No error was raised due to the use
of a subshell to invoke find.

Also, if a platform triplet is not detected during the configure stage,
the config directory (LIBPL) defaults to `config-$VERSION`, and has no
trailing `-$PLATFORM_TRIPLET`.

Now, we glob anything after the version to ensure files get deleted.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 package/python3/python3.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 5d9d77af50..950006698b 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -204,7 +204,7 @@ define PYTHON3_REMOVE_USELESS_FILES
 	rm -f $(TARGET_DIR)/usr/bin/python3-config
 	rm -f $(TARGET_DIR)/usr/bin/smtpd.py.3
 	rm -f $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/distutils/command/wininst*.exe
-	for i in `find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/config-$(PYTHON3_VERSION_MAJOR)m-*/ \
+	for i in `find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/config-$(PYTHON3_VERSION_MAJOR)*/ \
 		-type f -not -name Makefile` ; do \
 		rm -f $$i ; \
 	done
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
