Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9299CCF2C4
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 14:24:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DE3A606C6;
	Sun, 18 Oct 2026 14:24:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 031RBpWh1i2S; Sun, 18 Oct 2026 14:24:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6AA6B6071B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792333492;
	b=byu6EBvsOvm4Zo97weDzMQCw1UTfGtuZYrqxZxo4EXFTUkSst9uyoJnB+QK6W+gIzlEm
	 A2kmKaFWu89HMdWbmCC4yCIPgjDXXbtAVxhFEMnQx63Oo+V6XN57SCgRcm7w2lCLs4IY0
	 6oLxL/cV1vXM0iRZB0f7oIQCb06+t/Q6Le5bnmP7JS5CyLwablpL0KIdINwzhKdaDPqYo
	 UVfY3zlGZOemeIUze52GCitczpc0qdyUZNCtcQYSW4Gblf6mpjkcyJO7boVFbq8+ifURl
	 /xTVJE/tEcvuxvBuUNQnsIq6DS/CECi9smaLKOPDOE7S6G+xiPooJXC/KFfEVGNtDAQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792333492;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=EsbWKbxWRW/UzjM9TI7M3JuNlNiQiOmlNIUxxySWlFw=;
	b=BBz/rw9ilYw8ScpQSy119QGnZlLu9hdVb5N8/CxIO6nbIJ9cP9QBcLDVrcdsozXeHt3A
	 /HU0nGtpljf+4Z3Xhz0PdH482uPdRieJ1Y1E2Meg3hyIdA/uAGTyIjD20TepUtmom7sW1
	 jEmL48/0dJQiI3Jr4uBvZ261yJVyWPi1hGq1l4xsQRkF85dLZjRIUvajUTa+gQtWvCmsg
	 eYMNZTPFJ+30GAYOR3jHp0p2xic5a8GC1YDh9U3fH+IhP/s087lnTD4FOAlpayN1snllu
	 NZH0KzTNGo69yho7e717L7MTn6PpM1Lqxz1BlOqVHw7C5LW94HmAu7SlSZEQII0LZIA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792333492;
	bh=EsbWKbxWRW/UzjM9TI7M3JuNlNiQiOmlNIUxxySWlFw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Q9HrZVTfKeKGXPsHTo5taPhZvqp8KDtJinJ3Tr+PyK5cmj0BfCNWc0BY3sCGNeAIZ
	 YuonmA7A7YZMXVxDeVOWmT6EJBTGea1eNqhzcRuU05qWsXCDeMl53vWTkxmc379wXM
	 Z8SLcV0OcNZKaue9lQdaJ3lFAVt2bQUgfhSy9vcqdnp9OPfZ5u5la2uS9AknAH/Li+
	 yOyYUuqhYu7lWzhjVT0ucBRtdSm6Z5PS5ispAGn/rp72L8UWT1j4vjWZH7SEL5avot
	 QkPqL68u/N8mj/YH69/D0JN2BW61+VMc/vi3Fmy1c12GaTydgEiB9SN5rJ0pqyPoRP
	 8Jou1qztAk5FA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AA6B6071B;
	Sun, 18 Oct 2026 14:24:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 21AF1769
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:24:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 112EA4005C
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:24:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MjjIzra_Gz3G for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 14:24:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 9982A4020F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792333466;
 b=VavwuU76+7ZSEAzt9srq+m6A28Cd2PTbbrlsKOugnHwZ/E37tg/OLTRVR3Q0sRV/OKie
 dS4rFQpkBqHkeL/tSQgBNNZc/g5mWVWMI4GgVjgNN599y66Gsm9LeL1vjv05WUojIOeWg
 sf8GJtaNS/9jxjBBR97b3E2bCEyfTcwoZT3Iso8YnEsc/t37XIfq5hr5k4VRH1xQqeVpa
 42cg9ynTdg6nCHsO3pgHTcriPxJT4Jmlgoj2v1fkSQIs2L2Xo2pHo6036hVeJwRCJc6Hl
 eH8FjGSjEfEVi2FWUBakq6AjNUrifXqwEnnKm4TlSYkxcZgBoTfBF53bIQRqdssYWcA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792333466;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Yx6vwLdowvjQB3lv5EIMgw9W/j4f5d7ihhcIOGP9d1c=;
 b=bW/YxbHhAvbqjQ58D5Qn/IorVtoxejrk4GiPmngB33rOaBhOV0dtDkrJm8J/XV1PyESS
 ufnL3atnHQKWVPWqLeD/L4sT0KB4GjfCIA7KcGYX/YvQw1z8Q2uE7fE8g2I9+m6aHDDEk
 FMdVmHFDt1NnwUgmMhfBQ/vcHqqHlNnAuSlLNwpelBw1vFF6UDJCPeVE3LAqx8CPKfx5k
 fD+G/1H5v+UwBdgx8Odj5QZIaWvrxmxSirS9d5ouuXTb0agjg8LEvtin9AfWqOWb7yvOR
 tz1ViHdSfR1Npn2DjQN2geevEDpPmgPzBL1ElBYMQgTSrUOAMIkC2QoPsPFSlBq6+hA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9982A4020F
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:24:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 88E469828F; Sun, 18 Oct 2026 14:23:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 15:58:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d2948891d071509337e91126aafd061c9ea246fe
X-Git-Newrev: 279f4b62379b280782fb56cc88ef53f8ca384ae5
X-Patchwork-Hint: ignore
Message-Id: <20261018142304.88E469828F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ranger: bump to version 1.9.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/279f4b62379b280782fb56cc88ef53f8ca384ae5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ranger/ranger.hash | 2 +-
 package/ranger/ranger.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ranger/ranger.hash b/package/ranger/ranger.hash
index b1ae8a8b8f..1dda885012 100644
--- a/package/ranger/ranger.hash
+++ b/package/ranger/ranger.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  ce088a04c91c25263a9675dc5c43514b7ec1b38c8ea43d9a9d00923ff6cdd251  ranger-1.9.3.tar.gz
+sha256  7ad75e0d1b29087335fbb1691b05a800f777f4ec9cba84faa19355075d7f0f89  ranger-1.9.4.tar.gz
 # Locally computed
 sha256  ef973501404bd0556fd47324411fc69679f30daf7128e042eafa64e2c4f9ecb9  AUTHORS
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/ranger/ranger.mk b/package/ranger/ranger.mk
index d8a55b1fc2..dff2d65198 100644
--- a/package/ranger/ranger.mk
+++ b/package/ranger/ranger.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RANGER_VERSION = 1.9.3
+RANGER_VERSION = 1.9.4
 RANGER_SITE = https://ranger.github.io
 RANGER_SETUP_TYPE = setuptools
 RANGER_LICENSE = GPL-3.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
