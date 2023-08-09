Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D194CC001DE
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 21:25:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 791EC418F0;
	Wed,  9 Aug 2023 21:25:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 791EC418F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3sUDYIfKHQEv; Wed,  9 Aug 2023 21:25:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48954418A3;
	Wed,  9 Aug 2023 21:25:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48954418A3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 33E131BF28A
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D8BB408A8
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:24:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D8BB408A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fpq33hUCGkwA for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 21:24:53 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 48B78400D9
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 21:24:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48B78400D9
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3fe167d4a18so2108075e9.0
 for <buildroot@buildroot.org>; Wed, 09 Aug 2023 14:24:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691616291; x=1692221091;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=e30nmh1baPqEIcR4ttRHskdFjTh2F4zpMwcLj1FgOUg=;
 b=BCqSCKdEvcs8tkG+ux6mx1Gck4tcyJpMnKDbN9/WHdldPVj3xTLW/s9A+mjYzXl1Lk
 Iw5/AoYKoN+EI6ZEwArR8D3nWhqVbmRlyYCYO0eq18MJc177oGGOCCcUPKiXa8/CCw9S
 O3X+cWX6lkiAGy4pyv3Aemn1PYbk1IwC8f5QAm5lJXecfibqo5NK0DYW/SM4N4h3vXvu
 t9Ur6FDKBarPqNzweXQVZquywQOjz7UaulfLo9y5JC8Bi57iHYPuglUc7hPkW2hVRyAo
 pTjJSjNKxwJTZ6wUKAXS/hcEpzsWKsVl9a4adJxkfVzex9CdFvs56SweHkIannAyon3L
 06qw==
X-Gm-Message-State: AOJu0YySGsqRGR5xToflOydjNNgRDHoANNLIp8L9oloKflIFBj+345my
 Yd/TQmUp+Ejj8kiA4xZ9tImKoymYcAs=
X-Google-Smtp-Source: AGHT+IGkyqShvFDW3VRDFy9MyUgKEqU+0xpM0qPLLAyr+OxGWqPUzwVFP9S4BHgZ3bbHMJVLL17bDw==
X-Received: by 2002:a7b:c449:0:b0:3fb:b1fd:4183 with SMTP id
 l9-20020a7bc449000000b003fbb1fd4183mr245052wmi.12.1691616291287; 
 Wed, 09 Aug 2023 14:24:51 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b44:b00:7f53:5cb:7a96:c3a1])
 by smtp.gmail.com with ESMTPSA id
 c19-20020a7bc853000000b003fbc0a49b57sm138959wml.6.2023.08.09.14.24.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Aug 2023 14:24:51 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed,  9 Aug 2023 23:24:47 +0200
Message-Id: <b29b22fbfec7a4d203e006e440ebc1d0426ad00a.1691616286.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1691616286.git.yann.morin.1998@free.fr>
References: <cover.1691616286.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691616291; x=1692221091;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e30nmh1baPqEIcR4ttRHskdFjTh2F4zpMwcLj1FgOUg=;
 b=hDo5QINJp0hcQQ8FsJ3MLWQrYsCB3wq6dSj+ryhmcF+2QxCrIDOT0inHXJMNlZNgqI
 R2DQ1jFMw4daxPCz8lVaAg32IIfkUAuBwnv2ZKeMoXiu87YKHhPlBTHA82pEZO4rE7/x
 B//Xz5oPhDsuCo7EHBQ//XAyFj6YQHV4uaccTA0gcGhKLy/0OQjmlyrCt/3gNfU8wxb7
 ZcqmSp0kHdL/yq+zQeeQuSbgOQJawgCVsq3HT9pBs1J9cuvprleCJC7WQGCFld3r5DIE
 FD2bXwSlHDD+HQPkPbPiRSDVbtyGR8ar2J49WuiH3GZMXb8H32R2bcNf1sLWRC/KWTT4
 vSXw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=hDo5QINJ
Subject: [Buildroot] [PATCH 2/5] utils/docker-run: mount the download
 directory if specified
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

If the user has defined $BR2_DL_DIR in the environment, it would be
nice to have it accessible inside the Docker container, and the
BR2_DL_DIR environment variable set to access it.

This commit does exactly this: it mounts the host $BR2_DL_DIR as /dl
in the container, and sets BR2_DL_DIR=/dl in the container.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998@free.fr: use the new mountpoints list]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 utils/docker-run | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/utils/docker-run b/utils/docker-run
index 2f689a1fbd..7b27a9b05c 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -35,6 +35,11 @@ if [ "${GIT_DIR}" ]; then
     mountpoints+=( "${GIT_DIR}" )
 fi
 
+if [ "${BR2_DL_DIR}" ]; then
+    mountpoints+=( "${BR2_DL_DIR}" )
+    docker_opts+=( --env BR2_DL_DIR )
+fi
+
 # shellcheck disable=SC2013 # can't use while-read because of the assignment
 for dir in $(printf '%s\n' "${mountpoints[@]}" |LC_ALL=C sort -u); do
     docker_opts+=( --mount "type=bind,src=${dir},dst=${dir}" )
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
