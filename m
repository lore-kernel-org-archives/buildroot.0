Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF192CC6B19
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 816D6605CF;
	Tue, 13 Oct 2026 20:52:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8NOBcLJG-auE; Tue, 13 Oct 2026 20:52:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A3ED1607BA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791924747;
	b=rquBQXG3/tWXHCQzp4AWx3uAkfI1zplrAqOEZACQprIzrg+gOdjgKENGlyCN6Z1WmKfM
	 Trr9w8AOPfnlscZ8hBu635Xh5m/2a6hSYnBL39yC4H/bVKltAXcsV/aghQf+u+8Ea0KVs
	 SedQTCqhCsKH748wRedjf47tokTuxYprrATXfs2tbu/LdUIxrkgEcJeZ+u4dGkQxLJHJr
	 D4uo6f6/NzrAnOCITYCyvkP5Cw9u5pBL+5SYGpAG6gpV0MBdrj/qvo/2V8+eSE+PqBb4a
	 a35B7wEtj3ZYiLLRbj2zzszGpeAs3QrScJnS6czRjUNFNRnmqBqRuiEjWa6Ohz8bwrw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791924747;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=kSf+SCCDTYuxvEiFCvkJddi238hLq1qfRLzm/rpg08o=;
	b=Ls4s1bt4RypJqzVeUWq/Bgypo64BDnfbakclrYgob/EkrF9BLRfG3JZn2qk6QIBqOIfQ
	 ZtKk/gY6HcsKP6+g/LsHNIn5CxlJzNf6GAQ7J98amL9xTb03AjI/f2U4P+ScWXqdbdHtB
	 qyiN3k7KM39nGFQwJv35C1ytAmAzqJZKekGsr+iHRoOOopUo4MpiWzsqBziaz2IHOojXY
	 ayuy7srhCb/9SkoCrE5YoBp8FMhSPDsBgyxbwHusexdvABGLsrvMAzVflYA51loy/XS9T
	 oojvAPxUrE3ocTmV/cZ6uDbOkwF+GiQP98pKMt5e60Nt8pfdroBFjFkgDn8S8wznoeQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791924747;
	bh=kSf+SCCDTYuxvEiFCvkJddi238hLq1qfRLzm/rpg08o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CMkk2N4nvhpHD/2IW5Cxfs/1cugrAWM15NzHeZPKyl0ka8hpcppEnFRmkZmWeRZ0+
	 67qCxXoMl0ggwzT2EV8FtWEhgQKTe7w9hbZQ4W8IBbnQ4tec0cgvJJ6c1XjdDRxQgd
	 ExGrvXxRYvyZUflJB0PHe3jxfqHEmRfJl4DXc8SpK4NFOxiGRRKIoMXd0DJQIHSum7
	 7eTJPPCM8tpF66rTz1Vi6EoVj4mWxBXPsRFIJ1dqL/Mb2KltO1yTaoCAzPJ2mRMhEI
	 fQWg81io3VndgdryU1qz+EXKDsqaR78GhT0piQKpdMZwkWwpQXYVLRTucvsN4sM7uP
	 gS01Dt58UaZtQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3ED1607BA;
	Tue, 13 Oct 2026 20:52:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 289962AC
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E96F40661
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zg7xZKjbo0FA for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:52:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5E20F405DD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791924745;
 b=YaiZtzlTBHejnxSx6dZejScSPLqU+Ou1UlsLLpj3KawjyDOpjUhjp/EV9kChUPx+CUZQ
 9nxOxqM2THPtVRI/e18xAXCkZyy7iayAd1e8bHhZl+XviyaT9ImpdrTGxNeARdqJDu+Tg
 I1BfubWUQRdIH8eVqTtJOLajaoupaqkIuNn+AuDRiH6pMycLWwoCzoujk4Ahjzi/mj84L
 iw2xMyO+f1Nxgi3VLfoVWcPu/j651oiXIojf0q5OQmi8hlr+0IuMAPVI7OqzLnANih613
 S8KQS8qBDb2l1Z2u6oK8mEM8sI/icqHGtw+nAJmvsAF39kCsSIp7bt+ZwhYqPE9lRsQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791924745;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=njo8Vm9gRKROBPjcqG1NbtwV2L9f2xJ6n28i5Le0ny8=;
 b=DWZgAkMitR9SksMCutZHK1SNIbxtKLoUdfxDqreCgT73SsemPgXH7avHXI+kmW175pcY
 f57QNthQX4ODatt3rfvovHr7BP/tnwsRBaTZutiU2mGCyQtZOcmyvAU24WYg+nKMobAzD
 qCoIBfQeRCy2zud2mEeHfPP0/V/HaC3ibNQOCWYaLtu0+KSNHNe69ygovx9mlPqprhJ9I
 Muw08a8Tyey6wQmF7UHMPCmqSPnQqURKLEmudDs37fwRWDxTZq2fbHftlzDlrBfXhRe/0
 UKhsSArge3XZzCXutWdFclF97LZGGaVNUKWvm0LYc5m3b2ykULg1CvaVogeLvrgqszw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E20F405DD
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 847A9958AB; Tue, 13 Oct 2026 20:51:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 22:42:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4131ccbdd08aa47b2376ad28d91e8936fd2bc958
X-Git-Newrev: 7e0b4b6368dd3bbdbd53e3d0dda2259a9330b0f0
X-Patchwork-Hint: ignore
Message-Id: <20261013205105.847A9958AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-bitarray: bump to version
 3.12.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7e0b4b6368dd3bbdbd53e3d0dda2259a9330b0f0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-bitarray/python-bitarray.hash | 4 ++--
 package/python-bitarray/python-bitarray.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bitarray/python-bitarray.hash b/package/python-bitarray/python-bitarray.hash
index 8661d21936..b9ff325312 100644
--- a/package/python-bitarray/python-bitarray.hash
+++ b/package/python-bitarray/python-bitarray.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bitarray/json
-md5  07b44aa7a18fa6f800bf30cbe4a6e978  bitarray-3.11.0.tar.gz
-sha256  bf19437ec00ec3d40aef82eaeedc14cf4000be9b635c4f5049796506e6630dd8  bitarray-3.11.0.tar.gz
+md5  0c5925f54da81648a14ec51368134c27  bitarray-3.12.1.tar.gz
+sha256  b712ea178c26c00b60b14bfd17fd0bab6138a05b515884b0ce418c0f6fecd2f3  bitarray-3.12.1.tar.gz
 # Locally computed sha256 checksums
 sha256  e19b1180b6ee73307a8545716be9b36318cf4f926aaf3eb43f7fde3396a102dd  LICENSE
diff --git a/package/python-bitarray/python-bitarray.mk b/package/python-bitarray/python-bitarray.mk
index c803b4793b..4ebd26e593 100644
--- a/package/python-bitarray/python-bitarray.mk
+++ b/package/python-bitarray/python-bitarray.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BITARRAY_VERSION = 3.11.0
+PYTHON_BITARRAY_VERSION = 3.12.1
 PYTHON_BITARRAY_SOURCE = bitarray-$(PYTHON_BITARRAY_VERSION).tar.gz
-PYTHON_BITARRAY_SITE = https://files.pythonhosted.org/packages/04/f7/6765577df59e2345036e435f7e983e1c291d67b7d76a51918eff04ad1494
+PYTHON_BITARRAY_SITE = https://files.pythonhosted.org/packages/e7/af/9f136a8191822bc9277fa6af9241619ad6a21e0638b694bcea1b0f8d0d88
 PYTHON_BITARRAY_SETUP_TYPE = setuptools
 PYTHON_BITARRAY_LICENSE = Python-2.0
 PYTHON_BITARRAY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
