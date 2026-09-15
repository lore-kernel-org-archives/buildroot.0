Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C502C88E75
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 17:31:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C62A606F3;
	Tue, 15 Sep 2026 17:31:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bBEoJ7LazYFa; Tue, 15 Sep 2026 17:31:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 76D8F6075E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789493506;
	b=tYOC4q4skhUxMMXL9mMgxrA/N3A/lwIxj8zGyMTo85vmm2wYO+3NLXDIPaJM0a+Ej8Xq
	 Yp35KrD5yoDyQ9SDCDFBjl8bhnH1bVAItnrEQwBl+uNHS07QY/+vAWp81r/TDuTP+Z5fM
	 td5cimItKeTukCAHwy4xWv0Yit197N+PC+d3iATKAeq5TRCtY7gSlBOywAXAs9rzqV0J5
	 K4ErKpov3lx+Zsq4d6l/TJjWckwlPUShtY87boNsY8wxcAfSrSTQK+p01lM+wq/vO+AW8
	 h3ZQdEkOAjC+kkMy1SOl+v6579ErouQTk3L6xjAqn/+1xi1YKhw1V6rW0FUY3Gc+X9g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789493506;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=rqWLouIGcApsjECEmtm5XXRvLn2jhHa/DzSTXwPv3bs=;
	b=U2DwehSL8goD8xl2PWF8UAsTl1LaOIPRnwT6hV9iMhT5zzKZjDhnuX9KMMLvcPsljccJ
	 f5DPKiMrCO6fATYwI2qN+k6o8IhzrIn4U8j2awSKhDKU5niP4SZYE8aC8t64Uy2YIdqSb
	 fwEBtak947wra3xVe6wFqgoP1k9EV4nKIxcUb/cI/TAML9dVjMy22FWinS/dSa6UJVYWz
	 dWZ19o5fWJaYZKcLOlFTw0zOWSpGGClLzaElM2aywg4iysmtlsQs2723LJ4pD6U87CO2u
	 jzYf1plJVoKa70ftriE5XuC5NWp3EHYpQ217ZgripFC8AgSAeiKwaYEcHhy//c3a7cA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789493506;
	bh=rqWLouIGcApsjECEmtm5XXRvLn2jhHa/DzSTXwPv3bs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=I8QS9tOkD8P4FsDx6GCYagWbw/2ebwZRp58vWQqrjteW3P3hBignvzyuRimuBZDA6
	 6KL6dWz4wytMEbq2/bih8A+Rh+r9n8WhII5mSCqsVrgg4soohnmLoRtfcE+j/PEFr1
	 PZyQE2/g9+HQt4Zlv4WzXBVyL3nk1akbenP3iiyeTd/YMnMv+YEah3M1wBAPHCPp5f
	 tH1VdnqP4+WFpYkEsePKeAIMf5sZ3WPZ3QCz73n1gPPo6nNTHniC4TnE3Hvcr9hbhH
	 XL2IOf9n6IQinSKo0HfnrZPkJcMosupZFBcZn8B7sW3g+Bs+2plWlsvQIg+sWDC7Pq
	 bFqKcXCGlgTyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76D8F6075E;
	Tue, 15 Sep 2026 17:31:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DABC923F
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C133880986
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:31:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jdl_cQ7pc1Yc for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 17:31:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 24D6B80E2C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789493501;
 b=ZgO3ePZHofev6ObU3rOf/IFsG0jVZf/TVBB+39Gh1aGmfNgH0mfBAoy4zabU3Om7LU5H
 uyCJmHOqF1pm2AKeyPitggSDoUkwJq5zRmucAKR7iC4rhfCC0d4XaRIxur4pviWoEfG8z
 PeWhCw5RlxRdwAshCgqyoCJtvNKKDaAjOQIuO5Pq0KRrAMS/LscaH/G/o8awkjFY1l46X
 0QAoWt43yuglEu0zAA1pHiZ7SEfK1dZd3LCaeqxCdyyQ3anzYDldI2TfHql01jhmhBTzH
 zk72ET1Ndj6e3RC7cp/k/pkS3upghW1kmmZKVbhoOckTwnhuIxvq9fm3UKzYAGItxSg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789493501;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=t41k2DOvPPdfjNR+UpgLzWLBuYohIuuSma5SGWU6d/0=;
 b=QuRiA82Srcq+H2k+tbNERClQepJRzoxN3w5PLxygveyeMb8dymurP5r3y6lMSlQpGzdt
 Ayrwc2yRfvW7JNHa3PqfSpUy0Bbtc8Xi8ddRMJW4GBhSOy0kGJ7rvlWrm3RxieaSYIPG6
 tMrsvBvNfB4DCC0/G1+VD/Awc0OtDBF2OFV9DuJEqVyXSILFh5DxNuzpnOmyKf/ivPJKG
 n75Fmdu89n8F7o1DvhUYdslmZ8JsURmokY7QXSWDNYvzqdOHJCWs68Q5l3Kazinm+xNnn
 foGxsMYgAVmjANg9l5QlCDEdca5hOBVwo9plpWyf0qYEY+/apGBBvXgC5rydRShqeAQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24D6B80E2C
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:31:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 19CC795CEE; Tue, 15 Sep 2026 17:30:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 15 Sep 2026 19:29:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6dad789282b9f48d3dbe799c40648a5459dfdc17
X-Git-Newrev: e62e06b19d635e06687650de0558ae257b05ccbb
X-Patchwork-Hint: ignore
Message-Id: <20260915173035.19CC795CEE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xen: harmonize
 BR2_PACKAGE_BUSYBOX_SHOW_OTHERS select
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e62e06b19d635e06687650de0558ae257b05ccbb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

BR2_PACKAGE_XEN_TOOLS needs the full blown version of bash and
coreutils, so it selects BR2_PACKAGE_BUSYBOX_SHOW_OTHERS, but it does
so only if BR2_PACKAGE_BUSYBOX=y. Which kind of makes sense, but is
not aligned with the vast majority of other places where
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is selected, where
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is selected unconditionally. Harmonize
this with other packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/xen/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xen/Config.in b/package/xen/Config.in
index d63a3f6002..47f9dfa6e4 100644
--- a/package/xen/Config.in
+++ b/package/xen/Config.in
@@ -35,7 +35,7 @@ config BR2_PACKAGE_XEN_TOOLS
 	select BR2_PACKAGE_YAJL
 	select BR2_PACKAGE_ARGP_STANDALONE if !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_BASH # runtime (scripts)
-	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS if BR2_PACKAGE_BUSYBOX # bash
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
 	select BR2_PACKAGE_COREUTILS # runtime (stat)
 	select BR2_PACKAGE_QEMU_XEN
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
