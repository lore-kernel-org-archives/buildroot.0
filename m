Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0686DC27C44
	for <buildroot@archiver.kernel.org>; Sat,  1 Jun 2024 10:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2CD240163;
	Sat,  1 Jun 2024 10:04:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JVkjFB7U93R6; Sat,  1 Jun 2024 10:04:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FF35403E2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9FF35403E2;
	Sat,  1 Jun 2024 10:04:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5A1CE1BF2A7
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 10:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 527E741A69
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 10:04:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t84Ep7W10muk for <buildroot@lists.busybox.net>;
 Sat,  1 Jun 2024 10:04:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CD5C1419B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD5C1419B8
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CD5C1419B8
 for <buildroot@buildroot.org>; Sat,  1 Jun 2024 10:04:37 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 732ECB00592;
 Sat,  1 Jun 2024 12:04:33 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat,  1 Jun 2024 12:04:17 +0200
Message-ID: <20240601100417.50377-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717236275;
 bh=oT1oMGDOw87JOSFdNgnDPSXJcfkG8T+P+aRwHViabYY=;
 h=From:To:Cc:Subject:Date:From;
 b=UsUFd7shTOUtrVKVL5zviIJuM4uB8qXCjOTWNQM8AxzOvHQqzlrwOyuXySFEZOKb7
 3CB2gj/Rfwa2YtVrCSeBSEl0U11pX7LU4dYFjfrOCnlSz1jV1Ruej0427KlkUyT52y
 HiLk9L/3lvMomI/eWNKwToZn784HKfA/ljKKtUA0SWW7+W5KH7/7ilVONoz77bEJIq
 AmsiOwlgh/WRBS01wCCgEBsan83mItydBZXJCTb8AgQ2w2hIIrAxpGjcLyS9CGSkLp
 qekewAWsjDCgelGKRI1lZGkK5eUkemloMVzl0DDh7rDIj8/w5x5/7Q4vc9S8vxMH8P
 s77HgJ3Iu8QMg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=UsUFd7sh
Subject: [Buildroot] [PATCH next v2 1/1] utils/docker-run: set podman userns
 option in environment
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
Cc: Julien Olivain <ju.o@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 9a629f5 "utils/docker-run: allow running with Podman" added an
option on system providing the podman command. This case is mainly
for Fedora systems.

Fedora repositories has a podman-docker package, that provides the
docker command for compatibility. See [1]. In that case, invoking
"docker" redirects to podman.

When this package is installed on a Fedora system, both the docker and
podman commands are available. Since the docker command is checked
before podman, the --userns option is not passed in that case. This
brings "permission denied" errors.

Other cases are also possible, like a host system providing the real
Docker alongside a podman installation. In such a case, to avoid
unexpected change of behavior of the docker-run script, the original
search order is preserved (search for "docker" first, then "podman").

This commit change the way the podman user namespace mode is set. Rather
than adding the "--userns=keep-id" command line option only in the podman
case, it is globally set using the PODMAN_USERNS=keep-id environment
variable. See [2].

Doing so makes sure that the variable will be consumed by the "docker"
compatibility command, and just ignored by the real "docker"
implementation.

[1] https://packages.fedoraproject.org/pkgs/podman/podman-docker/
[2] https://docs.podman.io/en/latest/markdown/podman-run.1.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Changes v1 -> v2:
From Yann comment:
- preserve docker then podman search order,
- globally set the PODMAN_USERNS variable instead of
  passing the --userns in the podman case.
---
 utils/docker-run | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/utils/docker-run b/utils/docker-run
index 3dcabe2718b..1adb02d74e6 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -29,11 +29,16 @@ declare -a mountpoints=(
     "$(pwd)"
 )
 
+# We use the PODMAN_USERNS environment variable rather than using the
+# --userns command line argument because Fedora system may have the
+# podman-docker package installed, providing the "docker"
+# compatibility command.
+export PODMAN_USERNS="keep-id"
+
 if command -v docker >/dev/null; then
     DOCKER="docker"
 elif command -v podman >/dev/null; then
     DOCKER="podman"
-    docker_opts+=( --userns=keep-id )
 else
     echo "ERROR: Neither docker nor podman available!" >&2
     exit 1
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
