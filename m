Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0F3C9832F
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 07:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93AB3605E3;
	Mon, 28 Sep 2026 07:42:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ITUvz9HLFbE0; Mon, 28 Sep 2026 07:42:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C5D346064E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790581369;
	b=FKlyc9ozghaUAyhEdGMNGND48oWatLPxnVKjOtgiNGWNMoY5UHvQrYziowqqJxF9T8qe
	 F+CGKb92mi1lQ6WMBwP6p3S/GBVHuwflcY6iPIX26Yv7OY7L6lILSV/VzhMvvabTm/UU5
	 lJ3Ibh9J4Z1MEaVRCRAPgx0advDbsuPLzc8ZV/BvbZWfn7UgVSnChBAFFV4FM9lCpUckN
	 VrpuhFeGcvcU6vymajoiIm4v64UB1zTlc1NxvRJ0XXX1uVvi59sAm/7L8exMjLRn9QZ9Q
	 K9JgMBIrSUzoaenBQb2bRfSTqb+yq8xVPHD1MELmVUOLeF3RqfILebOYp6ginA5ezsA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790581369;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=a3dAehFQqoPxohIBGaC/anifA33dV6tHjejP+xI9m1Y=;
	b=Q5cn1XkKbeRq2+r4FxKW17jJNFuICd8Nrwudkah+3osj1diq5VAF1k9l9V0NiP/oJ+Qx
	 cdk5j04YJZndrKcJiYI7SyoZtDfnpBsVR2SpkYHnWPx/YoqhdTCZXXCwIT24yinUuKJRG
	 OkyuXWN+fAfScUiUAn0QlZ6SS6BhTUUP2djoZwwfoYRvH+qmspic1Z/i31Ci9FuA4M+j5
	 nZUz/18kWr1Z0aF2/GzeiJOPQezxztAk6ThlSaINoFRaYbhHLEat1Y9zciUcVanJPmNPz
	 tOlvs0Cq2OgZgVjnY8myDA6JFwkpD8RWApV2eO2k63jloNEXtYTGs970bAUwtQG0fGA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790581369;
	bh=a3dAehFQqoPxohIBGaC/anifA33dV6tHjejP+xI9m1Y=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=J9mpdbKnHsnlMNJPRZVnGY6RuILWwHsnakFxEIflaPs3KUtFiU9qAWdaD3thDe35a
	 Vac/Kk7vWnbq0+O3CFfiqb+drne/oSx9UNlAC52HIkpIzTtJUQOWoqAFyVf4zEv9zH
	 2wLCreB8wJrQJIByVJ53VskzHRa+FyLA2rdQO4mK3g7/2g1/focoWAUNR7dlX7eJvY
	 f8xxekRCjoKh1Z4PCrWnrQH+Jz3TdEA2iuz17MqhfCUqNbvtaVwVJiEn8f/J0v+k5h
	 WN3NeJELvEFiXERNLUA88K7OsPVaY1scQB5mYLrxMz8vFK6iNd6ulqTjWYCJt9V6SV
	 q6o9SyGgRlTLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5D346064E;
	Mon, 28 Sep 2026 07:42:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C35E524E
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 07:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B48178082C
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 07:42:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BAMFrVBtuGpz for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 07:42:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 976AC80827
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790581367;
 b=WIFBbzCKjgM0oiUay9bUrVJbGyqI+49bOXsnMOoNRvCthobVZo328O+cPP6RzmmEr/HA
 EUSiUIREc9lIw269b+7+YKCMFnV2DPeh96LQxYUc2+zrutzatVZxq0tcB0etrZLF8cH0h
 xI3b+1MrKw3mQbN1a5/A2SbSQY+KmM7US5/t9gRR1EvUQgrgfx0PhR+Actkm+4GCVyeIQ
 y1GvbtLVrWVIOy3/z6BUhel0kQ3kewFaWPrsX23pfEEIhtboclJ3YsOWLYaTf3yGceo3D
 cCyD7EATU/okM1Kl9KcyFrpFw1QxK0NHkwLXfmpTiCwmIB1FihlGxubsp3IC/7le1aw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790581367;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=slzgGkOsI9o8w0pnqGnlq2x3kbTxpAOS0iK+YMGa10A=;
 b=k/0vswEImFmA3d+BxIqdH/DqM7rjhf6Z+G+6v7eoLTzq1tghmUKGfd/BBe8hllwUjss0
 hh+Xd7hylftyU9rrlT/3ghoPJfPdZzum2fS2flpVQeUbeJtTUlqZvIlUsmRqoPGg9SBjW
 8H2E0LL/nEZ2ne4N3XFjKBrHtUlA+byNMaz6V/sWInOdzGbORYC/RYyOvzkJhceyTCh29
 m5388n7FkJl2zrHSVCYVwU/mZ8ZxXACzO0qFXW+c/WEzRLT8vKnxvPh1lq6vbuagc0brW
 2ddZJiYS7HKC/VabaYu9nCe0qqI0h3Sl95cfSMG0xjZMT+pXYi9eR/FNmwSx4S0+y7g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=I3ah2qFu; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=I3ah2qFu
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 976AC80827
 for <buildroot@busybox.net>; Mon, 28 Sep 2026 07:42:46 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49b912d8239so21891915e9.0
 for <buildroot@busybox.net>; Mon, 28 Sep 2026 00:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790581364; x=1791186164; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=slzgGkOsI9o8w0pnqGnlq2x3kbTxpAOS0iK+YMGa10A=;
 b=I3ah2qFu1bVPzzT3O51n1VUR399XzXmb8JyEV+wGZ4VXQHbghs/WHv/2nbXwl8ndj5
 M8v6SrXBom1ntoKIUJx4JZ0CbGsJR8CuHzurG+6CYgeESxtlFSJR2Z6PpAy/l0EiJp0c
 cHbapKpuc5JuyYAg5XKycLVBRC0r2diORd8PreGfGs6tfpq1cmJvEUAv6RZf2EGMBn6C
 GCKYSF79BKoXxFagrqR3ylvlx5Suqxq/XWGytimzlUd7HF4MP9MG1rGfJAtm59BKZzS0
 KFK5EzbSUQKES/ACWnexuCOTHdqPP5HfOowJfrwVvTFVaC416MxT3Fg05/3vnyY3hw19
 ymcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790581364; x=1791186164;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=slzgGkOsI9o8w0pnqGnlq2x3kbTxpAOS0iK+YMGa10A=;
 b=Fyd7GoS0/qbAEmT4rUNrmHkhsZFlhoYVcwvYdR2Bpx9JhyFAQXdbrY5N4iuU0itfxN
 c5IJ3Spwzk+xTie0ikfF3hiYSB6Jlr7A//Q5XfSTvhRnY9o0BARWmzezF7yBANpnp0C+
 I1hAhvHMkgxp1QyS6z6L4Evdk8HaQ154GAF4Sq9hlH+8rfEEf0WPEqh3ajCJkUGoPfcX
 8OuobwTCdHMJFBwlM+PhgQfEc90HCm3h2WX6MTIyfDh0S/esLOoAYXN6ejW+99RzEuUq
 aRWSDzPaisIWmkswmN93PtbPQygBNcSO8NzY7ZUyQmzH2RfR0sYmnvYpsVtDdbWAeDQx
 Ul7Q==
X-Gm-Message-State: AFuF++m13MpsW+PUXo3NLUExY7eDgxtdNmD/8fi8pw0mJRe7t364yHSz
 UqfX17kAYZzc9UyFEDrxh92UElUcw+CiLFuSvZE5f/yXVZssPCgjrhr7dY+tLw==
X-Gm-Gg: AYBFou0I3SNEr9L6cjPNFQ02KQNIxrf+PHGi9GL3ODzYmeXF7Iax/djbzX7+o+JIX4B
 crKehhMCjoa2KXhEA2MdF9nDmI0jnhKnerXAhtRsKZY/5vC8ituWXs5k3nz9NwsPzPediMusKCm
 2lkOnk29FQ5tyu1STpEU2KajUIFlV2qtgHDUOh2OWAKUKso/ly6TszoDUj9+roStXs4sMbe4b5N
 AImN5/VStZzERafxBViExamOZOrJCpNPVJWgYSJ82hK6BRXSwwxG0nfccDxS/guLSi8Bt0C4Zft
 TrS84Te2Xd5bruqV/GZFjAueqxRh5Ypxsv6N8NIeaSTOXJE1/4OmKjwES6yJskNPrAXQzCiZ4y/
 BqKGDMpaa8Ga4kxsq6MHqQnKEwQ1MHHR039Lg6yFcUYRA06z4MxHdDbOIEAP8ofm7Z1dhBPZNn6
 VWiCo3wM/4HyJNZikd9brFVfEVsNxE0zDZkIFwtCINhPe/UD8KJ99ZGHhXfPTR818xlNosUX9+I
 7Y/206OiPekWsV0m/yzto7boNQh72+dA/5gjwaL28ZlGWgfI5A=
X-Received: by 2002:a05:600c:4f54:b0:49c:fa21:1c89 with SMTP id
 5b1f17b1804b1-49fe7bd0003mr205839325e9.30.1790581363885; 
 Mon, 28 Sep 2026 00:42:43 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a0016fd85fsm120916065e9.1.2026.09.28.00.42.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2026 00:42:43 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Mon, 28 Sep 2026 09:42:38 +0200
Message-ID: <20260928074239.24304-1-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/wireshark: fix support for lua
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

since 4.4.0, support for Lua 5.3 and 5.4 has been added,
and support for Lua 5.1 and 5.2 has been removed.
see https://www.wireshark.org/docs/relnotes/wireshark-4.4.0.html

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/wireshark/wireshark.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index c500a4933..ecf9429a5 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -109,8 +109,7 @@ else
 WIRESHARK_CONF_OPTS += -DENABLE_LIBXML2=OFF
 endif
 
-# no support for lua53 yet
-ifeq ($(BR2_PACKAGE_LUA_5_1),y)
+ifeq ($(BR2_PACKAGE_LUA_5_3)$(BR2_PACKAGE_LUA_5_4),y)
 WIRESHARK_CONF_OPTS += -DENABLE_LUA=ON
 WIRESHARK_DEPENDENCIES += lua
 else
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
