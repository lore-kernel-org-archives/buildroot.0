Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA79C4332F
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 21:54:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA3D1401FB;
	Wed, 19 Oct 2022 21:54:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA3D1401FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id clBQDWWVKZm3; Wed, 19 Oct 2022 21:54:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D8F340438;
	Wed, 19 Oct 2022 21:54:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D8F340438
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 82C781BF41B
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 21:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5EA9C60AD2
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 21:53:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EA9C60AD2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 00y-FPGF7SVU for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 21:53:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1C2D60783
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F1C2D60783
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 21:53:55 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id d14so9921799ilf.2
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 14:53:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xY+gXgqvO/Ti185Xgw6Pd9Ba2UOlbUQGeaygfeq1uvQ=;
 b=Wo8koz8b8lbbERBd70JtOGftS43xp49Nv+sKl4vDudOqkP8IUhpmpIiO6YfWGVQOS7
 oR3ZimGixvYGrbtrEDYO6mfm21Nf27TRMhOL/0zusabiNaZBWjDKw3tjKE1ZLUgknk3x
 J7gimL4n10udArLZY388eAMaoy3TSqdUgT6daqt1iuTP+avTaVVELy2dG7Woq0UXflUC
 ggdnqgZMaXwExCyO3LiM7iqzsxFND96tQd73Au6msYOjIkC71Vegr+phm6YIu9g31pVp
 AbGD3mwyeiK0LnqW4D6/lTfIlVt7h5C5pg/ihdlKw49XKIrrgQ5X/fPyiui0Z3JqI6xt
 r6rA==
X-Gm-Message-State: ACrzQf3yAVbz1Q04izu9QL4AdIgcGhh465Hbc3hupfl9639NNNzLbCGz
 yaMOBOZZtCZc+jqkHwF5b0QFwfZf6MSsig==
X-Google-Smtp-Source: AMsMyM7xuBcpkNKb0Hs5vHAB6RFIi/SZLg5oUbQZkrkywcLq0UbfCkioVpkpQJJjWRf9hBGW6YJ/fQ==
X-Received: by 2002:a92:cd03:0:b0:2f9:463e:279d with SMTP id
 z3-20020a92cd03000000b002f9463e279dmr7669880iln.223.1666216434763; 
 Wed, 19 Oct 2022 14:53:54 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 v3-20020a056602058300b006bc69b0fa07sm2645358iox.12.2022.10.19.14.53.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 14:53:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 19 Oct 2022 15:53:45 -0600
Message-Id: <20221019215348.3262192-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221019215348.3262192-1-james.hilliard1@gmail.com>
References: <20221019215348.3262192-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xY+gXgqvO/Ti185Xgw6Pd9Ba2UOlbUQGeaygfeq1uvQ=;
 b=jrUubCNHXJXxzPeIIvNbbxh2Q5s/9/1LWF8nCrW/4by7xCAJ7r5JIqLXMkOZv6aC7q
 MobWjeyJAWQTrsa02m94mqeZCF2ba/eBz8caKN0EhIxQU8T+k0D5KmHwdxWvMGM64/tu
 HR2zViuD8KQsHWHqAyVKPqs1tf2DhD5uCPcRWDkHQmfrC3GroR1nVoaFmLAPK+pKq95I
 UAbi1FbikQz0deErSze+GB5yHPj0UkO4HJCvALX3h797c0l5ocyNwJfDvbkXJ0Io1Wq8
 XxAV7iXv6xmRSGZZLby/13jUpt3Bj8QHjPsVZerh95U1ESQOyCbsLOHfgKm12Lg3G90R
 VtGw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jrUubCNH
Subject: [Buildroot] [PATCH 4/7] package/python-hatchling: new package
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
 Marcin Niestroj <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a new pep517 based build backend.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS                                    |  1 +
 .../python-hatchling/python-hatchling.hash    |  5 +++++
 package/python-hatchling/python-hatchling.mk  | 19 +++++++++++++++++++
 3 files changed, 25 insertions(+)
 create mode 100644 package/python-hatchling/python-hatchling.hash
 create mode 100644 package/python-hatchling/python-hatchling.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 48d2193db6..9e2e7a2b87 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1383,6 +1383,7 @@ F:	package/python-flatbuffers/
 F:	package/python-fonttools/
 F:	package/python-frozenlist/
 F:	package/python-greenlet/
+F:	package/python-hatchling/
 F:	package/python-installer/
 F:	package/python-janus/
 F:	package/python-logstash/
diff --git a/package/python-hatchling/python-hatchling.hash b/package/python-hatchling/python-hatchling.hash
new file mode 100644
index 0000000000..41d7be977e
--- /dev/null
+++ b/package/python-hatchling/python-hatchling.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/hatchling/json
+md5  e06cc65ac646f9b01df5406aa1f97022  hatchling-1.11.1.tar.gz
+sha256  9f84361f70cf3a7ab9543b0c3ecc64211ed2ba8a606a71eb6a473c1c9b08e1d0  hatchling-1.11.1.tar.gz
+# Locally computed sha256 checksums
+sha256  7f143a8127ad4873862d70854b5bd2abd0085aa73e64fd2b08704a3b9f5c07fc  LICENSE.txt
diff --git a/package/python-hatchling/python-hatchling.mk b/package/python-hatchling/python-hatchling.mk
new file mode 100644
index 0000000000..13155a20a4
--- /dev/null
+++ b/package/python-hatchling/python-hatchling.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# python-hatchling
+#
+################################################################################
+
+PYTHON_HATCHLING_VERSION = 1.11.1
+PYTHON_HATCHLING_SOURCE = hatchling-$(PYTHON_HATCHLING_VERSION).tar.gz
+PYTHON_HATCHLING_SITE = https://files.pythonhosted.org/packages/24/20/3e21d2bc57229822ac9fb9b314d7892c16f829f34a0eb247c55fc11e09a8
+PYTHON_HATCHLING_LICENSE = MIT
+PYTHON_HATCHLING_LICENSE_FILES = LICENSE.txt
+PYTHON_HATCHLING_SETUP_TYPE = pep517
+HOST_PYTHON_HATCHLING_DEPENDENCIES = \
+	host-python-editables \
+	host-python-packaging \
+	host-python-pathspec \
+	host-python-pluggy
+
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
