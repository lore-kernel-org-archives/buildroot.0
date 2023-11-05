Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF709C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 05:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1B7081ECA;
	Sun,  5 Nov 2023 05:45:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1B7081ECA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QFfd5mllDvTA; Sun,  5 Nov 2023 05:45:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2F1582130;
	Sun,  5 Nov 2023 05:45:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2F1582130
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9FD441BF5DF
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 05:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 775ED404A5
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 05:45:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 775ED404A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id euO1J5002C5u for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 05:45:09 +0000 (UTC)
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 35EEB403CA
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 05:45:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35EEB403CA
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-35903f528e8so11310225ab.1
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 22:45:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699163108; x=1699767908;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DLNdaDkvf1G7LqJyUJB+qv4PBCQN0E1OjtF7owy3MLM=;
 b=YmSLc+dHrbLzl2wcLqK3Q7cqANApETlJ+jxHiu03tuaAhh9hM69XSD2PNpmHI85f4z
 zrJXUsMVmvr4LUKfFNvQ3IkL88dl5rzXfyU/Vb/yhwtBqad5dI9bNy8TEGH2KAmTXfa0
 YhFOvEWiSMs2cayVErB+6o1/XJdIVh2tI+II3Al5r7Sll1nxy4PzJPAMVuSlr8ZVq0LC
 rcrOJPTikYaghXUjGL0D0xqOVDWpk8d79VhxOtEoqS5qOQ/7u5vCXZknCkXONHgjzIfE
 CcnJooY5PcyjVftZSeaS1+r5B5QkoWr+GA5rTf6UDBsoSZyTA7GE3K2/stGj0A93MS7I
 Q1rA==
X-Gm-Message-State: AOJu0YyMfL77fC1xcaxXegEPXo3PNBwnuY0FY9kUKjv9siLKEA84tOfn
 b9rp4SpdSPgq01VrU1vOld8vFUZSisE=
X-Google-Smtp-Source: AGHT+IG9UwGB1qQALQwQwHe2lDvda26VvZV2BgtHl49uFz/3j/NCvIbtFyOYmKHjU7VwDhFryoJHig==
X-Received: by 2002:a05:6e02:320a:b0:357:d136:7218 with SMTP id
 cd10-20020a056e02320a00b00357d1367218mr6571112ilb.7.1699163107805; 
 Sat, 04 Nov 2023 22:45:07 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 v2-20020a056e0213c200b0034e28740e35sm1675313ilj.78.2023.11.04.22.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 22:45:06 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 23:45:01 -0600
Message-Id: <20231105054502.2846404-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231105054502.2846404-1-james.hilliard1@gmail.com>
References: <20231105054502.2846404-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699163108; x=1699767908; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DLNdaDkvf1G7LqJyUJB+qv4PBCQN0E1OjtF7owy3MLM=;
 b=LxKe6qd7YP+5neSrMzAtEGxsjiWNHwA4EEGW5QCqXvgwEP5k7YqIy8dcv3QPAFdRyl
 pYbTdfs89n6nI9YE8iV0ggDYqL9GrWYRiy0NNY1lO8313Gu1Ug9oj4dZ3D2NKS6DkEH3
 wDmiXhrMkCiceYa6L+8uCoDWdi90ykx//3pgcXrFnxedZhB3TyrAijc6NB9eYVYD7NnC
 fdf7TfuZxK5OKJPLwbvuSkJtZPyQEe2lGqZO7kmb/RBhbd8C6KuohtwliLUP5lFuXpNz
 6dzuh7ueTwCZXx9eiCRLXFioVXuBMc5iyd6IJWYJMC9G03cCWSHmnD7H1mQ8qnkSUhtj
 Zvnw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LxKe6qd7
Subject: [Buildroot] [PATCH 3/4] package/python-hatchling: bump to version
 1.18.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new host-python-trove-classifiers build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-hatchling/python-hatchling.hash | 4 ++--
 package/python-hatchling/python-hatchling.mk   | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-hatchling/python-hatchling.hash b/package/python-hatchling/python-hatchling.hash
index 154c1fdcac..ebb412d197 100644
--- a/package/python-hatchling/python-hatchling.hash
+++ b/package/python-hatchling/python-hatchling.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/hatchling/json
-md5  5a6e2fd0c877feea7e71b9d72bbdbed9  hatchling-1.12.2.tar.gz
-sha256  8a6d719d96653a0f3901072b12710c9c3cc934f9061b443775c6789b45333495  hatchling-1.12.2.tar.gz
+md5  43f7203cacb6c3c178b93149b8a8151d  hatchling-1.18.0.tar.gz
+sha256  50e99c3110ce0afc3f7bdbadff1c71c17758e476731c27607940cfa6686489ca  hatchling-1.18.0.tar.gz
 # Locally computed sha256 checksums
 sha256  7f143a8127ad4873862d70854b5bd2abd0085aa73e64fd2b08704a3b9f5c07fc  LICENSE.txt
diff --git a/package/python-hatchling/python-hatchling.mk b/package/python-hatchling/python-hatchling.mk
index 61aa1a6c23..f13e6d3e28 100644
--- a/package/python-hatchling/python-hatchling.mk
+++ b/package/python-hatchling/python-hatchling.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HATCHLING_VERSION = 1.12.2
+PYTHON_HATCHLING_VERSION = 1.18.0
 PYTHON_HATCHLING_SOURCE = hatchling-$(PYTHON_HATCHLING_VERSION).tar.gz
-PYTHON_HATCHLING_SITE = https://files.pythonhosted.org/packages/f5/ea/3ed5a7ecdd8a8f7e84cffd3b5ec24279a09ce2694c218ff922c35c6f1a77
+PYTHON_HATCHLING_SITE = https://files.pythonhosted.org/packages/e3/57/87da2c5adc173950ebe9f1acce4d5f2cd0a960783992fd4879a899a0b637
 PYTHON_HATCHLING_LICENSE = MIT
 PYTHON_HATCHLING_LICENSE_FILES = LICENSE.txt
 PYTHON_HATCHLING_SETUP_TYPE = pep517
@@ -14,6 +14,7 @@ HOST_PYTHON_HATCHLING_DEPENDENCIES = \
 	host-python-editables \
 	host-python-packaging \
 	host-python-pathspec \
-	host-python-pluggy
+	host-python-pluggy \
+	host-python-trove-classifiers
 
 $(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
