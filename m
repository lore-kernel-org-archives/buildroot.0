Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A503C47DD9
	for <buildroot@archiver.kernel.org>; Sun, 25 Feb 2024 22:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 653726064C;
	Sun, 25 Feb 2024 22:05:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HlyFY0pycyMD; Sun, 25 Feb 2024 22:05:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 751BF60759
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 751BF60759;
	Sun, 25 Feb 2024 22:05:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3B5771BF3E9
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 22:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22951812B6
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 22:05:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gIt0L8grviSW for <buildroot@lists.busybox.net>;
 Sun, 25 Feb 2024 22:05:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EA4CC812E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA4CC812E9
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA4CC812E9
 for <buildroot@buildroot.org>; Sun, 25 Feb 2024 22:05:39 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-33da51fd636so1530327f8f.3
 for <buildroot@buildroot.org>; Sun, 25 Feb 2024 14:05:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708898738; x=1709503538;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Q0h0/pKOt3HgGEUxTCTsxq6pxnOP6O/E4FgpQ9+7hWY=;
 b=sh6ZpDl+BveRG75sHThuIFmrj70OmuoDjoFiXlrgbvT4w8HRzf/imyL8jGh0GOojzU
 IN41izfVs1L03qkeQcshXvLW8BnBIZpozGW6empy5ipqCP5v45d0S5Se+3jW+w7t9KlZ
 ItqEKgFte2jSQ5D6EEPFBFYY1em7WJLP5cd8zWuksxfDYwg41mtCQNyh4IQE3yjh9J8U
 8LcW49RtuyvUYL81PtTf8yzvSTsqOr83FFa7jMndnFV9x2JJsUQydLVUxOv4W/gRfWdV
 BMWHxoFY0uv4pa5h4TkHqGU8tUaKWO/vPzd+kIrf+ILLa7o/GIEHIFV+lmTFEXjsuFLf
 3BwQ==
X-Gm-Message-State: AOJu0Yw7rQNB0Vyiersn2b+y+Sc4f5c3eEIS5IqNTI1uFDSBghrBMx8P
 yG4GppGAPt/Ep8VNvHXmj37XDgQ823Xdl44j5SWjxR+Ti4WsusEDdvVue6Xu
X-Google-Smtp-Source: AGHT+IF9jP4fTg2NFkCQJSFYl64v2gCaDCodoFfHJD/E5IrThEZk8S423Us8TV7RDGsB7ckvbJjLDA==
X-Received: by 2002:a05:6000:c9:b0:33d:1d45:60a3 with SMTP id
 q9-20020a05600000c900b0033d1d4560a3mr3043429wrx.44.1708898737677; 
 Sun, 25 Feb 2024 14:05:37 -0800 (PST)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 d15-20020adfef8f000000b0033cf29a67c7sm6183556wro.7.2024.02.25.14.05.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Feb 2024 14:05:37 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 25 Feb 2024 23:05:35 +0100
Message-ID: <9b7aaaa3b968342ac2f0d6d723ecbe721dbbaa4b.1708898731.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <cover.1708898731.git.yann.morin.1998@free.fr>
References: <cover.1708898731.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708898738; x=1709503538; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q0h0/pKOt3HgGEUxTCTsxq6pxnOP6O/E4FgpQ9+7hWY=;
 b=igc3b/DyXY8soy9Dp/H9JUrgubCYu4r4DLw8Ua+1zduP54QT/+Ouj0n2QntzIW1ftL
 bwO03bv9saw6wix56g8Zb/VLNlgJ4ES1vHKZvKMCS+uwiXfXUMz6Yl+g0PnMHL9FKNsq
 tv34RB9ueVhflKayAUybji0sPUUygwAE3yhRC8jw2kjktpKx94hNmsHFaOztjTBWRpQt
 Izc5krolRHVkGVxuuklY0GcDouFYdPBmw+3sMFWcjl4UiIIhGO0IshJALSCufRXN7uC2
 FpPjZcCiJjSM6qKSnHh4YH63NWIRuvsnPJOoC0sF5LXa2XnmwyP/D64CL2TxP+/pbYcK
 E/CQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=igc3b/Dy
Subject: [Buildroot] [PATCH 1/3] support/scripts/pkg-stats: fix datetime
 deprecation warning
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Abide by the warning reported with python 3.12:

    .../support/scripts/pkg-stats:1289: DeprecationWarning:
    datetime.datetime.utcnow() is deprecated and scheduled for removal
    in a future version. Use timezone-aware objects to represent
    datetimes in UTC: datetime.datetime.now(datetime.UTC).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/pkg-stats | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 7835cb3d62..00d1eef09a 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -1286,7 +1286,7 @@ def __main__():
         package_list = set([v["name"] for v in show_info_js.values() if 'name' in v])
     else:
         package_list = None
-    date = datetime.datetime.utcnow()
+    date = datetime.datetime.now(datetime.UTC)
     commit = subprocess.check_output(['git', '-C', brpath,
                                       'rev-parse',
                                       'HEAD']).splitlines()[0].decode()
-- 
2.43.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
