Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20FD1C79F9F
	for <buildroot@archiver.kernel.org>; Thu, 10 Sep 2026 19:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF68E60BD7;
	Thu, 10 Sep 2026 19:25:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nvxBkgC8Q-6s; Thu, 10 Sep 2026 19:25:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0083660B0E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789068345;
	b=ialJb415Is2FCbiPvByCQjLJgGxJ9ScHtUfHSnFVmJc7gXKxUahvnTFlwRK5QWbZxvk2
	 kTuOWv+yUWgLUSGWHRMh3AbvXIOrbeBSLvJVLDNdf2xH+Y6qfoiRfuJ7vc38EiDkVHAsN
	 zFtM88ETdzmIgA+U8zMpECk4PoWmxUT0NqrFwtI5L/mYk0ubEYGy/FK8wSmfKeOLMxuu5
	 O/3AQ/gnnCebGMczpbc9x6SlOG3LLnhqL+P0zkVKrT7EyARhq2QsoFDkipH2X0HZ+Wqz+
	 1JvKtu+Rt5qZTkf2o3EuaCj5L5XWELwLPd0W3uX7cqRLI0fZ53J5Chg7vYjBfDZd6jg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789068345;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=fTxzMp/flAzCADiTpAk4Jjmc7L8kX7lcfepI5NQ5zIE=;
	b=lzUmIlZcxZ6sJO9cyy7p1A9e8tQtph+OhywNqEk3FzEXYwp4005aroQZMGTWkA/nGPtd
	 xXCXLmuJWW+am9Oosswj0txrkeOfmYck+yzPGUs7B0fHxuKmV27EHisRPd/+Obap0EXMg
	 pOjNTPMrxHWRJSVvbMxcOYWxT5mnNi07jMCuYWvtJ4PSJaZqLKusqEqfcNUQ5vHFjLADW
	 UMQwG7JTYuwj+oV+6yPKN4NyFf+qJd2KWNAkUUHmGAFsgIMLHmMqjOsg3IWJNF9+/Re56
	 k/aj9KPZM0o8gzqa7Xx33gevo5RYXCxeYySTrXjrxs633w8AfehQU0N1EGMb2VuJj/Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789068345;
	bh=fTxzMp/flAzCADiTpAk4Jjmc7L8kX7lcfepI5NQ5zIE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SJkCWOKCLXfwjcptWeaPnOg+3XsAydNBT2gjae9/5z6M+nLjB0DxY/GhEJc90/MbD
	 e3atZHNkoN9ye5BUFf2obDhMljmkaDBP3IJtzaKmolAJK2YO4mV0smeD/F6iMo+jKM
	 +XMzskafvn2ItbdX5jFnKGvQvbjXUzmhP+vlabnoXTpOfG+R1ttZ+S8Y6WIP4iN3Qk
	 s+btrfWs5FeHljieZyNXLiDjiNqBw6HimmoL4BSeRKREm94bsaRsIyo2Rw9mgRk9/3
	 ARlRlR+P+Up2oY02foGKqcdVOA8jzh2F8me2TiPHBUFszBT7upuno01h6trbjGavvS
	 7y+GwWm4EBnqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0083660B0E;
	Thu, 10 Sep 2026 19:25:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F397243F
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 19:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0F0B40839
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 19:25:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wOUegUJIEzUU for <buildroot@buildroot.org>;
 Thu, 10 Sep 2026 19:25:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 432A34082F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789068343;
 b=PNQl4qBfTqS27JUSjuGhYZqYeYIpMAZF9FcY6uZ1OIURjk2qAE6WQu8erHOi1APkYUmR
 /R7L2diMz/FD0ANlseThjcJuVFxwHEzM1zPCFan6puMXgL5ZKQswgvtCSkTy5cX994AlV
 kbE1GBJWmEAOD+oFapRv/j3PYqsuG1fancDxYqEi7kBTuuJx3QEoBTzVICLCB2f0Ml4ZW
 AOTg+8W7uuT0LhvWDW58HdvpDO2TxqN1WqxScmaLaKgZpBHUZLbUc5J0GqDKNSGrK75ge
 kMMxPiHorcL/4r9h95Lr5Ao2Ti/AVGuu7xsuIW3ezRAmMF9QtHTz6dloKBJYv7V4Tvg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789068343;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=afd8WXsVVWzJ5vSjAOzgNl8AJ+FNHRqmz6zKh8vFKEc=;
 b=A4SJxL/SkntqUHiMTF8rf81+kbz0Md+dThLL+jMObdeQEMVBHoCC2Y5VlSbeiaHoFCR3
 t4c668jlL68w/vwNPbsfATzoiD6n95kozl0rjkokIPAlMo+mS3m3in8BJk9YnV8ANQp7W
 5YAsjF2at+dBrU9awavE831a3EMVMSAUmTsgCeoCwsk83HOv6wYCINXwBD7apeXJq8bYI
 mEZ+NgyIhtgaxdjXJbsc26z+dflXsOw6W1aGO7bfp4vcHryWjUXHXazYhEEfo7lBZdKZr
 ZLuRVWL+lWGGFkXO/xeBXjscYclWCWa23PSx2LpvVdPj6UmXZv4FFazCvr53HrW152g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 432A34082F
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 19:25:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A683194A7C; Thu, 10 Sep 2026 19:24:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Sep 2026 21:25:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d705dc5d96125bdd54b9e7087145236ede07c4b4
X-Git-Newrev: 8d8eb658ce9a086fd5dc2601b10c7f7945d44768
X-Patchwork-Hint: ignore
Message-Id: <20260910192439.A683194A7C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website/download.html: re-add the old
 stable
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8d8eb658ce9a086fd5dc2601b10c7f7945d44768
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 docs/website/download.html | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/docs/website/download.html b/docs/website/download.html
index d3f010fe07..aacb3f245f 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -70,6 +70,32 @@
             <a href="/downloads/buildroot-2026.08.tar.xz.sign">[PGP sig]</a>
           </td>
         </tr>
+        <tr>
+          <th>Old stable</th>
+          <th>2026.05.x</th>
+          <td>September 2026</td>
+          <td>
+            2026.05.2<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.05.2/CHANGES">
+              Changelog
+            </a>
+          </td>
+          <td>2026-08-29</td>
+          <td>
+            <a href="/downloads/buildroot-2026.05.2.tar.gz">
+              <img src="images/zip.png" width="24" alt="">
+              .tar.gz
+            </a><br/>
+            <a href="/downloads/buildroot-2026.05.2.tar.gz.sign">[PGP sig]</a>
+          </td>
+          <td>
+            <a href="/downloads/buildroot-2026.05.2.tar.xz">
+              <img src="images/package.png" width="24" alt="">
+              .tar.xz
+            </a><br/>
+            <a href="/downloads/buildroot-2026.05.2.tar.xz.sign">[PGP sig]</a>
+          </td>
+        </tr>
         <tr>
           <th>Long-term support</th>
           <th>2025.02.x</th>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
