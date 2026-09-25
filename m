Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C2AC98321
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 06:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9281E60BBC;
	Fri, 25 Sep 2026 06:43:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jGXhi7fmU4QV; Fri, 25 Sep 2026 06:43:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8CBF760868
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790318599;
	b=e6ohMnSZddvciQRXvJgZcQwcPOeBtO8x7ijlZA11wOOK0DnOO0FbS7AMbMEM7gmCRBh3
	 NTvJbsWXDa1uE9bS+o0Lfc7NU4hEAPNeiJoQ6CxbjS2Ckwtylk+OKjMrg7hsjWTKUCBxE
	 baRekfv7gONh5KIZfXw8FPLqJTTrSRo94e44451tcqFL/39a32VxcLhjTzQaCU4vblSFG
	 gFAE1DVE1FAETFv0HmH9G41Hi9ayD/JwlTgTReddkMVuWitmSGHDX9zXP1rc/OQ8EF9/J
	 J13/y+v/4MDKyeSGBk1R8aIJWc2kbi7EaJ93gmfZwMY8ireCdcDpeHwLWxBh5dXMElw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790318599;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=2WCvrB1mKCmNCitinCXdZW2TQdHztgeGKkM98yJ4mAc=;
	b=dA9PNRIct/dcSANck/13d0tJa2NOSquSSGNcdWOvQmmziRTBiTakpqDH0dEfkuxWNXG6
	 Mqsp2UH0upg96+Cat9wMKY9jUBNxQ3/yRx43sBWYqa+NPh5NzqnZAdmOZ3lpu6fTehkxA
	 D0xt/snjYDUk7Q8Mt+YTntihYLqKGS8/PcQkQq4Tp0YOEmUH41F84YUd7mEhkdduD0Qpa
	 G8XPBNVn2TSHyEOMGMNCbTggcelNzvwY98AouQIlD+pTzSmGQtS4G9u1u9EK3xCGljlOX
	 8jnDK0gnZRZGqz+ivolALa30Bl3MjFwZ2AO6LSwgboi0BGnZsjjOc3iKVEZ6mPfHELg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790318599;
	bh=2WCvrB1mKCmNCitinCXdZW2TQdHztgeGKkM98yJ4mAc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=WQRMCj8xs16G3+iOqCsZCJJjOcdW+pOBqGNvGs+q8MWtjG95H29+K/5muYkNgkHwA
	 kNafu+UWEBejd3wKPihRSwuO6VFX7scsQ5G0I5Wk378zUxQ0xg89yKnKDoZs/jAROg
	 sYAoavJZ9PDRZ3XrqMayessmuxwUNXei2yxLxOdw5H3sZur3wnlov5TcQk3uMBmLWX
	 cZIBb4DRc+HHndKINX6XPmxrP0iB+rKRM3DkymdxsANsSsuJT/2mFODNgWGq51XHDN
	 xdIkw+ibEOQKdcxsXje9LU5AAdjYxBO5PDusbsFb80eOuxjdod/YEzyHSRaR1kXP8G
	 Y0hJ5xAiq9shg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CBF760868;
	Fri, 25 Sep 2026 06:43:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E21C332F
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 06:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF4D240848
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 06:43:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uRG4bLGHJZd6 for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 06:43:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A9E324083D
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790318595;
 b=IjR2qxkz/rW3qCQgwKiS7KgVre7jtAtWnqvXnWlTsLmckAYbZEQgdzArBut1Hyn9UEMf
 VFwPDoPaLYilAuZLqrzqVg0MhWq9rJtubpys6a51WHkKkAG7MyvvIg7cuAsJCL5dUK3Jn
 f/G5ULbUGlWlEcYk9JE68YIOKFR9ZAAWsa8qA7NoNRzCAYxV8w/CpkuqCPfnAzjmbSbHz
 GpVK2b0WYNOsXmADPUA4n/6qTMoTwu6TMgz1Dt9NcyLO4mKeHrRbHQ5DZxP5hLYZACH4L
 iZ2IALXhL5UR/6TurKnWP6XXr1rgrCRyMzCwjopCewmGEzJlZ5GzdVf77vi0Q1N1Oug==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790318595;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=FsDovDfy8TYBhQEXo3mx+ibnkUcW/VGzrXQogKLrhdw=;
 b=g3QyO675pgyB9kfG/qBsH4cK8Pc7+n80NOmzqPh2P819US1YE1pv4uBdvdtZsw2wuu/H
 jGUxiiSQhZlqoYFqdpUUcKn3Ici/0JXO1kClRqH6Pzh2+AybWAEsqBCBPo8UZ0ACkHgKr
 wdlPgjVfpzhpYMAE9BCDcvatD8boZRtJf19Fe49Lf+9HW5w0sdt6C62x5hv/Ecm+uD0Eg
 E0PYPDlHcPIyt6fL+m12MsXB4bd5T8ccYMmtPJGE7T8ZXJlWByWWrfVELgo4ghFw7Hq9l
 8OwUNBe/n05fQJ/S5As8zb5PVXapVKdHPbjWeDKf1S43DwxN2ctniVYOtiUzRWh0N4g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=amarulasolutions.com; 
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=godtTPuD; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=godtTPuD
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A9E324083D
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 06:43:14 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49e6598dd44so2919165e9.1
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 23:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1790318592; x=1790923392;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=FsDovDfy8TYBhQEXo3mx+ibnkUcW/VGzrXQogKLrhdw=;
 b=godtTPuDVocTsRNzezkZLopejnF3JAsjvSUu/4hQ+km+GjebrQu75GAw4jbbQC86la
 U9pIEW3m5/yZ+i9K83HD+an5aDacwAb0j3iFB+R1pJHRIcMfVEMuLl3uRCVyEOmp+5RY
 T0E1uDC2TVqj3eBb1YBX6bSqoNr4Lsf2A5+TM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790318592; x=1790923392;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=FsDovDfy8TYBhQEXo3mx+ibnkUcW/VGzrXQogKLrhdw=;
 b=V8KtmFskcXjNEdxQAor1eaVHpU1lbeEQMcKAVXMwP2HQFJSNDBMSnO1zCu+lu/NLaN
 psMif1KhJc0dVAudgr8vTRCpe/soLtx4A4vi6ziCT949vo+WmeQ/MXXfaDeuDW6Yc4eX
 /uY5j0NJaD0sCUbu3qVo+9cdQt25fYuUBuR+cDNY8tev4NT/1BRFZ7KO/1mUt5GKK/iV
 l/J4bpWdA82eckyoIEmXrnMJ9H+0wsCJ+tWV/a7MFUkYKv7K2IkzzRnW1jngQk8zOEHU
 WAiPFAtyQtJQ5xA29mA8f27xys6YEawjYNe9CEjqCo7we47cZT+JKz7yG1q+OyLhOhE0
 VDKQ==
X-Gm-Message-State: AFuF++k+mEUOwPVwmrAN8LZ1W6hVlE8bb3s33eLADkQWpECb6O8XNq3k
 SJeEhcDHV/YwqF5MmK4xPWkx+rm4ZAI+IPAaVGS0ELvUzbsSwNH0zBD6n79zeY0BYRp/rGEa/vD
 Jpo1xTss=
X-Gm-Gg: AYBFou3Vtw0NpO8xpdclBD9BRqgPtBBkkgH0q7fJ89d3WNEtWTQk/vEaZ0pmNVxT7M9
 ehL6BaXoN0RSIygWZO0euPIYnsYiyZ0HZCekU0eLlymOXyVrKtDvrJ1BSkvg/VEBDPzFAFTBBPo
 tG+nZrEoW0PKbR+KKl6aetkdlZOJ0LZgecg/bRN2Y4dNBqzon8Cl1JKvzt6kkvXH7216pD4WHYW
 hxNf4PAxSwYxYwbnmculEjtI1bL8A5DrjIReKVWsgs31sXNRYY11VEzLYlcboR72Xlpsru7wwM4
 9tkpAFtdV2fclStYGfuhEivb4giII54CVdrI39AQwF2IZJriwoqFue0rZeJJ9cCAO0fdk9L4+3G
 0cL2116CPmloDxNRiRrah2/kDslWcEexNlXt/6YLXmRgq8QperaZr+Ytfv40/JDSY7JTJXb7gWk
 ISwVX1VOPk/KxavkJ7pnGvHuy4C3sdxhLO67zSyLNy2sX00CiED7mj3eU0hdI+syLQf7PZhep0k
 CdkOS1S0D/nKe3fds+3rcEsfd3mH9WpPoBSJ5XUGUKe2uaWRYMgQGNRA00IdZxQIbfGWvIjmENt
 GZRQ6pSCtag796Dg5HUV6fRDMa4h5Fwgz72MXbp6gh3LEA/phsWMbNLB+p9gMrBdo+2MGcb6eN/
 cfF6Zsg==
X-Received: by 2002:a05:600c:4f4f:b0:49e:69f8:e846 with SMTP id
 5b1f17b1804b1-49fe66cbb70mr89977005e9.9.1790318592381; 
 Thu, 24 Sep 2026 23:43:12 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fe5df44f9sm115584445e9.11.2026.09.24.23.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2026 23:43:11 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 25 Sep 2026 08:42:54 +0200
Message-ID: <20260925064257.1162394-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925064257.1162394-1-dario.binacchi@amarulasolutions.com>
References: <20260925064257.1162394-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v6 3/6] package/qwt: bump to version 6.3.0
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Andrea Ricchi <andrea.ricchi@amarulasolutions.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, linux-amarula@amarulasolutions.com,
 Richard GENOUD <richard.genoud@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://sourceforge.net/p/qwt/git/ci/qwt-6.2/tree/CHANGES-6.2
https://sourceforge.net/p/qwt/git/ci/develop/tree/CHANGES-6.3

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 package/qwt/qwt.hash | 8 ++++----
 package/qwt/qwt.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/qwt/qwt.hash b/package/qwt/qwt.hash
index d4fd210cbd69..e20c9ebadab9 100644
--- a/package/qwt/qwt.hash
+++ b/package/qwt/qwt.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/qwt/files/qwt/6.1.6
-md5  cc71be5d6c33c2fc19ae8082ccdd3e83  qwt-6.1.6.tar.bz2
-sha1  b1f17a86c9b1b0790a0c0067ef69fb6277efac79  qwt-6.1.6.tar.bz2
+# From https://sourceforge.net/projects/qwt/files/qwt/6.3.0
+md5  06a8f8eb1bc07bedfb1df601804439cb  qwt-6.3.0.tar.bz2
+sha1  9180f33f75ff8817f27019c94d10f92de840a5e4  qwt-6.3.0.tar.bz2
 
 # Locally computed
-sha256  99460d31c115ee4117b0175d885f47c2c590d784206f09815dc058fbe5ede1f6  qwt-6.1.6.tar.bz2
+sha256  dcb085896c28aaec5518cbc08c0ee2b4e60ada7ac929d82639f6189851a6129a  qwt-6.3.0.tar.bz2
 sha256  d8737db330e1eeb439962e11654ab7f1aece3561d9415454a8c538643824ede6  COPYING
diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
index 9f0b78655f6f..67292ee025be 100644
--- a/package/qwt/qwt.mk
+++ b/package/qwt/qwt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QWT_VERSION = 6.1.6
+QWT_VERSION = 6.3.0
 QWT_SOURCE = qwt-$(QWT_VERSION).tar.bz2
 QWT_SITE = http://downloads.sourceforge.net/project/qwt/qwt/$(QWT_VERSION)
 QWT_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
