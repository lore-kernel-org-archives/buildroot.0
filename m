Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E5BCA6001
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:30:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D4AD406C5;
	Tue,  6 Oct 2026 16:30:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JnEEA8ufir_d; Tue,  6 Oct 2026 16:30:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1A2F3406D2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304254;
	b=Xw1vY/o5xYlT94NdddYTjKoBzsgW+rlcjFWfOkm42K/DkLdbhFNQL19zP0+5wABOcbXG
	 XpzsadowHjnIN3tn2kE3ocsCNIp/6Fnc8eqj7HFXpgpLQ+2rAz9Oa1vrBUlsnxr9WhOCq
	 lS1olhaQdzHQ9kUjGQsTJV66i0jCTxfEnuLkrE9bUzhHJcQSn3rVTLqOr0JbCB2865oR4
	 cwjcDhczYNHtOF2csf/6vXz7Qs0U9/VaB394/oZzc8IGCIOS2wEd+ZZeAUMR231wgt+vj
	 JVtna+LDPPNWSZsx6HohqZT6wfQ+FnJyd36SulnJMLrFksxn8kMMhoHgiOMsItjyjPA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304254;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3kZlyJ+nLc+LfR6wT796c6ngXrDVsxA02rrF/FMi7EI=;
	b=o3r+uyRnE2kyHEwWIqXstfNne4yM3BFj8jfT4gc7vH1GYzf/S13I2nhlEDkmrZF0PgQP
	 y0ns7a1GBcGgrnXQUfUCfWkurjyaxw+fuLF5Fhxb5iwV0MXQnIMOuK6H1c7cBqu+78aRT
	 c4mlbyyU8t8qYBdJAXOMAA/ZPp/4L5efKzZv2HaxCUmkrhzo1qWVeayzHu+JwtB5wkpJD
	 bRrxj+S73J+3Igx/DTTdfYdfvzcBdcarMtuE3xGwNiJejK1aw+fCxcQLxsGh4JdOqVB0H
	 kEJ06W/JAIycM07uoC75REfdS1En+axYeXLIBReLPaNs20XzJu33vOE+FJtFohNFLMg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304254;
	bh=3kZlyJ+nLc+LfR6wT796c6ngXrDVsxA02rrF/FMi7EI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kzweys5lBjI85+VPkQK+MeopQqUrM3RIGV5L8zhQoAnpqd21Dy5pTXpO5KjueOFFC
	 o2+X1QZM1CdaFOgRkzuf+CO6RQMOVQR8gXtiNrHdSY/7utwlX8qZLXX/KMlBZUMRQ1
	 QLBvV1j5/kZy2S+aDQl4UEygjAKW8GJEcLITcXPkSG9i6G/x1o+qtfii/RqQMHpHAM
	 /fj7mUdnu9IiIqlUhjvLOHDwH6RJSrxrgxlgAifxp8rhA3MVEHtLxXSLhYQIn/5UIA
	 pJqTjrfBo9i0z5uDVvGAx5oybMG780tqNDfeKkD5AZodNUqtC6jFEqAumVzLZ7WHpv
	 kRExw92GGlciQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A2F3406D2;
	Tue,  6 Oct 2026 16:30:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AB68AA16
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90CC8404E0
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:27:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iN0cEnBwM4hJ for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:27:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6E0A7402DE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304041;
 b=Rwvnu34Vd1xypKdRYMugeBXoN8lBceBf/Ud37UPVV/VMa11SuAP1YRvT9wFtOklNGva2
 PfAl3EKybWrWjt2w7OgCQWeaZ1x9snSHsPrd2EzxyWzUGgMRkXKqHMCgqVP+BL+hpzyjl
 Q9hW/RaO2JxjBxCiWx+CQlsmz5jiycsaGmcXClZuQspAsGRdWICkteX5iF65dO8l2y5B2
 fwPhKbSm4ulomGmiZWMN/pKxVTrXrAEW9CRy0HkOL9maub37ZaJ+d0oRnRxkv4/64+QoM
 vCkWvQVyDVM6kirqXz38D22kzIlGwEOWYAJHdITCY6YVzrXH3jdHbB7N59uHV/5MfhA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304041;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=YQkfhRBF7pDtCWzfMRbFQEVxnvLNcjocB6gVDI+OxOk=;
 b=WvMOv8wmDyxeJG1ZZ7fYBGfIuVgUm2eVt6JmMh+WDDzHYcfqjJMdnYUQYD4lSx56PfWF
 kFvTjm6lgyaTbM9ml/l/v9FfuPtmyFxboItUIwvVhZzryCpZ2fx8Z1via+0TuTWJT3b02
 EnCBmFqA/arZJzNvoOcA3u7rdvqXXXtYaQuxJliG8sRsXSXdu6ISr5DxJh8JFu7y/Qc/C
 ZsaayOvvFarv/KXAKSdvQ/S7YNWhTzYJqkZscRkp9TyssakM23KsDtDD35+4qKtI27cub
 R/EKNPW16wwwQkhqPgimyyANpHhrItoSApm4VVdfYcJLds0OmhFqZ02o5hZX251MX3g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E0A7402DE
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:27:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 248A78DA0C; Tue,  6 Oct 2026 16:26:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Oct 2026 16:53:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2944d81ae72bd85d80528966414152a62c76fba2
X-Git-Newrev: 532aa127b933fd254c211644932169666ec67bd7
X-Patchwork-Hint: ignore
Message-Id: <20261006162605.248A78DA0C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pillow: bump to version
 12.3.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/532aa127b933fd254c211644932169666ec67bd7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update license identifier to MIT-CMU:
https://github.com/python-pillow/Pillow/commit/22c05e232c67343b193b9fdeca9e7b683d470bc6

Update license hash due to the copyright holder name update:
https://github.com/python-pillow/Pillow/commit/7c121637c9b0062694069f8f6d173e17dba8c46f

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pillow/python-pillow.hash | 6 +++---
 package/python-pillow/python-pillow.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index 22d1f3fe7f..6f9c5d2cb1 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pillow/json
-md5  a7432f8c473441996d72efdefbc49d40  pillow-12.0.0.tar.gz
-sha256  87d4f8125c9988bfbed67af47dd7a953e2fc7b0cc1e7800ec6d2080d490bb353  pillow-12.0.0.tar.gz
+md5  c714771477fa686ba789092cf84234c7  pillow-12.3.0.tar.gz
+sha256  3b8182a766685eaa002637e28b4ec8d6b18819a0c71f579bf0dbaa5830297cce  pillow-12.3.0.tar.gz
 # Locally computed sha256 checksums
-sha256  17f240ae101143707e5e7303a5d800450d9ccc7475b463cedb555cefdb3c6ece  LICENSE
+sha256  15181e7363dca9aed78b79bebebc7fde7f1814b8bd311ea3b87ae8ccadfc185b  LICENSE
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 19e3f8e279..433cbae5e5 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 12.0.0
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/5a/b0/cace85a1b0c9775a9f8f5d5423c8261c858760e2466c79b2dd184638b056
+PYTHON_PILLOW_VERSION = 12.3.0
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/1c/3d/bb7fca845737cf9d7dbde16ed1843984665ff2e0a518f5db43e77ec540b9
 PYTHON_PILLOW_SOURCE = pillow-$(PYTHON_PILLOW_VERSION).tar.gz
-PYTHON_PILLOW_LICENSE = HPND
+PYTHON_PILLOW_LICENSE = MIT-CMU
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
 PYTHON_PILLOW_CPE_ID_VENDOR = python
 PYTHON_PILLOW_CPE_ID_PRODUCT = pillow
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
