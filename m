Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56797CCF2CF
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 14:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14E7860679;
	Sun, 18 Oct 2026 14:24:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C4oMahv6-P0R; Sun, 18 Oct 2026 14:24:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 24FE4606C8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792333483;
	b=IndIGT0Bf9A9MLMzaf4e/PUZXOKFov3xAJezFsY7cfKpCfhD2Q3W1LS7dz5IbI8TjFhs
	 eI/kHNDJOpsuXEDV+hwdfDNNL6VgVuCXFXw/xKSRqCCh/ITx01L4ePMZezMNFjD7hpf3w
	 ARW1MVWMlLqKvYosNA6gFq20kCvun8lvqYFbAboByySQTmPtAuvH1u9lZqhIDlXKR5zOX
	 1Fu9BqhOpk29MSY9q3XAOvmyYgSzeGjxS07hXw0aG1Li/NmUkdqcQcpk099ZmVxL9Gofl
	 e5joHjEIWDcJJ5SmR9z9/3VOclehH8b0+NcCacEKbPhGfCh6D6K4FxsUIK4xrD/WUEA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792333483;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZIAfugWwv2SM374RdA/XXeVgEE9GWj1UTAhWCjt4yKQ=;
	b=lTbw6MkO/MvtbEhy+RBJJ59kA3khKzki98c6XMcaNFx+4UrPBcd2Xn0Okduzwr9TBRQY
	 EYiVx1Pdx+7BmFw3QjoImwLqQv29wYyjo6tGb9IdQpbJUsv5rhaTc8Yl+mEuUlpFlv8vB
	 4c+IRuQi803Qp/xv7IzLEewJJCN2kVx4QxPu8q5HUaIfDK1A1FnQtYlph9+56A/CMYi86
	 CJdKBTMRQUd1pZ2g3wCzJM7Wk7Fc3nSmf5kx370Qfa1ucag+FSuGIUsWGa0UH6Vl32nk9
	 6RcwOpUxHiTgcMNuHvX5SKdM+qcs3w0bJs9C3Z/beGBIyy0JZAKUurCSzUmSdNFGtMg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792333483;
	bh=ZIAfugWwv2SM374RdA/XXeVgEE9GWj1UTAhWCjt4yKQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aCMj2ShbbNV+4Dc79MlD5HI9CT0r7/lsmK8Y+z9n/AfZABgOzNQMhL+kemTiaCxyR
	 MZJYRXWlZJJgYiWCbak0LtxJBpbghos/wLnKIBRzl53lIp3e8s44ut6YChRwquEgkn
	 bCCOzrkMfPlf1whKi5vmGyxzCYvfM26t4cs4dGXg4IMMJYj1mYGUs7cWEDC6S73eV7
	 EBQJaDe9+C2k7kAD15xw5FcorXnRJJgfvycdFd/baSnBpKAQoSh9mKRUzEm8r0LvSJ
	 jT4I8qVGYfKQpRckhFtT3D3MKumICunzVgXTdIP2s6SVnxMkncoTOgNzk1cFwHPpbz
	 EjZcXhQCf3Gpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24FE4606C8;
	Sun, 18 Oct 2026 14:24:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 96864769
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 893FC400BE
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:24:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ByGrBm4LljL8 for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 14:24:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 40464401D5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792333466;
 b=mDaFD9BX8QTi3tmhddT8+zpE2WZPYzq+DKQJT58pGe8lcMbmv/0BqcfflH7gSO8f8Dpc
 YfJ00ejcMnp3caGt3JJ99BBlCRmwXvuT66rFH1TvK5NVaIJlyWfQLM2XetERU1oLdRwsR
 P+g74nYnPW+eCzCaI2dphl02JN9iD+TYuCSzvs9HzW3H/vl6vwV2D2lJmOdXvmktdE+0j
 ckjIeF6sRwAfPRDQZadLcoLG9V7xiXwBSa+yZDv4nmRf6bi22u76Ip/AAbJh5Fz++2TqU
 2BwBKfH74E31/gr0zZCQuwKrsclFx+xS1ILwF7psm7ORUeLxRtnYvz2OR/VtPv39SYQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792333466;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=3KqcdjHi7D6kkP/iaZIBnuxynV+CakDSa4thTy842S0=;
 b=RMfOA0X2At1RzBN7r7hylIk4NGJTM5r6IkTBDi/zqeMv+cn1exg8kyYYdzDixLVX8x44
 SWf45YSbzyllZfJnlIYn2zTcg0NHjXp9BVEtf8aBkXN9fSaY8e13gHleliXCAS6BDXGVZ
 aIgMf8/c5LHNRHqQ6Ehsid9dVZWZMfSHOx2UbwDvcIK9sfC0GlXBnO9q7OUqrwHxBD7m9
 PoEk+9byd+A6yLQBUBe+nC5CebcGVcHsXqahZPU5RP1HgWyzlGpyiEf8pmMMjq4z6zx1v
 rZ+iIMYsDol6ZwtpStTaY/4mgeuQi18Mz4JAYJM61NpBjKbn7hJ7WuRsPLXOyWj9ZTQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40464401D5
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:24:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2FBD198283; Sun, 18 Oct 2026 14:23:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 15:57:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f7c0436dbb90cd5fc2c67dfb8f991a2b461eba7f
X-Git-Newrev: a6fdd8fa927dcffed140536f99141c565e6e4f59
X-Patchwork-Hint: ignore
Message-Id: <20261018142304.2FBD198283@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pycares: bump to version
 5.2.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a6fdd8fa927dcffed140536f99141c565e6e4f59
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pycares/python-pycares.hash | 4 ++--
 package/python-pycares/python-pycares.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycares/python-pycares.hash b/package/python-pycares/python-pycares.hash
index f3d592a90e..14583b122a 100644
--- a/package/python-pycares/python-pycares.hash
+++ b/package/python-pycares/python-pycares.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pycares/json
-md5  32f250031005a3bd9a4e1a8e39488f2f  pycares-5.1.0.tar.gz
-sha256  4ae0712df072773a3193b23f124d9458d6b2054a22c9ea0059c9dff6b8f91050  pycares-5.1.0.tar.gz
+md5  b326db41b14da39ba62344fc6ec799cd  pycares-5.2.0.tar.gz
+sha256  90ea74fe26593d2c4e79e1ac4dcdff4a2434b183ec6feef0524e4874a7d307ef  pycares-5.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  427bb3a5372024a26e2c290b24382512bcc7ca123431c4dd178dd613beea7eee  LICENSE
diff --git a/package/python-pycares/python-pycares.mk b/package/python-pycares/python-pycares.mk
index 2b8d2955fe..555f2e969e 100644
--- a/package/python-pycares/python-pycares.mk
+++ b/package/python-pycares/python-pycares.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCARES_VERSION = 5.1.0
+PYTHON_PYCARES_VERSION = 5.2.0
 PYTHON_PYCARES_SOURCE = pycares-$(PYTHON_PYCARES_VERSION).tar.gz
-PYTHON_PYCARES_SITE = https://files.pythonhosted.org/packages/3f/b9/8f8389df1dfe3c9f6b5b02cfab60781685d146bee529e7628b77a1df7e9c
+PYTHON_PYCARES_SITE = https://files.pythonhosted.org/packages/e1/16/66c5e0498934011d36887d69ce116e347253399d06931a6ca900c7cc0899
 PYTHON_PYCARES_SETUP_TYPE = setuptools
 PYTHON_PYCARES_LICENSE = MIT
 PYTHON_PYCARES_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
