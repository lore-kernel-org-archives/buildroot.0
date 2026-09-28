Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ABF6CA5FA3
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 21:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAE70808C9;
	Mon, 28 Sep 2026 21:38:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L00620ofvZtE; Mon, 28 Sep 2026 21:38:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org EFB8E808FC
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790631512;
	b=j+yYbRN6bgBMlMFHyoz2rOklG4x7IL82BIaMDietd4za5ww4G9xASPpQlIYwgZqpvVyV
	 8Nue4UtXSD1lngxSi9AeIp3pWS/YbzRQ2I8eF1v7ZCStsqU+4cM/FLdMo18nP0bPl8apq
	 M8HMZTfCOW2Ja4XN+XRzdQJj8p6pUILz/FW8UBzHGEL8le41PqBtSR9/bZiDv4zCi0YK0
	 48uKTo/JZVtxoNmC03zf91VL9QcrTVjQ9xQ4yWJ1Qd822SfUORfW1lhOSXxlBlXwPBFLh
	 n87IcIzpf1Vv/RaQ+1ywxMxHKNAOkTjcgpJjQZfuDjv8/ktpXo6UfKS5tZSO6k6UyHw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790631512;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=iq+SDwrw6PyJP24EYspvP8aTfgc6t64XUV/VoqTGs3A=;
	b=Te13FMY5xP86oZzmDnMU9A+hZ2hsnuCclRFqh03AxznIuyIJaF1bhr/fTYAvq94WVSw8
	 ntDYozy3EBuzzaCVRV5YAykCnCLOEbIKqxrqcJZ8gdCmeqbdLEL5HU7MAXoA04Fi2j+br
	 V8vlpL8ruYFYiVljaeIRgcNS+ACeJjmioLi/2UaJzVG+yRH1f+JlbjYrUi1fEQpzlm4Hq
	 eR2/K/87qeMtdn7CRigsi9UGYy0LktbP7qWa2s0M9X0D09EuwCckryyE5DX595zQ9Ke5Z
	 Sp4z8F9lee/ndQ0NlgqiKrjNmZm0oEEBaGTOOPcfvjAbr0e2OFLciFwJLkXQvQ94CpA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790631512;
	bh=iq+SDwrw6PyJP24EYspvP8aTfgc6t64XUV/VoqTGs3A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kR8FBf9qVeHuEV/tDhPhtlbSBDdXuwp8k408p61M5hNJEYFTkiORYCD4hLc1OZPrr
	 BIRjiTApeHxNHX3B2Ld/PxSfVA6Ghfir/HIrAcKQr0ydUa0ZlLvqjxZF2CcGlqfNGH
	 x7VxsHOaYFDJ35GPwDFhKaUv+HlriprXBdKui/Gxwqxw3dJVocWduDaU60Y+hdk4d7
	 /yHPavNaACIIuWXrBeB93oz24hmUrQn24xK3twtLNqD6RCntaKOS6fvKB1CqfvZ7Hj
	 ppKKQsXSW7E7sBD0o3hEhojfM7xKLskP22XMfpJkZjq2A4xeaETiWitt+ImP4czy8m
	 6YBld6tyKIvVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFB8E808FC;
	Mon, 28 Sep 2026 21:38:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D85BB72
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D59F94018B
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:38:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gOamYJPBRg70 for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 21:38:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 405504008A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790631507;
 b=m22SLCc8x9ac1gsAIcWa0Tm2gwbKhEvCuJ7//dUVxFvOMHdhUph/wMEddAwDsqFjX65H
 lnuHthlxCYME+Q7pecDMqh2uBQ9Ao004R9hZSFih7oZvrBt1TSoHWDKDhWrN+VJ7gzZbi
 3o8LuZg9RnFzmIPfB2usCitjMThqYGXYmFvAbT3sHrrd8VUoytICi79OSXDaKQ0wTIHvK
 UU6BBeIMQgHjWerDdOBuOpqecvjsn2gzMNgs9eG7uElHIZ9vtNcQxWcJ2adgelwP/xKEQ
 PXmzxdNe+DmxdHT8kognBmEVYjf0pdVQZTH6LLYTmOLIVX2zJmZtxLL8muoghppl5yA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790631507;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=/btAIFoSo9XeG6fXl7qn0z9WK1noH0x97jPTPZFIM80=;
 b=HnJzVcouGvMJxfbWyM0XsrwOjAHvzbeDWOheS0HFzOVjYLkx+1H659b/t/py9mJNrct/
 FuK+yzBqjIcJPAL493sbCzx/c2Ndx7JLSsNekHoksFN1pcGM+FOCT3s/jtH/KRJSHAzsP
 lxgUAGMxKn22Ly2ZuAzIu+TPMZSs0nske+/agfUNz0Iyn2k8Wn0aJDGmatksvionIbtHy
 w5AmKWw5FwCXlE8V3vTosaKDvRkXDH+uCRYrV6GWEHaqh/DmnqHtbEtTt7oyMMpDeB2LY
 ABoALjeCoJO4vVbXfyn6S0z83i6Vr46ZxeAFgPuZIvIe2nGEl7AQD8wXWXKJ5HhK/lQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 405504008A
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:38:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D044F98418; Mon, 28 Sep 2026 21:37:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Sep 2026 23:38:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 451d9950d14f177186fa9a3466e550d14c9ada89
X-Git-Newrev: 5510a84de6eac934405772700cdcf7458aac9347
X-Patchwork-Hint: ignore
Message-Id: <20260928213714.D044F98418@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ecryptfs-utils: remove OpenSSL
 support
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5510a84de6eac934405772700cdcf7458aac9347
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

OpenSSL 4.0 removed support for engines.

Please note that upstream considers eCryptfs deprecated:
https://lore.kernel.org/lkml/ZyKf6ZSZrETI+4%2FS@redbud/T/#u

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ecryptfs-utils/ecryptfs-utils.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/ecryptfs-utils/ecryptfs-utils.mk b/package/ecryptfs-utils/ecryptfs-utils.mk
index 03e7f3e34f..6612587a8d 100644
--- a/package/ecryptfs-utils/ecryptfs-utils.mk
+++ b/package/ecryptfs-utils/ecryptfs-utils.mk
@@ -32,7 +32,8 @@ else
 ECRYPTFS_UTILS_CONF_OPTS += --disable-pam
 endif
 
-ifeq ($(BR2_PACKAGE_LIBRESSL)$(BR2_PACKAGE_LIBOPENSSL_ENGINES),y)
+# ecryptfs-utils OpenSSL's code is not compatible with OpenSSL 4.x
+ifeq ($(BR2_PACKAGE_LIBRESSL),y)
 ECRYPTFS_UTILS_CONF_OPTS += --enable-openssl
 ECRYPTFS_UTILS_DEPENDENCIES += openssl
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
