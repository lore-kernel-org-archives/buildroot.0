Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CC1CA5FED
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 315DA81553;
	Sat,  3 Oct 2026 13:57:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iClyZuL5hq5e; Sat,  3 Oct 2026 13:57:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4F51F81568
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791035853;
	b=LeEMtj+juNhaERx4XVEGeXQaM5di8SYHYxkv7i7XTasMbCjKXim/BMZ3Digq+AfnDE/M
	 TxjA/9kSGREnCttCa8mg6nW+5pAMgyciISmuUiJ2Cs/OosNP4/kdjSxPyJeQIsTOC4aNw
	 QM+bXg9McCT0kKvh+8tCgi3i2allZjHXW/uhVaEnYSKSjpFABpHHvA2UeR2/YaL6oELqv
	 fDYDRciHHIW0UJT9FlyOigarT2GeRSVpKrMhkGJPUv+iLqMdkq7z3gjVvP1he0Cp50zD6
	 cu7ml2n2QaZ8RojlMaOPCLP8+YaEqR5bb5zjqwQ6p5pN3SuSvARfT3CveF178o2WqZQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791035853;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=mmBxJyR+dGa7p6dfYS5PiUEBScu6eK7TTkzfsyG11+Y=;
	b=WUnZWdBp0WpbTtnQ0RRDCiWDKkdSiYPyLTjMPN0RoAtwCru+78b/0KVmAp+y5bWFcpi4
	 zlfKSkwhkVJEFEwRvnIYaX+Qg9V/IqG7GhUlNMDgAn8YCVdjhZBHAq4KM1Uztt0I+cF8x
	 0yoj27LK+c8/V12qy+LNvf+IFbaRqE71Kkv5Ebp6QzwQM3WlB0pYNb5kv7OyztK9HR33E
	 RNT9Vqr9ZqSr+zjEgwoxCc2o0zy3858xVM7+5rRLYa9ndU4vR8TY29nS35BZLIsPmqSiM
	 E+3M+zzJkjXCdCpUwuvbXjw/vmddD6hWs3JBNCkik4rMAx8sXgbMDkFGJzY694REzTg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791035853;
	bh=mmBxJyR+dGa7p6dfYS5PiUEBScu6eK7TTkzfsyG11+Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZsoHdA109iV018gdYN8nN9v1+g0FgNqmD5G7dHDWb/+yg/Xg5QZfJ0bMGdX6APrw5
	 a7h8J4XUdRtnfRa7fGOGQMW734x/uUjfGtQ99H5D+qiQQxcdu3BwVHmspX6S0bu01m
	 wTIEVspiBrEjIKByvjQW0NMf/yK3FxzAcoXMRggFiVHQSAmUG9dJYQxyhE+4UjuAbf
	 /wj8PpPG6ppVyqXeGv9ob2GBp9uveqU7Wdfdnm1qwS+r7exeWjn1POVkFaTdbqjtk1
	 5V6RjRnJtalQylG/IYVAU+VijD6anx5mPWyvFkZ6ZHlb475k2s/5VznbTDAJDlFQI+
	 s1hE4sZTwIRew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F51F81568;
	Sat,  3 Oct 2026 13:57:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0574D476
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7DD3414FD
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iflo6Ms23jmF for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5577D414F1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791035816;
 b=nwP0Mz686gv/0qV1NaiqPoWu/7/XVGqM0pTYjxCB0Yzh20HdTBAAvtSt8V/60XIfFmPk
 89R1bIne6hHU+ByK/IB7cjhJ/++y5hjBV0+fxuJChuVvtWCOj7QdI7iadcLKMzq3Lm/Pt
 mnr1cgYvVc+M+xn550uYwlACcr1C4gHMoIwf88aCNBTfgy2LHsRUxjg39prs0Yc+WXIGb
 86xD1/Yu3H9OCMIYXu25sVgpS+QM0dsWDgKvGGPD1ideVsZktzwah81r6iYdeWv9N5+jD
 9u4a7a58qyGWY/EBQ7uqHsrjeK4MmhZExyU7oNOnEUjz5SkQkEd/gP4Nj8KSMbjhOWg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791035816;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=emyneMoe5wqwtX4j8N4ItiwNHAWh9URJnP5p54VdmiQ=;
 b=jLFv/ZKmIcrpJbLrdJ2ig/cYKpxjDyOszKVqnocV2rx6sb+7P/MLzoFydzk8t6tWBM80
 rr0RiHk5TWlxraJ1UALtadBnF1HExC3IKqgcOUatygGfTYbKMhCP5UxhyZrda4l/nU9BS
 mTx3bXkysM9bIzX+R8ObOg16IdizB4dULeJ+rYdwwaUG3x6W43t08WrUc8N86XOQiKrdw
 yy5itb2VNYc+ocuE9RXJwKdE0hIw9pKkuDUhmID+D+I9fYDrXNlKe37/d7pUGVnkAa6Dj
 39jrGnrtN/BeQqAE/NkIdV7ozm+ny2XOPKjh+2h2lO6s3RVYiTBGh2pmIJuNF0+oCSA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5577D414F1
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A046C814CE; Sat,  3 Oct 2026 13:55:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 15:43:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3eb9b971f077a376860d8836ab25b7fa51cf2af2
X-Git-Newrev: a199cf5594d67cd91fcfbb5408530bf7afaa2ee7
X-Patchwork-Hint: ignore
Message-Id: <20261003135541.A046C814CE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-trove-classifiers: bump to
 version 2026.9.21.13
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a199cf5594d67cd91fcfbb5408530bf7afaa2ee7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-trove-classifiers/python-trove-classifiers.hash | 4 ++--
 package/python-trove-classifiers/python-trove-classifiers.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-trove-classifiers/python-trove-classifiers.hash b/package/python-trove-classifiers/python-trove-classifiers.hash
index c29f05b40d..d9ba083cb5 100644
--- a/package/python-trove-classifiers/python-trove-classifiers.hash
+++ b/package/python-trove-classifiers/python-trove-classifiers.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/trove-classifiers/json
-md5  693310e0edde305e2086b7b4cff5fedc  trove_classifiers-2026.4.28.13.tar.gz
-sha256  c85bb8a53c3de7330d1699b844ed9fb809a602a09ac15dc79ad6d1a509be0676  trove_classifiers-2026.4.28.13.tar.gz
+md5  4149c5d52f727c8d75fbc843f965953d  trove_classifiers-2026.9.21.13.tar.gz
+sha256  0a9ebc8d4e2f3e8a22848c5258033035bec17a3012ac3fea16dbaa764489eb71  trove_classifiers-2026.9.21.13.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-trove-classifiers/python-trove-classifiers.mk b/package/python-trove-classifiers/python-trove-classifiers.mk
index 645f57af33..fc7d2a2afd 100644
--- a/package/python-trove-classifiers/python-trove-classifiers.mk
+++ b/package/python-trove-classifiers/python-trove-classifiers.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TROVE_CLASSIFIERS_VERSION = 2026.4.28.13
+PYTHON_TROVE_CLASSIFIERS_VERSION = 2026.9.21.13
 PYTHON_TROVE_CLASSIFIERS_SOURCE = trove_classifiers-$(PYTHON_TROVE_CLASSIFIERS_VERSION).tar.gz
-PYTHON_TROVE_CLASSIFIERS_SITE = https://files.pythonhosted.org/packages/04/af/88fdebf242bc7bc4957c96c5358a2b2b0f07e5001401906783a521ea9f54
+PYTHON_TROVE_CLASSIFIERS_SITE = https://files.pythonhosted.org/packages/bf/93/af436dfaa845cab5d96f0adbc1e4f3730532d37fa249e4eb796fb1d7fc82
 PYTHON_TROVE_CLASSIFIERS_SETUP_TYPE = setuptools
 PYTHON_TROVE_CLASSIFIERS_LICENSE = Apache-2.0
 PYTHON_TROVE_CLASSIFIERS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
