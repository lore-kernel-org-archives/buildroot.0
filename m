Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D1CC32771
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 10:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E564A84294;
	Sun, 18 Sep 2022 10:00:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E564A84294
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p8g6xmX1HoOV; Sun, 18 Sep 2022 10:00:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56CB583FB2;
	Sun, 18 Sep 2022 10:00:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56CB583FB2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E681C1BF328
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF50F83FB2
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:00:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF50F83FB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mry9MamLpisY for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 10:00:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1F1983E68
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D1F1983E68
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 10:00:25 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BC040200002;
 Sun, 18 Sep 2022 10:00:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oZr65-00BWsN-97; Sun, 18 Sep 2022 12:00:21 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Angelo Compagnucci <angelo@amarulasolutions.com>
References: <20220705073206.1442280-1-angelo@amarulasolutions.com>
 <20220705073206.1442280-4-angelo@amarulasolutions.com>
Date: Sun, 18 Sep 2022 12:00:21 +0200
In-Reply-To: <20220705073206.1442280-4-angelo@amarulasolutions.com> (Angelo
 Compagnucci's message of "Tue, 5 Jul 2022 09:32:04 +0200")
Message-ID: <87r109gfyi.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 3/5] package/wpa_supplicant: configure
 wifi on systemd when enabled
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
Cc: br015@umbiko.net, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Angelo" == Angelo Compagnucci <angelo@amarulasolutions.com> writes:

 > Configure a default basic wifi setup able to automatically connect
 > to the selected access point.

 > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
 > ---
 >  package/wpa_supplicant/wpa_supplicant.mk | 10 ++++++++++
 >  system/Config.in                         |  1 +
 >  2 files changed, 11 insertions(+)

 > diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
 > index 09971654fe..157d45ee7f 100644
 > --- a/package/wpa_supplicant/wpa_supplicant.mk
 > +++ b/package/wpa_supplicant/wpa_supplicant.mk
 > @@ -275,6 +275,15 @@ define WPA_SUPPLICANT_ENABLE_WIFI
 >  		echo "}"; \
 >  	) >> $(TARGET_DIR)/etc/wpa_supplicant.conf
 >  endef
 > +define WPA_SUPPLICANT_WIFI_INSTALL_INIT_SYSTEMD
 > +	$(INSTALL) -m 0755 -d $(TARGET_DIR)/etc/wpa_supplicant/
 > +	ln -sf ../wpa_supplicant.conf \
 > +		$(TARGET_DIR)/etc/wpa_supplicant/wpa_supplicant-$(BR2_SYSTEM_DHCP).conf

How do you know BR2_SYSTEM_DHCP is set to something sensible here?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
