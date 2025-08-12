Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB5AC87FCB
	for <buildroot@archiver.kernel.org>; Tue, 12 Aug 2025 07:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD5FF41F12;
	Tue, 12 Aug 2025 07:48:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I1itZ2Th3Gyx; Tue, 12 Aug 2025 07:48:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60F3B41ECD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60F3B41ECD;
	Tue, 12 Aug 2025 07:48:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 64F67D98
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 07:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B48B60F34
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 07:48:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cY6xcEgPGjuG for <buildroot@buildroot.org>;
 Tue, 12 Aug 2025 07:48:01 +0000 (UTC)
X-Greylist: delayed 671 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 12 Aug 2025 07:48:01 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3879F60FC7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3879F60FC7
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3879F60FC7
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 07:48:01 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -390604253; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 12 Aug 2025 07:36:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1uljYu-008h4E-0p;
 Tue, 12 Aug 2025 09:36:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 12 Aug 2025 09:36:44 +0200
Message-Id: <20250812073645.2072147-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250812073645.2072147-1-peter@korsgaard.com>
References: <20250812073645.2072147-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=ITDrmC3Yce4T3vcvI+GhI82MsCs3/YFCfcLxqpVmsN6EXMhS6jKvV/5u6jdGopF0FgVuV0Sg7qsHshC/XTsrf3Gfjl8TcPoIsbepu/Du1vPKtpXZDJxWvqNXNlMczXU6AY3I84rdR9FLbvwlkC/UPIqiriqHMkD2oY41ouYsMSnNZKQ4y8CN+RiSnW2PAS16/eK493+2KjLsn/EDblKkLXqU8Dr8hoiWlnWElWnfrxCP2/xetOxzaGoK4cXpGAQYhr7jVXwXqfPqSvp2IoSmeR4B3a7/5RAEjmHjiMoa9wUQiYeUkz9AIGlYsJ9kfnIG/atNrHtJNvPpfbQmW4T6QQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=1NTR5tBlIClyqrV6+usDsSiRpKqt8Xdl19zGwUrGmjU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=ITDrmC3Y
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 2/3] Makefile: release: make tarball reproducible
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 33e8563e93..db2f522c7e 100644
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
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
