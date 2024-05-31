Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B36C25B75
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 19:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A9A25400DC;
	Fri, 31 May 2024 19:51:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cP-FFVHUbI8q; Fri, 31 May 2024 19:51:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A200240141
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A200240141;
	Fri, 31 May 2024 19:51:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 83FFB1D5728
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 19:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E52F846AD
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 19:51:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dgwfOug20Vt3 for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 19:51:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2DB8A846AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DB8A846AB
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2DB8A846AB
 for <buildroot@buildroot.org>; Fri, 31 May 2024 19:51:22 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 7DB5AB0051B;
 Fri, 31 May 2024 21:51:18 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 31 May 2024 21:51:07 +0200
Message-ID: <20240531195107.125727-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717185080;
 bh=n80izm8fhxqJJy8RkiZoiW1UwD+UkM4Z6LdXcfikY3k=;
 h=From:To:Cc:Subject:Date:From;
 b=pfY8HUVbf2beOlaNe/pTVNKOlaPxSmjBK1BZQVPfXaVAqM6iCGncbJ1iOW3gjmxdR
 JZYxDWHoQFqmzEj1w/Bm1sUXzOY0AnBPlCRukah0snCln98mZTOkJMWkiLMqMpDL88
 xzlVWeih/uj9BDWVmGw13WKqNmwwFtLNLA0OVaSuo+L+kt/RhGDnQg5MWHXsW5J68i
 D21LhZziJKV9lLV1W2paprAeaggLqUACCjzdNnfu2Tg2LKwy3MTAdH7lRUIn8TqPAT
 7Y+CH/1PyH8Ad8moB09M4dBqa777sBkdwC4gpjWXdM7YqrynuNXBKZXV+r1tfwN3Rf
 HCGilMpttFW/g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pfY8HUVb
Subject: [Buildroot] [PATCH next 1/1] utils/docker-run: check for podman
 before docker
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

Fedora repositories has a podman-docker package, that provide the
docker command for compatibility. See [1].

When this package is installed on a Fedora system, both the docker and
podman commands are available. Since the docker command is checked
before podman, the --userns option is not passed in that case. This
brings "permission denied" errors.

This commit inverses the command check order, to check for podman
before docker. This makes sure this mechanisms will work when both
commands.

Note that the same behavior of the --userns=keepid option can be
achieved by setting the environment variable "PODMAN_USERNS=keep-id".
See podman-run man page [2].

[1] https://packages.fedoraproject.org/pkgs/podman/podman-docker/
[2] https://docs.podman.io/en/latest/markdown/podman-run.1.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 utils/docker-run | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/utils/docker-run b/utils/docker-run
index 3dcabe2718b..51390945119 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -29,11 +29,11 @@ declare -a mountpoints=(
     "$(pwd)"
 )
 
-if command -v docker >/dev/null; then
-    DOCKER="docker"
-elif command -v podman >/dev/null; then
+if command -v podman >/dev/null; then
     DOCKER="podman"
     docker_opts+=( --userns=keep-id )
+elif command -v docker >/dev/null; then
+    DOCKER="docker"
 else
     echo "ERROR: Neither docker nor podman available!" >&2
     exit 1
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
