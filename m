Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE472CC6B12
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 07:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8912160765;
	Tue, 13 Oct 2026 07:45:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0RXpyACIByPk; Tue, 13 Oct 2026 07:45:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8ADB660761
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791877558;
	b=FxKH/y8PLUtvaXb8NNpaIfZsX+oSASL1TDk7YwIS3sbECjWQlmxRBqobKymsM+BUZhK9
	 4APwSvSfgemVeVAA0K2Cnu4TFg1jW3uvvRR7y3ULnFyPa8wefRQ28moVgDTXMqTjDQYrw
	 x40pdF5wqIfeJQNlv/Kqy9brZxwXOvS9El4YEK21I8Xer7n6oTfmtxzRFlqrJJC8Wwuel
	 IxTJu/FjOww8v8FZtMXKFXmUCXTGifjVybjDSFeE9K5DXD6VJyO+Jhtkw+nQkITEoVr4A
	 wrtsbzljQTy36P6Ff293Ixa1Qc3A9qk8D0Y67ACbpgGWMc0xa2T4qNlASED/ryVRkfw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791877558;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=2dHgPKYDOD8lzPC74lxYyE/poQ+Uwal2++X5F39FYY0=;
	b=OJiwgAwnFnoXbiF/eUXQcJsa5OGUh9xW4NFadsNl3A5Wf5NcZB7f1ytXEkVfvZeI1qc3
	 EoVFOShrW+/ohKEps7eLVoVUFAWkUGvBXP+LfgLwCN5JSqCUTfzR1Nutd/YnZwcWXL9yj
	 8DWamiuRezmTGG7vUjOszkG0peKHbioai3TjDbi6RTxt9UvcDAk8OPcZngNth6u93MPku
	 5RfPx0H4X5q4D41zJ70jOnbA4VAL67+CkyEGYKwL0n0KBCEVu1TyDbtfyGJxa5OrJIx6c
	 7iReYpbXFmbsFKcLENXzMAgu5ZcxFwxYd0HE0CXUoT1ZLEg6aOitlPnZi3soDQ5gCZg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791877558;
	bh=2dHgPKYDOD8lzPC74lxYyE/poQ+Uwal2++X5F39FYY0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PwVdLE7L6/WBNrXnm8HJDnV+QprpOkog2WNLOPrSRwmIBisj9RwKiHzT052Y/Fc+o
	 AndbN0CgomjnZQx8+YxqHh2NjtkrrF0tink63GF8XFyyZLmc/M1sZWMOGyqjcyKk65
	 utXcYQD7ojB4zMzNnbvSDKMrtM7bM6TP0XZud2nZw51LHGwgVvl4FGyUYRt15ukMOC
	 sJ/qBoQR0R2bk7bpa0sjJKK7dUb3dM9fpCH2blmp5kMcC/OxDdM4IQ0TsSK2gvqcxP
	 26tr6iWSqjvyXvyEEdXBeMruup1Qv5wm7xJRUp7CTyISmtSqnp5p7dxYYx6+1b6ify
	 mpuM2O6O/mB1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8ADB660761;
	Tue, 13 Oct 2026 07:45:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 34FD1129B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 07:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A2CC40640
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 07:45:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PKxKQPEIVCW2 for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 07:45:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 51FA840511
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791877551;
 b=hf/2p6lIgCyRvwkKtPn2NHlVd4SJVF6T9R747u+fAXK2bYoqZbEyMBQ056ccKl57WzZi
 29pV3isV7A+dhrikKnW/zRGdsxF6H8qNpOMPhxDLTFFycwFhB9DYYTsJppPzADim7C7oa
 z4lAzfZnGDuLvq+UMrfz1TBomBH9KPVXeSACQ4BE3cqiNAJScpw18LUfoxhCj6J2TW8Jh
 H+W+TxyA4r/nSyR6fVcl/0u3F31RaNS09oK3M+hbWNj0Kz9tS+LOLOEQyo+UZ0gnqbas5
 2QW/bqpTowgmsJHnghvqQSn03qfuIeCVmLVIFhXZkaGGqlhiOfYXeViX0wkBS0GRfwA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791877551;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=RejmFpKhpluDE7+hMhPZkHxlAyo37WCyrPsuasJLjFQ=;
 b=S3hJc6hcMhrxnNt8JjOd8JRRjYFRZN8IgwJ591ou3m+MHGKTWA7G7xyjqYM0teaZqNXb
 VM0CWWn3vZe4fohZacawoEnNmPE4EfBFajyD+Vf/DUrs4T/5lA0ywi2TrPQuuH18dcXun
 gvLIo5P0od8fyxnwjhaoqt2gQc8ZNS6qkXTWy37pGdE41v30gKg2wirXtOI33XYs07rVU
 ECU3XkbkjU6vF1kBH5vY03vwedJIkDoJ8ws6GbZL9FA61bH+Ce+pr+UEAQaOYDegOp7fp
 th7Im5RPQYRtxbTMLd193+g4tb5lR8Wr1ByFu6AZAlBe6UbwYhgRiYCPQTirqrOk8sw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51FA840511
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 07:45:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C6BA595442; Tue, 13 Oct 2026 07:44:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 08:41:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a380ee2a164027259cb62c6911912cb93985fe16
X-Git-Newrev: 8424f5c956826aafb286b660885ae7d7d7e61baf
X-Patchwork-Hint: ignore
Message-Id: <20261013074431.C6BA595442@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-http-message: bump to version
 7.04
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8424f5c956826aafb286b660885ae7d7d7e61baf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-http-message/perl-http-message.hash | 4 ++--
 package/perl-http-message/perl-http-message.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-http-message/perl-http-message.hash b/package/perl-http-message/perl-http-message.hash
index aec6102ac3..32dcc186cf 100644
--- a/package/perl-http-message/perl-http-message.hash
+++ b/package/perl-http-message/perl-http-message.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  fc958d64205edb2c76e1673424523932  HTTP-Message-7.01.tar.gz
-sha256  82b79ce680251045c244ee059626fecbf98270bed1467f0175ff5ea91071437e  HTTP-Message-7.01.tar.gz
+md5  1c3e66237697af8227a790ea8d71c57f  HTTP-Message-7.04.tar.gz
+sha256  699f3350dbb7bd8fdc9f3b013b0c91b7c059783708443e39bc395fa33352f006  HTTP-Message-7.04.tar.gz
 
 # computed by scancpan
 sha256  ad83c994e0d5899c09dcab1a45da14380f8f99afacbf383f759c05f8b8e21e60  LICENSE
diff --git a/package/perl-http-message/perl-http-message.mk b/package/perl-http-message/perl-http-message.mk
index 13d6b458cb..566995b455 100644
--- a/package/perl-http-message/perl-http-message.mk
+++ b/package/perl-http-message/perl-http-message.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_HTTP_MESSAGE_VERSION = 7.01
+PERL_HTTP_MESSAGE_VERSION = 7.04
 PERL_HTTP_MESSAGE_SOURCE = HTTP-Message-$(PERL_HTTP_MESSAGE_VERSION).tar.gz
 PERL_HTTP_MESSAGE_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_HTTP_MESSAGE_LICENSE = Artistic-1.0-Perl or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
