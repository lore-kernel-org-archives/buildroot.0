Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F343FC433EF
	for <buildroot@archiver.kernel.org>; Sat, 27 Nov 2021 11:38:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B748D40186;
	Sat, 27 Nov 2021 11:38:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rocdE4jfMgwJ; Sat, 27 Nov 2021 11:38:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10FA740155;
	Sat, 27 Nov 2021 11:38:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 871A01BF30D
 for <buildroot@lists.busybox.net>; Sat, 27 Nov 2021 11:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 771608299D
 for <buildroot@lists.busybox.net>; Sat, 27 Nov 2021 11:37:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uj_Sf7nlicMX for <buildroot@lists.busybox.net>;
 Sat, 27 Nov 2021 11:37:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9487481CE3
 for <buildroot@buildroot.org>; Sat, 27 Nov 2021 11:37:48 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id x10so14660169ioj.9
 for <buildroot@buildroot.org>; Sat, 27 Nov 2021 03:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W8YJBzPQTRsJi/kUD+jhnJvUJvFnogJA+hbBdgOpRr0=;
 b=lw5w+J2rtCLGFI1iztxkrKAiHnLjIs06KqbMojHvv/YpIQemVwB3dNYirSylylRozJ
 Ub7bDrildIE2IHvzmHcFthyXswZ6NROzeh23jBCKdQ7yW58ta3LAaaqgHGR+CJqey9xv
 Gs/+1CrdmVwGhcHSto8H1FP3Ox+J9NjejCUGELERxoAlyT1I/y56jYVbC1MXL82QLLP/
 sjfnRAgUrp0UymYQJSE1gnqhpl3jhLoFYijTQ0CWiShLM0WT+z7UXcPoAbaKM9yYwlTw
 7XH38A6G7Mv1Od9euz8UltZdfw16Y5KAaoAktHm1YYBawzEi8hFOzpLx1Oo79e1G6bJE
 qYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W8YJBzPQTRsJi/kUD+jhnJvUJvFnogJA+hbBdgOpRr0=;
 b=mjAnNTPh+S2BVEEwFABzhOzlO+FTWXMp1ZEH0Rbx/FobHABKl4m6ajYU2BUoKFf0vD
 +fk2A6lwzI8RsiTynRmZnryjrABxtb9m74MYmmpvYYqzn0exVjRnpP5+RS61a/NDieeC
 Iedp3+Owa9QmaHAkHAmL3xq83MnLaTzhFQe3gcU93yhGs/Nat3sizuKBXCGmF5vmhprc
 HVNn3B4bKzNOWYHpkzxc39ITdHQLoDWWZSkecywr5dEPgqI7MaUcME2VGG6DE57Uja/y
 RO8eq7M1jJeyw2Rs5iQG9LHfEtiB5W7HSk9FwP0k7RI5Moy6o/XTuqkIu+LScHgSAC29
 aUCg==
X-Gm-Message-State: AOAM530tX7suXHVxCYjY3U8rraZFGoZCY5mkl8fVexCPn8DiUnD0tgD3
 U9NkFo6W+R3bPZsH0TUrKDsEqTGpiBk=
X-Google-Smtp-Source: ABdhPJx3EitZQRNqr0m24cz5qXR1/PWVpGqbUeeMytnYEOFrp1FcdG2LMRgtVdjDG0n6I6ZyFoAa/Q==
X-Received: by 2002:a02:85a9:: with SMTP id d38mr51737831jai.71.1638013067569; 
 Sat, 27 Nov 2021 03:37:47 -0800 (PST)
Received: from james-x399.localdomain (71-33-128-47.hlrn.qwest.net.
 [71.33.128.47])
 by smtp.gmail.com with ESMTPSA id g4sm6389435ila.78.2021.11.27.03.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Nov 2021 03:37:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 27 Nov 2021 04:37:34 -0700
Message-Id: <20211127113735.2178776-6-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211127113735.2178776-1-james.hilliard1@gmail.com>
References: <20211127113735.2178776-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 6/7] package/python-pydyf: new package
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                      |  1 +
 package/python-pydyf/Config.in         |  7 +++++++
 package/python-pydyf/python-pydyf.hash |  5 +++++
 package/python-pydyf/python-pydyf.mk   | 14 ++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-pydyf/Config.in
 create mode 100644 package/python-pydyf/python-pydyf.hash
 create mode 100644 package/python-pydyf/python-pydyf.mk

diff --git a/package/Config.in b/package/Config.in
index c138911eb9..f348edb8c3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1143,6 +1143,7 @@ menu "External python modules"
 	source "package/python-pycups/Config.in"
 	source "package/python-pydal/Config.in"
 	source "package/python-pydantic/Config.in"
+	source "package/python-pydyf/Config.in"
 	source "package/python-pyelftools/Config.in"
 	source "package/python-pyftpdlib/Config.in"
 	source "package/python-pygame/Config.in"
diff --git a/package/python-pydyf/Config.in b/package/python-pydyf/Config.in
new file mode 100644
index 0000000000..f283a6d6aa
--- /dev/null
+++ b/package/python-pydyf/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_PYDYF
+	bool "python-pydyf"
+	depends on BR2_PACKAGE_PYTHON3
+	help
+	  A low-level PDF generator.
+
+	  https://www.courtbouillon.org/pydyf
diff --git a/package/python-pydyf/python-pydyf.hash b/package/python-pydyf/python-pydyf.hash
new file mode 100644
index 0000000000..90774457a1
--- /dev/null
+++ b/package/python-pydyf/python-pydyf.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pydyf/json
+md5  f78ee205b0637c92197f5d584d60cb8e  pydyf-0.1.2.tar.gz
+sha256  1e2f5de48174f505de025a7d1e7cf01bbdd9422ca8ab9451782bf00ee178602c  pydyf-0.1.2.tar.gz
+# Locally computed sha256 checksums
+sha256  75461e438973e1ba0f93a7de9e3fe5b2f49e1ab49251d392878a9cdae8ce7e47  LICENSE
diff --git a/package/python-pydyf/python-pydyf.mk b/package/python-pydyf/python-pydyf.mk
new file mode 100644
index 0000000000..7cc0df2643
--- /dev/null
+++ b/package/python-pydyf/python-pydyf.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pydyf
+#
+################################################################################
+
+PYTHON_PYDYF_VERSION = 0.1.2
+PYTHON_PYDYF_SOURCE = pydyf-$(PYTHON_PYDYF_VERSION).tar.gz
+PYTHON_PYDYF_SITE = https://files.pythonhosted.org/packages/78/ed/2ccc153d50d21a56916fd5c9d367cad798d4ca8a450cef03e7faa3b920c4
+PYTHON_PYDYF_SETUP_TYPE = distutils
+PYTHON_PYDYF_LICENSE = BSD-3-Clause
+PYTHON_PYDYF_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
