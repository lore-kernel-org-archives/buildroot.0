Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D2A5CCF2C9
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 09:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A22740937;
	Sun, 18 Oct 2026 09:51:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OpO0Fq1x5kDy; Sun, 18 Oct 2026 09:51:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A8DF940966
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792317066;
	b=UeSTnc8m+PMZxkKtuNg2ieKMGkQlL+Ha2nae4SjSHOh7NxCeRMoSpAr9uoLWZvFAIBJP
	 kAb8T15fyShMq7Gg5JwtfHxNq3iNLWc+ddV1+gmEQULjx7dyy8UJ4BCYgxcTMpNB9T7dc
	 w42vIedgIa5F6+ISR7OgUHV5nElty+yPDoL6uQiKxUDx4FVWyTKRYGQsYeefcuGMQyozn
	 nMULq91tpM+OsTn62w5krZzP+lZvJYbFzybXb/QVLjjzVSx8pj2J/RGx1Enj4DG9Wq1gr
	 4dAplyJf4xLFrYNy577lSMfWlCTqEVwhAk8PxFtV8MeNUjQHtDMg/nZtiFNtYqxSfnA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792317066;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=JBQKBQIKfGQKruCWg8o1xP+JwSZsrX2LQgxglZoe8wo=;
	b=S6EKjRbm2N1sa4HZgzBD7o2J0rGfxoxNqEMHJCZoP3qL2ikiFvmIFt6voz3NLvVJ4WUi
	 lQvySOwOqTpU+AqU+qI+erzBcYOMF4lF+NoPQfCtyBmoSUK3DVL8cd0YUfoHbMOlRfUAf
	 pVHkcHp+GVfcWKyytfe9hF6ERA2f9HNH+erdEV+RYu6niguYM1KZTFkmvDzqJBu3kmLuW
	 n/XQ4DKn1ZZqCypjk6lG4ra1OHd6O5WfMo+KNbhn9auiOCJswOuWzu0VPoIrorRrNBeSD
	 p6ZnseO4KlZ1dwt7lI5FBjN6mwkivKDxWTLr7HAiL+RUpDdb+CSq97qSvFHhPEQ/CYA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792317066;
	bh=JBQKBQIKfGQKruCWg8o1xP+JwSZsrX2LQgxglZoe8wo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DhAOz0bQ23x/sHkky+jtVybvwV0mYbee/9wOli6I/MLRagTDrT9wG50dtkotaelYa
	 LXseo/PMU3AbRHu5y9c5w3RkM0rK65XNqAevJeGotpTAzgG0+KSJWGNddRwN0mYvo2
	 kL2Zn2OTIXAeEEh8ZHxZushorVBTsFFIB9HUK9hK5YAJMW6mrV6iO6CXXneNcEnz+O
	 /czHxhic36XglX/krCQTsbpTYSK0kzigIp+4JmpUHVJ5xPQ8k15rpeKeb6ix0q+uSu
	 ZKPIab7eWu6RV7QeX+eSYjjeZrT9HShsSaTKfHfW81JwQf0VHDaMJ2NHBTNguMTPHr
	 lrSv9ydbBN5Dw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8DF940966;
	Sun, 18 Oct 2026 09:51:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EBF8E79D
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 09:51:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA52240952
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 09:51:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qEGj6kqXrVLE for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 09:51:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CB2BC40930
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792317062;
 b=Kmranbe7ySYNO7TG4i/5zr2gsDLEawbtBz2vBm27WATzUZ8NJRV/MvRJn2nAa2XYu7Kn
 wrr449/tKyWcWGyg2zDXN+dtxqxhEElOszskPzSldaYeqC/6dJBTMG4kXNBWS8kx7bztJ
 oJ1zroJMVOXFAgUHTSnisB7rF3AFXK23OARqVEPvIG5/I8qlj8+taZrvFmbqtwmAJh9NV
 5SGpkNyWXV9v4x2YIR5wxWYq87wXuqyoGxb6HFqI6UxZ1bu/iTueeJmpe1miJsH2FvoZ9
 m4OpdpPPtJizipBpT3QQ/grTD4CcO8jV7+dB1JmwPmCqO7fBKc8PcrrjpUQ2FpoJoJg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792317062;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=rPN6t686ktOT96slSxckeFjEZXXUBfjXwM2lvy9hDtE=;
 b=NxGWES6DC1izHZGy0cB7t3RaRyVsCkUEXY8j3Kj8VcYvwLWE1shE7HzR+fVXddrU+Thf
 vbFvZ0dn2sBzlpZ01o1OZ2IhoHJKnmD0mkmSGadVunGvkTgizp4ZmJJ9x+y8ntg1pxZtt
 bJbhlqvmcXHITl6rJF0n+XTMVu31r5afnGUoL2SGovSUrap5vA459i51eqIs9ctjMrI2Q
 YnFOH1erH5Qv1e6xa9QDuTvMcZ38pEod+g6InsSAAO3dEAtwwOIz2x3YGlzlMRSYVzB1F
 aLOS5PJJiFHK1cQrOB+Z0LOmA82kNELoKDnw0hQ3ubQ4NintekreWh1anXMUIZD0lhQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB2BC40930
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 09:51:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C01EB96AD9; Sun, 18 Oct 2026 09:49:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 11:18:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 45fb109414f273a51939e00f0196906a78dc4db5
X-Git-Newrev: f432a9e625cd1dabc7722e894909d7ae23e5e488
X-Patchwork-Hint: ignore
Message-Id: <20261018094940.C01EB96AD9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/p11-kit: security bump to version
 0.26.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f432a9e625cd1dabc7722e894909d7ae23e5e488
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Security fixes by versions:

0.26.5
* CVE-2026-18938: rpc: guard against overflow when decoding nested
  attributes
  https://github.com/advisories/GHSA-6x8p-h5fj-5ppr

0.26.3
* CVE-2026-13757: server: fixed stack exhaustion via unbounded
  recursion in RPC attribute parsing by enforcing a recursion depth
  limit
  https://github.com/advisories/GHSA-p2wm-69qx-x25w
* various memory management fixes (including memory leaks) without
  CVE or details on possible security impact

Full upstream changelog:
https://github.com/p11-glue/p11-kit/blob/0.26.5/NEWS

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/p11-kit/p11-kit.hash | 2 +-
 package/p11-kit/p11-kit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/p11-kit/p11-kit.hash b/package/p11-kit/p11-kit.hash
index 943ad9c22f..ca76eddae6 100644
--- a/package/p11-kit/p11-kit.hash
+++ b/package/p11-kit/p11-kit.hash
@@ -1,4 +1,4 @@
 # From https://github.com/p11-glue/p11-kit/releases/tag/0.26.2
-sha256  09fd9f44da4813a3141e73d5e7cf7008e5660d0405f13d56c15e1da9dcecf828  p11-kit-0.26.2.tar.xz
+sha256  f2cc09111e44bf3fea58f023180b33acea90aa82d042d6fbb623fbc5ba033bb7  p11-kit-0.26.5.tar.xz
 # Locally computed
 sha256  2e1ba993904df807a10c3eda1e5c272338edc35674b679773a8b3ad460731054  COPYING
diff --git a/package/p11-kit/p11-kit.mk b/package/p11-kit/p11-kit.mk
index 60133223ce..b3bb3e1263 100644
--- a/package/p11-kit/p11-kit.mk
+++ b/package/p11-kit/p11-kit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-P11_KIT_VERSION = 0.26.2
+P11_KIT_VERSION = 0.26.5
 P11_KIT_SOURCE = p11-kit-$(P11_KIT_VERSION).tar.xz
 P11_KIT_SITE = https://github.com/p11-glue/p11-kit/releases/download/$(P11_KIT_VERSION)
 P11_KIT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
