Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39720E9D812
	for <buildroot@archiver.kernel.org>; Sun,  5 Apr 2026 18:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF58B40982;
	Sun,  5 Apr 2026 18:56:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FNNNotn8fT_F; Sun,  5 Apr 2026 18:56:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E1114094B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775415406;
	bh=htudtRjUm+A87q9OOSowIsGWmyE1VjXd/hJdXyaJzpQ=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=c0l1AXwnINeqhUiB+Cwm/6Oxr9ddUoWPit/xD/InNUzDS9exYota0AGJo8iQW28/k
	 UvsAjqbeV5CGtaOiClhxPkX1VveIbRTfeYfqhEuhSH3LUEnSMPTcG/tBChvbb3XM8e
	 CF5c6s4xjVNjPDG1II3rE5xYhSTepxgqLo89Pa5K8s1TNnqeQmrWHkjl7ejn4R2jTm
	 F2d6SCCasCXoJ0As04YB2e7sEQfyQWhL6FgOYEaTBFqGPhn2WJqP9kw/UdLyaCjDaP
	 reA/Hx0VniuDYBGJaaVMFXqxQmBD63x5Yt+K2whZ27hCNDaCxEeIHrVxkRsYNNXWQx
	 QjEchqX7DqHeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E1114094B;
	Sun,  5 Apr 2026 18:56:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A64B219
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 18:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 884E140945
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 18:56:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jgHNbfzDUd68 for <buildroot@buildroot.org>;
 Sun,  5 Apr 2026 18:56:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2A49D4099A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A49D4099A
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2A49D4099A
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 18:56:38 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MV67o-1w1FhT03xG-00TxWS; Sun, 05
 Apr 2026 20:56:29 +0200
To: buildroot@buildroot.org
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Brandon Maier <brandon.maier@collins.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Fiona Klute <fiona.klute@gmx.de>
Date: Sun,  5 Apr 2026 20:56:08 +0200
Message-ID: <20260405185608.1357633-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:RU0AphOyVf4UsGeDk2v3cjyvuQ0NEcp0KhT3/oKN8s1zATFG2vE
 YGVtbCIYPmdJPE9HyNA+Bjc/tvP+GIN/qEajA/CswtB6xMgJaSsIeldbIHBOh1jxq25kLAN
 A+5JJPVoLwHRBmQtViV+g0ValMzqcZWgl9JSL4x9pzPINUpEkeU+Tn7zP7NrlkxM3GayZlP
 tCBBADbqc3RCS4X9zWc1Q==
UI-OutboundReport: notjunk:1;M01:P0:6WawksUKT2A=;xOSKku7B2PAIwSWdKXT0IhSNKKl
 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
 yZqA3ABfnR4nnKPsokGSfQt8WkW4cIB7Q==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1775415389; x=1776020189; i=fiona.klute@gmx.de;
 bh=dxywoO/B+KSsR9tNfieeII+3PJ3Cqz0dVksHAW9wZwM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=N8qL+Ztg9beIZvUrDEfbQpU3OZL1p58RrLcCQxSw+UotGZTig5EmckQXRzHb/q5i
 d3kS9iVhLUxZhN9WtunlDplbzaKxYgbdetdKLawycsxP8yfh6AQEzSQhCCefn9m+0
 yipdY+jBMQylijr3xI0SUrgZVPutYeCDYMfG0XAgCeQQQU8o9RtESPCVgf/9q/rXs
 jOAQWu+JM7v/ChuAF45lVOxzaBcSanOCbsW607ZR4zwRp8YHsg/fU0Gakepq/RFdg
 Xe19U+/LLo7oeG1w6blhxywYDVtglXxw+XUtbZMwnrW6twu++ZS4I6WIu4pWI5CL7
 srfrY587z58HigxmwA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=N8qL+Ztg
Subject: [Buildroot] [PATCH v5 1/1] utils/docker-run: mount and pass
 BR2_EXTERNAL dirs
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The BR2_EXTERNAL environment variable is passed into the container,
and each path listed in it mounted. This allows using external trees
when running a build using utils/docker-run. Testing the existence of
the variable instead of a non-empty value allows passing an empty
BR2_EXTERNAL variable to disable currently set external trees.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
Changes v4 -> v5:
* Avoid Bashism in "does BR2_EXTERNAL variable exist" check, suggested
  by Yann E. Morin.
* Make relative paths in BR2_EXTERNAL absolute for container bind
  mounts.

Changes v3 -> v4:
* Split BR2_EXTERNAL on spaces OR colons
* Revert changes to mountpoints processing loop

Changes v2 -> v3:
* Use read to make the loop that creates mount options more robust,
  removing pre-exisiting shellcheck override. Suggested by Brandon
  Maier.

Changes v1 -> v2:
* Correctly handle spaces in external tree paths

 utils/docker-run | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/utils/docker-run b/utils/docker-run
index 27c169db72..37f6c12c0d 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -97,6 +97,17 @@ if [ "${BR2_DL_DIR}" ]; then
     docker_opts+=( --env BR2_DL_DIR )
 fi
 
+# Testing the existence of the variable instead of a non-empty value
+# allows passing an empty BR2_EXTERNAL variable to disable currently
+# set external trees.
+if [ "${BR2_EXTERNAL+set}" ]; then
+    docker_opts+=( --env BR2_EXTERNAL )
+    for br2_ext in ${BR2_EXTERNAL//:/ }; do
+        # bind volume source paths must be absolute
+        mountpoints+=( "$(realpath "$br2_ext")" )
+    done
+fi
+
 # shellcheck disable=SC2013 # can't use while-read because of the assignment
 for dir in $(printf '%s\n' "${mountpoints[@]}" |LC_ALL=C sort -u); do
     docker_opts+=( --mount "type=bind,src=${dir},dst=${dir}" )
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
