Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F1DCC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6138A60F08;
	Fri, 16 Oct 2026 13:10:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lWa-ua09QcEr; Fri, 16 Oct 2026 13:10:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A80DC60F56
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156214;
	b=LK39GZRpScUzQHuG6QYBN778/NvQmEFdSf4SI6k8vw/vtlLrtGrY0RpPH4SRaKM0WmLO
	 Q9Hv9e345sIVpVZUNRB+jbTWOpO3j4mhBVXNx3YDUszOq8gCO6Fy4kQkzl2DQ0OhNMR9F
	 FGyzMn1DYCLptU4i8aASlrhR82w4j2axSOUS4bloPP8+iCL9sFkXdB4yl52qIDTpOrIKh
	 w1C6pf0VpvAWN2Qw6NxnL0B6m3NYrzh0lzyzPKDcJtHsuux1MvFviyYo6p8zz59b/w/j0
	 fQniII6Bqk4LNGn5lOg3McFxM1dnnKz0zEnPZSfR351yg++Zn6f0WFVnKHUrz6vhrTw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156214;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=QGA8agJFA0x4dUs2WEjb0b9DhXMU0OKbjpDV2EF1x0o=;
	b=OIab4WKr9Ak1IAAfZ8tiph7kG2ST6BUmyMoXD2YvK/+j2YjUGh50y6UYMsJh4dOpwD8N
	 T9R3/NAQnQHAquFZaENFeUJuUKUZlYQhA8lUPDte5qyTtgylMqNgguGr6K8Ht8OutJuoH
	 ikRinT7hlsARgxfrUpzfaxYBnrkAvsQm95hpOMsQ7yQSiq6x7YOd4yXe31An/hM9NjwVX
	 AQAo6VvDGxMpGFi5bJQzPka1ZXNKyz3SsAdVcw/GibeQ3sKkeEL7EYfPNSNW1k3TLy15r
	 2NBbGeRHJd/KBjrCzUZ8s2q0Y4hHFPk2InDznRg8qS0X2tAPdyvj4fXrVUEdc/AZYOQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156213;
	bh=QGA8agJFA0x4dUs2WEjb0b9DhXMU0OKbjpDV2EF1x0o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=X6mEkZL3VaHQJnvWv0TiZtz2YloEKJKIVHjUECdvurF1BuZDL1z8H1gE+xBpzmr+T
	 bjZM7n849zTLUJzz7L+NFTQUt+aWiObqajIL6coDiqi1y9JFhYay56MrT3Nlvk+YaD
	 F814pptW2GUOejBu6hkyz2Ba9cG34tPMSHJFt8v9UjGruIpGxLgU9M5EZYZBkYWAIi
	 cSYgdZOET2gP2VMGYopyUr8UIjryCOyffOM8P86/qb2ZMT+ffKCOyckQ0OUVv/TbRA
	 yuV8woqZSkiymwFBZLqE6Vt4zBse+3T9WvJCykzzPXlAwyYlv4ebOnIRuYAyS3u30Z
	 oSwq48tMgy6+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A80DC60F56;
	Fri, 16 Oct 2026 13:10:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 23C8B1F6E
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14AAA814A0
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A44V8GVFoK_z for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4B79281489
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156108;
 b=PFFlZ1BvuiEcCOqA6veM6C8LC4RseDUTDZYXty0EcZmqBGe4jTDZQqqt616J9uTbQKSh
 dVBIoH+xlECDw5ESmoXOrxWQXtK6TpCK/XBhEdPS+v+IOy0Jx0jhWLt+53WWHDVaqj3XM
 0Q3SXiFHd+0Mw6u7PR3TMY8PWFan7vKu/OvbQicfkBSyfcGI75z3bgxuNKt95w2A/ewMq
 rM/J2/Hflan2UzqVm8JYrnHNjvnbWnblPSwmt+R0XQq/At5HvqK8htJhF75CVTe/3uok2
 pGobusXlZNztEh+O+RMV+2C7WyyUkfa1pDm1wbvbq32Op4gPYdb8J1Anc54bzpFnTMg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156108;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=veqfrPEIhQa6F7GIUkhUYg0LnwFQGH7dD09UdmIYvJE=;
 b=UZlhe6SuNIspTHmb40a3WegXA3EuPHJ9VnLfRozKg5UpXelGd5JYoPNNtGnTTJzNm5QB
 F9CZHyAUhlorKV0ZDy7t0ZtA8EmfHRYX1gs0SmMd+4qFtc03rKX8bbAmlG25IaiI0x1Du
 132xnwl8a0iTKwflYk8PL2xew94OndVHudqZeAQvkTkzzrK/vtJg+wOLOSWnVe2T4NwGg
 6fzwYOVjwCKCFLeF4Ic34NXuGgmzeIi6N9xjyJmiYQ9vWw+fNxVGoxR8a5/vjWo+33jUt
 SW04TWIDdOHO/doUOlFHfOxgP0AMkTntGYPeOmFf7oo19n6batanGCLjv8i2AlECheA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B79281489
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3CA44960D7; Fri, 16 Oct 2026 13:07:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 790005ab44fadf6389be659291cd51891ebdab70
X-Git-Newrev: 058281ec05d28d792e4d409e9e9fef03190c44a0
X-Patchwork-Hint: ignore
Message-Id: <20261016130707.3CA44960D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/gumbo-parser:
 switch to Git download
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1067247376064410812=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1067247376064410812==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/058281ec05d28d792e4d409e9e9fef03190c44a0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Codeberg has changed the way it generate hashes for at least some of
the generated tarballs (see [1]). Since we cannot update the hash
without changing the file name, we switch to Git download in order to
have a different file name.

[1]: https://codeberg.org/Codeberg/Community/issues/2861

Fixes:

  https://autobuild.buildroot.net/results/7e4e5d6f1ba4222306cd88944b39a75c730db771/

(alternative to commit bde76bfe85f4c0ed7e838c08d001c27a27469d9a)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/gumbo-parser/gumbo-parser.hash | 2 +-
 package/gumbo-parser/gumbo-parser.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gumbo-parser/gumbo-parser.hash b/package/gumbo-parser/gumbo-parser.hash
index ee41f167a7..3f4acc3fc8 100644
--- a/package/gumbo-parser/gumbo-parser.hash
+++ b/package/gumbo-parser/gumbo-parser.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  d4fd158d998ab8302fa23bb01119b434bbfaf7139b59f9c74530a703176cb213  v0.10.1.tar.gz
+sha256  00236934e119254ce314681d3367b59c039e03451ae4c1bb5e3c5f84fa608809  gumbo-parser-v0.10.1-git4.tar.gz
 
 # Hash for license files:
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  COPYING
diff --git a/package/gumbo-parser/gumbo-parser.mk b/package/gumbo-parser/gumbo-parser.mk
index 76fcc876c5..84b95ad281 100644
--- a/package/gumbo-parser/gumbo-parser.mk
+++ b/package/gumbo-parser/gumbo-parser.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-GUMBO_PARSER_VERSION = 0.10.1
-GUMBO_PARSER_SITE = https://codeberg.org/gumbo-parser/gumbo-parser/archive
-GUMBO_PARSER_SOURCE = v$(GUMBO_PARSER_VERSION).tar.gz
+GUMBO_PARSER_VERSION = v0.10.1
+GUMBO_PARSER_SITE = https://codeberg.org/gumbo-parser/gumbo-parser.git
+GUMBO_PARSER_SITE_METHOD = git
 GUMBO_PARSER_LICENSE = Apache-2.0
 GUMBO_PARSER_LICENSE_FILES = COPYING
 GUMBO_PARSER_INSTALL_STAGING = YES

--===============1067247376064410812==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1067247376064410812==--
