Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC78C4167B
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 18:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFBA660BBC;
	Sun, 26 Nov 2023 18:09:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFBA660BBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gA8I37gLnt4T; Sun, 26 Nov 2023 18:09:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B17260BEF;
	Sun, 26 Nov 2023 18:09:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B17260BEF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6C0411BF40F
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 18:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 434BD4012D
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 18:08:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 434BD4012D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1a657XP60BHc for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 18:08:50 +0000 (UTC)
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0D53E400D9
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 18:08:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D53E400D9
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-35ca48d48d6so1592695ab.0
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 10:08:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701022128; x=1701626928;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NRrYwOzzAAudTAWSNf86mj1hCqU6OXhFci+QNOmI6MA=;
 b=GokaTyMYT0aoc/dWqCBxfS1HdpA/TRZOTXPTJJs25GmsthO97RjEapCuXoo8of4N9N
 N0WW8O8HJQnYDuhxFxHUb8kAVgvPS1vFW/heoxWkjrs4/xrgL4g74hooQ0Kbb54Xn6p4
 jFnlHYiIkVOWGaKpFdqxBC9bORhKNRLSkJjY9/yen7oFmAqG6jEm70fE+gjFEt0I+vgd
 0yEw1+6F9zYdOsuZxaYDvP1/5R+FrKh3isqgu5AWQDFV0aNJLushgwFLUzPXdCUqTl5T
 UAH3d6wGt3TKUQfgea04dIigPyYasPVWtDF2zpzYOcaEMreqqSBuG/+7BXyP2eyOB/2i
 OC3g==
X-Gm-Message-State: AOJu0Yy6AjrIT8BI4Q69m/CCkUs+OBafznJsH3bvX6m26MqKzE3NPM+5
 kzXg1pS+4saTLx8Knk9pjQA2PDinhFY=
X-Google-Smtp-Source: AGHT+IGf20KI0TB9CTXnF6VL6KXy5W7Cn7waT8mO4S8g2AJ3FcTWsPB57obbx8xxJTTWrSA08bRyzw==
X-Received: by 2002:a05:6e02:1d17:b0:35c:c4d9:b34a with SMTP id
 i23-20020a056e021d1700b0035cc4d9b34amr1079839ila.3.1701022128659; 
 Sun, 26 Nov 2023 10:08:48 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-253.hlrn.qwest.net.
 [97.118.243.253]) by smtp.gmail.com with ESMTPSA id
 o9-20020a92d4c9000000b0035ccfc69f95sm153207ilm.20.2023.11.26.10.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Nov 2023 10:08:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Nov 2023 11:08:39 -0700
Message-Id: <20231126180840.2081945-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231126180840.2081945-1-james.hilliard1@gmail.com>
References: <20231126180840.2081945-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701022128; x=1701626928; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NRrYwOzzAAudTAWSNf86mj1hCqU6OXhFci+QNOmI6MA=;
 b=nPxoFqtQdBtEwhKcSa2hv9JmnEJ5X7GecZpkF1DpsXSxJ2JsFj5umq5tKWoBsiud43
 tnz8iKDAsTtsdu5Z3bTj93MAAcISnTwVmHfnAlI4mmlxxXaPiwMHrGh/7q3uQR74C3rZ
 KiiYXs7BIa9i8pnMINCWYtJdQZcovd6FjnyHqcijve0Fr//bjYo9N7xOze4EW+icGq8T
 /ilEnutO6BA72EdLXEEUcIb0PHn+x1XYRDYPfnkIwqMAL16oBa7e1JpWloyA0DeQvq1G
 JQauDPJKO1JUEhFD1cR0zbChqr0J0dShgKfOaXrHLBi8oNUiqxhjt7HCMKfpVwHmEI/7
 7GjA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nPxoFqtQ
Subject: [Buildroot] [PATCH v6 4/5] package/python-setuptools-rust: add host
 setuptools-scm dependency
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
Cc: Gustavo Heinz <gustavo@gsthnz.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We need host-python-setuptools-scm for python-setuptools-rust to build
correctly when using a pep517 frontend.

Fixes:
* Getting build dependencies for wheel...
running egg_info
writing setuptools_rust.egg-info/PKG-INFO
writing dependency_links to setuptools_rust.egg-info/dependency_links.txt
writing entry points to setuptools_rust.egg-info/entry_points.txt
writing requirements to setuptools_rust.egg-info/requires.txt
writing top-level names to setuptools_rust.egg-info/top_level.txt
reading manifest file 'setuptools_rust.egg-info/SOURCES.txt'
reading manifest template 'MANIFEST.in'
adding license file 'LICENSE'
writing manifest file 'setuptools_rust.egg-info/SOURCES.txt'

ERROR Missing dependencies:
	setuptools_scm

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-setuptools-rust/python-setuptools-rust.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/python-setuptools-rust/python-setuptools-rust.mk b/package/python-setuptools-rust/python-setuptools-rust.mk
index f07263becf..e664a5604f 100644
--- a/package/python-setuptools-rust/python-setuptools-rust.mk
+++ b/package/python-setuptools-rust/python-setuptools-rust.mk
@@ -10,6 +10,9 @@ PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/f2/40/f1e9
 PYTHON_SETUPTOOLS_RUST_SETUP_TYPE = setuptools
 PYTHON_SETUPTOOLS_RUST_LICENSE = MIT
 PYTHON_SETUPTOOLS_RUST_LICENSE_FILES = LICENSE
-HOST_PYTHON_SETUPTOOLS_RUST_DEPENDENCIES = host-rustc host-python-semantic-version
+HOST_PYTHON_SETUPTOOLS_RUST_DEPENDENCIES = \
+	host-rustc \
+	host-python-semantic-version \
+	host-python-setuptools-scm
 
 $(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
