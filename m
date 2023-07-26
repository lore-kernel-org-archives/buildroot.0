Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A899C001DC
	for <buildroot@archiver.kernel.org>; Wed, 26 Jul 2023 21:20:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5039340BCC;
	Wed, 26 Jul 2023 21:20:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5039340BCC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GefvCY2thg1b; Wed, 26 Jul 2023 21:20:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 905AA40BC2;
	Wed, 26 Jul 2023 21:20:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 905AA40BC2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DAE6F1BF423
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 21:20:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B41DC40BC2
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 21:20:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B41DC40BC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YBBgo-1oCg3X for <buildroot@lists.busybox.net>;
 Wed, 26 Jul 2023 21:20:25 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9D50740609
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 21:20:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D50740609
Received: by mail.gandi.net (Postfix) with ESMTPA id 06F75FF805;
 Wed, 26 Jul 2023 21:20:15 +0000 (UTC)
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart <christian@paral.in>,
 Buildroot List <buildroot@buildroot.org>
Date: Wed, 26 Jul 2023 23:20:07 +0200
Message-ID: <20230726212009.221147-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690406422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=mtd5+eXksomL/YVWyBn2/nw5oX6aEHfQ3IzwOtdlvTQ=;
 b=frNG59kj9OsRvM1hoBZw9T71e5DJilc5+1LqrJ3495mVo8QhwTtmWw6b4aIzXwZ296/2D1
 p/OQ6abchZtZaO7Ngjlm1/QJnlqkEBOncG2YL6SiFAIvrn8lkmT3XqFssIImHWfPTpV8rz
 DH1GjfJzsZVAOIAfcPNYD37rPi2Deo1sEL9CqzKgyBlakBuQF2yjIAXYe5IjkrXdApk+9e
 pGtXbhXPk0AytIumfSFVMaOHdS6QFjFwPt/jzc19tWh/TwPEKzTJipxdC7lvCEjWsj6LN8
 Oe8JQGBPTaGQK+GDyAisHdordMKaSmyVnGZPDMXNJ5OyOsdVWONLT5Fil9Zzew==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=frNG59kj
Subject: [Buildroot] [PATCH RFC 1/2] utils/docker-run: make it compatible
 with SELinux
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

After switching to a fresh Fedora 38 installation with SELinux
disabled, we noticed that utils/docker-run doesn't work as the
applications running inside the container are not allowed to accept
the data mounted through the bind mount.

Turns out that Docker has a "Z" option to do the appropriate magic for
SELinux. However, this "Z" option is only available for --volume, not
for --mount, as explained in
https://docs.docker.com/storage/bind-mounts/.

So, this commit partially reverts 7f2020f9040f ("utils/docker-run:
improve user experience") that switched from --volume to
--mount. However, the justification in 7f2020f9040f to switch from
--volume to --mount was "Docker will create the destination if it does
not exist", but the current Docker documentation seems to say exactly
the opposite:

    If you use -v or --volume to bind-mount a file or directory that
    does not yet exist on the Docker host, -v creates the endpoint for
    you. It is always created as a directory.

    If you use --mount to bind-mount a file or directory that does not
    yet exist on the Docker host, Docker does not automatically create
    it for you, but generates an error.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
NOTE: I am not a Docker expert, and I certainly don't know if this is
the right solution, and I would appreciate feedback from folks with
more Docker experience.
---
 utils/docker-run | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/utils/docker-run b/utils/docker-run
index 17c587a484..eee1aad7a4 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -12,8 +12,8 @@ declare -a docker_opts=(
     -i
     --rm
     --user "$(id -u):$(id -g)"
-    --mount "type=bind,src=${MAIN_DIR},dst=${MAIN_DIR}"
-    --mount "type=bind,src=${GIT_DIR},dst=${GIT_DIR}"
+    --volume "${MAIN_DIR}:${MAIN_DIR}:Z"
+    --volume "${GIT_DIR}:${GIT_DIR}:Z"
     --workdir "${MAIN_DIR}"
 )
 if tty -s; then
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
