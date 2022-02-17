Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5345BC433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 09:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C16B180B12;
	Thu, 17 Feb 2022 09:38:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iRa7oqPPC5F0; Thu, 17 Feb 2022 09:38:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0ADB883EF9;
	Thu, 17 Feb 2022 09:38:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C5F4D1BF57B
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 09:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AED7D40185
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 09:38:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=heine.tech
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OKTc6I1kj_Qc for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 09:38:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 326A140169
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 09:38:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id AEFBD1814B9; Thu, 17 Feb 2022 10:38:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heine.tech; s=dkim;
 t=1645090701; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding; bh=bf+oMn20pm+XbvG9EJMNeadHMUXw9FrqQAnhgn/yq2U=;
 b=auKfFDeAy9sjadbpTX+h1+pYiIvlpGO/BjWpf89q9MW7Itnmg8trWqrkx8aaiSGJiEoXgD
 4NZxv9RC7APE3Weariym7uCiW+zIX2cinRYlvPWAGL83wkaLDHZP9Ye6HfR8YLvmj17Vyj
 rPvJN0tTMFIL7Jsat5I2uQBheJ/vgSA=
To: buildroot@buildroot.org, hostap@lists.infradead.org,
 "Sergey Matyukevich" <geomatsi@gmail.com>
User-Agent: SOGoMail 5.5.0
MIME-Version: 1.0
Date: Thu, 17 Feb 2022 10:38:17 +0100
Message-ID: <3f79-620e1780-1-7f8ee50@116634595>
X-Last-TLS-Session-Version: None
Subject: [Buildroot] =?utf-8?b?d3BhX3N1cHBsaWNhbnQ/PT0/dXRmLTg/cT8gMi4x?=
 =?utf-8?q?0=3A_ignored_build_options?=
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Sergey, all,

@Sergey: I put you on the list of recipients since you provided the version bump to buildroot.

Since hostapd 2.10 the wpa_supplicant build ignores the two options CONFIG_BUILD_WPA_CLIENT_SO and CONFIG_NO_WPA_PASSPHRASE.

This leads to the following build error in buildroot when BR2_PACKAGE_WPA_SUPPLICANT_WPA_CLIENT_SO is selected:

  /usr/bin/install: cannot stat '/buildroot/build/build/wpa_supplicant-2.10/wpa_supplicant/libwpa_client.so': No such file or directory

The Bug was probably introduced with commit [0] which reworked the .config parsing.
The two mentioned options are now evaluated before the .config file is parsed an thus ignored.

I'm not familiar enough with the wpa_supplicant build to come up with a proper patch. But maybe someone is willing to take a look at this.

Regards,
Michael

[0] https://w1.fi/cgit/hostap/commit/wpa_supplicant/Makefile?id=a41a29192e5d196444fc8859100762b04ff0d1c2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
