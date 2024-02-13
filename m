Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110BBC48260
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 21:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A22FD82171;
	Tue, 13 Feb 2024 21:15:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rCk2zOC0uCYD; Tue, 13 Feb 2024 21:15:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 900D0821DA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 900D0821DA;
	Tue, 13 Feb 2024 21:15:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CEC2A1BF310
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BBEBC41603
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:15:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ag65egCXxtLe for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 21:15:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12c; helo=mail-il1-x12c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 88A92407A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88A92407A8
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 88A92407A8
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 21:15:31 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-36420c187d3so655255ab.0
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 13:15:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707858930; x=1708463730;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NRrYwOzzAAudTAWSNf86mj1hCqU6OXhFci+QNOmI6MA=;
 b=ANrT6cD9w+5fTi+jXsZebaFpcTFEXX3WwZLmD9f0wgrCBNlfZK6hfrR3heWWpbBIq5
 G4qcYt251JyxjMIFbeeBgdkY9rFJMdMtoCjae1pcY5MU1d6xoCry3AODOsf2imbHavzP
 gJJAqVjSWXu4Qisc++eLzZ/nunWuPnrWnmjhO7vJpIMOojlBkvpph5ouFKHUfw5IxGWo
 7sBH6SE1kMjzWbso8iPr96Q0LRZOLTnrTKF7iI9lKZlzsA0n1qn0SAgjRKRlv5cRsQj1
 kRnfKJtxGItmhaABNsVccXQsrKVL16+QZSSoSQBwjXyHOciC+Fazx33fH2VZeuT6YEBa
 Dp+Q==
X-Gm-Message-State: AOJu0Yw//r5IhHWRZt6++May6yezaviHrtbS1siMqORJUvwC2xSSH85M
 GzCqT/2M9WnQ1ii7Dwp3dfijXNsJEU9iYABgj302e1nNgwLfx2yAl9mv/fNQDBjgvA==
X-Google-Smtp-Source: AGHT+IFvbo8BOpKl7Su7r/HeK5XXicXGAArUWHgS5Gv5y7DfKdgOEZxZCoG3EkpOGtPspysLoIPDWg==
X-Received: by 2002:a05:6e02:b45:b0:361:933c:3b04 with SMTP id
 f5-20020a056e020b4500b00361933c3b04mr25611ilu.7.1707858930198; 
 Tue, 13 Feb 2024 13:15:30 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVYqwSEUSu1HpCoQVZmIpgt8CZCtDf2LSZr7ZG4peFMyJ+stMMZsElYIotxzLj8T/z5bSf1PInBu+m1wbimO4ksxfe36YQF6uUzQyKiKwaOnQ9fugZ4k7oogpQ2htHRMCXFiMeA2lF5Khl4rsfv5/rL4LMoDn2d9r/2MQ3o7DePcWJ5KfHd65FTHnAfuzqOQpYFhm0CXVbIG5PAdiDRy0c6PfzbZxsVIoOmoYsiX3FZv96dBjGlOnWpOXW9LUTp7aIU59bH/HB1/Ub6UyPUjOnIfLhMAQW+tPCw+LkZtrQFMgDn+sxh3jznQLggD4INIXsCT2Bi0JXJK5LlU9hYc+AusTpn8Y1HKCeUoPvQvZtsUjtJlQue8ohsOFFSHBYWpKVp5fxIRvkQ2cVxsQRfjr271IFArhLO+r1ceZMEzbh9jmwGXS4zdt+DkqfUgKGRb5xmf9nRfmcOQ/EoaroXyqdmBiMIw6V59Rwz0vIWm7zNLBnthEtXoVjcHrkU3JUMgRxHiAjIaXUQ0YWgy0K3xpX2WKf2a6x34hDsKK9y417SIscl50cmEjKmJDxFvctSTATFj2jTh4n0FcuwZEh0jjecOLpijNWPgVsy2d696OmBiLM1+A4TuVnAX2h6fLY916kR9MP5ME7LvfNbkugAhgLZ2xOmK4nSlE/9RopePk0kSQGRxTWFjpEh0saH8pQIQc//9mfMOO2M0+kh8Tj1ucj0cS3iFs4mpRvrNI6pNq61yT6S40ZCZQ==
Received: from james-x399.localdomain (71-218-247-10.hlrn.qwest.net.
 [71.218.247.10]) by smtp.gmail.com with ESMTPSA id
 ei14-20020a05663829ae00b0047151636e0dsm2080336jab.10.2024.02.13.13.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 13:15:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 14:14:49 -0700
Message-Id: <20240213211512.3918044-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240213211512.3918044-1-james.hilliard1@gmail.com>
References: <20240213211512.3918044-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707858930; x=1708463730; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NRrYwOzzAAudTAWSNf86mj1hCqU6OXhFci+QNOmI6MA=;
 b=GZWDX5bBqaEhQpPrBsO4rxQQ8pvjPo8tKG+LkOjgfT9l7uPRC543eVgvAqwSA5aZ4N
 CP+aBet+pmrBKp3BBpTCjzYXes71Jq7TM58qDUqsr/BO0Bcxl9RTSKOdSf2UpHRiiI38
 TI9z2laIc86ec03F1tGIa661b7O6Wpote79KDeuh230RKPvkgvNVF+sP4kn9dJGb2BEr
 gK3Bxl8BWRH97OTYlQAdrAlZ07QQXNzEUffOMmss0+md+hDtw0go45ciMPNZmojsmVF9
 8TJU5NauyViiPLqDM35jOI4aPZ0C7ukDu1jMRnq5ykMSGCoqQ8475i9Swyy5IbVH0Mg9
 mfoA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GZWDX5bB
Subject: [Buildroot] [PATCH v8 03/26] package/python-setuptools-rust: add
 host setuptools-scm dependency
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
