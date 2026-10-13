Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2F6CC6B1A
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D7CC40715;
	Tue, 13 Oct 2026 20:57:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VeZ_bm1VLpmC; Tue, 13 Oct 2026 20:57:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7908040693
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791925064;
	b=K0pqtoYl0ZZBc6vW6P46TCGqAVo1Wu/6Jx+oaTH3so88xUx7IrvgGVDn0Wy387aN1PiH
	 xxUE6d1MwdxYb426Kz+elAtpshoFwRtSXSAS25Zkgut7pGvKDyzOHHN9Kll6IECUGAZse
	 7tqXK1kCnDWjVzR+wKAQHchex3Spz0xa5FqZK55i6NyJf4zmcXbkiswfyHz69Ocv5U/9e
	 DZXDj7uI1/UsHTADcDN/kvadWNQAI7mCcTmkxvwHxj05xpM8nasEfsisfgQZ+9OSKTtNu
	 Kbu7/PCNPa3w0DUBlRJW7NNm2HEvE1rdzBOyly1njyhtTapWAlN7Pc5TsFXNPUfEAOw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791925064;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ni2qVOQFn2CW370A2KrTbyPL+Ofp1TDz3QJWVNlD63w=;
	b=Z5Y6RlhwuxpEQMipMi90HW1rzD0uzz+3uLapBz3taew3skvBaIYkNaDjuMjf6rsp5qzO
	 c/hxFg6zXhCITIPKw4aSUdPb69yM3jZUzMeYIxkSxOM5TKuz3ivyQXIl1VTJRljPoUwhE
	 9FkwUX7tfrb1E4yyTwF071If99KfM9gJKNpq2KSs+/ZE8i4XY20BbuQ2Tol5E7vOlpLed
	 4o/EeWcQHG6myt6TdLmwCunTy/bUgNkMIvg0W2sl2aTY6ETEo5OB0MazEsruptZSc5oyt
	 GWX7flxzlUeqDdy9CPHILhhFkY89PY5wiqNbN6advAZqgKwzw8FgY5041Phf11I8Yew==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791925064;
	bh=ni2qVOQFn2CW370A2KrTbyPL+Ofp1TDz3QJWVNlD63w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OZB30KFprBult46kgLV5h3398ji7imQhPs4Usn4BJQoGanhCCSk4UuaWPoxRyW2he
	 kcnjWcSbDFFE5TcHZAgVAdAYnaAts/eum/OfR6r8qrEGldE5FLa6ExmSwBBwtVjq9X
	 aUdUDYhMq4ai9dlQGqTK3QPK0YrHiFNd4YJHv+ohuHvljQfnk/B8/Q+gJJJzbiYN95
	 h4bn0JXzHwMYW1mY//etzNzYDtvdX6s3YSVVNtcOCbjnBs7eS9CbPE9q6BYMFAhfBO
	 RmV4iGoMzrsX4ojhoZn7qlmT18Wi7lZdNlnTg2sNONhmMj+4FyNNbXlshqxzhwEOSS
	 R2Qjv+AIM91Kg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7908040693;
	Tue, 13 Oct 2026 20:57:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CBBBC2AE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDDD980CA2
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:57:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ySOaMqoM526x for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:57:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 203C380ABD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791925055;
 b=mfLkfQBdqAoVrVrecHewQMHaRmMamH51E7r9yJN82VxukR4lcuf1/dDjPnp3GZBO6ns9
 FSvesKYaKOP+q7snaB4oyHujp4s2iJkFn8bM9nLmbFS//mKxLrzyOyP9oJ534IO2+7KRL
 9+JiIgIMFqxqm9OU2+KVnlMPQvB/I96lZm1pHtqc1BzymjNChOxbiS17Y5phaYFgT+r9b
 DwS092vuTcsfPp+CQTyK9wXDFtA17A05S/28y5nihEgcpwKLmfbAnCultweibT9KW3aQc
 bOoRkrGAZNLEs/f+IZv8DFanzSdPorXuNWcnoUATCVsuO4imkyEDOCHYmhupK90OWNg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791925055;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=LyQDWmdUQ3pJac+z/MXwlEJNe1/niEpOVmPshtrwoVs=;
 b=cLmNPVn8awdIWfEvdIT1OPPoy3pfnCsEb7bLLf6vk2HAg5wxKxFq4YlpvY7z0FC1bCSC
 qmKDioTLaYkFqTUsCTR6Vb09FJQd0cRC6Ja5u7q1xvUVB30iLl4x5DIrpt4lgdOc/CirX
 4+IAJyLoSZbLD/PeQzo3SXapwgwofNyO963QqU+tW5mVHE7jS8F/HXKKe8QA1BKEykTJu
 Tlfz7iBVMlwpO2SBwhZLr+WtuFAFiHJzwFlNusXZqhEGFjGQ5Y8lug5nqk83rmg3CxYj9
 5vLvPt77FzioAxOFDr+nCbNJ1TBJ5pm7VvVdN2TnQqUhfmh69PqCtH7gThR9uFCsxjQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 203C380ABD
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:57:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4BA4D95B67; Tue, 13 Oct 2026 20:56:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 22:55:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: efcd03cf457dca3991d5c49732f20224924c2b09
X-Git-Newrev: cd4991bfe8d4bab0c194c7f31357fde36ebc24d6
X-Patchwork-Hint: ignore
Message-Id: <20261013205615.4BA4D95B67@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-starlette: bump to version
 1.8.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cd4991bfe8d4bab0c194c7f31357fde36ebc24d6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-starlette/python-starlette.hash | 4 ++--
 package/python-starlette/python-starlette.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-starlette/python-starlette.hash b/package/python-starlette/python-starlette.hash
index 840e0330f4..b6b013ad17 100644
--- a/package/python-starlette/python-starlette.hash
+++ b/package/python-starlette/python-starlette.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/starlette/json
-md5  09363df3ca97cae1eab654fd0d2e8bd4  starlette-1.7.0.tar.gz
-sha256  c79f74ea63cff761804fbbfb182f1e0b440c2d07b164d24700c5a1bab5d6ff5d  starlette-1.7.0.tar.gz
+md5  ed1e744017cf7bcd9097e0cf7c0f7578  starlette-1.8.0.tar.gz
+sha256  1565dc0b35d5737a271ed1e0e04e949f4e81198799f216d2667b0a0fb9cf9522  starlette-1.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  dcb95677a02240243187e964f941847d19b17821cf99e5afae684fab328c19bf  LICENSE.md
diff --git a/package/python-starlette/python-starlette.mk b/package/python-starlette/python-starlette.mk
index 732085a132..4c94f1853a 100644
--- a/package/python-starlette/python-starlette.mk
+++ b/package/python-starlette/python-starlette.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_STARLETTE_VERSION = 1.7.0
+PYTHON_STARLETTE_VERSION = 1.8.0
 PYTHON_STARLETTE_SOURCE = starlette-$(PYTHON_STARLETTE_VERSION).tar.gz
-PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/7b/2b/3850dc6bf7ef71b088962eba31dafc6cffd2f96e577ebb0bb316df96da3e
+PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/e9/0c/6efb252d091ecccd7d62048ae11f0ea35cd75a4fbaeea5e30f9c3bf91d10
 PYTHON_STARLETTE_SETUP_TYPE = hatch
 PYTHON_STARLETTE_LICENSE = BSD-3-Clause
 PYTHON_STARLETTE_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
