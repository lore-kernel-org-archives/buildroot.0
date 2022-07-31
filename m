Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59715C00140
	for <buildroot@archiver.kernel.org>; Sun, 31 Jul 2022 19:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E6FA60D96;
	Sun, 31 Jul 2022 19:38:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E6FA60D96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GY5oIb4PNUa5; Sun, 31 Jul 2022 19:38:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D46E61069;
	Sun, 31 Jul 2022 19:38:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D46E61069
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 73D971BF2EB
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 19:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F484400CE
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 19:36:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F484400CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JgGQDWDrjyWu for <buildroot@lists.busybox.net>;
 Sun, 31 Jul 2022 19:36:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D90C7400E2
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com
 [IPv6:2607:f8b0:4864:20::e2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D90C7400E2
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 19:36:21 +0000 (UTC)
Received: by mail-vs1-xe2e.google.com with SMTP id d187so9276106vsd.10
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 12:36:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=VXY886Al0pv0QeSaBV+M2gQKiKbOkzK+GO23WVvJSy0=;
 b=LFMuUg0kUDZ/1HcBxvilauLyUUC9KiicpulDLp3Uv8/6yFJARLerRSbxHoxy/Joqys
 O5v2wU7CVdeQN0t34kkxNU5CeTb2qpgUUDHYIKuaa0lyVgB9cHAr43Ey7dijsw/YdHnZ
 DaTiaHA3kuzkqcY6jrHscSiJKukjCKGGDHSqn0shuRH66IAYRExWixt/2mQxxXfqV6Ny
 PLqdde3el2/ojIz5olrOs4hNrLyrCiWjUBiQpC3hxthXtf4oFJatGMmNFRr5vRivlUkV
 8jtwfDWy+A0bQZX4Kfokv7vVuGNHCcB8iPoon89aA3CG7h4yrZ6HgdtdZsGr01m89cul
 WmPA==
X-Gm-Message-State: AJIora8pHC2vFs8djweoExBVnAFw434gFbH+ioiiWfQvOqC88oKcSaAX
 ictN6t7mm8A3gyyivzY2azqgKeD3S9E=
X-Google-Smtp-Source: AGRyM1uHXHSFAf4wjbxYnriGVlm0zEtAh4Rb36ur2BPVKnzWZXOela0rd13/awdZaLHxMG8pY/ozbw==
X-Received: by 2002:a67:dd96:0:b0:358:3dc0:fd8c with SMTP id
 i22-20020a67dd96000000b003583dc0fd8cmr4619573vsk.51.1659296180602; 
 Sun, 31 Jul 2022 12:36:20 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 v5-20020a056102074500b0037ddf9489f2sm1418667vsg.13.2022.07.31.12.36.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jul 2022 12:36:19 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 31 Jul 2022 16:35:19 -0300
Message-Id: <20220731193521.1217825-13-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220731193521.1217825-1-ricardo.martincoski@gmail.com>
References: <20220731193521.1217825-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=VXY886Al0pv0QeSaBV+M2gQKiKbOkzK+GO23WVvJSy0=;
 b=MOKLqVWLSrVkNpL5xsHWO8mZhjG1KVLOWbEOJCDh0J+3Jh9+HN/fXvxsqDfMwze1cP
 mnKO0+iKq27VpGZfHDxyPD8lsd3zRWhdKjwDQSih1QC4Lwta79aIyxVZamywwS1keSjF
 G3SD+NjQCbQ4akEmSDpCsoGoWhXLOqQ/JWR+WzNsLNbOO4RPpIiLytCK7JGEbf3VSw0X
 M8mx3Yf+zTKRg3T/MLGIvXM/HOYiIb457b8dn/r4fYs6NE5qoSlZ/9eEKLzjZY194oQJ
 MwfRJgEpvcdy1ABnJYiC7g7W/yc+7cP1qdrhRYHDFkPOnBqKb1jivuMA0kOIoWDZgoJo
 e9LQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=MOKLqVWL
Subject: [Buildroot] [PATCH v2 12/14] utils/docker-run: fix shellcheck
 warnings
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SC2046: Quote this to prevent word splitting.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Changes v1 -> v2:
  - none
---
 .checkpackageignore | 1 -
 utils/docker-run    | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 91efb7fa1a..e9d996008d 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -337,5 +337,4 @@ support/testing/tests/package/test_opkg/post-build.sh Shellcheck
 support/testing/tests/utils/test_get_developers/0001-package-binutils-change-.mk.patch NumberedSubject
 utils/brmake Shellcheck
 utils/config Shellcheck
-utils/docker-run Shellcheck
 utils/test-pkg Shellcheck
diff --git a/utils/docker-run b/utils/docker-run
index 5653764254..f42dc33d0e 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -7,7 +7,7 @@ IMAGE=$(grep ^image: "${MAIN_DIR}/.gitlab-ci.yml" | \
         sed -e 's,^image: ,,g' | sed -e 's,\$CI_REGISTRY,registry.gitlab.com,g')
 
 exec docker run -it --rm \
-    --user $(id -u):$(id -g) \
+    --user "$(id -u)":"$(id -g)" \
     --mount "type=bind,src=${MAIN_DIR},dst=${MAIN_DIR}" \
     --workdir "${MAIN_DIR}" \
     "${IMAGE}" "${@}"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
