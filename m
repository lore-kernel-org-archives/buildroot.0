Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF63C25B6B
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 09:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 331A44181A;
	Thu, 26 Oct 2023 09:33:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 331A44181A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eIfdnhg6l_WH; Thu, 26 Oct 2023 09:33:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8C4C417E5;
	Thu, 26 Oct 2023 09:33:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8C4C417E5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1F5831BF2B8
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:27:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E59664210B
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:27:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E59664210B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id njKxesy6VKfU for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 09:27:33 +0000 (UTC)
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C42FA41F77
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 09:27:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C42FA41F77
Received: by mail-ej1-x641.google.com with SMTP id
 a640c23a62f3a-9b9faf05f51so97499466b.2
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 02:27:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698312450; x=1698917250;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o7EncMKfVXvFK0RDd6XDX5DgYt898LGHLakfeWvs8bk=;
 b=H4fitaAN68v3bq6Ee5bE6aUP84e2EgIJEhvZ3xWdI6oXPekr+dgkzGBL0G/57AewkS
 nXpOVQbUEkW4mHlB0WJ5B7ak8fU+xQC24GKNqniP7CzeKS/CYurJ/tQP6wt1NviUZ0eF
 kQy5ZZLH/FoHW625xBp3JAwD9niu0Db3VSD2PN4I0Z9Y9g9oYaast8ZpKfawKT9FJliO
 IYhdKk0d1jE/Br97xoosvY8Iqtw1AQJiuMVSksqWBEvPaGka1vGxVcipJwPNAXrtFe/f
 FDLvBbBCDwodX1gy4DRqMuvnGvaJUUBeg3UGnYSjHIwRAGipMI1DdLpFJBK4rPVcncSb
 wnWw==
X-Gm-Message-State: AOJu0Yx5lczYicRFub72Vlq9jUgpvk4s3Z2V+noiMaBdORCu/7VQnmar
 Qzdqhy1gY8YQZvlrfy5lZBidE8nhqoZc5FipsSOtJh5V8PiDlX8f
X-Google-Smtp-Source: AGHT+IH5RS4YlrEvSlI9hV8+aYP8mNqUyQTkA+YmyZw0wLKT9Iq3MUrg2G8x5pNbqJjTTLyEKQcOiQ==
X-Received: by 2002:a17:906:c115:b0:9be:839a:3372 with SMTP id
 do21-20020a170906c11500b009be839a3372mr13816471ejc.59.1698312450708; 
 Thu, 26 Oct 2023 02:27:30 -0700 (PDT)
Received: from fedora.. ([77.241.232.0]) by smtp.gmail.com with ESMTPSA id
 mb8-20020a170906eb0800b009b947f81c4asm11268438ejb.155.2023.10.26.02.27.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 02:27:29 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 26 Oct 2023 11:26:57 +0200
Message-ID: <20231026092701.12345-27-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
References: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1698312450; x=1698917250;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o7EncMKfVXvFK0RDd6XDX5DgYt898LGHLakfeWvs8bk=;
 b=GFIw1luxxZJGWAP07VQVge1giMeVmnIE4RZS0SNj9/QIGvhf4truqu4x9yc06MSEMC
 mUEuR88V9tq2Gqzoy4cBhpKLU/0wKLMrcCan8JrzGFTN//Li45pKYKc+xFoeDfgSyT3u
 gxK/a2pvvXkw97FmUjEr7od5zIBf+iQOdSy3c=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=GFIw1lux
Subject: [Buildroot] [PATCH 26/30] package/python-pathtools: add
 0001-replace-imp.patch
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In preperation of Python 3.12.0, add a patch to python-pathtools that removes
the reliance on the imp module following the instructions found here:
https://docs.python.org/3.12/whatsnew/3.12.html#removed

Also tested with Python 3.9.2 on Debian 11.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 .../python-pathtools/0001-replace-imp.patch   | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 package/python-pathtools/0001-replace-imp.patch

diff --git a/package/python-pathtools/0001-replace-imp.patch b/package/python-pathtools/0001-replace-imp.patch
new file mode 100644
index 0000000000..a5bc240cea
--- /dev/null
+++ b/package/python-pathtools/0001-replace-imp.patch
@@ -0,0 +1,55 @@
+From e2372bbecdf46a100b09126f2951431c1929637b Mon Sep 17 00:00:00 2001
+From: Adam Duskett <adam.duskett@amarulasolutions.com>
+Date: Tue, 24 Oct 2023 08:59:21 +0200
+Subject: [PATCH] Replace imp
+
+The imp module has been removed in python 3.12.0.
+
+This change has also been tested with Python 3.9.2 on Debian 11.
+
+From: https://docs.python.org/3.12/whatsnew/3.12.html#removed, follow the
+instructions to add the load_source method back into setup.py.
+
+Upstream: https://github.com/gorakhargosh/pathtools/pull/14
+
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ setup.py | 19 ++++++++++++++++---
+ 1 file changed, 16 insertions(+), 3 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 4718885..1be0315 100644
+--- a/setup.py
++++ b/setup.py
+@@ -22,12 +22,25 @@
+ # THE SOFTWARE.
+ 
+ import os
+-import imp
++import importlib.util
++import importlib.machinery
+ from setuptools import setup
+ 
+ PKG_DIR = 'pathtools'
+-version = imp.load_source('version',
+-                          os.path.join(PKG_DIR, 'version.py'))
++
++# From: https://docs.python.org/3.12/whatsnew/3.12.html#removed
++def load_source(modname, filename):
++    loader = importlib.machinery.SourceFileLoader(modname, filename)
++    spec = importlib.util.spec_from_file_location(modname, filename, loader=loader)
++    module = importlib.util.module_from_spec(spec)
++    # The module is always executed and not cached in sys.modules.
++    # Uncomment the following line to cache the module.
++    # sys.modules[module.__name__] = module
++    loader.exec_module(module)
++    return module
++
++version = load_source('version',
++                      os.path.join(PKG_DIR, 'version.py'))
+ 
+ def read_file(filename):
+     """
+-- 
+2.41.0
+
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
