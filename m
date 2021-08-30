Return-Path: <SRS0=17BZ=NV=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF78AC432BE
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 20:13:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E76960F5B
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 20:13:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5E76960F5B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=fastmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1190680F91;
	Mon, 30 Aug 2021 20:13:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L67PLXyJ5J5M; Mon, 30 Aug 2021 20:13:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76BFA80F93;
	Mon, 30 Aug 2021 20:13:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D90D41BF2A4
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 20:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4B3440244
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 20:13:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=fastmail.com header.b="UZk0xiXi";
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.b="EpbiCxtz"
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g63Q1lqjeXiO for <buildroot@lists.busybox.net>;
 Mon, 30 Aug 2021 20:13:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0409040210
 for <buildroot@buildroot.org>; Mon, 30 Aug 2021 20:13:24 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 1E37C5C0198;
 Mon, 30 Aug 2021 16:13:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 30 Aug 2021 16:13:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=UGVeMXrIfJ/2iTg6egVpUXBYQ2
 Kcu4c8oedP2f1F/Oc=; b=UZk0xiXiJkr4+bSnR2Sk6KC/dG89KoxlRj35JGJWkQ
 9jVJpcpxK3UYXdsch2IaIL7gquY5WBn6Ve7Z5t/ja1EKLmMjtNf6lnZpcUfX0sPO
 sL9kTfdtHEn/hLBl5f3ppJg8IitKb292UXmUzqv2b3YCndcX7Una+64pi3tB0vkK
 aaOBAVzftNO5kbk1HuI/ThGLEJZ6bvw5wpVH5H6pcDol10OeiHfyKufOCJCgBA6G
 y/FHq0XLb0Yr8jgN6Wkou1nfafSl10mBBNgRWY7bU1hO4i4d9qJTYhPR2To+CINt
 anE7aoErJ8it/lG05mVEhrRUJ11kTF9zsEZCGuJDOOMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=UGVeMXrIfJ/2iTg6e
 gVpUXBYQ2Kcu4c8oedP2f1F/Oc=; b=EpbiCxtzMI/4uDvgqx5DKPUcY7bHitNW2
 APblx6ueMcARLkxx6mEAjDPpVd+38ubID3Tn+tVnBywpJ2hjBrOIRp28qUt9wXME
 1ikpJruUaK4I3UogOjyhk0/TeT+lNRHXG67k4Bap4M6S3ZSwhGJh21qvlzgb/AnS
 Muk72XodB3rgoy8JD680ODuVjH0UvMqP3ELPRSE4gIhq2V8uzx0t88F+vZ406PkC
 Aa/1nP+PdjPMLnO6RxsrvL+eE/jObH8KIRQuApWvIZGiLyrs/MPmtBDqVrmK/afK
 14gPNDoLFgka663lBxrWtUPyclgQq5oxe7dJhiQFKVRtpkrz0UBjg==
X-ME-Sender: <xms:4TstYeb2QGe49jFB0wp4R6fXr9yrgipRpcAOjxoDo3t-98yD6f15Bg>
 <xme:4TstYRbgeazeHcrEKGNbFIFjm8oPMS4fw2giiLKJuq94pGOh23vJPiwXDYqltwN_0
 Ok3rw8crsFZvWs7QH8>
X-ME-Received: <xmr:4TstYY-F4I7VhcsVaIs2Xf3m26f9dFKvlGQxWnbxU2NUIHi2KjBapH55bBaD>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudduledgudegiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
 ertddtnecuhfhrohhmpefmrhiihihsiihtohhfucfmrghnrghsuceokhhkrghnrghssehf
 rghsthhmrghilhdrtghomheqnecuggftrfgrthhtvghrnheptefhjefgffetudfgieegfe
 ektdegfedvgfevleetueejhfettedtvdevveeghfetnecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomhepkhhkrghnrghssehfrghsthhmrghilhdrtg
 homh
X-ME-Proxy: <xmx:4TstYQrETvQvF0VLC6wEqBPV-IuFqmWJLOK0FNzCrHi0ElcO_J9gjQ>
 <xmx:4TstYZo4Jmvd2THZi3iz9veRUy1nOtqcjEUV6aERLHv7bY-w6MCOmw>
 <xmx:4TstYeQR_zAiREFqpvMHmFeUmyKOuQUQLGBZHDwjro7U48ER-PVwtg>
 <xmx:4jstYYQl3SRJTGt0fn1Wjd6p1LVx0Hd80u9dk6bDAuaa6a4LluAmjg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 30 Aug 2021 16:13:20 -0400 (EDT)
From: Krzysztof Kanas <kkanas@fastmail.com>
To: buildroot@buildroot.org
Date: Mon, 30 Aug 2021 22:13:08 +0200
Message-Id: <20210830201308.143849-1-kkanas@fastmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1]
 package/environment-setup/environment-setup: add zsh
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Krzysztof Kanas <kkanas@fastmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

environment-setup used BASH_SOURCE which is bash specific and empty
variable for zsh (and other shell's).
Use $0 which should be work across multiple shells(tcsh, dash, zsh)
It won't work if other script is sourcing environment-setup.

Signed-off-by: Krzysztof Kanas <kkanas@fastmail.com>
---
 package/environment-setup/environment-setup | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/environment-setup/environment-setup b/package/environment-setup/environment-setup
index e9bc36fdd093..2b54e88d6689 100644
--- a/package/environment-setup/environment-setup
+++ b/package/environment-setup/environment-setup
@@ -16,4 +16,8 @@ Some tips:
 * To build CMake-based projects, use the "cmake" alias
 
 EOF
-SDK_PATH=$(dirname $(realpath "${BASH_SOURCE[0]}"))
+if [ x"${BASH_SOURCE}" != x"" ]; then
+        SDK_PATH=$(dirname $(realpath "${BASH_SOURCE[0]}"))
+else
+	SDK_PATH=$(dirname $(realpath $0))
+fi
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
