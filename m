Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9535C88E5C
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 16:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84D03605F5;
	Sun, 13 Sep 2026 16:35:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tt-agR0pWxjC; Sun, 13 Sep 2026 16:35:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 78E59605FF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789317314;
	b=Yuffx4WEG9I2cpwFFehbg4H933vPqMI2K+qXjRwaL3ccxEE2tqs6YsYhPYhfxmLWTmsG
	 aAOiStMttB6lnAPhsZMtKVeYle0X8YN3gQz3Ql0uLSoGJ+T4l/Lw0znBLYrUYk3F5igns
	 20q4xc3VruquFKAvQYswimWS/QO8qzv9ocPb3kk5Wh115Af2VnX70SNsdFUIKfJ/djDBO
	 hQnWERpu3nKPEsYiYwkm/aU6UMaL1B7t9G0+6rQKpG1hL22bR1ms3mpSjirhw/B5dnoCb
	 HK2EQ3IUe8NeiOFJmWFYasNJ5HvYPnb0uKyBZ1NeHTczaSmo/T2rVLOnU3o9aqp8Z0Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789317314;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=T5C70Hz0mLrzO8VDc8uITd7vlA3VciMCtHqlO/lfjcg=;
	b=rLcIqnQ6lDFHhWiQ1ZKIu70I0NNpmK3liEh867PFK9xpb2n3ylTHXxR0ejMXihRQp2ug
	 rZefEU7pOiETJJiRc8WQqX49H4vmwOe9Td7aYiA2uWsfgrHsM1CJbw0eeC27frtQd00fd
	 OJ1srLgGrnsfcdqhtguDw2qFqccWfTx78DYqgETwiXTNwFsi91V1sYDfN6/KhydTIx2MK
	 umpdAe7k6mWWVK0+jj5JhMqqwnEfqw8efoRtmuHSV90dd8iM0AyBJ0dA9WKSAkwYomtSt
	 2CFFi6juoNX8uNb7pXUcXr/XtMFDRurMLd8QyGDIb4QyTQOLei1g9sdX8puuEIi6mrQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789317314;
	bh=T5C70Hz0mLrzO8VDc8uITd7vlA3VciMCtHqlO/lfjcg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=seTx9H2YlLsTGull3HHrbaHn+mY0l6AMMKQCP9ot+VnMal9ARP9kh+9JNFfOm16Jp
	 lZzBXkdGz42a7SvzlNnK6prWKpHMNQsDkQezxcJD9OG4SNPXd+IAO3XgvKWTg+Co7u
	 5oazQt3yJRDwy9kKmNeUkHGYITEn7j80eOxf69fFwaaSChGU02y7a0BmYU3PnjVUEA
	 g+xjD81QG75zhRPCf04wpcByFRixEWWw2wl4rygPa38Auihx5TlsNQHoZbG8W9Ch1J
	 BeM/NeColR5mXS3JFncgxIbU/OAJ5i42dg2Pf3ae+fZY1h/e3e7JWmEy8XrCqgFDCw
	 Sl7Z1JROOMvKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78E59605FF;
	Sun, 13 Sep 2026 16:35:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A7CCB24D
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 16:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DCA180C38
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 16:35:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MAaEUXMb1pmh for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 16:35:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8A7DB80C68
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789317312;
 b=LFF0TBmRyl2wXFsOrIF20ov735Ec7fsRYVJ22LK3HuVCoFwJ+8qK5y0vHJXrv4UqgFVm
 4wYCKhmMgjjOvxgeccdcSDuLTfc6yp4K05uxZHnI3Z9xYIVlSsNJIXliTpOhpXyDU6Ymj
 wCRCE6zcrV8N8DkRTPws85zBQgYyQ5IVXYucmXNVb7JF7jJs1lMGHJDzhsvzrC2b7CwRK
 76R6czkFMtcttfkWXlXfpJT7WZA5xXBcuKSDKj/9SFMiBOYSi9nTlvJwcC5tyZmkcPFM6
 daLjvsLa76WZjgZEc3hIdC8B5cREZNyjjAAtJLggeX3qvaaiwW70Q/mNKR+n3wfSvOg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789317312;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=PsGGaFxDQS19fPhLiuZmk7FU0Bmqk+kWqM8Bn0GXIh4=;
 b=bbs64za/UNEr7TEfMQYjqiXZ6/7JAoXZzzCZjFZRlHpms5YmRhL3+GrA33H0Q70QWsXO
 zflwJeHFmUA3rESwEjEqF+ibBgLsmve5fJgg5/h7RUxPgJjVU70xytSdks/5vZKH0Dkgp
 09S3zUlA6prU2EoPuG31iVwkNsPvv60+phDHJOyqk2V7h9n5f0li5BRh994b2IzfUgdYc
 I1h7N91spNJLFIyWT3tcCUzR6+n5cctDL3qOXiQ+X4KKDCw+gtIgHyh9l6P3bNs8RcXQC
 A7boScyGMgYUq2vCGn6Ku60cXJfdXvsWfRoae6fJITJNDkK7t9b4g8JQG/S6LapqDnQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A7DB80C68
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 16:35:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9B90A95C39; Sun, 13 Sep 2026 16:34:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Sep 2026 18:30:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a38ff8ca81b72c4f33081e8c7563fe4bc90ea694
X-Git-Newrev: 376daf3dd0ac4dda52ede3284dec59a92bb24130
X-Patchwork-Hint: ignore
Message-Id: <20260913163407.9B90A95C39@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pocketpy: fix build without threads
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/376daf3dd0ac4dda52ede3284dec59a92bb24130
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

pocketpy enables thread support by default (PK_ENABLE_THREADS=ON) and
then requires Threads from cmake, which fails on toolchains without
thread support:

  CMake Error at /usr/share/cmake-3.28/Modules/FindPackageHandleStandardArgs.cmake:230 (message):
    Could NOT find Threads (missing: Threads_FOUND)

Thread support is optional, so enable it only when the toolchain
provides threads.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/pocketpy/pocketpy.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/pocketpy/pocketpy.mk b/package/pocketpy/pocketpy.mk
index 23789dd620..c1ae075d38 100644
--- a/package/pocketpy/pocketpy.mk
+++ b/package/pocketpy/pocketpy.mk
@@ -12,6 +12,12 @@ POCKETPY_INSTALL_STAGING = YES
 
 POCKETPY_CONF_OPTS = -DPK_BUILD_SHARED_LIB=ON
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+POCKETPY_CONF_OPTS += -DPK_ENABLE_THREADS=ON
+else
+POCKETPY_CONF_OPTS += -DPK_ENABLE_THREADS=OFF
+endif
+
 define POCKETPY_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/libpocketpy.so* $(TARGET_DIR)/usr/lib
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
