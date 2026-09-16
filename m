Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BDB6C982C9
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 21:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1FBB80DEB;
	Wed, 16 Sep 2026 21:34:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 26flsP8BdQIU; Wed, 16 Sep 2026 21:34:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D82FF80C1E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789594485;
	b=U8A+e/4PtnKRwfqFIz3JwwP6JzSADd32za9vsvY97s3211cxPR0/CndBatE/vm6cTx6/
	 iyCmFrjcDEI3fdE2lNEQvCcm8DgDHdbsytjXjp2lH/RlkxW29ul/82ouw4YKtSHgRUOeu
	 WIrxKtsrfiiLdmApnayEKb9F4slGjI6Hn4NFcI/KsB2kDZDqe6WtT70tG9XuIPd8m5Nxq
	 5ceKuLBWAsYZmwI4RIYxBeS6R15dP+6Ugq6wU6zNoMI6xb0jEgfMASNw+9KzfoC9ycD7D
	 W6l3J6MPDn25tOGeU7ONGLKkBMO1/m45ZCaG58IYnnj+ENsp8hTFyu0t8ObXGDpBSmA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789594485;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=SJfSJV8p49YUX5VJdgOHOrEJ5hNVmDdKqW48laUPVDQ=;
	b=qiO9ZaP7BCB1FC4xNqG18dIimVsC07CrdIwSzDXERefUxRXN63iQlqND76/ctrxhhvhl
	 zxc3i5x7iK9giIPts7z+nImbSS3tbnzqxRGUeAoZNIvDeyLg52tXFGC2s8pX16P16nFbb
	 1LAh0EpAj+K6aIQuCYIdeHl1d9Urc1Kq9yH3ikSGu31WUVOO8/8RH6+aSDbDDjVzytWuO
	 Q1ngGqO+7GRlMiqxRbhja3He5je4xTAh8MqWmwkx/RF2ofoV+VpiUtidGSjF+4rbBHop/
	 QvvEy9PGrmF18tfefUh1j7ICzszpL0fmN5Pvb515d0xJxPtslwdrQPD96AG/Q2S0cLg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789594484;
	bh=SJfSJV8p49YUX5VJdgOHOrEJ5hNVmDdKqW48laUPVDQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Qp6jqHqmW7E+iSLvv6o+K+S0Nm/3S3OhQJov5TqQ2xxxlJtBQGDCqXvk9blwOiJy4
	 pi0FC5gBYci+MzULxPwK6fpWC0fhEb2eTodcUVIhLPYWYPL7jXSQ5CrOvOw+qDpx5s
	 BjgUsS4gu9AUTcA/khnPHJV9zMSlYiAM6jQeeJFNQhmaToHJsrZDbHKCxUy1gXG+gg
	 PLiwpn8qHl+laVPLU5GzxlGPVu2K+21/2LfwO7emtOWeEE2dRGB3xXj/48MtK7b+dP
	 gkvLo6p+Fzjr0EPDS8nXQ+F8DDmHYvdrzScLknFy50lYHIWqIhAVKHDBaW6DLoegLv
	 K/lhVjVXV1VyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D82FF80C1E;
	Wed, 16 Sep 2026 21:34:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FD952EB
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85E4F80C1E
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:34:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3tPXH7yRoHZQ for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 21:34:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C89A280ADE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789594482;
 b=Kz03qHhspC1r3z0qXHbqewl7l915rMUM1Yguf9/KPXfhKX6ri1Vdz/ykwCXrGao7lY7l
 ZD7ZxZ61xcnA7dMnPNgWNQpXa6iWsIeXYCul8+GF7ALw+BAV9/FcPmGA5HbZVqsQYz4cO
 EgVEDD3ZWOf1W3xbSvO5pBkDVqknCkRfPUSJE8RVlbQq+REQ6PmVvcyi2nIcnuYhZgydt
 ETOM9jKo4DUI/DTxs3Sevt6SC7dzzDiK2728EP4DwUDS9d20YVmNP0orlS5ebJKfQNRjU
 9eDm/lEvHIoLzpaB0tOS66EpQYdxi+yq8gpC+abrNUMkt6WWvlPc0ujOvR8isWlhz/w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789594482;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=xknlUN3CyDLJkRoaV1wFzji5Dt9mpxDXMwy4e2FHhdU=;
 b=KsLhWJF1gOYFB428Rij39CETQ7/8NMEfkwWxuC74ut1JpF6Irp948SU7HYRcXF7a2/0N
 CLgpEHUjOHnohmbsgaUrXS98+ygjD+kYv4XRTTjpluMjSLxyrPDuGkDBi1KpwX2d03gSN
 2LIiJcHZNh+RIVq2N8IyoqX0xWZuyjjmgfWCCpKjXQ7/zGECiug7e0KMszfS0/46Q7csz
 7G2iqNKiYP4M3b1rHzhhmFbc0i0C/0xX4FAY5hKHEWDNah7UtHFYF2uNP+pyHETtY3QDn
 YJxlZ8vJv4Dh7kRFPr29TxMH3G6gPvp19nn4rXqAyQXqqJchy5M+b/oCVcFoiCe/o3A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C89A280ADE
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:34:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 43DB196B2F; Wed, 16 Sep 2026 21:33:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 23:34:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f3797e342095235636304364d79d3f5c957087a
X-Git-Newrev: b7cfa2371bc1ebe83ea1c74db7fa45f360a2138a
X-Patchwork-Hint: ignore
Message-Id: <20260916213336.43DB196B2F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fcft: use release tarball instead
 of archive
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
Content-Type: multipart/mixed; boundary="===============2817401423316416166=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2817401423316416166==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b7cfa2371bc1ebe83ea1c74db7fa45f360a2138a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Codeberg has changed the way it generate hashes for at least some of
the generated tarballs (see [1]).

This change affects tarballs generated by Codeberg, but not release
artifacts.
fcft turns out to have a proper release available, so use it.

[1]: https://codeberg.org/Codeberg/Community/issues/2861

Fixes:

  https://autobuild.buildroot.net/results/6792109a982924f4cf2b8bcc9a2ac7c12f5ddc55/

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fcft/fcft.hash | 2 +-
 package/fcft/fcft.mk   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/fcft/fcft.hash b/package/fcft/fcft.hash
index f5a499edcc..0a4c633f24 100644
--- a/package/fcft/fcft.hash
+++ b/package/fcft/fcft.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  79e52aaafc0b57fa2b68ed6127de13e98318050399a939691b8ca30d44d48591  3.3.2.tar.gz
+sha256  8dffe750027618e01dd4e6bc9aa9c889033c7abe4a661e9294192b58b4556264  fcft-3.3.2.tar.gz
 sha256  d534a23a31500a0ac958d9634b84f532bd73ff1aca1bb8f7debbcbebc16ff39a  LICENSE
diff --git a/package/fcft/fcft.mk b/package/fcft/fcft.mk
index b9ce43b454..40b2d45a8f 100644
--- a/package/fcft/fcft.mk
+++ b/package/fcft/fcft.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 FCFT_VERSION = 3.3.2
-FCFT_SOURCE = $(FCFT_VERSION).tar.gz
-FCFT_SITE = https://codeberg.org/dnkl/fcft/archive
+FCFT_SITE = https://codeberg.org/dnkl/fcft/releases/download/$(FCFT_VERSION)
 FCFT_LICENSE = MIT
 FCFT_LICENSE_FILES = LICENSE
 FCFT_INSTALL_STAGING = YES

--===============2817401423316416166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2817401423316416166==--
