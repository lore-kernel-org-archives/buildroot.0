Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3079C0015E
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 14:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C98E813F4;
	Tue, 25 Jul 2023 14:00:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C98E813F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JkGfH9xgAHlm; Tue, 25 Jul 2023 14:00:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3728817B0;
	Tue, 25 Jul 2023 14:00:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3728817B0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DC4801BF84C
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 14:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4549418AD
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 14:00:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4549418AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 69jphAy1ZW8P for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 14:00:33 +0000 (UTC)
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E320E418A7
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 14:00:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E320E418A7
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-77acb04309dso307416439f.2
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 07:00:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690293631; x=1690898431;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=91sYU6yGae7KjyEa1H1yw4VbWYB/u+3DKTms3s7++8I=;
 b=fklLOZbngGoNXTPf38iGBHxkhUDNRXL28oLtC9tth24DiCFdTFk+nAzEq+zV5mI0J+
 nt8dtA0JcCAaB64mPpl8MC0OHyTIJFkQERam73pJJkDOkd4+jlyTdX6/IV7KyiKcNYcD
 6sE/6jKn/sBSpAVqX9RtJ0KyGvFY9cRmdXUdO3VVdBM5bqZSTBcIp/ZXX3102kG86EAT
 72KrDFN4xrar0D3esTVeS273ZtuwPVBXFt8PYZeRuEkPf6YaFw43kUCbUnrjlevbJ0Pv
 PRccJ3uFnTDJFrIXYOxZgapyA5eZwpL/iKarAEFDYCA1OpROGwIe2fp0D1xXl9ysqf8B
 33OA==
X-Gm-Message-State: ABy/qLYqwD3ZANuK+hAUeM0vSBNw1SmOFTd5Y/13ZgohPUVu+e5pIcbY
 oIVpOcy10cPjgQMK8jtrkTkNzOdkIDk=
X-Google-Smtp-Source: APBJJlGiYH5QGWojFtm0/oCzpeHQs7Ui89iBh4b53Yr9+sPYhIdkCEd2r5jpxUXYcAI1pNCk21vamg==
X-Received: by 2002:a05:6602:2152:b0:780:bb63:1869 with SMTP id
 y18-20020a056602215200b00780bb631869mr3497457ioy.13.1690293631604; 
 Tue, 25 Jul 2023 07:00:31 -0700 (PDT)
Received: from james-x399.localdomain (71-33-156-134.hlrn.qwest.net.
 [71.33.156.134]) by smtp.gmail.com with ESMTPSA id
 eq8-20020a0566384e2800b0039deb26853csm3664659jab.10.2023.07.25.07.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 07:00:30 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 08:00:29 -0600
Message-Id: <20230725140029.304205-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690293631; x=1690898431;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=91sYU6yGae7KjyEa1H1yw4VbWYB/u+3DKTms3s7++8I=;
 b=c3wTjXom4o+Vr6USyca8JSnoJxxO5PfsZJvtpBq/jWv1KMQOLnY/gmS5mTEriNcgPj
 U0lKx9f8asC7HTASMxEV1R7lLBInWi08Y3GLFEyqgZF85hQ7cfmmZU32ONF7MNb665xz
 wPj0BnX8DXp2DepkiRcoLshBJP2Ghg8dVN8uwaPjEZetHfiQbh/d6YNb85CF2Q2K7fPQ
 /IzDKkGiora8CxwXgkzPQGMhJc097BRiy4Q7xrop/57kshGWILWNtbNh8v9KxNzC7LuE
 3c4Ffc9TKcLfqYMxFYEm3MuCwgBxvSriYzg5hgoTdlmJeXc3evqd/sDZc+QBC2iZEx3e
 As0A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=c3wTjXom
Subject: [Buildroot] [PATCH 1/1] package/python-pybind: bump to version
 2.11.1
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
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pybind/python-pybind.hash | 2 +-
 package/python-pybind/python-pybind.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-pybind/python-pybind.hash b/package/python-pybind/python-pybind.hash
index 971eceaa07..9d2f43ce0d 100644
--- a/package/python-pybind/python-pybind.hash
+++ b/package/python-pybind/python-pybind.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  5d8c4c5dda428d3a944ba3d2a5212cb988c2fae4670d58075a5a49075a6ca315  python-pybind-2.10.3.tar.gz
+sha256  d475978da0cdc2d43b73f30910786759d593a9d8ee05b1b6846d1eb16c6d2e0c  python-pybind-2.11.1.tar.gz
 # License files, locally calculated
 sha256  83965b843b98f670d3a85bd041ed4b372c8ec50d7b4a5995a83ac697ba675dcb  LICENSE
diff --git a/package/python-pybind/python-pybind.mk b/package/python-pybind/python-pybind.mk
index 1fd106b981..5a5d120321 100644
--- a/package/python-pybind/python-pybind.mk
+++ b/package/python-pybind/python-pybind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PYBIND_VERSION = 2.10.3
+PYTHON_PYBIND_VERSION = 2.11.1
 PYTHON_PYBIND_SITE = $(call github,pybind,pybind11,v$(PYTHON_PYBIND_VERSION))
 PYTHON_PYBIND_LICENSE = BSD-3-Clause
 PYTHON_PYBIND_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
