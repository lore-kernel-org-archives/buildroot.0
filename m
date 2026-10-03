Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7A3CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BEAB41165;
	Sat,  3 Oct 2026 07:25:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P79bUvFzhgW5; Sat,  3 Oct 2026 07:25:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5194A41096
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791012309;
	b=Bk5yUf+gV9u7fgQAhweV+IIVPKCljb6y+EBLbhqHIt1b10aWJIrSwXO4F9OmWaLVAmN3
	 lWvsWbLondDxqAMSUtN0SV7yuVZZFqIwrA0SPwzvcKIrVQ8iGfPadFlj15Ipu7Vwx9dtZ
	 l3Fm3T1OnHL8fAHL2v1ILdmd6o8dC+5KPpMUUIIZiYyxkDZynyL4m/b4DIqtQxlyEuBWn
	 0FDfZmwXAUSBNB8lOaKvgYbDmWbHuLLrL92kdfn3orJecRaKOT8KMRYfIxce1J3jXe8PH
	 PH9+WgT2pjOAJsHDMwmDIgXQwTib6+CZDalHeVIoPHDhaeB5i70S8hSEOMibsKlI7XA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791012309;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=nj2vja7TKRBB0fFBVA6clihZDvXFtoF5US0qncYKH6A=;
	b=mYoNSqlBOuK9gLL0ZS5GmPuGcNh6fBgbYBbkvfkqCYvOFH5uwpZZltzn02rniT+ia+lO
	 2KTQRcy5g7Dl4d4Iw9XVwJ7hhS2J+Z71LYGwafrBl38e0WazNfjWH51BwYz7U/vUUZMAN
	 t/Cyhmby7Eogqb553/aQNqtx8S3MK7Cvz342oJqDexG8N48TLBSGSO0u/dJq/Qaopf01j
	 W3XbLaggHAxv+JjXjJptpd+/m2wRNVBqzaFtgPWjzpGXq9G+LuzAQ98z1R0AqH2XoaqfP
	 Sn8dR0d9JfXROl1Y/PD+fxmdURz0cXw2LWcCkRAPAdmU8tPieUGVg0bbLYqgahBxVaA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=OxfY4sTF;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791012309;
	bh=nj2vja7TKRBB0fFBVA6clihZDvXFtoF5US0qncYKH6A=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=m0tpOMR+nQnP23+ooXJ7A3bk1b8AO/QX7SSZACcdj6oH4jXLx9UPlaEW4N4EokRjz
	 kdZoSMyXuDw8+SNqQfS4dN5BLrq3eQlbHDXQKmLJMAirkKNXtugfE+NITMh8MIYAFE
	 rxXe3MVZhcv9bDbkJYa6gI5JBy2qFCTDoYyKmGhc0fewZdg2PFMapGYnStj+1wunGn
	 7J1+Cm521Ef2iwNFoPEsc/z0BhfqSPDchuT2nqC4pF1LBrGCsRbyW0fqC8avq4S4a1
	 8tx/zEYir/dAUepnJV3nDUzFC5a/8ZfR0vJw/PBDfQosIKIsTg/BUQY9uj1dXutAX1
	 DVLC8RHeV90cA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5194A41096;
	Sat,  3 Oct 2026 07:25:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 73DF034E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A5C141177
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:25:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DWlyJFJcPqgD for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:25:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 72D2641013
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791012306;
 b=UVr2wsfAa5xhagLplVuDaMi+bMk2VgEGojlRY/FsKd6HNeeyFZ6bScLpT3fdUcMHgoaK
 qS/sLiB43c6zjMGWLFKhYy/bvSpmoD/yhdiAq0R9EPoOB9Xb4ABglrLbhpMFxsHEhBogN
 okNOd5lROe6hj5vSmR05mzplxx/kHSMnaScYKeyjqY95kBD+ZLowVoY3AdLNNOOLJguKz
 WGOLmspImxk4WJXgtfSJalAKSNslOJt12l8hXZnTXevW0+Srz5XZdh9TduvwDrrqbZ+Tb
 2otQV+KZ0tGzwSFX3uDS2AugksJyzK5izi0gDTN2tElKEpTHshlthCbfBEFvFu7IbIA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791012306;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=tAuBHuvgLDVv2SWsWm1qfmhhjso9QYkLwUGLbaMniRY=;
 b=Z8UHRuDQ7UOqS+x6zax20t+Odu6H9JNjwxCJlU7RWPjO+R1m5a8B9qc5mJ+Y9NQ8BuRu
 Crw3RX9yBkIEXWJJli++Y4/Lyct7czoncliSWmqQ7TsAWjIuyAGPD4pWcJdxIO6dUYdif
 X/Gskb08PbQrD40N9zWHHeR8PIXgsCS64GYeprgUE4/C8RMhlwBnjf3N48lNP9TBIMHn/
 6wRVtoxokZIe91QG0ki2dfIM/MFL0Szj3JoWJ3T7yyO1HkdF9pS55sDo4+8KyYFKbPY60
 ov1WoHEER+g/vqsVSSDxssgL+PFcBhYqLQBzScTm1OFYE+gI/NVBho6viMdFtTgPJwg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=OxfY4sTF; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=OxfY4sTF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 72D2641013
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010943;
 bh=tAuBHuvgLDVv2SWsWm1qfmhhjso9QYkLwUGLbaMniRY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=OxfY4sTFfPy+Mb9S7jRpitvZiweynzVrmhYTtf+Q6ngL8d4OUMzTe3GfmgRZBS4dx
 2rmwcFJW32DkefBxEswo08FWAWaY9zybrKdMZZjlvum9HlDMaPENoVdFGog3GsC6DA
 lV1FuiuYN5LAqg3v8bUt2hGdt2mZj5pdJBTnsdWXaO1YEzpYQGk5aia/iYZ51OEb7j
 SBMWHXUKuzsXxxyL+/Wwb9Aa8w+74KDW9vSfhIU1vDSlzDLGBqk8erLtrE/mFQ/Njb
 7eCRKn/XPXxqLiGfQWeRUbHaO12W+cCnA7mcfhG+1w5lGsB8s3kK0cKAs04DySuwBb
 EopqPmEzFhXWw==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 zXl0V5QgiWihoDYAuA6J9+y6OfVMNY+9eGE9PzHS9odMwJRE1lxpzR/UxSfoVaG7xINex6OOv1f
 dFYusSZem31Phd9aAkkhYyQT5DjKr9suUkLTKUTQMQPNjmrIjpPWEhkCMzdgfI8tWbluXYhNUQN
 6b0ZEYI80YdZrWaj2RTLlhe8kXWvFHTwQnSVmYMc7c8aEZzNQ7oOwk18es09aic83MTpyf/QiqY
 1IGycqoIrwxKkJYa94T72rg3B/MeUP9YWwY0uDDNtPeL1ZttOLlM+2VrMxHvLNgbVYh1Omec4C7
 8Xdgd5RxJPBrLXORJilJZt9Wt/8ETISFLO5v8yEiUW57cqhAM1vFuZpWhfRgIIxpVqXKUnbmGXY
 4u0bxlQusI67DcG5ALASWSyDHDVYxU2FdgGWG2sZ3rRaKXwKR+BTkd9U9pRemeBru/RLASGGHB2
 CVEGPYtwb7mu8wdCl4LDvhY4oVRYXjdTvVswqPnRMfGUhNUtrir05Ax7KTg5OujDcKwyH5R+Jyw
 3Ck9JCOkOCV2+KjDJKjPB7zkhwKOV/XEBeAk/54VXBUXn3QymD6kQv8wvxfDJgWA/W938QzCY/d
 /8JkOPnZlCN3/mMqDMR5zqBYbLZG5tEkbGsL7lAiLN0DYiqL9QiCMhhBz3BwcMYI
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 91C7EA4C5526;
 Sat,  3 Oct 2026 09:02:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkf-000000007Zo-0wsL;
 Sat, 03 Oct 2026 07:01:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:25 +0200
Message-ID: <20261003070128.1295458-53-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 053/114] package/python-prompt-toolkit: bump
 version to 3.0.53
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-prompt-toolkit/python-prompt-toolkit.hash | 4 ++--
 package/python-prompt-toolkit/python-prompt-toolkit.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-prompt-toolkit/python-prompt-toolkit.hash b/package/python-prompt-toolkit/python-prompt-toolkit.hash
index a9fa1ffe3e..4fdf564b46 100644
--- a/package/python-prompt-toolkit/python-prompt-toolkit.hash
+++ b/package/python-prompt-toolkit/python-prompt-toolkit.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/prompt-toolkit/json
-md5  8d75b89a1478259c17130d4fab6de475  prompt_toolkit-3.0.52.tar.gz
-sha256  28cde192929c8e7321de85de1ddbe736f1375148b02f2e17edd840042b1be855  prompt_toolkit-3.0.52.tar.gz
+md5  9f85b26fbf7285d3cabe6488d1b939e4  prompt_toolkit-3.0.53.tar.gz
+sha256  9ec8a0ad96d5c56148b3f914aa79c1564c3fde5d2e6b876e7bc327e353cf8fa6  prompt_toolkit-3.0.53.tar.gz
 # Locally computed sha256 checksums
 sha256  303574d9bdd85c757d6025017942bf17baeedf2778f62bd7f425d07d880f4c4a  LICENSE
diff --git a/package/python-prompt-toolkit/python-prompt-toolkit.mk b/package/python-prompt-toolkit/python-prompt-toolkit.mk
index 280a6561e2..c56b2fd2f0 100644
--- a/package/python-prompt-toolkit/python-prompt-toolkit.mk
+++ b/package/python-prompt-toolkit/python-prompt-toolkit.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PROMPT_TOOLKIT_VERSION = 3.0.52
+PYTHON_PROMPT_TOOLKIT_VERSION = 3.0.53
 PYTHON_PROMPT_TOOLKIT_SOURCE = prompt_toolkit-$(PYTHON_PROMPT_TOOLKIT_VERSION).tar.gz
-PYTHON_PROMPT_TOOLKIT_SITE = https://files.pythonhosted.org/packages/a1/96/06e01a7b38dce6fe1db213e061a4602dd6032a8a97ef6c1a862537732421
+PYTHON_PROMPT_TOOLKIT_SITE = https://files.pythonhosted.org/packages/7d/ea/39b988c938f75cb75d7045b5c69f8bfed47ee2152c8837fb403de29d6fb8
 PYTHON_PROMPT_TOOLKIT_SETUP_TYPE = setuptools
 PYTHON_PROMPT_TOOLKIT_LICENSE = BSD-3-Clause
 PYTHON_PROMPT_TOOLKIT_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
