Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CCC5C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 09:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F3A3435DE;
	Wed, 10 Jan 2024 09:39:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F3A3435DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jI1ySQzt0ANU; Wed, 10 Jan 2024 09:39:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CC4D4362E;
	Wed, 10 Jan 2024 09:39:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CC4D4362E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9412A1BF34C
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 09:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A4E4435DB
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 09:38:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A4E4435DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zFIiX5si6lCF for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 09:38:55 +0000 (UTC)
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7DEB4404BF
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 09:38:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7DEB4404BF
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-7beea7c4985so38614939f.3
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 01:38:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704879534; x=1705484334;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/wHvimbNCCzGXDKXkmCGUY/pk5shO8dV43wEPpqS4y4=;
 b=TMik7GqVKygID054HfwofKJsgI9vHmhEQcLpGMzw48ufoa0/49TLWqYLO8u3Ztn8b3
 pbj7at78wxDTM8NFUC+iVMEwVu8LWLj66H9e9VxG9tcQJms05r/w6nk3CXR6sKlugvin
 FPz8YwIXSpjErcNSpCnfvYY3BH6e08pNHFCHQpmRYERkMEVC/mPpb4QkKLp511mZ+QJe
 iQrYlK5xF6SJUkntPD9RF37dMnIbRetLPp3DAXSBSecGv/VsCLbX9SqksK9lf+H2kivv
 h4VUMzU03QDSCcv5VqPcuZ54eVZ4DbzVMzqhY8tgXhhmbj1tDtrVI7kH78PgqlWk1WYu
 3kcg==
X-Gm-Message-State: AOJu0YxuaSc3y7TNFLJFCBbhv2CrpZmtKjDwUfnsApLgMxsZt3LEGbnB
 LGveYMl0tu8UyhUUg0UzooVpp+ApBvFqjg==
X-Google-Smtp-Source: AGHT+IHdi6WH04KFKnMwEEk/TDZXnbdjKT0zPnAa3I6dCzJTK877znIJszD4eADkAMB+mA4o2WH+dQ==
X-Received: by 2002:a6b:7f44:0:b0:7be:eed4:72c7 with SMTP id
 m4-20020a6b7f44000000b007beeed472c7mr453128ioq.20.1704879534213; 
 Wed, 10 Jan 2024 01:38:54 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 cw9-20020a05663849c900b0046d950cf82bsm1185395jab.85.2024.01.10.01.38.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 01:38:52 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 02:38:46 -0700
Message-Id: <20240110093850.2302133-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240110093850.2302133-1-james.hilliard1@gmail.com>
References: <20240110093850.2302133-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704879534; x=1705484334; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/wHvimbNCCzGXDKXkmCGUY/pk5shO8dV43wEPpqS4y4=;
 b=JdFbM23EIK+qv2mJPJer6g8HaJg3EI/8m49ROQd0yXu5shePjW21tLH3UIalq5gs7f
 xVZdMzZYEZee2NZwIEFKEZl8IsjwVZvsOKvXpu7hf7Fyc5r6Vp6+Ce/+FW1hHLKF2vnS
 rPNpVXNQFKWfkLS7fc3hAUTVrBKe2vVSQLSEyXKkZxZPaDinc+S2sKAJ4+QqMjcPU2jk
 wFUW8dgFh81DmXDud3ABxnTflrsj66/m51QHGtLtLHGLoKWGCFjtU2pkCeUNOfU1SJcz
 zzB9gm1hlEvZIiNGMLuRDfy8LJogTsOMgiAM2xg/BAcCa5XrTtHiDRrWUFqeolyR51s9
 8hfw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JdFbM23E
Subject: [Buildroot] [PATCH 2/6] package/python-distro: add host build
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This will be needed by the upcoming python-scikit-build package.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-distro/python-distro.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-distro/python-distro.mk b/package/python-distro/python-distro.mk
index e079d8e265..947063da76 100644
--- a/package/python-distro/python-distro.mk
+++ b/package/python-distro/python-distro.mk
@@ -12,3 +12,4 @@ PYTHON_DISTRO_LICENSE_FILES = LICENSE
 PYTHON_DISTRO_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
