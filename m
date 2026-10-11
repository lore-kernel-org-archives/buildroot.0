Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E66ECA9ECC
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 20:33:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AE0B4058C;
	Sun, 11 Oct 2026 20:33:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YTcnDdPT8N3b; Sun, 11 Oct 2026 20:33:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E7B084057D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791750784;
	b=cTd9oV/TlDus+rVFFMptAYjrz/Dzfw3JlLn6OVqMbYF9S01Wwvc7SFuYyF91DKHTFLRt
	 G85nWg4cqE99N9XQspCK7lfSo/k96dKgtCOFtW3XLQeMYu6zUVky2cvBxzvcJLAYmU7Kg
	 MddW4XYzNb6kBlUi7mGW/8vu3jIho1LNVChmwK0/l+FtH3cdBkMzdD8TZVLdEOLOgEVdP
	 v4/RoW22bwPC2EyGLoxuAnKa2j5/OHrzgGOVMNMopEx0J8PWgQ7swyVnVhkcjeCWOfSg/
	 ueP+p0Rjckt+aJzgG9N1lEuS0D778YNuIcajgNT/+GzudR+yz9tZnYBEPNUovibqyqg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791750784;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=4tE8F6jSUXrLHRCqd0gE+FJYfqkSVLnU0qtrK2Aen/U=;
	b=XAJ5/ZX7VWu1MY8eJTQoWm/pP0n56WU80iSZrnYB1ATU3avtLfzP+TM29G1tMw+GMm9A
	 ZdW0IvIWzXWC/SrzlRwk2gOcj9aoxDhMFTh0JRyFkxW0jqK1RrR66fZUZ8y35JIZE9dIG
	 bj4KbVYEmSyNy92+7BC9KAyM2dbsCmMiRIzYz5qqRRFG1jJ04LYZhgUkrXx4pu06K1mEv
	 19HVGf0e72qgkqiXdGJ5xj8WSG7TfkCUyp94lnVwpWdQ47ToFtti0V8C4PAN3tjO5h7Sc
	 HIAtkwa5mGsFvtoB1VkAa2YtJ5R5vYjf7DYd54gqPN3wjKZlyuUelA+OP89EScX9lkA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791750784;
	bh=4tE8F6jSUXrLHRCqd0gE+FJYfqkSVLnU0qtrK2Aen/U=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OkkxxaVBvIo7uRTNy5hfuF7aO9d0gTlJ2Lny65dDMNfYaoe7BbCsNiR/QLD0YSAVV
	 7dFJ3AlRdcnI5yse4HO7RJRVPLB0ccySY7vP8XAIYGybkmANNliLVI0Evriqc/pca2
	 Rg1yeE0mD3nPQJTMmnZMNCSJhEeV0K5dsgNYNx3W6pcZykDpyUFltcu3msJVnvpG4l
	 XQQ67xKMgF+Q9L+YDJk/qmpNPvSPBV14d5p235gX5IwdE9CyjmDsTc5VxZq12asGpV
	 NCTRNP6kV8JYVwHVfF5316y8VfsZienQb8xFvXnNwXky5Mduj9YTAHe9OTPf4+zLuh
	 bVAzR5bnQvIEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7B084057D;
	Sun, 11 Oct 2026 20:33:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B2774380
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 20:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4B344056B
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 20:33:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R1j6sUSDOA05 for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 20:33:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4A4F24047C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791750781;
 b=ZxHGk5oUzAp2Zf/ti4FPaRdPUvY4+CFYVM74awjhQzWBKhMyy472r9dML68+blAENkEi
 DiXmzbT3NZ06nUWkjfpq9M4eDac5FepgPp9lj/VvR4oVc5zJgJM/PRX4D2X4A2+LxaJuN
 ba6T2CoFn/r/Eh1x5OXzEemrOzatgibQaf7Y/l7k7WBA5aSJ9KGSy6rxSq5lgbXmAmNrY
 15kDFYxs6174qFkWx2PvjRquTzdjrkEIkOKt28ymq6OzBrXWwu7t8zJXM83dmmI1rJGv7
 E6Kgb9HGw3plMBoxX105I306u81fdmJEDVJ0ZYMQP3Xnonp6jDmC+7mkAB5/iKSEDdQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791750781;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=ExRRLaowh9JRFpRbbDKD/VokvFETlfP+D7wF5GIJuZQ=;
 b=D116qOutwav9OBU5bZxIYT4DQ0OPljTdETgc74FMnEoI4z8P6HA46YQMrZxYeXIbJul7
 hc84cGAYWgKnWD0BsHA7tsUGm0lZOqy+7aKuscxbhzfksTZ2NHRnd7PGqMbx0Gk2fbieL
 5v9rDQgdH+i2hWM6TQc8vOPPh0Tfm5tYcsK7oL9JJWPi+FWx0LZfO/J/XwNvqOrEN4Nq3
 BQK2ramvFRGBo7k+YwgJKqiDlPAkW+Fsap6zGdm3Ae8hbLUR7e+owpdS9xUf5WSQojPgK
 X13slB7ZnGyIhIVgiflOi2VuIF1AZoecyhhcFEqFrhhvYu4CLN0ZSFBi7uiW3MLy+Bw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=UNDxU3G6; 
 arc=none smtp.remote-ip=212.227.17.21
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4A4F24047C
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 20:32:59 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Md6R1-1wfqGJ0geh-00cDV4; Sun, 11
 Oct 2026 22:32:56 +0200
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Sun, 11 Oct 2026 22:32:29 +0200
Message-ID: <20261011203230.2072127-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261011203230.2072127-1-fiona.klute@gmx.de>
References: <20261011203230.2072127-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:4+lQDyeogGrpJHh6L2B3AIVEg3drUbo3mgTyWz4jU0FJkDG5spO
 RV+nt56nF4FkcbVCIjGlPf1o9MmoWXxWQj/zvR6lXMRvXlJ/8Ye/JBziSPYkU88nSVO7Ct6
 jzyZ/9TUwHHBmcQii2piO58O67txnrm7fO3dBP8GeGE7bqgVkBaFFYD8B0FtN/57spSDjW2
 PbYPf2g3bCOkGvU9IY0Lg==
UI-OutboundReport: notjunk:1;M01:P0:2AKtw1NK+y4=;GOArpYMne5Eath4Zlaw33Jk9lpy
 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
Subject: [Buildroot] [PATCH v5 1/2] package/pkg-utils.mk: include external
 tree info in show-info output
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

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

This allows identifying packages from external trees, and the external
tree version allows identifying the precise version of the packaging
code independent of the package version. If needed, the location of
the external tree can be derived from package_dir and further
information loaded from there.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
Double SOB line is because initial development was sponsored, but the
current revision wasn't.

Changes v4 -> v5:
* Name package property in show-info output "external-tree" instead of
  "external" for clarity

Changes v3 -> v4:
* Add an "external" mapping with external tree name and version to
  show-info output for packages from external trees (this patch).

 package/pkg-utils.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 17b0aa1760..454ae376c0 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -111,6 +111,17 @@ define json-info
 	}
 endef
 
+define json-external-tree
+	$(foreach name,$(BR2_EXTERNAL_NAMES),\
+		$(if $(findstring $(BR2_EXTERNAL_$(name)_PATH),$(1)),\
+			"external-tree": {\
+				"name": $(call mk-json-str,$(strip $(name)))$(comma)\
+				"version": $(call mk-json-str,$(strip $(BR2_EXTERNAL_$(name)_VERSION)))\
+			}$(comma)\
+		)\
+	)
+endef
+
 # _json-info-pkg, _json-info-pkg-details, _json-info-fs: private helpers
 # for json-info, above
 define _json-info-pkg
@@ -121,6 +132,7 @@ define _json-info-pkg
 		$(call _json-info-pkg-details,$(1)) \
 	)
 	"package_dir": $(call mk-json-str,$(patsubst $(CURDIR)/%,%,$($(1)_PKGDIR))),
+	$(call json-external-tree,$(patsubst $(CURDIR)/%,%,$($(1)_PKGDIR)))
 	"stamp_dir": $(call mk-json-str,$(patsubst $(CONFIG_DIR)/%,%,$($(1)_DIR))),
 	"source_dir": $(call mk-json-str,$(patsubst $(CONFIG_DIR)/%,%,$($(1)_DIR))),
 	"build_dir": $(call mk-json-str,$(patsubst $(CONFIG_DIR)/%,%,$($(1)_BUILDDIR))),
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
