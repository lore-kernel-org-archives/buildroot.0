Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B93B2C4332F
	for <buildroot@archiver.kernel.org>; Fri, 21 Oct 2022 09:16:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4242560E61;
	Fri, 21 Oct 2022 09:16:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4242560E61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ew_TCtEC1cEU; Fri, 21 Oct 2022 09:16:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7407D60E52;
	Fri, 21 Oct 2022 09:16:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7407D60E52
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EF33F1BF29F
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 09:16:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7ABF8436E
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 09:16:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7ABF8436E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bR1Xj5h4UIpq for <buildroot@lists.busybox.net>;
 Fri, 21 Oct 2022 09:16:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD61783E5C
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD61783E5C
 for <buildroot@buildroot.org>; Fri, 21 Oct 2022 09:16:21 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id e18so3450650edj.3
 for <buildroot@buildroot.org>; Fri, 21 Oct 2022 02:16:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r9DUCwL3j6LJauwLyqXoFdb1vAIKAzvOLEUPHqZKxwA=;
 b=mYMhhaVPtMOZJkhItpx8sP0Hm0RxsRqHIWaeue3VsZ4te7c4lrJMrAhaoQXYlB4NaS
 qbsUzT3phv52F2KC7tVVJ/pKhHsQ5MutNx3vqoOZkl/9yLhwTC2Bu7TXB4RpibVx+ZH5
 saKmlFGhz/3uJi6OhLX9Yu6qCNyhBkSLqR1L8dec3VOQGaOFIwxpvzNKfMXmrWYAB0mr
 16o9oJDFKEEcM8WFXhlfeeNTaOVcpkVbL9nrUNwCFybYRKAQkxhihgPzkXgQ4txQONGp
 Xdae+a5wQadDU30AY9wBn7Ahw/9NxHdxV6ir06nwO+bb3jS+S9iZh83OHL4d8xGqellz
 po2Q==
X-Gm-Message-State: ACrzQf0nV/w7dTbmsChHqM7mT8jAgGocM0KXsUW3yQdjNCD2pfk4gIfB
 hS0ICUwNKGOKKhL3Qsl6rqa84uHsNEFrhQ==
X-Google-Smtp-Source: AMsMyM6dObIgTShiNb8JYbL+B8enRzso8H85eas6Y2jCwUQXE4+1v+Bv/L1F4aP39lm082m+f4Yt2g==
X-Received: by 2002:a17:907:a05:b0:77b:b538:6476 with SMTP id
 bb5-20020a1709070a0500b0077bb5386476mr14949386ejc.324.1666343780138; 
 Fri, 21 Oct 2022 02:16:20 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:8478:6e00:12e2:7130:278e:732f])
 by smtp.gmail.com with ESMTPSA id
 kx7-20020a170907774700b0078d793e7927sm11470368ejc.4.2022.10.21.02.16.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 02:16:19 -0700 (PDT)
From: Oguz Ozhan <oguz.ozhan@mind.be>
To: buildroot@buildroot.org
Date: Fri, 21 Oct 2022 11:15:31 +0200
Message-Id: <20221021091531.2989489-3-oguz.ozhan@mind.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021091531.2989489-1-oguz.ozhan@mind.be>
References: <20221021091531.2989489-1-oguz.ozhan@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r9DUCwL3j6LJauwLyqXoFdb1vAIKAzvOLEUPHqZKxwA=;
 b=BKcdL80oklj0QIQFoBPp4SBf69ltVITdkQypnhuKjHXpywi3wUbeyzTQeUuUZXpL5l
 boc2+vIDzx25sNXzBkTo9emYoO56Cb1rfhWR8l4+G/IBs8ShFviVjFBbAMMCbnKGxCaf
 4m66U5J5r/3kSAtHUkLp3vhnqIweTM+o+LqMIEHEl/662G/e63fFqM8bh/rf+j2UWFpn
 EanbXB54LJDrNGfez9tG4Vbgl5tP4kgBMAtpTBVwrbqOj7ZSZcucIFnq83XRP29By6Xb
 kQ1jhD5gU8isL7h2OEcRi02GeJgMguNQOO5Hwq90D1QJ1MjKGJzDGLFbLUIF0mSdYQLI
 meqA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BKcdL80o
Subject: [Buildroot] [PATCH 3/3] support/testing: replace nose2 with pytest
 - CI
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

- Changes in this patch:
  - the sed command was fine filtering the tests list with nose2 output but removing all operating on pytest output. With pytest no fine filtering is required to get the test names in correct format.

Signed-off-by: Oguz Ozhan <oguz.ozhan@mind.be>
---
 support/scripts/generate-gitlab-ci-yml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
index aa43aac019..bb4dcbbb22 100755
--- a/support/scripts/generate-gitlab-ci-yml
+++ b/support/scripts/generate-gitlab-ci-yml
@@ -31,7 +31,6 @@ gen_tests() {
     defconfigs=( $(cd configs; LC_ALL=C ls -1 *_defconfig) )
 
     runtimes=( $(./support/testing/run-tests -l 2>&1 \
-                 | sed -r -e '/^test_run \((.*)\).*/!d; s//\1/' \
                  | LC_ALL=C sort)
              )
 
@@ -80,7 +79,6 @@ gen_tests() {
             ;;
           (*-tests.*)
             runtimes=( $(./support/testing/run-tests -l 2>&1 \
-                         | sed -r -e '/^test_run \((.*)\).*/!d; s//\1/' \
                          | LC_ALL=C sort \
                          | grep "^${CI_COMMIT_REF_NAME##*-}")
                      )
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
