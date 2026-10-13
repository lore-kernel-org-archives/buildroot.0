Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D51CC6B08
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 09:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C956F6076A;
	Tue, 13 Oct 2026 09:43:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H70PkK10qIQH; Tue, 13 Oct 2026 09:43:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 852C660774
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791884588;
	b=jNxP+7pExmfRmrhJf8/ZRyQh3Nbfjfxldg2Mh7ah9OmkVBta11O6sO3P7HICv48vAhnx
	 P2mr6MxS8EeodaNaWXDa4dzAX8UOKASJh1XOgnZF75a8p/kDRFRdQUc8yf0ecXwPC0xqj
	 PlzolZ0KHYf+vV8PMcVjatxh5bd8iVgt4mT8nXHB8WRrCjZsNOfe/dthJq3XpdFFaLQTp
	 BbjkoH52996pQNTMWspCRvffrE9jl6HM/Bp95iTQiZyZqerbVR7aHUNT1RpGG4aLX9bsv
	 cPlhlXI18rPPqCveHYpQoARRP4f91/TM7lIyp1VZNMMVFNtKnKrGApRZ2PpdxzvScfw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791884588;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=a0BuV2bN3GzNjdGJT35XF+jPRACok8LWUnXZBF6N0Uw=;
	b=MmvO8UUJLrJezTn8STALsV3cni21orw0XYXZq/pkhq8YK2S1ISKe4CzAOEpHuYNFZiff
	 HZAfZwUGqiwzDah0iI9jHHEdiUD4l6uAz4UeM5TyukxrVNjyZ0SReKpkuTGXLnpMBQN8b
	 YzyfOvLb8mnFGazBOHJy8HtJnlJFIlKkIn+5H/4936/OpDSX/MM2Z15JNfZK4jysXoZpg
	 gsBjLxwOW6OOpK9eHHo81NJjgd5FK3zj1waKDJ9E+vAoT6I4vYbMNC4b8yrPv+NGJIubh
	 uGzSnGd7WdPmxFGnOVT+uR2QFaGlyrvw7u5aC/2MWhDcEpDP2BJ9JaAuxDkIALznJVQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791884588;
	bh=a0BuV2bN3GzNjdGJT35XF+jPRACok8LWUnXZBF6N0Uw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kAK6Z1MQUfAJ6vDQOlK0xMp107uqUZxTULv8Ko2nB6Q5sCyaUKK4rhxxMTUdqe7zl
	 Igrv9yTZzMKvwLPOxQlAO3nGi4Ap5Z46ew4NO/iCK4g+K4maRX7LyaRg49K+P5V87z
	 u9ValzFGQ8Vvb4x8Uyz3NQyn2neIy8l+evXmJRfCPyP+b4P+CpAaPIJJNlF5r3xe+e
	 p9fzL71VoKi365c7U+a+dAiNgZ8uHX0PhozlRjF9VT7xFAGTVXwX3Eof/PO2BGWgFa
	 GK4KNJnbRsIKIWlYHR6LipfgRfa85eEshPFHYtAfltlC66HTSxxPVvpscQHP4YKwnf
	 KE+KGW4Af4sEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 852C660774;
	Tue, 13 Oct 2026 09:43:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7EA3675
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6492F80C8A
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sPiGisHwwg51 for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 09:43:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C6E5C80B97
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791884583;
 b=JChYRVI94Lu7UzImxh4F7xVKmeWJS1/KJTNTfXfa6oNF+vZOvjdWez9gYXHMl0fuEJgM
 01WfsrhqBTGSnSlfOex1gQVIdW0TkeCWuh3MvZFD4t16A8T8oYyCW+Q8inLVKf8XovjKw
 Hyf8qIauPk/xLaZDUAvyb8/2s8i9ClyZ5lhspmP8+VvvdoS7FdDU1JKnWzrvHPWatBWV0
 Sm7VBkqK+LTN/g6G3wsyKNUN5jgU9Mg+ymsuBow0Po5vz56TEXmM/mYPzykRIe+YDQ+Um
 fImevflzs265BdgkxhhL8OtaEZsrTYu8jPv6PLW0ONdHmCrdk8fbuAU9SiYPWSNo0Mg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791884583;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=CzfukccaU4KVTQlxZ8t1oOD7MWfNr/6qMjCiFqyvE9s=;
 b=UXtmOkqXU9FONL1slYEFpeoPOE6uEHUNkZueVRYHeAnl7p5MiSL3jI+78xGaQitlrzuS
 G/sLM7KBtThbwP/0rrd1QBoiVhLkh/I009RClMCdqDsVyOxGA7KxARWuERBg6BLq78ah2
 dFY6smslWnImXthkzo4XSjA/kxuBVMA9J5V4MO64aWjgt2sBq/CWBjpoMq6PtTgOnZHzO
 9Ihxqp3Pq/slRRFcxOlaq1aa4LDvrR0oSDrru7m4Vg1xArfKYDLpIzYooQ8efHoh6pYrN
 Pk3YTUdMS2IVE1WNhHP4tQI5O4Pat2KUJakgCegPqKTbVu3ajy2zph+/vdeVfP8J2vQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Y9Qjv5zT; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Y9Qjv5zT
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C6E5C80B97
 for <buildroot@busybox.net>; Tue, 13 Oct 2026 09:43:01 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4a0286c981dso23345215e9.2
 for <buildroot@busybox.net>; Tue, 13 Oct 2026 02:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791884580; x=1792489380; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=CzfukccaU4KVTQlxZ8t1oOD7MWfNr/6qMjCiFqyvE9s=;
 b=Y9Qjv5zTJcWDTKuzYrZhgciZFMoV6zfEQImfDWEjnUdZR5Yy/RdfjDPdKbAzWzkHxY
 JPVOWjdrnKyfTe2xFCXDxsaOLGzG/l6QVP8grtJeob3qQySNbIPQP79c+E709KAS97Y5
 wurJiOGNfhCAUY3zQ3EVvobJoxt0YhmPDmPoYuaGsKvv/3yL193rzeVOjYhVuAjTc8D3
 kVJNhhob5G3uGrjDsaL6pZzQdve0IC5kvu7QG4Sw0mv4xnmpB3DcKb8Cmjwx7Iws4M6V
 2JYhARmUhp3rmleSTmAqyvUPTyjWj7jLAz8NhVVy0sAzVymNb2GCdwT6sh5sQOMtH2u5
 5Jdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791884580; x=1792489380;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=CzfukccaU4KVTQlxZ8t1oOD7MWfNr/6qMjCiFqyvE9s=;
 b=C0fkJseG2jyWLabKfKcTuM0VZoBed4HOPXkQJpZnAdWq/+ZO+Bqb+UKQjDji2/wOUW
 Jm/g3K50nOEMYOe8LVZFVrvEA81tBZ2w79FO0PDaFm8eaI0RM4UsW7ZGlkoUMkUJeDij
 TLRV2Fq7Q9TP09iIepJ7XqdbQHOD8vyE+CulLmManNjnOXq82Uy7nco6f5NAo3fEJGMa
 EIPX3NEdWWP5EjzmUshM3Y65wjsi7RPSvkU9T6rHrRFWrrm0DpSSlDYwkQIlBZB4W+z9
 Naf+2JVdlIuvGx9/ATDIpWLfu69yfCPKpLkcbc603G9/cP4HNx4GDtw0TGLDmw/Xf2KU
 +dYA==
X-Gm-Message-State: AFq9FYK13FGNMFDCWL6iFzWN2MWsGdBlc5P+PaGHtchjpgLuyEpYH+U3
 SProthFoLJZVyvbFKd8hlKLIxuHPrtfrqvX0qJXTZuGbYnINv/tLxBivEd5COw==
X-Gm-Gg: AYBFou0HXcSZ2tpSKdjVnUhrHKbtTHg6lwpZ/YxoTiiyduvYfZUFZ56JLfh+wZodMXw
 t+AbIOQ3s4qn3+1s04rZWuxOxo39rAQJ76s0jIMZFYGNOeG+41Cr+Yk/9npaUFmIG+8eaWtVsQ4
 Osdld2HYIKrCfkdUaelfRRaE6uPhcKEDMyoZEHyjdivookS/eB7l1scMd4rnwZuCcUPYtXTf9+e
 73DKDyeHD74kNJ7DYgmYFMxJ4YoRX3ecVg1/Kd6PteviaSjg/Ib3pOmR73NTKT5+NiN9rAiZ1W4
 gkgp8l3lgczVdIohPLCAKGqfoBCsE/K4tP8WjfoBDa7bR2aMKXcIconJsdNgskPfRMFGLpvLTUQ
 Y8BWNv7iDokdHlGXaKuI5DbH1+r0QtWxfPtRXfZKWerkxX8nyg08hHWdDqn4iTcz1p1V2KqxAqN
 V5v4KBNVxKC2zv/8ejT0qfdYIersnpz/82Z85LvMAZQ6Fop037oDELlSxKC8Kfg8OPEe+UAdqMp
 ktnjsgje3pRT9ea7sHkJ97aZEVUz5iga2UZhOKJ
X-Received: by 2002:a05:600c:820a:b0:4a0:98c:e082 with SMTP id
 5b1f17b1804b1-4a18e4a3f0dmr226047435e9.13.1791884579580; 
 Tue, 13 Oct 2026 02:42:59 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1972eaed8sm238665595e9.1.2026.10.13.02.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 02:42:59 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Tue, 13 Oct 2026 11:42:42 +0200
Message-ID: <20261013094252.96761-4-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013094252.96761-1-francois.perrad.86@gmail.com>
References: <20261013094252.96761-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 04/14] package/perl-http-daemon: bump to version
 6.17
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

diff LICENSE:
see https://metacpan.org/release/OALDERS/HTTP-Daemon-6.17/diff/OALDERS/HTTP-Daemon-6.16#LICENCE

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/perl-http-daemon/perl-http-daemon.hash | 7 ++++---
 package/perl-http-daemon/perl-http-daemon.mk   | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/perl-http-daemon/perl-http-daemon.hash b/package/perl-http-daemon/perl-http-daemon.hash
index b1d92ad8e..c7b679958 100644
--- a/package/perl-http-daemon/perl-http-daemon.hash
+++ b/package/perl-http-daemon/perl-http-daemon.hash
@@ -1,5 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-sha256  b38d092725e6fa4e0c4dc2a47e157070491bafa0dbe16c78a358e806aa7e173d  HTTP-Daemon-6.16.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  14f98fd61159ec4740a21781b787944e  HTTP-Daemon-6.17.tar.gz
+sha256  16281580c40e23108d028434698b5d7d53637bf904c9df822481e253cbec920c  HTTP-Daemon-6.17.tar.gz
 
 # computed by scancpan
-sha256  311f168ba9a7819ffab4fea19858f9e880737baf6d112929d11530205035a4cc  LICENCE
+sha256  994ab45a4f8ef43f47b7baabc48d100838c42d226d8d161d6ac1f49c5f9d7c84  LICENCE
diff --git a/package/perl-http-daemon/perl-http-daemon.mk b/package/perl-http-daemon/perl-http-daemon.mk
index c017c4e09..835a6cc49 100644
--- a/package/perl-http-daemon/perl-http-daemon.mk
+++ b/package/perl-http-daemon/perl-http-daemon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_HTTP_DAEMON_VERSION = 6.16
+PERL_HTTP_DAEMON_VERSION = 6.17
 PERL_HTTP_DAEMON_SOURCE = HTTP-Daemon-$(PERL_HTTP_DAEMON_VERSION).tar.gz
 PERL_HTTP_DAEMON_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_HTTP_DAEMON_DEPENDENCIES = host-perl-module-build-tiny
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
