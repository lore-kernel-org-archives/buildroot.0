Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2973C433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:58:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95B0560F02
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:58:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 95B0560F02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D58A4072C;
	Sat,  9 Oct 2021 20:58:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RjvwJ2JpsczV; Sat,  9 Oct 2021 20:58:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC8A840736;
	Sat,  9 Oct 2021 20:58:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 300FA1BF5A6
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E4AC405F7
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:55:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tb6xJoVfQbDR for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 20:55:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 57E9040012
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 20:55:42 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 pf6-20020a17090b1d8600b0019fa884ab85so11765399pjb.5
 for <buildroot@buildroot.org>; Sat, 09 Oct 2021 13:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=usToAev1ucXLWlbckeDDAP8cdD1fjkBB5K4KeuQDbf0=;
 b=RZ8Q4fqQ5yaGO/pRDICiNqMdJbdKIqN/2emCWYQzvoGgyCcunxytD2P6pQbdBUq+Ot
 qaj4y1KMMA6hVDspYq8qALTCsFopuDdWHfYKnYMGqgOPe8RWvalXs2Q8nxIK3xKjzepe
 Ke42RhegcAZXhjQ9UWxphRkC5xeo0Yd6xeiGe2mok83tkhaYN0/6sIZ/0gIRJZdstQvt
 wqdFsFxiVgO2Mgb4WRIinxP5E3gHTc9mOxZ+P/rvNyES6ZX48H/4eZnWNi5QvOzc/FB2
 50XVOeMAf+hO6fabVwgVSacEQEKiEvRNRx34E7771kLp0rhtaHrpsnJWQ5B6m33Xi8RG
 4aCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=usToAev1ucXLWlbckeDDAP8cdD1fjkBB5K4KeuQDbf0=;
 b=w5icPfSqp00N7uHGHd/NNBP1WjdJ7puXRrJpkcaYQg94wrP2a4t5bkNWhDBUy1lIZ7
 FIv21PH24+G9NMocIo2jj/tgtWmwzdsgaKNvGczWZdtQygHN9pZlsQhw615jHwrU91Xp
 2yagJcwBoxSCIUsgL6vpiJX15Fbura/CAV9l8dlYJx8jz1wmleMFKcApCU6pXcLyiPOB
 oW9C9IenhOgucTPkk+ChYHI8k+b/IOmpUOhbrGpA5T9855ZwpmHeNpUTL+NzQN3qq9c5
 m7KFrb9J5Lfm1/p1awz/2kl/+6fwCV7agr9j+3qGgvW/dTW6z8N3OAjefLRAgo9yoMs3
 E8fg==
X-Gm-Message-State: AOAM532MoCKvw25+aOVmfVemN3ie+nQvVY9rRaEINSwQes8g8qMlfmOb
 fZ2BvDcNufPfqmZNxEOCxsZTj0n7nd4h0Q==
X-Google-Smtp-Source: ABdhPJzi1U5af3WeTZSDcLbqVmLFv2pvZRkPa1SKfTdOdaV1vE5q2pQtDlrgcZ240KouQBf0Ne6aOg==
X-Received: by 2002:a17:902:7144:b0:13c:8d49:fc46 with SMTP id
 u4-20020a170902714400b0013c8d49fc46mr16380159plm.45.1633812941622; 
 Sat, 09 Oct 2021 13:55:41 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id qe17sm3125765pjb.39.2021.10.09.13.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Oct 2021 13:55:41 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Oct 2021 13:55:17 -0700
Message-Id: <20211009205523.3137859-15-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211009205523.3137859-1-aduskett@gmail.com>
References: <20211009205523.3137859-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 14/20] package/python-certifi: add host variant
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Samuel Martin <s.martin49@gmail.com>,
 Philippe Proulx <eeppeliteloop@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Matt Weber <matthew.weber@collins.com>, Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>, Oli Vogt <oli.vogt.pub01@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

matplotlib 3.4.3 depends on host-python-certifi

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/python-certifi/python-certifi.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
index 7c63633a8d..486548f8c2 100644
--- a/package/python-certifi/python-certifi.mk
+++ b/package/python-certifi/python-certifi.mk
@@ -12,3 +12,4 @@ PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
 PYTHON_CERTIFI_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
