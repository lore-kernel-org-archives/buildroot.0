Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A593C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 10:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B178B404B1;
	Wed,  7 Feb 2024 10:41:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lCT6maXVTdyB; Wed,  7 Feb 2024 10:41:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08E354057C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 08E354057C;
	Wed,  7 Feb 2024 10:41:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 610DF1BF255
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 10:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F07F6136F
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 10:41:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ki84YkFYLozQ for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 10:41:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4E4ED61306
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E4ED61306
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4E4ED61306
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 10:41:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3CB6D60017;
 Wed,  7 Feb 2024 10:41:44 +0000 (UTC)
Date: Wed, 7 Feb 2024 11:41:43 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240207114143.786a5be8@windsurf>
In-Reply-To: <a1a293b6334f91a747159399e18c86adc90bf614.1706448055.git.yann.morin.1998@free.fr>
References: <cover.1706448055.git.yann.morin.1998@free.fr>
 <a1a293b6334f91a747159399e18c86adc90bf614.1706448055.git.yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707302504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7XuMhMnAZBx1G0nERZYQWyrZDvUGTUPh+wyd+K5Vzzo=;
 b=hxefbYM5KQbXI3Hvf6rYpD7kRaK0oPGTPlj+p8r3YN+f+CX4Nh1/acEgdiEj6r0mv/qxcO
 KneqH7HgrzPSj88HUfJR+XtvITApE7ILC9RnJa1pruQcKIU68QXrYUjZcnUaLQo+EvOltX
 3wetygxYupcI9I91mekaK3lwsroan9ouMapq5G8X24DUmQF1m8bVVHlKG1kev3/Nihv7MR
 wNHCAdJe2aywqQfTPtc5OkVhgoDvCb0qRvm0wvpsTzntGUr0/08/iRkyGSp3fYUQwubKwS
 fi49Ri51JF0bGDUyJDKANKo0ltSf+bn6BQYN3DVc/f5QXg6p7zAkqZUytYL8gQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hxefbYM5
Subject: Re: [Buildroot] [PATCH 01/10] package/util-linux: propagate
 linux-pam dependencies
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 28 Jan 2024 14:20:50 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Commit c77e25c3f113 (package/linux-pam: needs gcc >= 4.9) forgot to
> propagate that new dependency to the util-linux runuser and su, yielding
> unmet dependencies warnings (unfortunately, not errors), such as:
> 
>     $ KCONFIG_SEED=0x8AE589A3 make randconfig
>     WARNING: unmet direct dependencies detected for BR2_PACKAGE_LINUX_PAM
>       Depends on [n]: BR2_ENABLE_LOCALE [=y] && BR2_USE_WCHAR [=y] && !BR2_STATIC_LIBS [=n] && BR2_USE_MMU [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 [=n]
>       Selected by [y]:
>       - BR2_PACKAGE_UTIL_LINUX_RUNUSER [=y] && BR2_PACKAGE_UTIL_LINUX [=y] && BR2_ENABLE_LOCALE [=y] && BR2_USE_WCHAR [=y] && !BR2_STATIC_LIBS [=n] && !BR2_TOOLCHAIN_USES_MUSL [=n] && BR2_USE_MMU [=y]
>       - BR2_PACKAGE_UTIL_LINUX_SU [=y] && BR2_PACKAGE_UTIL_LINUX [=y] && BR2_ENABLE_LOCALE [=y] && BR2_USE_WCHAR [=y] && !BR2_STATIC_LIBS [=n] && !BR2_TOOLCHAIN_USES_MUSL [=n] && BR2_USE_MMU [=y]
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/util-linux/Config.in | 27 +++++++++++++++++++--------
>  1 file changed, 19 insertions(+), 8 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
