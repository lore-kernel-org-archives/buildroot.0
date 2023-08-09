Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D7B5C001B0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 21:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFB874092D;
	Wed,  9 Aug 2023 21:25:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFB874092D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YGgV3az7GRTR; Wed,  9 Aug 2023 21:25:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BD35418F9;
	Wed,  9 Aug 2023 21:25:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BD35418F9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D2FE21BF28A
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:24:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B77344180B
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:24:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B77344180B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fgPIHLxf97gV for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 21:24:53 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AB43C4092D
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 21:24:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB43C4092D
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3fe4ad22e36so1906435e9.2
 for <buildroot@buildroot.org>; Wed, 09 Aug 2023 14:24:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691616291; x=1692221091;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SNp29nBSNLMaBWFOJHKD9DTlmIJCFd2d/xj2k7Rt9DE=;
 b=G5E2vm3A/l0VWZOLocWyg70bXWZKCpZpHlnvHKVYWMaszibWdhHnJEaHrpRvGaWf2v
 b5bPUNKSl36ls6U2TkzSMmejLfzFT5YoNHEeGTIgLwnyLW3O14P53G8V/ErWWSuToxw0
 KDcO1Jt890sZVdem4YLUvAh4aQslxu74CwiVPBdCQwo/EzTJqfz5rGUZcksVJSwobM+b
 1ZqwyE+9tNgFApFJxfU5FWGvK1/DgjJfuma1aqQqE94+vIRYhmdRx//3GNs5qv1Ca3Lr
 +DW2ruIpT9kbFsMjX+IhGlSvwPVMT7nQ5+l9+t/V+LZ9rUMpGKTRvSyABoEcyfGtQfv7
 q2LQ==
X-Gm-Message-State: AOJu0YzuM0aiMGKDFAGLsWsYNi8PHHPzsPYeXNZx2vijiRwF3sVUy89f
 QVues96wPbgwBSjg793WXt9D3YsbTOY=
X-Google-Smtp-Source: AGHT+IGyNnaG/zu4Y7yq8FJapnqR9zrTxiyyE+fgdQvUo1MuPtD/oropkBhqrDA1NstYoNqjRusw/w==
X-Received: by 2002:a05:600c:296:b0:3fe:1967:447c with SMTP id
 22-20020a05600c029600b003fe1967447cmr253420wmk.9.1691616290872; 
 Wed, 09 Aug 2023 14:24:50 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b44:b00:7f53:5cb:7a96:c3a1])
 by smtp.gmail.com with ESMTPSA id
 c19-20020a7bc853000000b003fbc0a49b57sm138959wml.6.2023.08.09.14.24.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Aug 2023 14:24:50 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed,  9 Aug 2023 23:24:46 +0200
Message-Id: <fa7e9c2fbace61b469b5b1e616c9d6f599f227da.1691616286.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1691616286.git.yann.morin.1998@free.fr>
References: <cover.1691616286.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691616291; x=1692221091;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SNp29nBSNLMaBWFOJHKD9DTlmIJCFd2d/xj2k7Rt9DE=;
 b=N+a3XyM7uLAB4U7XhtOw5Ibf/JM0yIKq5VQTjNqQ3qiHxg3FXnUVmIiJkH5OIr3EWu
 BHHhLAFfqNF5/sFC+vqIgIEej06iQH1z7v+wrxqYrZxwfH0C254UMCj3K1EPNJfBfMJw
 ko4R+R4Er8pR1MXoLCpD8lS2rui3vmGM2HjgvGd4kr2eQWp1yUv7uM2wv23zQ7birFzK
 cF2u08cMafXa+QPHU6h37PDTDeu9kdpQ8ahJuFnPquAyCHAIeBlrUU6PFzJwGXBXWg0f
 f38RXp3eZJSqKSXlE8Esvu05Zkpp87d4pbLbOUaijs24fmo9XE2A0Cf87kirPyg5/Epe
 C2qA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=N+a3XyM7
Subject: [Buildroot] [PATCH 1/5] utils/docker-run: introduce sorted list of
 mountpoints
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For now, we only ever mount two mountpoints, the main directory (i.e.
the working copy), and the git directory.

To pave the way for adding new mountpoints, we introduce a list of them,
that we sort to ensure that we never mount a shallower mounpoint after a
deeper one (that would shadow the deeper mountpoint).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/docker-run | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/utils/docker-run b/utils/docker-run
index ab95e61e84..2f689a1fbd 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -17,10 +17,11 @@ declare -a docker_opts=(
     -i
     --rm
     --user "$(id -u):$(id -g)"
-    --mount "type=bind,src=${MAIN_DIR},dst=${MAIN_DIR}"
     --workdir "${MAIN_DIR}"
 )
 
+declare -a mountpoints=( "${MAIN_DIR}" )
+
 # Empty GIT_DIR means that we are not in a workdir, *and* git is too old
 # to know about worktrees, so we're not in a worktree either. So it means
 # we're in the main git working copy, and thus we don't need to mount the
@@ -31,9 +32,14 @@ if [ "${GIT_DIR}" ]; then
     # not absolute, GIT_DIR is relative to MAIN_DIR. If it's an absolute
     # path already (in a wordir), then that's a noop.
     GIT_DIR="$(cd "${MAIN_DIR}"; readlink -e "${GIT_DIR}")"
-    docker_opts+=( --mount "type=bind,src=${GIT_DIR},dst=${GIT_DIR}" )
+    mountpoints+=( "${GIT_DIR}" )
 fi
 
+# shellcheck disable=SC2013 # can't use while-read because of the assignment
+for dir in $(printf '%s\n' "${mountpoints[@]}" |LC_ALL=C sort -u); do
+    docker_opts+=( --mount "type=bind,src=${dir},dst=${dir}" )
+done
+
 if tty -s; then
     docker_opts+=( -t )
 fi
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
