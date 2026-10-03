Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF60BCA5FED
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93B3B8169F;
	Sat,  3 Oct 2026 15:56:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hCRDrt-dhKWe; Sat,  3 Oct 2026 15:56:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D5B04814C7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042972;
	b=T1lXDVm8gGeHrtEqmx+pDKy5JhTFqjOZ4MBbvBM6lx29Upavw0lm9nMHDwxrk1sgP1xT
	 M8/LdvcWYXp121Vap/Z1JGXXn3tDL/ues1J3J6gAcY2yEBv5Gyzf6LkvzEDpsmIg+PxFI
	 cK3+sRqu+Aik3QaSHQzhifn31GehkokD1t3AJrRFI0AkWed5WgnUPzwMo2vkkWp8TzVAr
	 utn2evns+VZLlYJ2Y9G711btZ3QaHzUgt07qqAXCNqz5OeakPn6O8iMZ9f4HSMOG8UwSl
	 9skAHcN7e8kBFqMLldWEJ0pMdsYqYJhFzJULX9hN4o6KcY1QzV1R6PI+nh0Fjzs0w0A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042972;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=dnXpnJ7gL32FkFcUCnPgwfO4/kCSwxx3EgzODl9BM9Y=;
	b=p6+aGVAVvp03wffFF/ALuvH4PdZW1XvpZwTijLx7A2sGEUermM6erPgevM8V81fdBQEB
	 g9El+9pLW/ULBKYh+KIBftTdV7UrmXa/4tvnkjfhDK0aHSHLTVRqr83ObDOvzKMkUKfqS
	 sHnxH9B/J/d4dFxJ1M1ETPvcP3noZ2KJgqyrsPJ1vRyxvGPpS/d9j3JdUN1k3BkQ6s2uS
	 9jCT92/Evcr/HKBNeqDB/rSnpuaZ3BcsyBdeBNLjm06AkjNnSQW5O/XUsdoMCR0WeRZdx
	 jdbyR1ZqHeWrTM3tPUlFZZeAb5TZSPGjfxKXZkEPZ/+t7PC/sU/WGvqOA0bu4yihVQg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042971;
	bh=dnXpnJ7gL32FkFcUCnPgwfO4/kCSwxx3EgzODl9BM9Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IkfuTFD4KWtE18plhE690OSwyqxNYzsv87mM0T776cB/ZMRj3SRM4XowiXml9kRUs
	 /dcDniJ/YO7Sb41naCz4hgvqLc/XVquuW3UbfqWe1Im2q83j3j68aiFYjMbAxNN0XP
	 SJAAHtSKoAJh15uCTKBMGxRFxPeOl4nf9MaC4Hl1rPR8Q+XeIBjcvQMcgvvXX98Llo
	 TSdJ0VizZGuljUton9Fj2mRWJApiLHLtxYh1H1mXiY39gC4P3ZQ+pUuio3kbmSkw+x
	 z3uCw6/puiGwgc7mOZk0DaV5XDeJs678zZqLDJV/wr4yY+kRV+y7OK52qcK8kDFreI
	 eN086wkYwb9Bg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5B04814C7;
	Sat,  3 Oct 2026 15:56:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E8EF1D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36C97606E6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kIrCvsNtVJG4 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1B1F860601
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042846;
 b=nlpdi6L4cdbXiTlzWH4XRWX+pwwowuj0cSplHDOCYiwV6pUfVaGBn87dRzgLFTA1vZFq
 jOnsU3bIFOgU/1uCsoh1WjRQ0ToOq93vKwl8vp1p53r9Hz1329qsYS5bcMi2qn+DtPUPN
 MgC8Kj5L5RlL6KIBdmVLws3/blLB0CeLUDg9Z5TK7OeP+wxqW1mejP76iSmS9kIYawt2l
 vMm/9sGn3+fVSYARt/4oMzQP1WI7Mp77cwTt/kwVvZdX4iXzuJ4ELzIki5P1Xw28T5Wmn
 HKjMwuL2/MWMDtPDAzdZf2uO6n20D8IHTKC9h9p3MVPxg3fz9bQ6KFmdX+DKkxuACKA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042846;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=h8ulrTzeuNooq2z7Y1YKjLc3niR66SVcE343EdUn5hI=;
 b=tR497JHilTQM+TOpQdLOyVuG8gmKgRQSoS5TVP5dFcQWlw1YRvwpoz2FCTwBcNdQbggV
 090uhhKs0Aq1r5fIovJNrzno5aHCmbWPz8pMyigXkI4rnbPG0FuP7nFJi+FdsX/G2ie2k
 ccpWYjqkF1QS3ya7oj7NDQGkv13OHVZaO1jiiG65Kb2kVT/HAfj1GO1jijfFkTe02kywt
 Xg+Lo04by5dxSYRiM0sUCbd0t8DO74h6OifoQvaMyjLM7BSyqsk1UXpPbLde+9J4C4Suq
 W6wCa7IF/ACl4QKe3b941RCLJCDHpjry0ffxHY2WKwVh93wkwYi8eppOyYrLqRCGjRg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B1F860601
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5C89A8A30A; Sat,  3 Oct 2026 15:52:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 68d3fa064f912529529bcfc054f874ae8a271e33
X-Git-Newrev: d25bbf1f237ae34dfec52241986b04a221a57f56
X-Patchwork-Hint: ignore
Message-Id: <20261003155251.5C89A8A30A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-types-python-dateutil: bump
 version to 2.9.0.20260807
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d25bbf1f237ae34dfec52241986b04a221a57f56
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../python-types-python-dateutil/python-types-python-dateutil.hash    | 4 ++--
 package/python-types-python-dateutil/python-types-python-dateutil.mk  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-types-python-dateutil/python-types-python-dateutil.hash b/package/python-types-python-dateutil/python-types-python-dateutil.hash
index 9f8e30447b..99eff042b3 100644
--- a/package/python-types-python-dateutil/python-types-python-dateutil.hash
+++ b/package/python-types-python-dateutil/python-types-python-dateutil.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/types-python-dateutil/json
-md5  59a73a1592656ca894f6c61eb8f2a0b3  types_python_dateutil-2.9.0.20260305.tar.gz
-sha256  389717c9f64d8f769f36d55a01873915b37e97e52ce21928198d210fbd393c8b  types_python_dateutil-2.9.0.20260305.tar.gz
+md5  e6fb2bbea5ab3d9c1756cef961e2806c  types_python_dateutil-2.9.0.20260807.tar.gz
+sha256  e0b8a90d464c8684c66b7b8e4556d9074afdddcc56ca45323f0987134f9e7034  types_python_dateutil-2.9.0.20260807.tar.gz
 # Locally computed sha256 checksums
 sha256  295f8538c94ae5c3043301cf7cff1c852dab6a786a8ddee471e061b40d5ecabe  LICENSE
diff --git a/package/python-types-python-dateutil/python-types-python-dateutil.mk b/package/python-types-python-dateutil/python-types-python-dateutil.mk
index cece2e4fb1..f5b44c836f 100644
--- a/package/python-types-python-dateutil/python-types-python-dateutil.mk
+++ b/package/python-types-python-dateutil/python-types-python-dateutil.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPES_PYTHON_DATEUTIL_VERSION = 2.9.0.20260305
+PYTHON_TYPES_PYTHON_DATEUTIL_VERSION = 2.9.0.20260807
 PYTHON_TYPES_PYTHON_DATEUTIL_SOURCE = types_python_dateutil-$(PYTHON_TYPES_PYTHON_DATEUTIL_VERSION).tar.gz
-PYTHON_TYPES_PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/1d/c7/025c624f347e10476b439a6619a95f1d200250ea88e7ccea6e09e48a7544
+PYTHON_TYPES_PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/c8/4e/b3fa538f9cb38dfece0d6ccf6d3d0d925bdedb144fb9c8129dfc007cd003
 PYTHON_TYPES_PYTHON_DATEUTIL_SETUP_TYPE = setuptools
 PYTHON_TYPES_PYTHON_DATEUTIL_LICENSE = Apache-2.0
 PYTHON_TYPES_PYTHON_DATEUTIL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
