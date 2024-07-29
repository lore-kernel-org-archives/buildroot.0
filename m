Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F4BC3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 13:58:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 501584059A;
	Mon, 29 Jul 2024 13:58:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sn1MfZD9oPEH; Mon, 29 Jul 2024 13:58:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37CBD405AB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37CBD405AB;
	Mon, 29 Jul 2024 13:58:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 39FFA1BF299
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 13:58:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23EEB401CE
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 13:58:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xENQsAoqM2UZ for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 13:58:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.86;
 helo=smtpcmd0986.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 60F8F40130
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60F8F40130
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 60F8F40130
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 13:58:16 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id YQtBsmoeicvwVYQtBsJ1Cd; Mon, 29 Jul 2024 15:58:13 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 29 Jul 2024 15:58:12 +0200
Message-Id: <20240729135812.993362-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfLWApttuOCKBrbMGW6xMe3LmQCV6sc0uJecNDKjfDfuFPLXvoERMgxdDqle4DS7SiE1UPGM5G7WUXeg/p+loK+SpTZE0hLLriESNZTh3bBiJKAb4SoOc
 qN0Ff45E6ESdU/GThfrOPtqwr+ucP5vEjvKOp8X/+lpbR4SGsi7KZtnmS5hQNCEl00ToirnxLtiEO9kUrr4+EiVDa9Yu84dfgpQkyo426CsaNn4QS3Up71+M
 /GnV9Lj+Z0nU2rfiybfFwHSxoeqiJDybEAF+FaoL9WljbIO3yCKGauULT7h8iodxVPEE+T2Ah3XLEYEOB05aYw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1722261493; bh=KvY/xdgdsrO3gM7qwEu2pWV65/Cgd7x2oPOjKt3gO6U=;
 h=From:To:Subject:Date:MIME-Version;
 b=gBguCHJ69LGn6/pO8DbNFfYAgZwCTNLYiyHjROj7Jd3WPxsk64Kif9jjV56c8JTJt
 uMQBCD6BcLdHwztDA7Y0Sx8TrkOPytThXtyOTdhisCDyeWGbfpury2mm65MCjkaWie
 FUX3cIe3IsKyFgTHQKPd9jtIeLbY9Ganrcp9tDdl2sikWRqUs2SI4lXcDQKyDFt3Y7
 gBqmv7tMAA6Uq+3OPG9O7VKCJRrLX0qQcftx5SK+OZIX3bpqgiShBoFvhTkj9Bs3jp
 SxvMa40RODdL9RbAQNajc/S7S/NT/P+yjiwPXaPqhO8CVSCN6HXVkQ6w/r2fZwDu1V
 5yWKcn2dqENww==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=gBguCHJ6
Subject: [Buildroot] [PATCH] package/trace-cmd: bump to version 3.3
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
Cc: Pierre Floury <pierre.floury@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/trace-cmd/trace-cmd.hash | 2 +-
 package/trace-cmd/trace-cmd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/trace-cmd/trace-cmd.hash b/package/trace-cmd/trace-cmd.hash
index 30b0c48de6..ac30eae85f 100644
--- a/package/trace-cmd/trace-cmd.hash
+++ b/package/trace-cmd/trace-cmd.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  62af2c6062eeb434925921bb5936774b0a0e17a5f86671fa2ea2f40704a080cd  trace-cmd-v3.2.tar.gz
+sha256  0671048dd2b8abdb8b2d0eb9cc91335c997620a7da72f858381ff4206f32065f  trace-cmd-v3.3.tar.gz
 sha256  b1d04b850c1c7471b0f0896f6c6f0fcfc9f07e2dd183a5f5826af269fe9e88fb  COPYING
 sha256  70f297763149e72306919c924e164f83041d5e512868d4c8c1826c171b3e49f9  COPYING.LIB
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/trace-cmd.mk
index e02eb79530..14a59b2cc8 100644
--- a/package/trace-cmd/trace-cmd.mk
+++ b/package/trace-cmd/trace-cmd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRACE_CMD_VERSION = 3.2
+TRACE_CMD_VERSION = 3.3
 TRACE_CMD_SOURCE = trace-cmd-v$(TRACE_CMD_VERSION).tar.gz
 TRACE_CMD_SITE = \
 	https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git/snapshot
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
