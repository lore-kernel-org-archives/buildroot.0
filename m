Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F1F0C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 31 Mar 2024 00:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B139E82116;
	Sun, 31 Mar 2024 00:42:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ShQtXPm0d6MN; Sun, 31 Mar 2024 00:42:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79A2F821D9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79A2F821D9;
	Sun, 31 Mar 2024 00:42:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9D7501BF95D
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 00:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88E548213E
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 00:42:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UwSEsJMq4Kgn for <buildroot@lists.busybox.net>;
 Sun, 31 Mar 2024 00:42:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6C10482134
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C10482134
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6C10482134
 for <buildroot@buildroot.org>; Sun, 31 Mar 2024 00:42:04 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-7d031abe8f8so104683339f.0
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 17:42:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711845723; x=1712450523;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wFqLdS2ksMucS5DUd2QwheVDdQ2OnV0IjRWjOgrRFKw=;
 b=sMzWHtg3BxHLj8Z2LOG6pupAVA3/zF5Gw7sHzvmn4c+TycD4SsUccRbbfRkoPtVyz0
 WdJVlIXJfvTvtqhI2WL+LUKAOBpGziBpwFJZu53au4+GrV7v/4MjimLobGkzjNKIjlYr
 Q+rWcnt0xOAR8WlB9HgkNf9F1eaVilR+8b55oUpcmn+WjXIR8oZjgmrf8ck6DI6ji3hq
 Fh93RvuyIROArEJheY7QC6XqLxRbLMr0XVZ0yeR0V2HJLv/YIhSlZwTgeZa3Vf7WsW9x
 vAguW1vhlH35e7c+pi7VzVRPoha1EPm4fZzZXbQtFIETdUy57SLyXUCTUh196oLuWlN/
 SOWQ==
X-Gm-Message-State: AOJu0YytTahlRACXdZCpiG32P1JMw+MYMX32DuiXWPwg6eqmnD0sQpCs
 Z+6HKZVj6CBQfOuSkRSiqogDWwHKw6L8pIdtcu5WnII77zLhqlULj53gCK+7UNnhdg==
X-Google-Smtp-Source: AGHT+IGvonPRoJ2lPoH//cFA2EdSZ+tDVCCGQQmAodoDbFnuqLoxexIjUgMtYCiyzTW4Ni4ZYDmCVw==
X-Received: by 2002:a5d:9045:0:b0:7d0:605d:1625 with SMTP id
 v5-20020a5d9045000000b007d0605d1625mr4392196ioq.9.1711845722778; 
 Sat, 30 Mar 2024 17:42:02 -0700 (PDT)
Received: from james-x399.localdomain (71-218-245-145.hlrn.qwest.net.
 [71.218.245.145]) by smtp.gmail.com with ESMTPSA id
 q1-20020a5ea601000000b007d05927cb31sm1851053ioi.45.2024.03.30.17.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 17:42:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Mar 2024 18:41:25 -0600
Message-Id: <20240331004133.636618-10-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240331004133.636618-1-james.hilliard1@gmail.com>
References: <20240331004133.636618-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711845723; x=1712450523; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wFqLdS2ksMucS5DUd2QwheVDdQ2OnV0IjRWjOgrRFKw=;
 b=N4ECoMbYNa6wFny3eJxoZ8gg2HNNWWzQ4her1uUTdQPyN7MGtpMQCoxUUoki/HaxY2
 lGOXk4SU28uzbZtega/Sqa8CupQpPP1bLIyMqCob2lawrpGHVgTAOG7Ynh7rRp5qMd1Z
 G9QEy91fSro90MO184bw5dTjca7mPTz8VgV+BPdDRXXLvXdDCNTOmo/7fhiLHSCI2+Fi
 58ra2zBsSX2t1zN0lmci2POpNkO4Lx8+VsJsilIEhvqh78DosgYtSLxlpAQIk4qDe/4T
 CzSq2iaHPTjWr+V0lRNDHatAYGu2x7pONor8MtEms9sVVV8HVg2sdh6/aORXKKqOnvCJ
 eSUg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=N4ECoMbY
Subject: [Buildroot] [PATCH v9 10/18] package/python-cppy: add
 setuptools-scm build dependency
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
 Gustavo Heinz <gustavo@gsthnz.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Attila Wagner <attila.wagner@onyxinsight.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Louis Aussedat <aussedat.louis@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Joris Offouga <offougajoris@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Christian Kellermann <christian.kellermann@solectrix.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Mauro Condarelli <mc5686@mclink.it>, Lionel Flandrin <lionel@svkt.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The host-python-setuptools-scm dependency needs to be added
prior to migrating setuptools to pep517 as this dependency
is listed as a build requirement in the pyproject.toml.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cppy/python-cppy.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-cppy/python-cppy.mk b/package/python-cppy/python-cppy.mk
index adadc352d3..5bfd5a0f16 100644
--- a/package/python-cppy/python-cppy.mk
+++ b/package/python-cppy/python-cppy.mk
@@ -10,5 +10,6 @@ PYTHON_CPPY_SITE = https://files.pythonhosted.org/packages/c5/7e/6cc5acd93752ee5
 PYTHON_CPPY_LICENSE = BSD-3-Clause
 PYTHON_CPPY_LICENSE_FILES = LICENSE
 PYTHON_CPPY_SETUP_TYPE = setuptools
+HOST_PYTHON_CPPY_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
