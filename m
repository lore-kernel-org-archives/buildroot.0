Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFAF9CD37AE
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 20:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AE2240105;
	Tue,  3 Sep 2024 20:45:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NSCW2YljbiFY; Tue,  3 Sep 2024 20:45:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4480A4026A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4480A4026A;
	Tue,  3 Sep 2024 20:45:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D2ADF1BF57B
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0E8760687
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:45:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ki3JYrBkUNaz for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 20:45:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7386C60683
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7386C60683
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7386C60683
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 20:45:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A35A620005;
 Tue,  3 Sep 2024 20:45:43 +0000 (UTC)
Date: Tue, 3 Sep 2024 22:45:42 +0200
To: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Message-ID: <20240903224542.0ecdef27@windsurf>
In-Reply-To: <20240903054622.14033-1-fido_max@inbox.ru>
References: <20240903054622.14033-1-fido_max@inbox.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725396343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vBqSP9U3J9raucudnK8PBUFZc0qWSfUZJ0/fD0sqPbo=;
 b=T8yzkxH3PIQBXAk6uBgOj6TLp4Zj2o34vaajzTENqN4h1oVwIhk8kwv3b/GKoDUera24ko
 k6qcaC37r4qoBhILeffPFpYZCiJL/znSsMz8HwlXNPGHkg3211YQ6bNlZXKZFAdPgFW7in
 d5tWKpmFa9mIbFMHdMnkxVMqoqFDeimklVkkHd1M85hOB+AzIyhxwSeA3tTqvy5DDFc6pC
 lwp1gIfOTK3qsaGHAvvBcpRRw33FoL3knxBnzsx7LGs4kYe0FyzWyAOvBGmcnEVdwLdWkU
 3BmcuFcIYO3Rakl1w0bUjSQhxy+pe+CjOxx9bSSncn8agUWoY13nniG3dFb0yg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=T8yzkxH3
Subject: Re: [Buildroot] [PATCH 1/1] package/postgresql: needs threads
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Maxim,

On Tue,  3 Sep 2024 08:46:22 +0300
Maxim Kochetkov via buildroot <buildroot@buildroot.org> wrote:

> Threads are mandantory since bump to version 16.3 in commit
> https://github.com/postgres/postgres/commit/52afe563206e753f4c45c014fee2459ad0855826

to which Buildroot was updated in commit
73dd1d6b96665574607c8b05189426ad3eb05a6f.

> diff --git a/package/postgresql/Config.in b/package/postgresql/Config.in
> index 899907d6a5..9faed419bc 100644
> --- a/package/postgresql/Config.in
> +++ b/package/postgresql/Config.in
> @@ -32,9 +32,9 @@ config BR2_PACKAGE_POSTGRESQL_FULL
>  
>  endif
>  
> -comment "postgresql needs a toolchain w/ dynamic library, wchar"
> +comment "postgresql needs a toolchain w/ dynamic library, wchar, threads"
>  	depends on BR2_USE_MMU
> -	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
> +	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
>  
>  comment "postgresql can't be built with Optimize for fast"
>  	depends on BR2_OPTIMIZE_FAST

Unfortunately, this is not sufficient to add a dependency, you also
need "depends on BR2_TOOLCHAIN_HAS_THREADS" in BR2_PACKAGE_POSTGRESQL.

Then, you need to go through all the reverse dependencies of postgresql:

package/bandwidthd/Config.in:   select BR2_PACKAGE_POSTGRESQL
package/collectd/Config.in:     select BR2_PACKAGE_POSTGRESQL
package/lighttpd/Config.in:     select BR2_PACKAGE_POSTGRESQL
package/php/Config.ext: select BR2_PACKAGE_POSTGRESQL
package/php/Config.ext: select BR2_PACKAGE_POSTGRESQL
package/poco/Config.in: select BR2_PACKAGE_POSTGRESQL
package/python-psycopg2/Config.in:      select BR2_PACKAGE_POSTGRESQL
package/qt5/qt5base/Config.in:  select BR2_PACKAGE_POSTGRESQL
package/qt6/qt6base/Config.in:  select BR2_PACKAGE_POSTGRESQL
package/zabbix/Config.in:       select BR2_PACKAGE_POSTGRESQL

and check that they all have a BR2_TOOLCHAIN_HAS_THREADS dependency,
and if not, add it. And then look at their reverse dependencies.

Also, another thing is that postgresql.mk has:

ifneq ($(BR2_TOOLCHAIN_HAS_THREADS_NPTL),y)
POSTGRESQL_CONF_OPTS += --disable-thread-safety
endif

so does it mean that this option is no longer supported? No longer
exists?

Also, does it now need thread support, or NPTL thread support
specifically? (You can figure out by building with a Buildroot
configuration that has BR2_PTHREADS instead of BR2_PTHREADS_NATIVE).

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
