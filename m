Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83DA6CA9ED1
	for <buildroot@archiver.kernel.org>; Mon, 12 Oct 2026 11:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 233214059A;
	Mon, 12 Oct 2026 11:40:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r2s3QnDzEh9q; Mon, 12 Oct 2026 11:40:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2B2964059E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791805207;
	b=F/QEQnzbCp3Ys4nKOm7krlXiGY1AKc7/GaWbQhg3674ZuiDvXy2sdDZn+t/+HDDujUo2
	 /LznLDa12+J+rokIdIZcW+QA66krlkP2Fk6VkjjmF0TzLsMjhjr5gDfrER93/txyGHwMY
	 x3pAScYqfJz2SxyN1+arCgaTM8vwCnIBb8rP8nepVUIKrR+9EGuD9w/2FBX9VxqlSyHEs
	 W1SuMQy2rJs4p/+fiDoMhF0evgSmCmJUDS+OFRzTvy4gfGxrxQVUyICWfsmLbvNBl2enD
	 4Qwh1i/CEfyZwbWbDnXX+8kKV+OqwC04bP7IqswtkVLYyV3qh9i78IbzgrW2AYDkhNQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791805207;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=MplzhtFtwQhV8lpU0UoJx8aaG8J+N8qajiRVcH+Riio=;
	b=gvUpulQkk2S0dXm+OjA7kexBYecYdlCmlY9hw7uN672AFdG8zMXRj6IXZzLlxBXx3eL8
	 IyUxvkgoQSkOjgKSWti/RrydshOYmB2CV2CukTDwTOROjhvj53pO2NARwoXKfbS26JpTU
	 UZRdMGqB3DI8M1mjUlK7fheEPJCvIrMgn9BrM9SnMV12ooCk3x8Tj+FCnL8G1B7TFARPX
	 Nzx24U+cZgPP1yIfGe1StWg89UyR3nWLnCHRQUsfTheADceWrkKF29HHs2LFB/BQBAruG
	 SSXbRjoJfkwZL3VANeBw6lkeWDYadODuEwrH9oPWJg8NB6PFQa1KSBanfah6oHQl6+g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791805207;
	bh=MplzhtFtwQhV8lpU0UoJx8aaG8J+N8qajiRVcH+Riio=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=AqwbKUw58Kk1r9p1nbaos7jrd8QgzshatBh+ayY4cRCT+hd9gJ/NtDC3hE8Ea2y4H
	 rWqi5/ujX6dn9kVp4kxUq3ku5rCT8TObAyAagGfIoDglbplM/9o9i6JOq8rjQDyb97
	 TzWIylJKOvup8mFVnfWdDAkAh+GR3NHXYdckWc2GOzXZzVnzva0fV+hGpZKki0JRI0
	 vopG9Roe3DpaZtSUc0IeUNwzx6c1yab+3mUg2RVIxgFlvT8qoa7Er7Ls0BC5bgVgcd
	 jI3ZJ93wRmfUu3jozEJ2KIhPQivQbfkkWX7/x0b11x7CeHO4yPZp4tYJFqOqqxmWHo
	 ddQTcP/G4nVog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B2964059E;
	Mon, 12 Oct 2026 11:40:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E10F194
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 11:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E6AC40182
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 11:40:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D1p2_saMZhQM for <buildroot@buildroot.org>;
 Mon, 12 Oct 2026 11:40:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org E4E3E40076
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791805204;
 b=cqvNYpHl6cSQqzejmFuz23v+fLP/HK0Jtu9LhjdKORpfkeJOiKAtM5bUx6ByHoiGoTqt
 aVQwmh5SYD5BGvDOHsMaS/b9VRuudh+LXOJwZxJ+7ehyOg/UuiszgHdLRqlPFO+j83vNz
 aMRKti7pIM3sMEnM9fYzlVl48q7NtnXSsTTGPwKVgf6y9HG8+MMmEnYwsw88ASepsF+w7
 pUGtVfSmdqNBDFmfwfXekY6EpV8ATd3HT3/vLCbnvnjMkDX4UgnH0e6JxR/tkygF0V602
 oGiZRgiimmTR0ush1j+Rj+2FUlADWhfKMn/eX+9qjNHgmgPrfNreNrs8AoG6hWwnGEw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791805204;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=I9p3iQyNHMCKSSq5TUvenAvrsaABVem+NNRcN06MEGk=;
 b=YQ+Jzr834KY40/zCYUQTb4Kme1EQBqPmAUvRJLcOUBz21SInjT7iKcq6K9bsQHY9eeeE
 YNJuSCQy/GDFnjchgr2s4adKe7HRBzM9J0Txc3Cqa47FBiDgDcsIlxh6KFhK1llzuFvJH
 XLin9J+ox/V/tldpfdpblRQDbq+59W7BuUhb2cWYnGLmVhoDS3hyi1mcGWehftbll8MzU
 EMkPHwv6tKGeqlTZd7Y8RQx24jc6056HyllpffOIOi1vwY1jRKUBDndDBQdmc6d9SkHhf
 ltBe7GYnWiYVymUYVS+/X5CzqBhBeXya2o3WAhc4vTqL7V/XFn9P8HIAq61n8Z7/wZQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=F4fe95Zm; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::435"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E4E3E40076
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 11:40:03 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-48b0584ad71so914125f8f.0
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 04:40:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791805201; x=1792410001;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=I9p3iQyNHMCKSSq5TUvenAvrsaABVem+NNRcN06MEGk=;
 b=ODwODIUA4vlgM/uS83joE8S/C/G7z2TeMqJ9Qn8i/CMMAWLbgY+W4f6TcLJaPQicm4
 qTNm8f+X1dlD0izGzH/5pJy0OliYdvANSRlTZxARkBXXBbauNA/lq5bm2PqVsnyhm6ex
 es0GAPQL4mNdbUkg10YsTfnBy8Mxp0FME/lzd5NHbQVduNdWHFpwOnWh32fWQNFw+3vS
 dzxFyJ9ezVVZcZHJyNEb6sE+0cc+lmMt8F+fqxeXY2TJqfUUusd310UQ8bl4x2clZisZ
 F5qM9Rj5NXvctIgi1CdMArtO9bmyvglzssfy2bC55fGzyWfqV0bcg3pA98+aDntbwNr5
 rDAA==
X-Gm-Message-State: AFq9FYJGyjfw7bPuJ/Kv6FOntni0fg3YYP1z1MeOFkQAeHKqatpfDbK6
 1yczDT+2tDnZ6KcjaB2BnGRsSszafvu22DKJucXnVIutysrGgNB3O5s1E+U4xWdIInySmdsH3Sw
 dXDK9x0w=
X-Gm-Gg: AYBFou1B6tEcrZ9DsY/GA9DAMtfbke/G72GhRB+6XnRckMz9xQ++4L0GoTDKDM71KKG
 D8c9Z+iZTVMhOwmznCT1TOpgtgpcXv4pmoXMmp7n3EiD/EHader2MwqtZY9aSlJb8NS9/URPj+O
 hpnwe8UvY0qDgZXOajjZLFpz5KPYaTod+QSh0dbxbXsaOKEcf1feD8Qt0geRdsyh7IUZX38Lih6
 htkp4uBoeTn+httt3GuqCFm4aT0Sh6mw4/ECLQgQY3moOf3TuixfW7DUM4FMZnNhO07NlG2ipQp
 +ly5NFnV/LHuCz8XUcmOau63SZU7haQwBxRe+oVtyeiQl5J51UiuAwH+rGNKH0jRekapQe4HnBs
 paAUPMtXjbStK8u7TGlX7fwv9LACXL42RWcioPl1XUiTYUGPUqd0XDMbWUWjMyrSvsRvXvh1XLy
 bJT1McXvFb7Lnu7uD4X/Yi4PBfu+L1X4IOYyq5y/d1yRl1pSH0SEw4hFAKNiCkwmfbXg+U3TKLl
 bhf/mMPCLvsWAFNE8IhS6TU/3AJw3h2ZakEFHO9uss=
X-Received: by 2002:adf:f704:0:b0:488:894d:20b0 with SMTP id
 ffacd0b85a97d-48dbad336a7mr12690104f8f.44.1791805201045; 
 Mon, 12 Oct 2026 04:40:01 -0700 (PDT)
Received: from dragon (ptr-94-109-220-54.dyn.orange.be. [94.109.220.54])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9ae25easm19705000f8f.59.2026.10.12.04.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 04:40:00 -0700 (PDT)
To: buildroot@buildroot.org
Cc: thomas.perale@mind.be,
	raphael.melotte@mind.be
Date: Mon, 12 Oct 2026 13:39:27 +0200
Message-ID: <20261012113927.1642597-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for 2025.02.x] package/shadowsocks-libev: update
 the site URL to shadowsocks-c
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The upstream repository was renamed from shadowsocks-libev to
shadowsocks-c. GitHub still redirects the old URL, but the README names
shadowsocks/shadowsocks-c as the canonical repository.

The Github releases have been preserved with the rename, and therefore
v3.3.5 it is also available at the new location.

(alternative to commit 0522d9af895473a34c0a467e72e70d6d6e2a853e)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/shadowsocks-libev/Config.in            | 2 +-
 package/shadowsocks-libev/shadowsocks-libev.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/shadowsocks-libev/Config.in b/package/shadowsocks-libev/Config.in
index fefb27bcc1..3a6c8efc34 100644
--- a/package/shadowsocks-libev/Config.in
+++ b/package/shadowsocks-libev/Config.in
@@ -13,7 +13,7 @@ config BR2_PACKAGE_SHADOWSOCKS_LIBEV
 	  Shadowsocks-libev is a lightweight secured SOCKS5 proxy for
 	  embedded devices and low-end boxes.
 
-	  https://github.com/shadowsocks/shadowsocks-libev
+	  https://github.com/shadowsocks/shadowsocks-c
 
 config BR2_PACKAGE_SHADOWSOCKS_LIBEV_CONNMARKTOS
 	bool "connmarktos support in ss-server"
diff --git a/package/shadowsocks-libev/shadowsocks-libev.mk b/package/shadowsocks-libev/shadowsocks-libev.mk
index c76983ce5e..96dfcf8743 100644
--- a/package/shadowsocks-libev/shadowsocks-libev.mk
+++ b/package/shadowsocks-libev/shadowsocks-libev.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SHADOWSOCKS_LIBEV_VERSION = 3.3.5
-SHADOWSOCKS_LIBEV_SITE = https://github.com/shadowsocks/shadowsocks-libev/releases/download/v$(SHADOWSOCKS_LIBEV_VERSION)
+SHADOWSOCKS_LIBEV_SITE = https://github.com/shadowsocks/shadowsocks-c/releases/download/v$(SHADOWSOCKS_LIBEV_VERSION)
 SHADOWSOCKS_LIBEV_LICENSE = GPL-3.0+, BSD-2-Clause (libbloom), BSD-3-Clause (libcork, libipset)
 SHADOWSOCKS_LIBEV_LICENSE_FILES = COPYING libbloom/LICENSE libcork/COPYING
 SHADOWSOCKS_LIBEV_CPE_ID_VENDOR = shadowsocks
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
