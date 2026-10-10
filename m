Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D5FCA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 08:54:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 663FF813F1;
	Sat, 10 Oct 2026 08:54:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aoQLas_dTZ5q; Sat, 10 Oct 2026 08:54:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7A007811E1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791622491;
	b=oiEqmbXoPqnJheXKF0USQOAiiAhIikWkdmlxp652yJlYxL4lNa1QCvfZCk5dy0o8ihQE
	 ZMuPwMgBcS5m+x2yB/Gg5htSV9MPozvQoMWB0o4lrZjX8PiBfroEo6HD9xBBqIwR3ASbR
	 FSq1+afH8LlTqJCJaIkdORAQQqnT1G3MwQ3siqyRM40yRQZASVDF/oE3QEeGCIVuv0R0+
	 xAuayD0sf1/J8QxuFjgvoetYkjZUHjkaPkFd9Fw8ryW6Vk7CToeJ9WiJyc0pcjnbX55wc
	 cELuPkOM3maCKVkGEh5e5ZnsAqgabpHbC+vyZHNVwZTf78IyV7RZjVwi3JE48Sl4z9g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791622491;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=bxuOx+NLD+db8wzFdKVaFxyyL/UFSpN1TDf70wyXXi4=;
	b=SAkv6ec5u4S12mmcvaWBenaYlmOMW5eBxFNibsViUgv3ML9Ltvsw9g4k3pzVI0nhOr74
	 dM3PjQa5sv8oXCxotryMb+ksdqdOeFqtglBkuT0J9MHrvMSHubCPq8hi3euW2CqZD7B5v
	 SVvk6I6lJWtKWQ04umGnKhC3Bgx5XhyBQa6mRGBFTqoPqhFhjOX7kmQgK92M0BtJr9+bt
	 ZPL28oEgFeVmKR1s+5DdKEmCb/uesLJMntvqPGmbKPZBYNTT8ocEEIw615HkqiSKBiNLy
	 Kb2+JyguR0lCIqKjDtLvxuwHbflVKPR5rXJfpRD3M4+1kelouKHQiNQF07dT7EW/SRw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791622491;
	bh=bxuOx+NLD+db8wzFdKVaFxyyL/UFSpN1TDf70wyXXi4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=adZNj6Tqml6IGWguWSHTnr7M/sgdkfSkb2mA5yySHkyPunbvNADxWkjABId403mUY
	 W5oRdvyXQGMJGHzd3TMuIuaa6Nr9cQAiAzUj8C0aFcHZFfQAFcbFL8xwnTAz1pRP07
	 g7BMCCIalprOJNCokVXldnSmjPxHcfJVT4sx6lMZ08AiadHvVWrfsXEfhkO6M6U2ez
	 5LtCXqXdhettv5Dq74AEltxLkiNGVcXsYGdgEe0EGXgF0kWar3vgX9LIXAgAwc+fOE
	 7BFNohP5CuzSRlmuaLD7wvhYh0dunQ8sG73S2tN0cK22d7RgYcbHA9gZIYRoYgMVsv
	 lP1WjNXsM1lEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A007811E1;
	Sat, 10 Oct 2026 08:54:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E226C111
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3E4E4006F
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:54:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6obQNXjW4gA3 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 08:54:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 152E440004
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791622489;
 b=m1tfMk+uZk+MO3b6lSra48hWn5cUMHmDp2Lo8x9HToKOc24Gvjq4/pRVTjlcwjP6dx2D
 Sh4R5+wGopDx7whnxij6M7YMCZ0C89kq4lc6//USOyX0DR32ReuIMQMdlSr5QMnUGDSYC
 vEvNeeP8RzB0NK0P0wa7Q6xXglaAYX8upO7sOYS1i9dycP8yh9bE+qbN/gxCT040tmK6Z
 PKFMV1Fb9BFU5i4OI+r4XneuWYqijJMpCnQTaEKoD5EOp+ACJXxFDAfV1XuFguQ4Ddtj1
 PIV0h5P9mooQ47sFsW2lMq/GG0mrZ8YJxA4tEvWF0chv2w3mU6Sn1njUpwNXuFgXWQg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791622489;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=blBI1X3XNAMfUvnR4625pmCnmyW2BxvfoBgepACEs1U=;
 b=OxS0WOsIyg5NbyFtD8MkhRTtsvoRj47J7iPWbvIkMBJluDcLWht86BSUFqWfSaQ1Ta1f
 5PsDs+ECnnFcdTB0yH70iclvlWVRB4aDrGewDKIP6NN5pY+BBv4oibrjbn7WtCDeHL6vD
 ARo7uhH70+hbzDgyouXImoDL/+5/iuaG6irmOpOHvwolAc6ghiHSPnAgEp+iYEsKoYPFI
 tWnzGDdgvtp8pJKCoaEjhcIxe6ElwWBVx6Gy7GXUN8Kgi+ZlkYkoGdzGdMfRQnMLr0pjA
 SwM5q21wfJ7vB+oKwMI27q9FS7fc4gXzujbW6A2GDoNB5IX1+pNTGC4Wo6geySsN/zw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 152E440004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:54:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CB1408F044; Sat, 10 Oct 2026 08:53:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 10:54:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 940b418dfc053a2b7fc9601d73a52a04231bc939
X-Git-Newrev: 4ab7d13248ef9229cbd94961baec6023e6827f07
X-Patchwork-Hint: ignore
Message-Id: <20261010085330.CB1408F044@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/snmpclitools: bump to version 0.7.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4ab7d13248ef9229cbd94961baec6023e6827f07
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Switch to the poetry-core build backend.

Use the standalone license file, including the updated notices:
https://github.com/lextudio/snmpclitools/commit/d95f1008c52cf5c3cfaa705b383cdcc44c284066

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/snmpclitools/snmpclitools.hash | 6 +++---
 package/snmpclitools/snmpclitools.mk   | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/snmpclitools/snmpclitools.hash b/package/snmpclitools/snmpclitools.hash
index 575bfbced8..a9d3ed6879 100644
--- a/package/snmpclitools/snmpclitools.hash
+++ b/package/snmpclitools/snmpclitools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/snmpclitools/json
-md5  132b100f5e7b80715e6c1d424e89687c  snmpclitools-0.6.4.tar.gz
-sha256  820c45de419bf355c845a96610a395ec18a15176ac0362d388da7740266ea1ac  snmpclitools-0.6.4.tar.gz
+md5  5284f7f6015696d0312172601832783c  snmpclitools-0.7.2.tar.gz
+sha256  c54977a588bfc4beba83ec77f6294957128de27bb3b86c05f488cbd3d0977b15  snmpclitools-0.7.2.tar.gz
 # Locally computed sha256 checksums
-sha256  ed5561a0f5b75e93aa026c1b9fdef58e7ccbf6b2e9a2458be732afc288209d23  PKG-INFO
+sha256  9ba24bb6f0cd2087d8be50ea116456bb8b171613891c92800e5cac931c6649e5  LICENSE.rst
diff --git a/package/snmpclitools/snmpclitools.mk b/package/snmpclitools/snmpclitools.mk
index a4a90e5bf1..9552dec46a 100644
--- a/package/snmpclitools/snmpclitools.mk
+++ b/package/snmpclitools/snmpclitools.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-SNMPCLITOOLS_VERSION = 0.6.4
-SNMPCLITOOLS_SITE = https://files.pythonhosted.org/packages/03/2a/8488828e92a82c5416e33fba6089283162937b0f73e5b15205fb6ec3bbea
-SNMPCLITOOLS_SETUP_TYPE = setuptools
+SNMPCLITOOLS_VERSION = 0.7.2
+SNMPCLITOOLS_SITE = https://files.pythonhosted.org/packages/b7/64/947b1cad405ba175c03385a4936b930b1fda7ce65e9da5bef5d64a5439fb
+SNMPCLITOOLS_SETUP_TYPE = poetry
 SNMPCLITOOLS_LICENSE = BSD-2-Clause
-SNMPCLITOOLS_LICENSE_FILES = PKG-INFO
+SNMPCLITOOLS_LICENSE_FILES = LICENSE.rst
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
