Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E50BECA0EEB
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6DF08461E;
	Thu, 21 Aug 2025 19:20:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QpEIwlu4Snkw; Thu, 21 Aug 2025 19:20:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D43384274
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D43384274;
	Thu, 21 Aug 2025 19:20:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 16B2C1C8
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2C4B413C4
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L7f8tCUtdzOk for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:20:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17BDD40D21
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17BDD40D21
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 13F6A878D7; Thu, 21 Aug 2025 19:20:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 10:50:57 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: f1745c048225c330ebc23610cf12ce07f1d5443a
X-Git-Newrev: d071870aa1de1af0f9e42296eeb9402d797ab7f2
X-Patchwork-Hint: ignore
Message-Id: <20250821192006.13F6A878D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] Makefile: release: make
 tarball reproducible
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d071870aa1de1af0f9e42296eeb9402d797ab7f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

The tarball created by git archive is reproducible, but when we append the
generated manual we leak current time and the username/uid of the person
running make release:

tar tvf buildroot-2025.08-rc1.tar.gz | tail
-rwxrwxr-x root/root      5512 2025-08-11 13:22 buildroot-2025.08-rc1/utils/update-rust
drwxr-xr-x peko/peko         0 2025-08-11 17:39 buildroot-2025.08-rc1/
drwxr-xr-x peko/peko         0 2025-08-11 17:38 buildroot-2025.08-rc1/docs/
drwxr-xr-x peko/peko         0 2025-08-11 17:39 buildroot-2025.08-rc1/docs/manual/
-rw-r--r-- peko/peko      5738 2025-08-11 17:38 buildroot-2025.08-rc1/docs/manual/docbook-xsl.css
-rw-r--r-- peko/peko     19029 2025-08-11 17:38 buildroot-2025.08-rc1/docs/manual/github_hash_mongrel2.png
-rw-r--r-- peko/peko    638866 2025-08-11 17:39 buildroot-2025.08-rc1/docs/manual/manual.pdf
-rw-r--r-- peko/peko    587892 2025-08-11 17:38 buildroot-2025.08-rc1/docs/manual/manual.html
-rw-r--r-- peko/peko    393514 2025-08-11 17:39 buildroot-2025.08-rc1/docs/manual/manual.text
-rw-r--r-- peko/peko    117499 2025-08-11 17:38 buildroot-2025.08-rc1/docs/manual/logo.png

Fix that by forcing uid as root and setting mtime to the latest commit,
similar to how we do it in support/download/{git,helpers}.

Notice that we do not use --numeric-owner to match the output of git
archive, so it does rely on uid 0=root, which is very likely but not
guaranteed.

Reported-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit fa855cbe6e024ef23ed7f4d5071956fe139168d9)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 6b33bc462f..ecdd42cf5d 100644
--- a/Makefile
+++ b/Makefile
@@ -1253,7 +1253,8 @@ release:
 	SOURCE_DATE_EPOCH=$$(git log -1 --format=%at 2> /dev/null) \
 		$(MAKE) O=$(OUT) manual-html manual-text manual-pdf
 	$(MAKE) O=$(OUT) distclean
-	tar rf $(OUT).tar $(OUT)
+	tar rf $(OUT).tar --owner=0 --group=0 \
+		--mtime="$$(git log -1 --pretty=format:%ci)" $(OUT)
 	gzip -9 -c < $(OUT).tar > $(OUT).tar.gz
 	xz -9 -c < $(OUT).tar > $(OUT).tar.xz
 	rm -rf $(OUT) $(OUT).tar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
