Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA8ADCA5FED
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:57:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EF3F80898;
	Sat,  3 Oct 2026 13:57:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wjuXs9dyBNq1; Sat,  3 Oct 2026 13:57:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9AAD1807CF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791035833;
	b=Qkvg49SCEw2iznG2EhGFvM/QYuDP10dKYLwJvEQ/JHJejA31Tzn+bVgd6bsuTF5gTsEq
	 b7phwyL51CrNtyPC1ULhhn6nk9GjncV2bWPr4Njf9lU7S1n23f5dCKupyMERPBpxhPtGL
	 ZMmr80r5uoxfoQ5S1YDBVDtSW7UiKl7N/7vfUliVYQRTNdwTe3um3L5t+Dv9z1+3Qnjw9
	 58O8NvPSPCj0Qyzamsc2uTviT7jxbXDDcpEYaeH0iLPq7sU3KziTJnuV6AMMd3gyEScM2
	 3/T0/+uto16LO6Eo4jnAvhRke7aocn/waFXqwDu2wCsNg5ZF3nAE8VpYPj78hni5Wxw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791035833;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=kb+A60T5TvJRXBici6oYEoXjhrEkpkdhfpWPBkjM02k=;
	b=QoB6wCp1JfkqW9WAmt3fZBCGRWFfMsSKnLDl1VkGCJ4k8yUmJlo5QpFl3iPcJyCmF8rw
	 wDBzpoQNLvzqXYaqQAuyYhstIyibYCFhG0GVt3Q91uSq41QgL/xaxhf+9BrRq5V3Ij82B
	 BAHBn2o4/TJ3Ln+iJ5q9FqzxvxBiThmZXedgCo6g/mLXVqrgig9yFjPzrxPO/Hw1Rba72
	 gQ5XOSkwAW27ctnByZ+Gg226NokhkOC5x3+k4glsXUgob4M3DqvrYRODksJ7dF2we6oWM
	 i8RJW1UEcaiXKYfhXHxWMqZcGbKStR2ZlyY8to2ClCOr8oyKpFUxNHMWNYCspH0mnUg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791035833;
	bh=kb+A60T5TvJRXBici6oYEoXjhrEkpkdhfpWPBkjM02k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OhAnH4Gokkeeex1pHJwTgdueBdHmDA15wd0RqIKy0WNnC8y0QYaTkmZ2Cr4pRk8d4
	 Mou/RQN7JYo/Zk9sS/lWGQEWmQKwktjLGQgezP03+HnBm3t2eV1L/H/I+D6xqLt4oU
	 D/WAAHNiTF+PuSQG1exK/7WREZaO6XXgrhQ+nx7MQEcyvltQbwJUIW+5h8dWJAhhHV
	 IGbrcisXFaH3S03xnWrmGRhuD/OMI/3fwUeEpUMG9brieZGI6fPPBLP5ta2hgcfi2p
	 /iNhM0SdFEncIUm2ZMgV9IO28aadSScN5mTRL1/NU6ygyM6/ETNgkAgz5qs+eUT5QN
	 aIINx31wCsNwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AAD1807CF;
	Sat,  3 Oct 2026 13:57:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 93A3832F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A08E414F8
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GEWl9fBdV3Z8 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 49C37414DC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791035815;
 b=nFQaJGuCwkjktRhfINDW/XgsqvcFQMwMDYGdCMC/UwRqCCH4bfeL6LbgjjLR9/2PwgTl
 2mk8NLOhnzciWCGp71wSlMxFn9FZBK57gOMMPYqH4M4VcIRaQhki2Je2TmkmH4xZr+/L1
 5BECg8C9IathnB4qlI0X+pGrn+Ah38kTLqsLbDW2v1HPSQPcAWYF3TRGLwPUEdWLloTEp
 JzK8jYagLAhicURmFKkV+fQ85rccwlX8+5PHiwJroOmDpXuP+ykS5docV91EHHWvfVFyy
 T8SNzYwoVUY9fjXLs3/Y44LqwZS9Zzp25eYP6+Qi1dnUP9nh7o3y9LJePRm83rVBEIQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791035815;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=bYI5kSAeYprSQq+p/KgvxJ0Xlx1gm2E/fcfwP3cHzgo=;
 b=eiE1FNjHWSckVGB5H8rEEf1rFdDM5VSchp+0oLFPYWgppqm5Z9GJXZwwAhKPZZ++r0zT
 zZUg1VaieLGZ4aBdfIh9pR6p/Gf54QmWArOxkbbMT0kQXtLkmCkmGW4gLZ5lOiKTw9GoA
 y1g5wobQcnPfUIcAFcsGAEJ8wYXky586ssgcSJwMbexjGeRNguHfZjLG5zziA6BgThzjm
 9jKDKfI+r3ehGsgZEQrG1s7RbPEn09GU2KINjSQ8FIl5qrjUV4p90mJ9KLXy1amX6nHIx
 KsN8aZBKVmSlLyuCpgXQb+99zBhwKffF3/1i3WUGh9pPHXwWmUMk8SxkFML9L+CzL7w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49C37414DC
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 94D548A31D; Sat,  3 Oct 2026 13:55:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 15:43:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e801ebe04f3a4fa7d7f9f53c4325319b6baf97ec
X-Git-Newrev: db76d4ce8028656987298dd0dbb03e5087b1f3d1
X-Patchwork-Hint: ignore
Message-Id: <20261003135540.94D548A31D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-installer: bump to version
 1.0.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/db76d4ce8028656987298dd0dbb03e5087b1f3d1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-installer/python-installer.hash | 4 ++--
 package/python-installer/python-installer.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-installer/python-installer.hash b/package/python-installer/python-installer.hash
index dbea06738d..0a4c9f6dd6 100644
--- a/package/python-installer/python-installer.hash
+++ b/package/python-installer/python-installer.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/installer/json
-md5  fdf6be7db2ab6fdfbfacfdb208abc33a  installer-1.0.0.tar.gz
-sha256  c6d691331621cf3fec4822f5c6f83cab3705f79b316225dc454127411677c71f  installer-1.0.0.tar.gz
+md5  c919fdc746e46b0a93ae53ed375e047f  installer-1.0.1.tar.gz
+sha256  052c7fc3721d54c696e2dea019be67539d7b144e924f559f54beb3121831c364  installer-1.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  37b8b9f2569892fa54406383d431169dbb2115980d78b7efba6eeae5664c484f  LICENSE
diff --git a/package/python-installer/python-installer.mk b/package/python-installer/python-installer.mk
index 22b79ec464..20cf1cb744 100644
--- a/package/python-installer/python-installer.mk
+++ b/package/python-installer/python-installer.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_INSTALLER_VERSION = 1.0.0
+PYTHON_INSTALLER_VERSION = 1.0.1
 PYTHON_INSTALLER_SOURCE = installer-$(PYTHON_INSTALLER_VERSION).tar.gz
-PYTHON_INSTALLER_SITE = https://files.pythonhosted.org/packages/5f/ef/230b70e66db6ab01d5cbb93329688ed1f06b2b0618a74925e36384ff0fba
+PYTHON_INSTALLER_SITE = https://files.pythonhosted.org/packages/06/fe/b9f481cf0cc867958a21338baa900357b7b7d86cac9b025948049d77923c
 PYTHON_INSTALLER_LICENSE = MIT
 PYTHON_INSTALLER_LICENSE_FILES = LICENSE
 PYTHON_INSTALLER_SETUP_TYPE = flit-bootstrap
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
