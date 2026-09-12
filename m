Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C31F9C79FB6
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 11:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F09880DE6;
	Sat, 12 Sep 2026 11:18:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HQRLmVgJZIHb; Sat, 12 Sep 2026 11:18:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6B57480DE9
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789211926;
	b=X899xRfXBpqei+f2tq+KpwloIcCOXNlll37IQy+IOpwuUBEO0Pm6yeYmQMhgKtdtpCh/
	 KJqDZVOKV5ZRZCYauIRU80Us7o8RC4wkwMU4gN5iYwqXV1bDfVREq83ppbEfbNmbgE8xq
	 LKHkcz+71TkoG1gmDicC8x7IEHnAEKLwpT7ZzVNOY9m6cAeJzxlp54EyBD25G42zOb+tm
	 tsG4+D2lQ5VVQDK2xpk85RLIIXLLVhYmmDXHIGrMgOWt7BrSFQ89bqxy4RO/32ZfJPfth
	 e6KJJz2pCxOJoDVaqnWu1CSmQ/9/DxIR1bD0Mmt0FGJshtTMYB39ZpxUejHbO3pMtYg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789211926;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Ahp3YiGbMM60ycrEuwdsUlXeV1EHlBXGkVfjrymsvoU=;
	b=Q2rxU7PUqjxF/DtRmmx+8d6wYrD8mdgjDWRlo99StPwjxq0fpuXV1esWEgEKE75u/PEq
	 h/vPVRxlxafGHmc8Bed1VelWXdfvOTRZiNNgXRj5zzEYISBzrpyT97vncA0fPWeD568xe
	 0rg/YC6NAtZ4aL0WmGgmnDl7Xz6W/xMNTS1KCV7eRvnLcUTcY1bTVn3Ki7JMRR2y5EVuT
	 YDxcxvivPacj1M5VXyYMt3dEg+cBZ2MjeMn5Sdt9H+Z4YtGkip+hn2SHPrf7Hxxaos+Tr
	 BXNenLGorw9tlA0+EBAUY2FiACSZIx4sqacvdx5rcKotpIYigpKZYm9uVSkKk+0EaAQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789211926;
	bh=Ahp3YiGbMM60ycrEuwdsUlXeV1EHlBXGkVfjrymsvoU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RtKzTX9qqRVQmCtd0LAxYkrfVBsh0JuJsFmVcU0rd2p9saui1R3KZhFhf0DZu/DCx
	 EqtOdXFt4xvYfcaQath4FmJIrm0qqTUVfk2Mw0rTYVUbuB7TVVTV8muqBnj0xJLA2e
	 65i2W+DKS9sHp+ePCypsdESnGSDJGOp0bCHV7oeYGQ9ugsEiDLm+0nR/nA09Cn1Nj2
	 LIS5bekjafJeQ7nx9/5HP3NjX1xyF69xIMoVo3y+evRD4CHV2guCWvyJRDTi5spv+P
	 LY/ZiSnE+Z/FwJXFgrCnY9q5XFJl/Lp/FBeO5IqXP9JhJkH0ycVwxUvXee9V1U3Srg
	 Bs0TlWZXPeF2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B57480DE9;
	Sat, 12 Sep 2026 11:18:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5AD1932F
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 11:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40B1160600
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 11:18:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CNOThVgWoYDs for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 11:18:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6343D605E9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789211924;
 b=QdXp1LF93F2i+2ZwfR8FhuxClPkpr9epaB0WjqzlK4GwYaFKtBqHk5gI9kNwCvrl01/M
 cxdLW/mIEgG5NMZN0BfZoGILRdwpl4PMBagPrMm+axZI07pDUz6+nD7ESyp/cR22uVkbP
 0vlqIRjqC3y4wbVMP1ViIodXXe1eKE7PgGTdtdI9qBbKCoO33/JrnVztiWZYCXNvFaATM
 Z9GdefOSmZtNBSijNaRuk/ps28Cu70Izypbplk/3NDor7hwACo3EFurjzj2cxOTW3K3Tm
 8aOb0bLljul7fnsL7sxVwKqunINsZw8F5FpJedH4dCU2rehsN+Twp3ug6OlT3wg0cyg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789211924;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=XWULzh4oi9K93AMN/W+ZDnM7cGb4xQkq+OeUwVA3NoM=;
 b=Wtfu1Z5fEhqVpeScKU2u0mykljPLUaAPtAkWtf28YeJg77OcdE+o2Etz9C1/NWcRm4BB
 ANSQKHYwCpnXYFcJmLDFHUxGK/UOKHFdh17WuOohTTMUTB5PJ4FAejrxn6ZmLAdI0GSL0
 6zqU9fsWTsd97jnFkMB3DQmdw056HP3JqU28XQppBiVBHawZtDFS3VrJsS/sSI00JZJsK
 8eGRLx4qeh/WK7bmgbrz0ZL2fICpQ/0XWE549pXYgGhwEh6qyYNz+HJAPwWBaY7mMxKG2
 2STAGGfTYeWNK55AI3EU/KIJ64mtp7slzpakMlKGm0010u5gjpS7zHaGjEWDwZi2riA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6343D605E9
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 11:18:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F2F48955A8; Sat, 12 Sep 2026 11:17:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 12 Sep 2026 13:16:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 08b18e657105135517cf60c26864bfa907d06166
X-Git-Newrev: c527520f07168e447652c5c0ee42fcd9a551693c
X-Patchwork-Hint: ignore
Message-Id: <20260912111739.F2F48955A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/utfcpp: bump version to 4.2.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c527520f07168e447652c5c0ee42fcd9a551693c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/nemtrif/utfcpp/releases/tag/v4.2.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/utfcpp/utfcpp.hash | 2 +-
 package/utfcpp/utfcpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/utfcpp/utfcpp.hash b/package/utfcpp/utfcpp.hash
index 779bd2d282..454903575d 100644
--- a/package/utfcpp/utfcpp.hash
+++ b/package/utfcpp/utfcpp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1ca68016f0abc24172998e39ce0d8f8e2b7a26f7579a0ff85d4e1b9a7aea56f8  utfcpp-4.1.1.tar.gz
+sha256  54a8e96ea835a7359e8e53d03e30e9833d51350cc4615ff53f8449ef19ee46ab  utfcpp-4.2.0.tar.gz
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE
diff --git a/package/utfcpp/utfcpp.mk b/package/utfcpp/utfcpp.mk
index 0ec08bd54e..25cdb20ca4 100644
--- a/package/utfcpp/utfcpp.mk
+++ b/package/utfcpp/utfcpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UTFCPP_VERSION = 4.1.1
+UTFCPP_VERSION = 4.2.0
 UTFCPP_SITE = $(call github,nemtrif,utfcpp,v$(UTFCPP_VERSION))
 UTFCPP_LICENSE = BSL-1.0
 UTFCPP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
