Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 756C2C433F5
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 20:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CCB56401C9;
	Wed, 12 Jan 2022 20:24:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QQLmnTOtuvfB; Wed, 12 Jan 2022 20:24:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A45D240475;
	Wed, 12 Jan 2022 20:24:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 46FF11BF578
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 20:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34D4584C7A
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 20:24:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HuB6o-uE0xor for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 20:24:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D40CB84C78
 for <buildroot@busybox.net>; Wed, 12 Jan 2022 20:24:15 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id z22so14551864edd.12
 for <buildroot@busybox.net>; Wed, 12 Jan 2022 12:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=H8DkC4uBJBLby89KXUzzs3khDYDBpTNN6jowTvnD05c=;
 b=DoILIVWFKUDD5tttx8ctbjVLEBU+sYOl6oBc7EF9JDBxM88OsG4eoh6diyFbFW+at6
 8h2Hb8ExhAGFKy9t1DDMw1izY+jPEJN2o0e2T7ZZUcw/S8D0VdIp13nzBlCLJxVEQNsu
 RUmM65fpcRLva7IrRgqWfizC1PWyKvfFanmcaAmhSrva1SeOeNPwKnhEvCZLXIR7Pc7M
 9uUi0LgjQPjm8Aym9bSHlAH2J07nZQNWdtGW+R3vQe2OFylR2g5x+SrFlVyQdziGHJVo
 Re8zZbMKHLFjzOTlR/r5Hee5pTAURvcQnnNbtUmhh3iii79pfJfahjq5ijlTOaS0leDA
 qbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=H8DkC4uBJBLby89KXUzzs3khDYDBpTNN6jowTvnD05c=;
 b=7hnbYdBIXM9sTvwmjh4bqapmOoLlja++r+3qG56yV5HLmf42kS3VMQD9rhddi4+5bR
 5k/7RWjzj+1Ove8jcTsRvwawH1EP4/SasKmfWh/KVNFcDSNUsQw2iooRIcQnYt9Bf98/
 SRUTI1K5QOGHXDKOWZA13bH4w/yVYgN3lrIjbALccImY9AYhDyVaBrSnR/svXNL4sbJe
 ZeVBmIS8iG9FRsLWSL+Wpvv+84YpKkvFk3tGFAGlu9ycSklb3NOz8PUonshJPSnxrdj5
 YqGRY2Havdz8auNBcpp8XWAhq/E3lxOPEB8ryLacyLbhLR2V1/DUgE8B6cFBqheb2Rm9
 Ho8A==
X-Gm-Message-State: AOAM533rGgYEP1unVb5jR65/kFitAT73AV7acaeH4s9ebQjIuKjICpUh
 9Pd6SRFHi4fvMLzl91/7gVf6cw==
X-Google-Smtp-Source: ABdhPJzoPVEGZaZvedctoB2SdP+MYChXHlkenWWRg6ol0Z63CqtFNO8A5c6IL3vu4wSxWonbrj73yw==
X-Received: by 2002:a17:907:8688:: with SMTP id
 qa8mr1140236ejc.256.1642019053875; 
 Wed, 12 Jan 2022 12:24:13 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id h13sm300632edl.96.2022.01.12.12.24.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 12:24:13 -0800 (PST)
Message-ID: <3b7552fe-af31-cab3-b9ec-cfa9fa4076e9@mind.be>
Date: Wed, 12 Jan 2022 21:24:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Michael Nosthoff <buildroot@heine.tech>, buildroot@buildroot.org
References: <20220110185147.84697-1-buildroot@heine.tech>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220110185147.84697-1-buildroot@heine.tech>
Subject: Re: [Buildroot] [PATCH v5] package/networkd-dispatcher: new package
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
Cc: Michael Nosthoff via buildroot <buildroot@busybox.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/01/2022 19:51, Michael Nosthoff via buildroot wrote:
> From: Michael Nosthoff via buildroot <buildroot@busybox.net>
> 
> Networkd-dispatcher is a dispatcher daemon for systemd-networkd
> connection status changes. This daemon is similar to
> NetworkManager-dispatcher, but is much more limited in the types of
> events it supports due to the limited nature of systemd-networkd.
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

  Applied to master, thanks.

  I reworked the Config.in quite a lot, it's a complicated one!

[snip]
> diff --git a/package/networkd-dispatcher/Config.in b/package/networkd-dispatcher/Config.in
> new file mode 100644
> index 0000000000..1dfa12ba45
> --- /dev/null
> +++ b/package/networkd-dispatcher/Config.in
> @@ -0,0 +1,21 @@
> +config BR2_PACKAGE_NETWORKD_DISPATCHER
> +	bool "networkd-dispatcher"
> +	depends on BR2_USE_WCHAR # dbus-python -> glib2
> +	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS # python-gobject -> gobject-introspection
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # python-gobject -> gobject-introspection
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus-python -> glib2
> +	depends on BR2_HOST_GCC_AT_LEAST_8 # python-gobject -> gobject-introspection -> host-qemu
> +	depends on BR2_TOOLCHAIN_USES_GLIBC # python-gobject -> gobject-introspection
> +	depends on BR2_PACKAGE_DBUS # dbus-python

  dbus-python depends on dbus instead of selecting it because it's a suboption 
of dbus (though actually implemented in a separate package, which is not really 
relevant for the user). So here we should instead select dbus.

> +	depends on BR2_PACKAGE_PYTHON3 # runtime, python-gobject

  Since this is not a python package, but just a tool that happens to be 
implemented in python, python3 should be selected instead of depended upon.

> +	depends on BR2_PACKAGE_SYSTEMD_NETWORKD # runtime
> +	select BR2_PACKAGE_DBUS_PYTHON
> +	select BR2_PACKAGE_PYTHON_GOBJECT
> +	help
> +	  Networkd-dispatcher is a dispatcher daemon for
> +	  systemd-networkd connection status changes.
> +	  This daemon is similar to NetworkManager-dispatcher,
> +	  but is much more limited in the types of events it
> +	  supports due to the limited nature of systemd-networkd.
> +
> +	  https://gitlab.com/craftyguy/networkd-dispatcher

  There should be a comment for the dependencies. Because it become quite 
complicated, I removed all the dependencies that are implicit from glibc.

  Regards,
  Arnout

> diff --git a/package/networkd-dispatcher/networkd-dispatcher.hash b/package/networkd-dispatcher/networkd-dispatcher.hash
> new file mode 100644
> index 0000000000..ca7c300783
> --- /dev/null
> +++ b/package/networkd-dispatcher/networkd-dispatcher.hash
> @@ -0,0 +1,3 @@
> +# locally computed
> +sha256  1682c0106d9d2879087612e76aebb87672ebf339c43f229a3ee27dadb428575b  networkd-dispatcher-2.1.tar.bz2
> +sha256  589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2  LICENSE
> diff --git a/package/networkd-dispatcher/networkd-dispatcher.mk b/package/networkd-dispatcher/networkd-dispatcher.mk
> new file mode 100644
> index 0000000000..4f609db73a
> --- /dev/null
> +++ b/package/networkd-dispatcher/networkd-dispatcher.mk
> @@ -0,0 +1,25 @@
> +################################################################################
> +#
> +# networkd-dispatcher
> +#
> +################################################################################
> +
> +NETWORKD_DISPATCHER_VERSION = 2.1
> +NETWORKD_DISPATCHER_SOURCE = networkd-dispatcher-$(NETWORKD_DISPATCHER_VERSION).tar.bz2
> +NETWORKD_DISPATCHER_SITE = https://gitlab.com/craftyguy/networkd-dispatcher/-/archive/$(NETWORKD_DISPATCHER_VERSION)
> +NETWORKD_DISPATCHER_LICENSE = GPL-3.0
> +NETWORKD_DISPATCHER_LICENSE_FILES = LICENSE
> +
> +define NETWORKD_DISPATCHER_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/networkd-dispatcher $(TARGET_DIR)/usr/bin/networkd-dispatcher
> +	mkdir -p $(TARGET_DIR)/etc/networkd-dispatcher/{routable,dormant,no-carrier,off,carrier,degraded,configuring,configured}.d
> +endef
> +
> +define NETWORKD_DISPATCHER_INSTALL_INIT_SYSTEMD
> +	$(INSTALL) -D -m 0644 $(@D)/networkd-dispatcher.service \
> +		$(TARGET_DIR)/usr/lib/systemd/system/networkd-dispatcher.service
> +	$(INSTALL) -D -m 0644 $(@D)/networkd-dispatcher.conf \
> +		$(TARGET_DIR)/etc/conf.d/networkd-dispatcher.conf
> +endef
> +
> +$(eval $(generic-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
