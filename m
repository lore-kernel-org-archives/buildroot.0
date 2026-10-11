Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC358CA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:33:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7843940539;
	Sun, 11 Oct 2026 13:33:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X6x_eaaGYKNt; Sun, 11 Oct 2026 13:33:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7E94C40550
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791725598;
	b=CQlDm+gd6p7b5J0pxbwLlQMu0SdA2j6/VXOmXEtubM8vWa/JitRFg5tb2V8gux3MtA8p
	 OMEb1qpYWLbT3Ov6Xhdd6+aNSiNczC/sY7cWdGdmvXCEtON7wAiAP4qGKCgN+VVV9MlN6
	 WUX0JG7+Xcrkwj6n8wN94cyKs/DMtuQDMD4bI8BPGhGLN5pIBPQX05nnY2mmidPoVuWj0
	 H7Gawgp82+gnTTXkfsuez7H9zrH41tw61Nf5zsCidD869mYGGy/LdXGqUUdtNUkoiIK9c
	 fkFwoWZ7LGzgORhDE9NbDcUGG4IdWkPeVdtQmS1BtdXiW4ckzso84t6ykGE2PFWHJHA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791725598;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=TwrZhuIBALzXiOgggnKcuqA0PQeOcKfdi6WPg82ygXk=;
	b=qVMOXQMhcPr/QfagfEAQNUzm35g2MEAUT20Lap8RLv58NFfqSnSFb5bAjBvkFHaniFqu
	 TH24OphzY02lRC6r/eIVcEPEnBeV11y5EvSZmEFaqESydN6MI9juRetISZN8a+UgbroxT
	 Ru2FJPVml6pVehiMGG2KWimbUW4JPn6EqQ/ea9aBxmfD0zSYTvWIIKgdChFR9bgu8Sl8W
	 4yNi5kaUBdDjhe9yrqNd6mEJUKzzgwv4w4Ri2amg+HiDDB1rj71FREVfia8LIsWcvgNFg
	 3rMwbgUH2b/R+b87/cR3QSuGEzCl+wUgEHXWOhSUjkW5B4B+hVTVhPsKC/5HvJtfJ8w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791725598;
	bh=TwrZhuIBALzXiOgggnKcuqA0PQeOcKfdi6WPg82ygXk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FHPN189JGwNtu1E9vKl8uCVbwMCjtIwbvwaDPEKlTJBbg3it0pbhBN1h6XDQoDNyi
	 MHjJ/ltwHD743xon6JYPc+TNAhYFn+/CV3eBstLDZ2qp1E3q+fkH1z99Y4Rvo5OoBK
	 5649f+3JkS/aQBsINbHCvylNg6n7LYY1FK30XiGEl8qotq5aA0Rk1dbFZkdvNtTr7E
	 RbQGPZ25V74r/Mzw2+pVVQvVXy6ousH7yVU6jmI2x6IC2dEQzaiCybheASdzCaMq9n
	 JPE5kGDitzkK4ZaHu05+W7Bl0SXcXMYSBU18bgFw1AmBRT9KBxDN2rdq1pISJH+027
	 uJYOl9gZqy4Gw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E94C40550;
	Sun, 11 Oct 2026 13:33:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E9CB7111
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:33:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB9EA80C45
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:33:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fi_RvxJ7iQOy for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:33:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 16D3880BB7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791725596;
 b=pT4G4P4jQOH2Spt1VZ8qYHZQiSEVH9g91OZ1uSoyy09VBhXeMwxcWTq1X/irS4UDdt4C
 uzucJAAJxvLU2p9cxtY3TfkqMD339DBmttPUWV3xdUqPe1BKMempjnqPp5y4RXFeXhlJf
 oEDGnIwR+7h7I86QYqGWxmjwnTI6Q+GIuK9PMqD5Uv8kW+Sf1pew4TAlcQ1Tewb/j6PzH
 rmH8Uk/c8f6QzpLCd1yja2qj4kPK0IxecPdeNjpjMG/iZTYkHp6QZv+ri05hvasVYC8BW
 U74xYkyd9uJQL+cr79ts07SMkqD6IUUPKCnBEPn6ULSTxGXM/Mni0CAgPBbKTvjF+rg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791725596;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=w43zEqIwEWbD2dmnuGpNTHhKXbQfQ7qriD7bbeBcGuY=;
 b=hIviQRGa7P41hLj7z/lgDzjxA0sMAGIVRG/JhzW4QwkDq2o6f70D6i8c1ofbw4LLThiH
 FzZE4yIIdCwHlu7+RGuGd6PlAnV+NJ2ldj3CZvLqQADy2+Utp+1KrIP6KwaW2Usa1XFrP
 Y0v95cdUbVBaiMaayUbBN8EQo0R36uLxkb4g/5hPbQhgi0EvoZdu2oCztBoYhJlghYAOJ
 T+gxL7uaiKo5X2fmJiZEhzTxA2UViZA1tHg78ysWxQZVVoEz+ue4hoFRNkr9YdqScVpfj
 RKKJ1SSWSSuz7p6SEhcisWAsg609eXCKRLzMO4mbOrOdLD3DKXjssdXeW+e7PllykCQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16D3880BB7
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:33:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4EDA494A16; Sun, 11 Oct 2026 13:31:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:31:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fa668003c0fdf5a9a51203ced70c715cdb841605
X-Git-Newrev: f1fae6867b5a5b4ee2c7aad97330a7b9dd8476d9
X-Patchwork-Hint: ignore
Message-Id: <20261011133157.4EDA494A16@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-idna: bump to version 3.20
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f1fae6867b5a5b4ee2c7aad97330a7b9dd8476d9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update license hash due to copyright year update:
https://github.com/kjd/idna/commit/21cd5ddac6a1cc5e2bd4ae9e477ebe5f103f8225

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-idna/python-idna.hash | 6 +++---
 package/python-idna/python-idna.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-idna/python-idna.hash b/package/python-idna/python-idna.hash
index 188f290f41..8b3abc23ce 100644
--- a/package/python-idna/python-idna.hash
+++ b/package/python-idna/python-idna.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/idna/json
-md5  9a9c33db960e0d35cc5b257c37dabeff  idna-3.11.tar.gz
-sha256  795dafcc9c04ed0c1fb032c2aa73654d8e8c5023a7df64a53f39190ada629902  idna-3.11.tar.gz
+md5  922e0f674e2ea8035ae7bc07652677ec  idna-3.20.tar.gz
+sha256  a7db850025b95ded1eae8a46181a1a6c56c92c96f0e2b005d9ff8dc0210cab44  idna-3.20.tar.gz
 # Locally computed sha256 checksums
-sha256  b7a336abf3b04e180ec065cdd16e705d079e1cc7a14f910aa6e9187f36b9cd87  LICENSE.md
+sha256  1a9a4f0e3d479a27240ddd59a9137a66ab4a0f9dfdc8ca6188cc0bfd85187f04  LICENSE.md
diff --git a/package/python-idna/python-idna.mk b/package/python-idna/python-idna.mk
index 2b654a480c..2fa18ef541 100644
--- a/package/python-idna/python-idna.mk
+++ b/package/python-idna/python-idna.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IDNA_VERSION = 3.11
+PYTHON_IDNA_VERSION = 3.20
 PYTHON_IDNA_SOURCE = idna-$(PYTHON_IDNA_VERSION).tar.gz
-PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/6f/6d/0703ccc57f3a7233505399edb88de3cbd678da106337b9fcde432b65ed60
+PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/f5/08/8eea9d4b8302028f3abb2c0813953f7aec26d33b7a8960ed760e65ff29fa
 PYTHON_IDNA_LICENSE = BSD-3-Clause
 PYTHON_IDNA_LICENSE_FILES = LICENSE.md
 PYTHON_IDNA_SETUP_TYPE = flit
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
