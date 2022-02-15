Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4389C433F5
	for <buildroot@archiver.kernel.org>; Tue, 15 Feb 2022 13:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4437E4038B;
	Tue, 15 Feb 2022 13:50:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AvE60ydkF1N1; Tue, 15 Feb 2022 13:50:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6DBC540364;
	Tue, 15 Feb 2022 13:50:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7325B1BF2F8
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 13:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60F214163F
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 13:50:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JbiSEkGOxujy for <buildroot@lists.busybox.net>;
 Tue, 15 Feb 2022 13:50:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7106741637
 for <buildroot@buildroot.org>; Tue, 15 Feb 2022 13:50:13 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id e3so32320515wra.0
 for <buildroot@buildroot.org>; Tue, 15 Feb 2022 05:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A+z3OZ8rDtbZjpGOYHRVWTPYRh6K19wio0Qyz8ohuAI=;
 b=cLo5pYsWkTo891ANzDyRg6Xpc3x7OhDZJEUT9Y98h99O7YHPuTydM5aaYMk8OvnvS6
 uY90Zpa+OT3zjAbsq0/GW11Kwn8YhfS+qvE3H8wl4/wO58YClLOPGXuDqpix9TTj80yW
 JAMoE6oXjHQZ6OsGi3zSKSI27/HPtysjonckfosx81NBnBRaigyt2YnvE0sY2aJgbQIU
 0wifTBlpwj0VolKbwhRh8HguvTHu/CFv5ShgC/b+lX7MJ8LfOzX+RawQUOoSnrxQFLFE
 UyOZxt7piEwJtUUhSpJgroyYnYWVUnd/AdE1ERhh56p2aB7d/EBRzCql/Bj9TEiBTEb3
 U6RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A+z3OZ8rDtbZjpGOYHRVWTPYRh6K19wio0Qyz8ohuAI=;
 b=snSaWhvWogfygtx1k0IsBCT5fp8vDN2uLnsbmckgc8lG1TndpbqTlpb946j8HzT1v3
 tXXPYSfkJwRVhlg/UX97bU3MqtfcneOVw5n08PdeTgaR4wu7Dh5OItR7++eyAPPRQNGL
 TUfEjAeg4C3J3n2IM9na9I6wlcFlfEgJm4vsHZapk9pf70Hky+bBm/mjIb12IOB3IPiS
 T9rM0iSTFclQ+xuPctzTrIcYUBXix3DnMDnyBIu8rFc5NQ7Jn8fU1XFfGnZ2yG30QTZL
 aHvjNa/oImTd0tYewXSmHqsnmcGgZ7oVtYKZLyDNBPEQYpXPwutFHh/aNkNFY/leDwaa
 efVA==
X-Gm-Message-State: AOAM532Ec/DT+cNqYTzvKo/nKc6ubfbWyX3d1RBczwL3vsF3o8Yh8ldO
 EUzqzBRF2RTZJ7cUm7bkf6ggfSNinoM=
X-Google-Smtp-Source: ABdhPJy5cPksZbJLF8LFtweN58Nbg9vky9hjdifRarnkD5Q6eo8yUstdsunI7YrHS39lBRn54qBl/g==
X-Received: by 2002:a05:6000:2cc:: with SMTP id
 o12mr3430288wry.234.1644933011376; 
 Tue, 15 Feb 2022 05:50:11 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id s26sm15403713wmh.47.2022.02.15.05.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 05:50:10 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 15 Feb 2022 14:41:10 +0100
Message-Id: <20220215134110.2365539-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/qt5/qt5webkit: disable sampling
 profiler on musl
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 =?UTF-8?q?Ga=C3=ABl=20Portay?= <gael.portay@collabora.com>,
 Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable sampling profiler on musl to avoid the following build falure
raised since bump to version 5.212.0-alpha4 in commit
df0b0fe6919c0d0f3750f439a3cfa765232bd569:

/home/buildroot/autobuild/instance-0/output-1/build/qt5webkit-5.212.0-alpha4/Source/JavaScriptCore/heap/MachineStackMarker.cpp:686:2: error: #error Need a way to get the frame pointer for another thread on this platform
  686 | #error Need a way to get the frame pointer for another thread on this platform
      |  ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/87f52db7f8ebefa4c1ae3dd70d4a7a460f9aca35

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/qt5/qt5webkit/qt5webkit.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index 2084f3af52..024184e267 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -39,6 +39,10 @@ ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
 QT5WEBKIT_DEPENDENCIES += qt5declarative
 endif
 
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+QT5WEBKIT_CONF_OPTS += -DENABLE_SAMPLING_PROFILER=OFF
+endif
+
 QT5WEBKIT_CONF_OPTS += \
 	-DENABLE_TOOLS=OFF \
 	-DPORT=Qt \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
