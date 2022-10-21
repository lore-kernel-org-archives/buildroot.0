Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E1EFC433FE
	for <buildroot@archiver.kernel.org>; Fri, 21 Oct 2022 09:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF15041168;
	Fri, 21 Oct 2022 09:16:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF15041168
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DWbJCed-ju54; Fri, 21 Oct 2022 09:16:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1CF9408EA;
	Fri, 21 Oct 2022 09:16:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1CF9408EA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2EDE91BF29F
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 09:16:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0AC46408E9
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 09:16:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AC46408E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7KyrApG17EGf for <buildroot@lists.busybox.net>;
 Fri, 21 Oct 2022 09:16:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B38DA40585
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B38DA40585
 for <buildroot@buildroot.org>; Fri, 21 Oct 2022 09:16:20 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id l22so3435441edj.5
 for <buildroot@buildroot.org>; Fri, 21 Oct 2022 02:16:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tQ3p1FNjoaIXORlC1+rvzo7kqZQpy5RqKEgvhOvRKEQ=;
 b=JJ+a6lJ9FvqtkB3ldVqonKGdBwttx90tbReM0jbbn4L4A1aSsn7aq9kYnK9Z8LY3Vd
 R6NdZMPy9zUwThwdygV0h19WSTrp7WfVgvewuRZ0Xc2YrynRlU2xVXfeFfkLm1LQUZ3a
 lJCIjXeqNjZILtOhkikdJnhQLBiLDSU1vjCRJpoRs6+dIbeUNnWbgK8Z9BSlySrBWDyZ
 0sEw58AbpkaQlViMRhkoaWac95Our+UYP0fekseRzwkbGSG131e9DV+J+JV/hbFIVvES
 mCafMPanM6/fvG+pH0Wgj3lqNw6cU3rboekYY05OnSA5kjP417Hwou/M3AauC0tjAlV7
 keIQ==
X-Gm-Message-State: ACrzQf2l9VN6XX+rb8cxuIyS34yrPanp7MimzIIuErIlm+c4e+wWh3uG
 n9WZZspjqT9Rc3gzuWQ2OY8LB49Rx9jaOw==
X-Google-Smtp-Source: AMsMyM46YrmMJICgrRcBYduAKuix1v/MBbjw00petO0i5qMzMsNu3UimPWJaqh+IwspxGcbn5PDoWg==
X-Received: by 2002:a17:906:fc6:b0:72f:d080:416 with SMTP id
 c6-20020a1709060fc600b0072fd0800416mr14843668ejk.1.1666343778741; 
 Fri, 21 Oct 2022 02:16:18 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:8478:6e00:12e2:7130:278e:732f])
 by smtp.gmail.com with ESMTPSA id
 kx7-20020a170907774700b0078d793e7927sm11470368ejc.4.2022.10.21.02.16.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 02:16:18 -0700 (PDT)
From: Oguz Ozhan <oguz.ozhan@mind.be>
To: buildroot@buildroot.org
Date: Fri, 21 Oct 2022 11:15:29 +0200
Message-Id: <20221021091531.2989489-1-oguz.ozhan@mind.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tQ3p1FNjoaIXORlC1+rvzo7kqZQpy5RqKEgvhOvRKEQ=;
 b=M+II0yTH87/I1qNMXE3qOu+zBbB79aHGgU/aAJAb9Pv9HbdQBL0Z2g7M4b7udrof3y
 EmGkSOnl7Y70ZV2Gjzfr4bFb+Ili7yEDnhinN1j83YW2UF/6fy8bHe6rj0NoyyKtapJq
 cgoU+Diu99vaZlXOTyeVgDK1GA0+JfsRjZXVYYkPPwGTW1P81Pawj2/dW3QGUgWdvrPk
 UgWFSIgCsE510hOwtI5r6KVKCJThfKcTKXtW033hakUJnR+GH6Bp22K3/bNLSoafFbU8
 eR7xQButxNJ/VzWvFPjrgjGkKwIdfHCoPvnlUkPPvhPx+NcQSAwcoLrZrF9fgMCON8Ob
 uwnQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=M+II0yTH
Subject: [Buildroot] [PATCH 1/3] support/testing: replace nose2 with pytest
 - Dockerfile
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
Cc: Oguz Ozhan <oguz.ozhan@mind.be>, Oguz Ozhan <oguz.ozhan@mind.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Oguz Ozhan <oguz.ozhan@mind.com>

- From web page of nose2:
(https://docs.nose2.io/en/latest/)
nose2 vs pytest:
  - pytest is an excellent test framework and we encourage users to consider it for new projects.
  - It has a bigger team of maintainers and a larger community of users.

- pytest is more robust and has more ability compared to nose2

Signed-off-by: Oguz Ozhan <oguz.ozhan@mind.be>
---
 support/docker/Dockerfile | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index f54c31b54a..fd1527b1f9 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -38,8 +38,8 @@ RUN apt-get install -y --no-install-recommends \
         mercurial \
         openssh-server \
         python3 \
+        python3-pip \
         python3-flake8 \
-        python3-nose2 \
         python3-pexpect \
         python3-pytest \
         qemu-system-arm \
@@ -53,6 +53,9 @@ RUN apt-get install -y --no-install-recommends \
     apt-get -y autoremove && \
     apt-get -y clean
 
+# To be able to run tests in parallel
+RUN pip install pytest-parallel
+
 # To be able to generate a toolchain with locales, enable one UTF-8 locale
 RUN sed -i 's/# \(en_US.UTF-8\)/\1/' /etc/locale.gen && \
     /usr/sbin/locale-gen
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
