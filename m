Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4173CCF2C9
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 14:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62E5D406CB;
	Sun, 18 Oct 2026 14:24:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ocW6QH3Sv8Vl; Sun, 18 Oct 2026 14:24:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 870304070C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792333470;
	b=dtHbdz0/o1rTdoYMNdw7NCXtlFruCnYybxWAa/naJcOo4eDvxS0wzO1PuvqVJZHJaS71
	 wJBeq04wqiyWc6Lo2t+Qdl/rs15K3NpfKpMDafYHc4ew4083l47eimprEoHguHpY1g9RY
	 BVjW0UcsnG8R9bv3irt17GRpQH068Pwu6nwpZ350GmwekHLoYLP41blo/wj0OClcDtQXm
	 y043Y9Gf2WjOEGH8JTzxj9S7xTNzlqZWFQ3JmoCeNjpQ2kDmS9Ugkr96IRom60fG+A30V
	 hqhvxcFS9LEtyBhm45rY6tznf5UsMt2QykAXFH7fZ7gbeqdEgm81J0bGzIga9Uwpr7A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792333470;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=L9NCTrPfYE2OmiiK8dq+kbULNZsgrPfUKix7uygMgkI=;
	b=cvIP2pV7ypEKXDFp7Zd5YtxqClfqX3w6uz5NZqbcbGgsrhqIE11/x8cfN1zBbsRLsy+d
	 3xH4dzpY9MA4CYD02Toeu7oU2EdRWd3JucKH/9MmLoC9edldhgREmuEdYq6buhFtsL2M8
	 jVopVaRHaqMoUX038g51qLfx/Q+YU8rJKw+hs2XETNqxcCYG6wk/4A5j5p5/psp8LwRSM
	 cDL6AV3PPBsq67fwp/xFOrFcei9M2L5MiZaK/D6Ga0p4B2PzycSBDKXH/oUqrqUjwvRGb
	 eZxfMdmtZemHbS6Q0M4LIeztIWp9FA11eyQ4TlhtA0G/YewXF2tZgJaydhBjvJbDc6w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792333470;
	bh=L9NCTrPfYE2OmiiK8dq+kbULNZsgrPfUKix7uygMgkI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ajs37XkBc3eB/NQ9oZIPofR8B+wNXTQWUNAa0hk+pyV5tsIw/Fvlbc9DcxqbHrM5I
	 ifPqHG8pksa1Jw5J1XblACsykmXfmtfumAEJ7RyWtUDlWU8RHcic7o55JlFr/JA4hv
	 SUL5+2tL+/NrQLlpzXcV/R/UiXMYDfbNzpRZ5GlpvWmC/XRJCMkOXCCk/6hwPT0Jg6
	 Ui+O0RIqfg++Hl7ELpITZllqNRmsCDUFK2EV6R8XbNykSAfAHqFY1ERJsI6BpMWUl2
	 8yIoEdqNNkGXAmGqc+LdbxHlQZhGaSKPJ/oKiFrABAjLTkKopMzH/Qg9cKUV4D6Csh
	 1S904QFToZfIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 870304070C;
	Sun, 18 Oct 2026 14:24:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 77D1061
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 758F54070C
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:24:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gfwhBkxjDc19 for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 14:24:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C2F23406CB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792333465;
 b=LMbiWAGXAsQJtL78rxtI4n/6/pF2BKF2eOvdImxF5K89QY3JRhYxvICvLj1KillO6PDm
 hSTdQKZGpMdE5BWEOMtQRRCLK6YoMN7Gw+fMtWznaBtKbIxeSF+YNMf+vJ6ITdqIRutAj
 qI9l08Dt7TpUV+cfSZl9p3D/L1y4d/uJLBIjiOghg57Zy7ojergzPxGH/WT90Mc2zSehv
 QVuuWeT2eDmpECgXx/EkhikPbgEfeO3+7eDezvtpgPGpgVx6BwUv1qCuW75LMT+hdQYxa
 MZoXVG6lvgFETULlT3DTnmP7AWZHNaqJ4dHPPpdz/UIf6Lt3JKj/1X0cHKaAo4W8gGA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792333465;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=LDRzQ/ax+/vsQKahZqqt93d0//XqW7TEFGvpepEs3tM=;
 b=EkgZsd8lgiDGvtZWF9NEFDV2VWjXwwCzMNFwDJMG/iMPhRnR47KzTCWk1cOzDzQQk8QP
 aBxPL+Np95igdt0YHJGkqIphLy9/WJevqReLAdhnjFydBnQ6XARgiOJnKUxnBjrbRUUKq
 6EcN26dPZGNYzCfC0kQAcQI7GjkXkZcmf10Q+DvdwEVJqhHKHP7FltbgzXa9OBi4ormeC
 VVhk4zo2EmnOgVcuNpVV9XR/SAO3zT456EuC404Vph9af05CGDtkkH9JpnbdOdsAHuhes
 A9SR8ULB/LlFq0TdGrPyrZ3XTcLzRpnUyYsTNwmtIj/it0m6ZEARXi7kwgwGaUVTtoA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2F23406CB
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:24:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B1FBA976B0; Sun, 18 Oct 2026 14:23:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 15:56:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d0230d3b8ef9c21873593d2318efe6da525d1c84
X-Git-Newrev: 8bbbcc67f0cc462851d69e22d0dbb08e1af5d3c8
X-Patchwork-Hint: ignore
Message-Id: <20261018142303.B1FBA976B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-entrypoints: bump to
 version 0.4.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8bbbcc67f0cc462851d69e22d0dbb08e1af5d3c8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-entrypoints/python-entrypoints.hash | 4 ++--
 package/python-entrypoints/python-entrypoints.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-entrypoints/python-entrypoints.hash b/package/python-entrypoints/python-entrypoints.hash
index a8deb85614..55161f1a50 100644
--- a/package/python-entrypoints/python-entrypoints.hash
+++ b/package/python-entrypoints/python-entrypoints.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/entrypoints/json
-md5  3acd8b72119a8fb1eac7030c24ac6b49  entrypoints-0.4.tar.gz
-sha256  b706eddaa9218a19ebcd67b56818f05bb27589b1ca9e8d797b74affad4ccacd4  entrypoints-0.4.tar.gz
+md5  593a00e93cb72f8cf5ab88358e550ada  entrypoints-0.4.2.tar.gz
+sha256  3bebd9a2cd05e08b123be74c277b36de4a38e899dba6a84ac9962ebe0c22ece6  entrypoints-0.4.2.tar.gz
 # Locally computed sha256 checksums
 sha256  de5fcd7349cdf399b0707a2a024833c4704743650133c72d6f0ff7561a03a848  LICENSE
diff --git a/package/python-entrypoints/python-entrypoints.mk b/package/python-entrypoints/python-entrypoints.mk
index 287b83605d..ac0e0072fb 100644
--- a/package/python-entrypoints/python-entrypoints.mk
+++ b/package/python-entrypoints/python-entrypoints.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ENTRYPOINTS_VERSION = 0.4
+PYTHON_ENTRYPOINTS_VERSION = 0.4.2
 PYTHON_ENTRYPOINTS_SOURCE = entrypoints-$(PYTHON_ENTRYPOINTS_VERSION).tar.gz
-PYTHON_ENTRYPOINTS_SITE = https://files.pythonhosted.org/packages/ea/8d/a7121ffe5f402dc015277d2d31eb82d2187334503a011c18f2e78ecbb9b2
+PYTHON_ENTRYPOINTS_SITE = https://files.pythonhosted.org/packages/9a/6d/8f96c1eb3aa1b448a718866e88e0201145a35e80ffcee3b1b88543d3e740
 PYTHON_ENTRYPOINTS_SETUP_TYPE = flit
 PYTHON_ENTRYPOINTS_LICENSE = MIT
 PYTHON_ENTRYPOINTS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
