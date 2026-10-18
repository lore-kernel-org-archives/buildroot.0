Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B63CCF2C4
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 14:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20EE660763;
	Sun, 18 Oct 2026 14:24:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8KyzRAmCF_I0; Sun, 18 Oct 2026 14:24:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A52FE60757
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792333487;
	b=fb+qQov3jaBEhGoH81wTzEt3QVkz9DCibG+2OL7Y1rSZQmQklPaihj6dtjQwG5jZGB6c
	 8r4BiClXOo6GAozpe6a4IkE0gT5Z1W/rj66fz1eKiUhSW3UR5nQORKE0XoV2aueA601c3
	 FvvaT9JHowifijHoupjtmL05SCjw0u3ePfUFF6hSEOYCheSPGEuCYDoXzWf67HcOFumVK
	 da44RerzTk6xcVmOg4ShoFeQxm+1KfyLonsB82wPrUpuU7Zib3AWcCol1pGG1nhqUczO8
	 mjFZpCX24BC1jSmIa7o8G61CKVTDgliAFOB/FElNJ5luOXh2MdKeLMUv0nBduq5itdA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792333487;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=troXvRbNZPxurKqM0FNdNZ0R52OyeveI9gwBueS+oQI=;
	b=tDOELwIKIzrCEKUONwDTCCnsFtYqz96SkR3I9Yu8T5+MJKXTgzwVufoPZRZvwIe01/u9
	 pMhsAc2kXSkKH1SpAirowf11xABOnQhedW89KoVK+ATvXOSzLV71YKI33FcTZSHEUEUI7
	 nIndo0AWuAWZBMqYvULz8k2NRgXWpKgW0dQoqp+kGXTWBONp3F2FxA1FW6DMvS7APifXe
	 WlxIWLI7ykwVwJM54gHxRg21244aga0Zp4++5f88pHikYdvg6kK9jJXlHfVfraFmDlW/p
	 ScPg31QFbULyPu5/2I/iXxtVQ5cZirGjRTNNAxlzb4vQSsdVD7UEDYOy3wz3Eb4Ic4g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792333487;
	bh=troXvRbNZPxurKqM0FNdNZ0R52OyeveI9gwBueS+oQI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oaPRqL6n150t3T+tBPq2EpXBkAoGHb6r1f/VFCwYvZwnYVqnKkOwnv+FJKjOVFkG8
	 aTXInT1bACr9WWAn+e/1Ubkyyr7GNHjPo1FnEKLiJPVJP9vah4dBNZFwhKfgDb63PP
	 mbTqjgzlVHfNlS2ruL0Um2hAzMpXD7fYb3K2/nLFqj9rYluhaL5QfH4kbd6kdn/8j1
	 96dLJx/5vE3Q+sfvanGhGEWzWzJxwtDab6kAoUvIPZZcNU5VhHRJlylC2edZ54NxsQ
	 MocRITlzYeSAW8RNL376411b5T50NON1Jsd3aPyASbWkTufR1/OrW98AuVfYzOvLeT
	 WTLz3haA1R2zg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A52FE60757;
	Sun, 18 Oct 2026 14:24:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B16A0D7E
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1ED0400BE
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:24:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ChKQ7LXzzLtt for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 14:24:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 4D414401EF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792333466;
 b=lGwqt+Nso0Dc9V9i3QdblIhuvr0065K+Ha0aO23F8P+06pG1x3RD1LXD81UhAu/wzOPN
 s+yNniFiKbgLSm6ZHrOIa1V2Ws0BwYqCgQ8Q0L1Eh0g+Cn0b3m6Jf6QABk+ao6VH/lZtv
 hwU+kgCcv8EmsncGnQeoj/ffadM2zOApZgshSZ2N+71cw+VZw0PgtcD311WnT1w+47Ljh
 Wbd1n5L8NEnhLWqsboSul+uRzP+yzz/LT1tbkOESnrwANLCWs39pfXdMqS75rHLMPgrwu
 YVrY+dZHUCpeFOti5ct61NvqgEO96B4jqy7BImYgncX7Gjmk3ORCRRNjcsnTYN4zv+w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792333466;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=KA6I9zq/rdIzMma+ABda0Pb4GLOFVCMCmMzp4rO/qxQ=;
 b=o5MC9FH5d9o60Om3Yq6ZUMRdvfHEXVZYl4urKDn2zdwlaLLDO3kGvmjFpaERbd/8hOYI
 f1GBn8VytwffDLSW4x5rX4375IgSg/l+0wRR2ebz98y0sTC2EQFBKGKJMA/G+4OoJMeig
 Njpizap0fX0NRsP8tYnRO2d6WTjNmDs1Ff35jC14nI39PulS+gOMo6GvPj3KlqQVBYUQg
 cOsC6jtPM2spzZGde2gN+dYC8sEsAdylnjc+uP9gB1fJg9g6YbQyXIUGWjlBjauMnSYy4
 7gqa6Jn560nY6hAhsIcbF4PzifoT0fpI7OlPY7bbmTHLb69EDHo2P6hgBYObA9Vr9Eg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D414401EF
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:24:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3CB9E9828F; Sun, 18 Oct 2026 14:23:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 15:57:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a6fdd8fa927dcffed140536f99141c565e6e4f59
X-Git-Newrev: 94e49af88213d1eabca8a5772a1c2bcbf12eb6f8
X-Patchwork-Hint: ignore
Message-Id: <20261018142304.3CB9E9828F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pydantic-settings: bump to
 version 2.16.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/94e49af88213d1eabca8a5772a1c2bcbf12eb6f8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Select python-typing-extensions, which is now an explicit runtime
dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pydantic-settings/Config.in                     | 1 +
 package/python-pydantic-settings/python-pydantic-settings.hash | 4 ++--
 package/python-pydantic-settings/python-pydantic-settings.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-pydantic-settings/Config.in b/package/python-pydantic-settings/Config.in
index 76cf564f0c..a7fa64d662 100644
--- a/package/python-pydantic-settings/Config.in
+++ b/package/python-pydantic-settings/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_PYTHON_PYDANTIC_SETTINGS
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-pydantic -> python-pydantic-core
 	select BR2_PACKAGE_PYTHON_DOTENV # runtime
 	select BR2_PACKAGE_PYTHON_PYDANTIC # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	select BR2_PACKAGE_PYTHON_TYPING_INSPECTION # runtime
 	help
 	  Settings management using Pydantic.
diff --git a/package/python-pydantic-settings/python-pydantic-settings.hash b/package/python-pydantic-settings/python-pydantic-settings.hash
index 00e8f84957..226a923bf1 100644
--- a/package/python-pydantic-settings/python-pydantic-settings.hash
+++ b/package/python-pydantic-settings/python-pydantic-settings.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic-settings/json
-md5  5adc6be6e91067201caff66b05f1186b  pydantic_settings-2.15.0.tar.gz
-sha256  694b793e84f766ba76a90ebdefc01d0a9a045dab0382bee70393da93712ad117  pydantic_settings-2.15.0.tar.gz
+md5  68615b705951d9a2de8d8ea29c377580  pydantic_settings-2.16.0.tar.gz
+sha256  5b6c578049ede4db0e2ef3b4eaa4ad4069cfa9211f83fb38df899dfade50a614  pydantic_settings-2.16.0.tar.gz
 # Locally computed sha256 checksums
 sha256  eb355a753e020346d33d83bf9769135b89fc610568ac531a01c295bcee7fd998  LICENSE
diff --git a/package/python-pydantic-settings/python-pydantic-settings.mk b/package/python-pydantic-settings/python-pydantic-settings.mk
index c297fc7e79..708b1df045 100644
--- a/package/python-pydantic-settings/python-pydantic-settings.mk
+++ b/package/python-pydantic-settings/python-pydantic-settings.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_SETTINGS_VERSION = 2.15.0
+PYTHON_PYDANTIC_SETTINGS_VERSION = 2.16.0
 PYTHON_PYDANTIC_SETTINGS_SOURCE = pydantic_settings-$(PYTHON_PYDANTIC_SETTINGS_VERSION).tar.gz
-PYTHON_PYDANTIC_SETTINGS_SITE = https://files.pythonhosted.org/packages/68/ca/31c57507b13119d7d3cfa1576dad2911a4861e3be07b579395f4e9d393f9
+PYTHON_PYDANTIC_SETTINGS_SITE = https://files.pythonhosted.org/packages/2e/3b/a5d2294799b53b448319978cfb5bd139d5a9d45e862af91661614f14c922
 PYTHON_PYDANTIC_SETTINGS_SETUP_TYPE = hatch
 PYTHON_PYDANTIC_SETTINGS_LICENSE = MIT
 PYTHON_PYDANTIC_SETTINGS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
