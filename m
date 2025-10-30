Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC2FCCF9FA
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 08:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD98B84005;
	Thu, 30 Oct 2025 08:11:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wv4ng7PwLKlz; Thu, 30 Oct 2025 08:11:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C56398402D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C56398402D;
	Thu, 30 Oct 2025 08:11:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C218A160
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 11DB861382
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:10:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gChFeNYttZa0 for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 08:10:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F005661385
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F005661385
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:10:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE72B8140F; Thu, 30 Oct 2025 08:10:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Oct 2025 08:56:13 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b60cdb1c76ec535ac4f099f8daca384806c80c90
X-Git-Newrev: d7515eefc82bd862ea8e8168f5ba92094c08daee
X-Patchwork-Hint: ignore
Message-Id: <20251030081039.EE72B8140F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] utils/brmake: filter
 output for parallel build
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7943297276026588298=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7943297276026588298==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d7515eefc82bd862ea8e8168f5ba92094c08daee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

When building in parallel with per-package directories
(BR2_PER_PACKAGE_DIRECTORIES=y), brmake output is often garbled:

  2025-10-08T18:39:10 >>> host-dtc 1.7.2 Building
  2025-10-08T18:39:11 checking for stdint.h... >>> host-dtc 1.7.2 Installing to host directory
  2025-10-08T18:39:12 checking for limits.h... >>> host-gmp 6.3.0 Installing to host directory

Remove the spurious string between the timestamp and the ">>>" marker to
fix this.
We need some extra care to preserve the preceding "term bold" special
characters sequence.

We also prevent grep and sed to buffer their output too much. This leads to
more frequent output even when we might not be connected to a terminal; for
example: when brmake's output is piped to another program or when running
in CI.

Reviewed-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit c9dca7f4c34d6573f007122eeabaac8d0b7fd732)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 utils/brmake | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/utils/brmake b/utils/brmake
index a4b9e7fa71..c29e56a9bc 100755
--- a/utils/brmake
+++ b/utils/brmake
@@ -12,7 +12,8 @@ main() {
              printf "%(%Y-%m-%dT%H:%M:%S)T %s\n" -1 "${line}"
          done \
          |tee -a br.log \
-         |grep --colour=never -E '>>>'
+         |grep --line-buffered --colour=never -E '>>>' \
+         |sed --unbuffered -E 's/^([0-9T:-]{19}) [[:print:]]*(.*>>> )/\1 \2/'
        )
     ret=${?}
 

--===============7943297276026588298==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7943297276026588298==--
