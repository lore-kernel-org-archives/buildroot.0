Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7833BC4829F
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 21:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 459E48236B;
	Tue, 13 Feb 2024 21:16:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I3g6bq1tNbep; Tue, 13 Feb 2024 21:16:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FE9A82378
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FE9A82378;
	Tue, 13 Feb 2024 21:16:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 515821BF310
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:16:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E302822DE
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:16:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vR7c4zV8tgJj for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 21:16:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CC90A8216A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC90A8216A
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC90A8216A
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 21:16:01 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-7c47f06863bso18968839f.3
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 13:16:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707858960; x=1708463760;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gCZfjHW0T2bUUUkhl9aCq1nvXak6BP50PQnGOePk+V8=;
 b=sTRmxWsE5yNGf2IdNzenCujir2RR05ApPzwBPXYYavLJ0+usol0bV5iQqdA4dnlp2V
 WwW1EiE3X8VzXgAZB9YNxaCDowvckA0GA0Y3TRakKNEleAKonGd5mFFhDGAxtX2DdbdY
 UKbGofr9b+kbUkvE5337UGS9uk5csvsx87l9wadYMxzw1h/rExmHXls8waXYS61gfAnf
 kicawcIWlJgoLC03erMqUilAgQWCIrzD5k74LyfabOIOitgjQ4qMB6Y3k+uCAxCGaqs8
 /qm1MWclqhVmp58MClXH5uDX6PxIiqOplbnOZ03vjQRxIRPOM/mmj14HBGFC8Q4HiZMa
 8cdw==
X-Gm-Message-State: AOJu0Yy5C6BNRNOcrLpRpZzluaWGNJFBamDYmv7vJ8YBK+riaj9lJjR/
 ZdFN1LEMTF9OI8t7G5D3j/NsVRSzqFXdu1ua2FTK0GdGH8a8gEuyomHME7AZeqdeBA==
X-Google-Smtp-Source: AGHT+IESijowrrMJzK8B62/sinJ3fw0sOVxK0WjMI4QXJc9zo9o9Xan38TP5+jjUesr8YCcPv3dfhg==
X-Received: by 2002:a05:6602:1d5a:b0:7c4:6192:a730 with SMTP id
 hi26-20020a0566021d5a00b007c46192a730mr1075801iob.16.1707858960475; 
 Tue, 13 Feb 2024 13:16:00 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWtMAaGx2P6XmFkvqypS0x9FSaNzBEFe3vIQ9syxkwlmh60sNoZz2YBHmBRn05CATHxarueoZmECOXLGmfY1jTAgOQZv+8hsrzmR09zacTmuj2KDIIE3IWJpzhV3+1VnSSFbUd/ie9fN8Ikp2lVGMJ7eMtc+PXIdGGqc9eXgtBZZ17kTr0p2+NYpMv5CiKFz8tK+tdwh1NqzSLbGqcTXKAyvfUs0jGA0uxVDtiJ2WjreH/Bk0EPvMFrTvsPr52uuJxb9yz5ubsT/uhhV1/ikwVfF+KWiyxAfU3IWv5yHwtyC0sfdbmZ/Hc2RvzlA8KzXEYFZ8nAxUy18cEGHA905VfCToDxRdmfqeoesRf12VKLpnqTWcp77m4IaPAZjpsfGhucB5pmGohmGX9u56TkxHZSJYZNVO3A1ENjIzHse39EkOEtY/7CRXWW7BTjRaVA6p4VK56TFBklZq4N9Rhd6zsqvvesloPxh1oMe/ihT6WeeQAkG96ukixC5pjdJkfffWFH4+nij8Oj5JjvYt2GcSy1vACTEGzA7hKedJQnS/6c5+8ttYRrCPl5NgBkHRiB3GY+rWIbMk62q4Bg2QOIR1GPf861Ej6/qfUctz/AHn/rpgyNVRBA4GkKH9Z5pwzMVEBAHf2XiFNqDMnNdrwQCTl0RIYiZWZu04SWMA5LewIu5hopZe1yeTeHb0xBNaUVRV9e366miu4zLNJpi8sh4f0MRw8/ZKDdW4y+inemF7GXKBblPYbYew==
Received: from james-x399.localdomain (71-218-247-10.hlrn.qwest.net.
 [71.218.247.10]) by smtp.gmail.com with ESMTPSA id
 ei14-20020a05663829ae00b0047151636e0dsm2080336jab.10.2024.02.13.13.15.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 13:15:59 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 14:15:08 -0700
Message-Id: <20240213211512.3918044-22-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240213211512.3918044-1-james.hilliard1@gmail.com>
References: <20240213211512.3918044-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707858960; x=1708463760; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gCZfjHW0T2bUUUkhl9aCq1nvXak6BP50PQnGOePk+V8=;
 b=VYnqt3hn+TnggyGb+fJZGupt6YMLyDBocrITfoLeT1bKRlujR64LhRvE0tv9RUKicY
 BM8OqOdo3fJ4Sp0opbnFW+2695FEMD6niGvgxaaTEjOujAiq6hrKnehtzn8OuyYSItDB
 32B7ecCkKYfUAsL8hA8uZsDwze6XtmIRnCvt6PLUzmLtDwdDg2t0RElw7sJEG34oL5/P
 FYSC97CroIOkVMwIgODZvV692Aie8v3aLyuItcmcgZ0jU+1eoC3qXRR8lnHwa6qrO0fj
 o6kwwFIxxGKHEoJ7STUDz6uxL/b4kEA0KOp50hdzjJwsTOwJFCqtLHE43Y0iV2spwAW8
 4H3A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VYnqt3hn
Subject: [Buildroot] [PATCH v8 22/26] package/python-sh: migrate to poetry
 core pep517 build backend
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
Cc: Geoffrey Ragot <geoffreyragot@gmail.com>,
 Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Gustavo Heinz <gustavo@gsthnz.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Attila Wagner <attila.wagner@onyxinsight.com>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Louis Aussedat <aussedat.louis@gmail.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Joris Offouga <offougajoris@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Christian Kellermann <christian.kellermann@solectrix.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Lionel Flandrin <lionel@svkt.org>, Mauro Condarelli <mc5686@mclink.it>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We need to migrate python-sh to the pep517 poetry-core
backend as setuptools is not supported when building with a pep517
frontend.

This package currently builds using setuptools as we do not yet
use setuptools with a pep517 build frontend. The package contains
a setuptools fallback which only can be used when using setuptools
without a pep517 frontend as the pep517 frontend will only use the
build backend specified in the package pyproject.toml which is
poetry-core and not setuptools.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-sh/python-sh.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/python-sh/python-sh.mk b/package/python-sh/python-sh.mk
index af4da3f6c9..29843d645b 100644
--- a/package/python-sh/python-sh.mk
+++ b/package/python-sh/python-sh.mk
@@ -7,8 +7,9 @@
 PYTHON_SH_VERSION = 2.0.6
 PYTHON_SH_SOURCE = sh-$(PYTHON_SH_VERSION).tar.gz
 PYTHON_SH_SITE = https://files.pythonhosted.org/packages/cd/51/7355831d8e1cee8348157d769ccda8a31ca9fa0548e7f93d87837d83866d
-PYTHON_SH_SETUP_TYPE = setuptools
+PYTHON_SH_SETUP_TYPE = pep517
 PYTHON_SH_LICENSE = MIT
 PYTHON_SH_LICENSE_FILES = LICENSE.txt
+PYTHON_SH_DEPENDENCIES = host-python-poetry-core
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
