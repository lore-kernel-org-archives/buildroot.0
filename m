Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70570C4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 20:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25C1C80ADC;
	Wed,  2 Nov 2022 20:23:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25C1C80ADC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k2P209pQFwN8; Wed,  2 Nov 2022 20:23:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4537B81E8D;
	Wed,  2 Nov 2022 20:23:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4537B81E8D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0325E1BF476
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 20:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E016481E8D
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 20:23:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E016481E8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7ZwM78axczSy for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 20:23:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4E3C81DF9
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D4E3C81DF9
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 20:23:28 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id l6so42163ilq.3
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 13:23:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I/NS2uiebMkcQng/Ec3qOLIfKb3wXLz094pJCXYS0OE=;
 b=SYawYyUCdA56ZlyNQobc6A7tIsHet+jIawxXYUXDbSi9JfnTl/jg+JK6ukgwuEw94V
 dPWGV2tYn7xuQvVNjKzwiAzqc0ffyIdmXK9+2gVPI4xtrkEsNUdaSmvYDds07gzQrEJW
 bVbTSLtGnWRfd4PxFDHi5z1jjcluOitXppbJSOybP37pjRaIoCNUMzV+QfP+z6RRQ0qZ
 yXeysqqC7z5xcACxj37gEndN7+y9MCwlcGvxvk/g0VQR8zMix3y5KSRhri9Fl0dK0ZcO
 /v8GS+GJ/UFkSSS+IUzSneHOnnl89c0cz+jW+TQpQGWpu5Nbi8qzPaThWrGS27Mq9VWf
 EqcQ==
X-Gm-Message-State: ACrzQf3FkPsn3AjCJW3JIstDAc+o6qB9kuWS4UdRyUsW8ONuXbXgTzjg
 6abc0VBwDijqNbOksVQ/z+7KEc8s9s8/EA==
X-Google-Smtp-Source: AMsMyM62N9LZ5ZyNeLp/QTQLub36SvgkJuxA4Ey0JavlEyXm4gR4cTcMHu0rpByurE2Le1g/eY6mbg==
X-Received: by 2002:a92:c046:0:b0:300:a731:b9c0 with SMTP id
 o6-20020a92c046000000b00300a731b9c0mr11401005ilf.44.1667420607566; 
 Wed, 02 Nov 2022 13:23:27 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 o130-20020a022288000000b003758bcba4b5sm497104jao.153.2022.11.02.13.23.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 13:23:26 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 14:23:25 -0600
Message-Id: <20221102202325.2943719-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=I/NS2uiebMkcQng/Ec3qOLIfKb3wXLz094pJCXYS0OE=;
 b=gkfxWtKm3Q/fquZ++0KIRzlQa4EtC3Kz/MJfhOGGgL8yEPp9Ss8j3sNWs3lCqvemB8
 v3q/YHHlnpVu7tKzk6HaRyLhs14ojsZUIfYPXovcp4/7No/GUSV4yv4H3E32mdWg/kNz
 3r6NV51alvaXi1JDPiNRsOULYPAWMY5efmyLX9VyQXG0roDARZtIs5hbLu1j6Bz980rc
 xttyFeLluQkSSvQuh8XkhXMXPtGGUNNArQ5claZKNfMRu3hb0MoV8ih5KBQpp+kno55e
 ECh6lpe7KO073GcoY3oNVf+p0vBbfE2sxaKMFH+e2t36GT1S/m+cEkmT6T0qiXEOYpLQ
 SUog==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gkfxWtKm
Subject: [Buildroot] [PATCH 1/1] package/python-engineio: bump to version
 4.3.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-engineio/python-engineio.hash | 4 ++--
 package/python-engineio/python-engineio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-engineio/python-engineio.hash b/package/python-engineio/python-engineio.hash
index 5762303af0..651226cc9c 100644
--- a/package/python-engineio/python-engineio.hash
+++ b/package/python-engineio/python-engineio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-engineio/json
-md5  d2bc7184d64e9d5a692bfad29ff73dea  python-engineio-4.2.1.tar.gz
-sha256  d510329b6d8ed5662547862f58bc73659ae62defa66b66d745ba021de112fa62  python-engineio-4.2.1.tar.gz
+md5  cb093c07bc5b5351e6a2edb555b02f33  python-engineio-4.3.4.tar.gz
+sha256  d8d8b072799c36cadcdcc2b40d2a560ce09797ab3d2d596b2ad519a5e4df19ae  python-engineio-4.3.4.tar.gz
 # Locally computed sha256 checksums
 sha256  c9e97d3dbc1fbbcdb4f7808b282cd646db887aff4f5313fe6bbe8d4c31405a9c  LICENSE
diff --git a/package/python-engineio/python-engineio.mk b/package/python-engineio/python-engineio.mk
index 81bd49fb64..388e669155 100644
--- a/package/python-engineio/python-engineio.mk
+++ b/package/python-engineio/python-engineio.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_ENGINEIO_VERSION = 4.2.1
-PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/74/1e/33e402011bb2fe33ab12762e5a66d66df1d47302a23e9c5e8310e11b1403
+PYTHON_ENGINEIO_VERSION = 4.3.4
+PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/7e/ff/970c5d084f513fb38108cd7c90497489d7cff8666f9bfabae00a3f4e13d4
 PYTHON_ENGINEIO_SETUP_TYPE = setuptools
 PYTHON_ENGINEIO_LICENSE = MIT
 PYTHON_ENGINEIO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
