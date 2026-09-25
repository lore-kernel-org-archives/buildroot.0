Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DBC5C98321
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 06:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 326664083D;
	Fri, 25 Sep 2026 06:43:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZU52pDMBVD4e; Fri, 25 Sep 2026 06:43:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3733640B10
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790318603;
	b=jcKDwN4Z1r5+2hkWYMR772rxyS5xT7I8QbZD2CNbls+JJaYq0h3wiXkqmItkPgkW3HEK
	 c8WyXY1KFi0UYyBHexqTuL6+l0DmcLzO26jOa5tywwZdvG2MY2vaPrFCT1wGRNy4TDOn6
	 R1wlEYpiIn/6lNu5cJZc2C2lc2ARvmXUJwR8xNdCi7lXwRSNPVfA40cgGPfoPnaQVo4Q9
	 aD1pPOG3sweyz7fJjX8lYktoiV+rqug3Rf/ZtXHpE2mn55a+jfAZQcCfP7eZdqXVHJX/j
	 PaqK7LLYIcOpSUtmZRcOGVoKA7Ym/UT75OiuqxwNxTsajgyHZP9oBwxLjNqr5FuzRoQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790318603;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=9L+pugMuebMxPPhPOJDtcMt1+spaNHzmw6Y3fhULouM=;
	b=ntiaHrDwzluiv+lGcaWzfj3aKNzf2YHEhqSdD8mFVYa91rTCLdPOkVFzwI8BOdSy0D7U
	 7Q8MWBelo6QyjCahZNhMAgc6KUf7cnLkgL03wNdYT0Rt+x7NeYUMMF8B6vef6n9pnBBuv
	 HKhq+yC015bK7N4zB292eYbKTQY8h5SXn1hBdsxMuWTx/7JdSk2YUW3xIVy20DqiaDIoB
	 vnoGBRxyAoPRXJsh4rfKfwAaCr25QlDVxpoA5TvUsNf8VJPQDkz5sUFaJNErz/SAOjn6I
	 /dxnBf7tIU4FXknXriGw+qLksDAg+/T/eyklaX9b0YW8hrgwM6HLawq2+nM0zbajH6w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790318603;
	bh=9L+pugMuebMxPPhPOJDtcMt1+spaNHzmw6Y3fhULouM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=D+4d6EczSAKkLFQvQxvpZMcUXIznZ7Se7aJnnzfBvDjuO981N7M+kYBeTwXX1ut75
	 PjEV89Ze/L5mpAjuH588YflCxWOoQiqSAJMzs2EKPNqM0dwQ/0w6DOrXPtDp0i3RqA
	 AsJHaPv8uZExX9wIz0/g6M7KkAfwsHA4frxjl1hdmamIHOOy7NLosNUT2VsACB1urB
	 XuBy+naxPwnR6/XwYCpTLk2yizeU+BGgM5jbWuo1jpMjxipGqmrtRd4kGut8LwVlJh
	 67AS3WtEOxI1ikRr6gHu6tdCt68UFVOIHHC0BFlEr3CNKywaFEY7dInU4X3Jxsum/Z
	 ouTeJXw0YRDZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3733640B10;
	Fri, 25 Sep 2026 06:43:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C1AED35A
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 06:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3CD9401E3
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 06:43:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2oovNS0p5p-q for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 06:43:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org B6B0140079
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790318598;
 b=k9EDnQa/dWiHLbp1eIx7ViZxHo7wD0RaQKNgDTByHhUiSIvpeAmDG08dLMRjjinNl777
 ec27EN56yWsHLLNTUc0nIFekmV8PODmHN1fGDjHJdoL96P+U9anGspkq5Pm6zTKK+CLV2
 dyikxytMgCDnu5F2mmr/FnuGtg+vaB3pgYl/iSkhbDcz6jlTyOixZMeQ2s1Egkl4KXTRF
 KNvn+gL3W4sND2hlX0t4RNM5ZKy22gzu+NOCfTe+apsxrm3PZTfeylVrXlqXBKu0kNacI
 UgbRf9rsxAkEEJukgy+cK81sbpftmWlVmZ+MbNuBbzBLuFcn7Qvvy3Dv2mZ7pwA401w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790318598;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=O5P5nkyq0hPCVocnpTwOrn9Pkk7unn0FdtvmXk4STK8=;
 b=BjxzSW1YkqdF+KRHFoYucCaqicJrZ8OtrGqALV0kxqP+9+hC+EK27AzteioaqsH5uNPG
 xdKndgDd/FfYHJ0snuAH12HaQR464Pfk+MwZX4piydCJOJadGF8F0/5UKztSajpJOxc8A
 RnF47xIubt2fLydXrRcKRGKUTbwy4v2RN/QRt0fJrbKuo+04N5kG0qZa9+1ZmLva8qsDI
 GIH8aFMKdpQG6cnEwt+XJVEm/GZtJzCBWwuX2zr5QcG5naUdhkrFRTTnJwPZdVidFAq9c
 o6U9Ni7DBZHyUk0wSs62s3F/m3i5Sy0rF7gLNesbGm7aY7JBryo826fakR+4PcoAoyQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=amarulasolutions.com; 
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=WdH87V+k; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=WdH87V+k
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B6B0140079
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 06:43:17 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49febbce9afso3223305e9.3
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 23:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1790318596; x=1790923396;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=O5P5nkyq0hPCVocnpTwOrn9Pkk7unn0FdtvmXk4STK8=;
 b=WdH87V+kVT635wyeG+wbibLedxQd9KaYwx2hbYbP4/gyR3WOU2o+1pErE2ND7kSYBE
 l03B/GB/sMiQNOj8Uu9GbfMhT86BdCwFEXEYFKRridnU6hW22bhUo3f4l3Q0dJ2Qjj7S
 GSsUyqV7yMvEqE6yC7xY8y1PXV42ysJkky0cI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790318596; x=1790923396;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=O5P5nkyq0hPCVocnpTwOrn9Pkk7unn0FdtvmXk4STK8=;
 b=C7vvsBfz4FO+GWQ98+bhjHQBYfeu1rNRBx83+79YAiOfUs3tycT8dDr75ARNNEs2Ac
 wndF71Vx2jpdChIc0MU1J+MR/g5FtO2vM1Sz/mzsz5ZlpMpH4S5L7rnhN8wHPrRnOGPG
 te3o3qWO2RE+NZMjxxH/VQaZpsMK2h191diQ9IILgO11NaTHfmT644llcYfJMBw97G+l
 yNHnIUP4qr3NbMYizQRUuuGg59wVSyStPjAUwZT3/HTN9E7koGuY7lX/sjYJV2fpQTl7
 M4MzD4F9Lu95IwWsWaHj6RuVjPXhPGDuvwHf8ePzlf1iVY2NIn6x870aizfQO34HkeWe
 ZetQ==
X-Gm-Message-State: AFuF++kE9eXmCzsmlh+/40ZV8WynD0A32KreHitUFjuE/Puu6mY5nAKa
 s2Igfxff64ovp+NWCOi92ZTBQpVU6Bb0oHUkgP70mkqiMlfVf4f3fRmriBDn7fQaHY5Iu6ikP7d
 Sspe7Y6g=
X-Gm-Gg: AYBFou3SbnaMqA0Q137sgzTu5IRA2mPhVStvFD6Bfw1oN/IIxBqbczlgqo2Sn4nRmSx
 1uoi7/wiOvfgZIAOM6bZAuQ+gd4Dvm2DAaAHGWqlMPAfZrjwO3KRQ+IalyMaJB2AgHbHLJZhALK
 e7bcz6on2A0J7X4KwdWocxGn63Flj+xw3nfJO1nJVKUfRWg8ug7X0qZ0eUMp4KtFI8LqF6ys1qb
 ZAQIvUIxj9IPOXFJ1QKPcAFsLX7mQN1BfjaN+cwDegr4+zQkkHl99KP61a2VTthGeQn5fSJgK8W
 egpsKu9XaZtsqUs0FmwUIwSaiwUEDR+cIuwGrwK09mgOi9gn9yPuVCtgNKhU6oTvs5hNDMWmrHh
 Ina8Lv2VMXLWLLDVmjPhi4B/JC06kM4N/WwBx7sEE52u6ErFWx7naNStIcOTKHUNEAscidsidUR
 7YD38wmspG3Tm5slC0Fw/5EQ1k6DOC3KvkNutjYfyNrQ9JGUFx2ufArE11+vzG2gOAg6qJMcuwr
 BeTuRBhhFIbPAwQDcntaPhFlwbgHLoZwyuOgTf2Av2zIoVbvbIxDAXz7kYiTbfqoCrj9Izw8ju5
 rSR/9PwpIpdsdM50y0PDiYQGmSc6LhrrX+HZSCDg43iZWfzTZC0ZWKSO6LYqFRwo2abyiZ8=
X-Received: by 2002:a05:600c:83c5:b0:499:bf0e:95c8 with SMTP id
 5b1f17b1804b1-49fe66c8623mr78638385e9.1.1790318595912; 
 Thu, 24 Sep 2026 23:43:15 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fe5df44f9sm115584445e9.11.2026.09.24.23.43.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2026 23:43:15 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 25 Sep 2026 08:42:56 +0200
Message-ID: <20260925064257.1162394-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925064257.1162394-1-dario.binacchi@amarulasolutions.com>
References: <20260925064257.1162394-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v6 5/6] package/qwt: enable build with Qt6
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

Version 6.3.0 added support for Qt6, so enable building Qwt with Qt6 as
well.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

Changes v4 -> v5:
  - OpenGL option depends on BR2_PACKAGE_QT6_GL_SUPPORTS

 package/qwt/Config.in | 22 ++++++++++++++--------
 package/qwt/qwt.mk    |  4 ++++
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/package/qwt/Config.in b/package/qwt/Config.in
index 736ccc2a5ea5..7b0e068ad131 100644
--- a/package/qwt/Config.in
+++ b/package/qwt/Config.in
@@ -1,9 +1,13 @@
 config BR2_PACKAGE_QWT
 	bool "qwt"
-	depends on BR2_PACKAGE_QT5
-	select BR2_PACKAGE_QT5BASE_GUI
-	select BR2_PACKAGE_QT5BASE_WIDGETS # printsupport
-	select BR2_PACKAGE_QT5BASE_CONCURRENT
+	depends on BR2_PACKAGE_QT5 || BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT5BASE_GUI if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE_WIDGETS if BR2_PACKAGE_QT5 # printsupport
+	select BR2_PACKAGE_QT5BASE_CONCURRENT if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT6BASE_GUI if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6BASE_WIDGETS if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6BASE_PRINTSUPPORT if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6BASE_CONCURRENT if BR2_PACKAGE_QT6
 	help
 	  Qwt is a graphics extension to the Qt GUI application
 	  framework. It provides a 2D plotting widget and more.
@@ -14,15 +18,17 @@ if BR2_PACKAGE_QWT
 
 config BR2_PACKAGE_QWT_SVG
 	bool "SVG support"
-	select BR2_PACKAGE_QT5SVG
+	select BR2_PACKAGE_QT5SVG if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT6SVG if BR2_PACKAGE_QT6
 
 config BR2_PACKAGE_QWT_MATHML
 	bool "MathML support"
 
 config BR2_PACKAGE_QWT_OPENGL
 	bool "OpenGL support"
-	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
-	select BR2_PACKAGE_QT5BASE_OPENGL
-	select BR2_PACKAGE_QT5BASE_OPENGL_LIB
+	depends on BR2_PACKAGE_QT5_GL_AVAILABLE || BR2_PACKAGE_QT6_GL_SUPPORTS
+	select BR2_PACKAGE_QT5BASE_OPENGL if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE_OPENGL_LIB if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT6BASE_OPENGL if BR2_PACKAGE_QT6
 
 endif
diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
index 67292ee025be..0e835c700e16 100644
--- a/package/qwt/qwt.mk
+++ b/package/qwt/qwt.mk
@@ -18,8 +18,12 @@ QWT_CONFIG += -e 's%/features%/mkspecs/features%'
 
 ifeq ($(BR2_PACKAGE_QWT_SVG),y)
 QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtSvg.*$$/QWT_CONFIG += QwtSvg/'
+ifeq ($(BR2_PACKAGE_QT5),y)
 QWT_DEPENDENCIES += qt5svg
 else
+QWT_DEPENDENCIES += qt6svg
+endif
+else
 QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtSvg.*$$/\# QWT_CONFIG += QwtSvg/'
 endif
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
