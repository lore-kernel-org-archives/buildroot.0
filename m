Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C768C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 14:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF38983B14;
	Wed,  5 Feb 2025 14:37:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wvp2P1kfKCiB; Wed,  5 Feb 2025 14:37:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75D0D83A9D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75D0D83A9D;
	Wed,  5 Feb 2025 14:37:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AB8F6CD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A63C260FFE
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:37:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i1n_EkTBFY7G for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 14:37:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 76A0560FE6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76A0560FE6
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 76A0560FE6
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:37:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A1DF4419D;
 Wed,  5 Feb 2025 14:37:27 +0000 (UTC)
Date: Wed, 5 Feb 2025 15:37:26 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Cc: Fiona Klute <fiona.klute@gmx.de>, Bernd Kuhls <bernd@kuhls.net>, Sergey
 Matyukevich <geomatsi@gmail.com>
Message-ID: <20250205153726.35bd53e7@windsurf>
In-Reply-To: <20241205150114.3474074-1-fiona.klute@gmx.de>
References: <20241205150114.3474074-1-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeejvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedviedtkeeuiedvtefhjeejjefggfejheehkedtgeffffdtvdehheejteffudduueenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehfihhonhgrrdhklhhuthgvsehgmhigrdguvgdprhgtphhtthhopegsvghrnhgusehkuhhhlhhsrdhnvghtpdhrtghpthhtohepghgvohhmrghtshhisehgmhgrihhlrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738766247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uSjg4lTcbsU5KO/yKgKm7uPEiVX+j1hkd0DakzD28Yg=;
 b=RD9Fs9b9AW3iBDdLuq3/cIYXzDB5WutKRP/OC9aeO1EJAukLOPBiA8IuYUpE8ASeYRkJ0p
 rXdaa1VLWWrmo7oTztSqFGJYJ3gRWMvO8Zy6qj3y8zKT4PybC/Q0k3siMVzmk1lAGXnbSh
 b1zvJyWXP5GLiqvAzo8vmTgdrTuP5ewp9vCncNIxvvsmtmy6o2TeAPU3lmNTjhSetFydPH
 PFCAzbC0yot3ytDjpLyKND9XkmlZswjpJ525iLMGLchBnLqJAOkyhbk64cp5tWqAJOdKgQ
 UAU/0yK6fFyzlnP1FHzn9RdPbRS9HnJglMZkjmEqcbpljOPHBASAO5g01Jem5g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RD9Fs9b9
Subject: Re: [Buildroot] [PATCH 1/2] package/dnsmasq: install D-Bus policy
 to datadir
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

Hello Fiona,

On Thu,  5 Dec 2024 16:01:13 +0100
Fiona Klute via buildroot <buildroot@buildroot.org> wrote:

> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> Since D-Bus 1.14.0 installing default policies into sysconfdir (/etc)
> is deprecated, they should go into datadir (/usr/share) instead
> [1]. Follow that policy.
> 
> [1] https://gitlab.freedesktop.org/dbus/dbus/-/blob/8f1e00427f7048f8b24c3a1cfca8903254fe00d4/NEWS#L274-283
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> ---
>  package/dnsmasq/dnsmasq.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, both applied. We still have quite a few references to
/etc/dbus-1/system though:

package/dbus-broker/system.conf:  <include ignore_missing="yes">/etc/dbus-1/system.conf</include>
package/dbus-broker/system.conf:  <includedir>/etc/dbus-1/system.d</includedir>
package/dbus-broker/system.conf:  <include ignore_missing="yes">/etc/dbus-1/system-local.conf</include>
package/mender/mender.mk:               $(TARGET_DIR)/etc/dbus-1/system.d/io.mender.AuthenticationManager.conf
package/mender/mender.mk:               $(TARGET_DIR)/etc/dbus-1/system.d/io.mender.UpdateManager.conf
package/miraclecast/miraclecast.mk:             $(TARGET_DIR)/etc/dbus-1/system.d/org.freedesktop.miracle.conf
package/shairport-sync/shairport-sync.mk:               $(TARGET_DIR)/etc/dbus-1/system.d/shairport-sync-dbus.conf
package/shairport-sync/shairport-sync.mk:               $(TARGET_DIR)/etc/dbus-1/system.d/shairport-sync-mpris.conf
package/tpm2-abrmd/S80tpm2-abrmd:check_required_files /etc/dbus-1/system.d/tpm2-abrmd.conf
support/testing/tests/package/test_python_dbus_fast.py:        config_dir = "/etc/dbus-1/system.d"
support/testing/tests/package/test_python_dbus_next.py:        config_dir = "/etc/dbus-1/system.d"

Should some of these be fixed, perhaps?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
