Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F8BCA5FA2
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 13:08:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95C8780D5E;
	Mon, 28 Sep 2026 13:08:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tyg6EbJbi6R3; Mon, 28 Sep 2026 13:08:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org AF57E80D18
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790600887;
	b=EgRpQRo356QAUZOeZrbmYDXmuEAr0fcDwNRLN2ZJ7TgO2upTU7d1qgxg157d9hqIhivD
	 Kh9DcBvoS0uE48Lk0r05iHb1KeVkO2aIIaME4+4SM9+gxH766169save9Z92HimjotY4v
	 Xg/cqqHPki0NhabxMA7q0UeRct7vRvX8CYiPG6ODQPBrDeu1HU1oJRrMJSKmc52z1Tb2p
	 N+3IogO5AEGLufpnNN9eU+PORDfepoGOLs9/Z/LBeA3yjztb5Zn1c1mqOnvW4EdyrloF3
	 ApqJGkJ6iPvOfNXaSkFeWKOlrahRfkK7YTsUOiEq1E/Irx06vMA8Y8spiGnuOC/s4iA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790600887;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=YtvCrRWK58ChGj5IBQ5ZG2KSUxxDx6aNUsXv6k1zLAs=;
	b=EkKPwCyGH3XhBoY8jI0HYU86lEQ+F4Y4t6tojYxm8c2702c6VGrgOM7DiWhyXqIYyPHf
	 5a9T4Q0jsyyfsI+C+p7lgoXpnrjZaFBCUvV3YzrlJAJZMihgaITbgc6TbbYTCxkjiXpWc
	 w8F11bsc2M2HTA0Enc/2oMdbrDcIhtQqhOJ65fpFJttiI4jROelS5qql6EJvJZ/eEZiQF
	 h4Ubakb+ClxRMmNMGkG9ED/GBZPnJX5/CnxtKzQCvmYWaNjsvwAspRqafdA2tda7iDkrq
	 RkDk61RE177Qod+rtdB2lM8qLRx5AQaqHFy9oEclO/uJsX6rc7yjXjCx3WQPxT4fXWg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NBG6dNQl;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790600887;
	bh=YtvCrRWK58ChGj5IBQ5ZG2KSUxxDx6aNUsXv6k1zLAs=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PB3fRCUnn40yFlwsjZPkAezfg9IqThqbxR/ITjoI93Pji8198q8SP9ZzmlTQe53jZ
	 Kl7fUSJHg5n9Dvdyr0MorAMVaH0fTNN1O6ZWfMubg8EIk0ityMcuA0B1LItSDKgffR
	 SlVHgpb0QbsFCIG0rZlwOdyXWeNMu25FclncnUFPjpf1/Lk31Rw+M6dkPcunukuaaV
	 D0M/YEYN5oXhnuBERA8Hb3YxX6XloWsvG1bqS/fvbVrXgEIAIc9DdRnJu7jCdif3Mb
	 Wu2UeMtSvFIO5m0B3IywhVrz3Twe6pH53CKi14KH4NQGMoO3UMRPpGFS7uzKo0ZJPS
	 QPvVthsGLpSjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF57E80D18;
	Mon, 28 Sep 2026 13:08:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 764CB3A0
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 13:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C0CC80D18
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 13:08:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AWvXBn5HEp2N for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 13:08:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4DE7780D01
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:30::f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790600884;
 b=UReTzIus+3AWRSBgRSarX+6q7ED9xZEeXUXmjD9l6Bfu/85bPcYbUJUL+ZZBi6UnLyGb
 9j8KKlFM8EP0mKIgieBxT0080yJbzoAhoyhSuf4+GlO3VDlAyxNwgAkv73DWKVoEuPLEA
 GdjIKCjOVC+80pJNMMqwgM2Zf2N93wUy0NGCfnkow6m5hDs1aubcRYpRlqcW39Ck/GXXV
 BtUJr70ujWciZwVl8tWfmRv75hJs7MNRVIZ6cbVdA+EiBm9g+A7g1wWQwkQgjD/pytwj/
 6EwK7FvZPQJbBxbinb6ge08chqXFmtd5GIZ54l6dKjw95k8gSFrBKHiaWPUoGXtcAag==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790600884;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=bvM1NL8iyIiympIvYfZhzXsWpLhNE+cL7Tq+rzcyCXY=;
 b=cWnqLx0wIekYj0unotr+0WTNHPCdbdH9fGGBKgjndFQ9r/YiHv/rIzNydOKf1P+LPgaj
 aVrD9FQhky9hbCh5fxqqf0qsaWgksWuHl8tSAnoC0v7AT4cyvZ5Rsk8ckAYF1XsBUGyhH
 hgkPWsJSNVbfI7feALjod9NotWs7Yfp7EvTGNtcoh/xz8pW+ZeMnBD0vYBud5uJ1ULF4O
 X40rb8EIXnPDHQq+JlygnKsW/WJAWyKj0B3vTDc9nYp9Y5UrN8DDISiPCW7UGNPllBcKg
 4nVQdKAzpCy8G7mqUtSd4NtRSTdJrRAfZBztxEbDVLMxTBLF1RSAjm+F6A+sqn9X9Fw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=NBG6dNQl; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::f"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:30::f;
 helo=mail-wr2-x0f.google.com; envelope-from=francois.perrad.86@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=NBG6dNQl
Received: from mail-wr2-x0f.google.com (mail-wr2-x0f.google.com
 [IPv6:2a00:1450:4864:30::f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4DE7780D01
 for <buildroot@busybox.net>; Mon, 28 Sep 2026 13:08:03 +0000 (UTC)
Received: by mail-wr2-x0f.google.com with SMTP id
 ffacd0b85a97d-4887840c529so1129813f8f.1
 for <buildroot@busybox.net>; Mon, 28 Sep 2026 06:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790600882; x=1791205682; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=bvM1NL8iyIiympIvYfZhzXsWpLhNE+cL7Tq+rzcyCXY=;
 b=NBG6dNQljbIY9ojFJ3pqi7JwmEJ8SDcCkLv0+KH2o5TUCottDJciL3FSX6ktT78ITI
 xYs+/ou13XO3Gg4YVWGsPhYJ33iikTbmqEB/R5gprTOKIHXJuor/DIRKOUq5Wsgr1NOk
 HImdZxD2U9YmQKre1uGN9OIuA9Mxfl7jHb41N7F7hsjc+y76Ubv9qKNWjrnkDxGWkv++
 L/wWkf0Poj5RO2ohOC5TUgCeBVviLKEmPy2wgD9mrGeq0UbGGuZiU/SNPrUkVvf/01AE
 qb5lFIynJIQ6rSNmz0N7ij8j7gkzblYgPzWCFzvLc65M3K6ApJSaVMoiQjLClzgJoKh0
 IAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790600882; x=1791205682;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bvM1NL8iyIiympIvYfZhzXsWpLhNE+cL7Tq+rzcyCXY=;
 b=ChMxpHgoE2dLjW/5P8nZF0URNqchzDHx8Ki2vzPmHTCbtIEzwNmNqCqd4r/kKz7dxS
 cMI+q3VP2h2Gg0+ddUGTVTVLdz7GdqWrTdx9aJHXIA+JJ46CM2j9RWIB68Gg7Fh7t5X7
 l96TGMW+mYJLXo5JYylOO4D7lANE0nUMoSyDSX8HQibRJM+Pt8WTz9A1E2osdPONAn7p
 P+IqrS/NXk3hx26fDUUUCv3biio7nno/W2hZqXqA2Vdx4+rnwpnrRAGiM4+JBqWzKMSn
 /3ZBdXI7GphSBvotnZRieGlZ/48sqMQCpqpx102GQUzokeQhqnMs0L4QzXPnvOh2VO9n
 wfaQ==
X-Gm-Message-State: AFq9FYIMuhNI0F/FtZ+JNnNe0CrBkqJDaOJvZBICssx+Cq4W0tSUoao7
 CMWBfb0GfQriWEmoaCJjgiNUquPKJcqlY+ObUNX2ZkVXkEoqpXEFmYjKHFbtUA==
X-Gm-Gg: AYBFou3HyRAhtcWCQ4sCfcTiGcec81nwBNk1FfMvPRsbgd8VP1qA25uN9rNYqWGfQu7
 NYjCxvAnpABKEQwKxdFMRL+KNs18QS6Qk3TOaWtJvlkIfjj/w4BKCBHoFheTEZ1l5IJVwBHGPmJ
 38C6ez9mU62/vsgHJ4x5298sjlfaB4p88Sx2rgBwyJseEY0JZwaUN/KAHn90K7J2uKWkMK+/mRN
 Upu+6mcaNGtzRtdrSatXNxNlv+XuPEU06FcXfeCMzwUkB2EYbLjYpfarZyjH8BW4/RLyskAwdM5
 rj3BZ21A9dwYA7SOYkWP0J9iCpHFQ/s7TJct2XxQY8IO2wZ7qX0YZCXEJOOG3jTYfOHWjyWY7V9
 7OigZ3UUCeBie6uzJdMcrhcpq6NttYMfS7Dxx+FTWur5I5UWXwW8gr1ABPtHzfsrVVK5NHkaeO5
 BILwAeKUXdQOIChRn9g1kQPafh6mzp18Q8vjMdhG3UoO3SSkG3+0IcIUdbEJxFcyrePJ8QOAnyH
 Q8TgGWyxF2YyuUPIhnSYP7KsdwPJBy1jEdMfchx
X-Received: by 2002:a05:6000:2892:b0:487:f31:857f with SMTP id
 ffacd0b85a97d-488716c7093mr26974171f8f.15.1790600881300; 
 Mon, 28 Sep 2026 06:08:01 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a30b9aesm25645181f8f.5.2026.09.28.06.08.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2026 06:08:00 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Mon, 28 Sep 2026 15:07:56 +0200
Message-ID: <20260928130756.24498-1-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/wireshark: fix support for lua
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

Fixes: 49fa20e6678ee32e4b26979f5cb4d149876fbedd ("package/wireshark: bump to latest upstream stable v4.4.9")
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
