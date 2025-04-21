Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1B1C369AB
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 21:42:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16FF260B3E;
	Mon, 21 Apr 2025 21:42:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gPeiUIi-SO9Y; Mon, 21 Apr 2025 21:42:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33F5760B3C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33F5760B3C;
	Mon, 21 Apr 2025 21:42:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DB2E1BC
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E73A380C9E
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:42:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LbBTy_bE0vGO for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 21:42:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DFDDE80C9D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFDDE80C9D
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DFDDE80C9D
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:41:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7701A42DF9;
 Mon, 21 Apr 2025 21:41:57 +0000 (UTC)
Date: Mon, 21 Apr 2025 23:41:56 +0200
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>, Eric Le Bihan
 <eric.le.bihan.dev@free.fr>
Message-ID: <20250421234156.40403831@windsurf>
In-Reply-To: <20250402-bump_linux_pam_1-7-0-v2-1-c000177ea7f0@rivosinc.com>
References: <20250402-bump_linux_pam_1-7-0-v2-1-c000177ea7f0@rivosinc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeduleeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeeftdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepuefhffehhfefgfffvedtgfetjeeludetveelleduhefhvdejleeuieehveffffehnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegthhgrrhhlihgvsehrihhvohhsihhntgdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepjhhurdhos
 ehfrhgvvgdrfhhrpdhrtghpthhtohepvghrihgtrdhlvgdrsghihhgrnhdruggvvhesfhhrvggvrdhfrh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745271717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wjloBWMW9KbUWUYDSOXHrRUpyoAoGAaSCQ+cAie2Zmk=;
 b=ZnA22XkU+9k7D+VG/tobaN0fw6e7e1ASH6fDuhcoXEOO84iA6qjPoCEuR4qubqUmd4mOYV
 QFTPUkNXd00D9pTODBNYfWIutHF8Gy2T9XxoAZQYPAh1aExTbcf9bwehcrr4J2Mtnbmjnt
 tj1XQw0N78jIieN8baU5Nw1uxzDB+t84HkBfoY12eq8anfz9zjnkSpvZSuPi2WMPxgeMA3
 W1Jqw5tBPvb/+/4rCQvTROwZH1VWDiAv3/0cmpV8whasutSnKm2ZFHUMGxxoeZg3+ygPse
 t6ldqtVrZwylTt1U4ZKgsg/7R5zCD7vV+fm/1E4FCdk2iV9qqmuyJOVblKXUkg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZnA22XkU
Subject: Re: [Buildroot] [PATCH v2] package/linux-pam: bump to version 1.7.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Charlie,

Thanks for this v2. Unfortunately, it still has some problems, see
below.

On Wed, 02 Apr 2025 14:46:31 -0700
Charlie Jenkins <charlie@rivosinc.com> wrote:

> diff --git a/package/linux-pam/Config.in b/package/linux-pam/Config.in
> index 6b08a9c4c2a9ff14a9d43c96ecc99826c82bdae7..41de8f833b14247b85ce1849c08fac6a507727d5 100644
> --- a/package/linux-pam/Config.in
> +++ b/package/linux-pam/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_LINUX_PAM
>  	depends on BR2_ENABLE_LOCALE
>  	depends on BR2_USE_WCHAR
>  	depends on !BR2_STATIC_LIBS
> +	depends on !BR2_microblaze # Toolchain doesn't support shared libraries

This is not true: Microblaze supports shared libraries.

Also, you cannot add a dependency like this: it would have to be
propagated to all reverse dependencies of linux-pam:

package/nodm/Config.in: select BR2_PACKAGE_LINUX_PAM
package/openvmtools/Config.in:  select BR2_PACKAGE_LINUX_PAM
package/php-pam/Config.in:      select BR2_PACKAGE_LINUX_PAM
package/refpolicy/Config.in:    select BR2_PACKAGE_LINUX_PAM if BR2_PACKAGE_OPENSSH \
package/rsh-redone/Config.in:   select BR2_PACKAGE_LINUX_PAM
package/rsh-redone/Config.in:   select BR2_PACKAGE_LINUX_PAM
package/shadow/Config.in:       select BR2_PACKAGE_LINUX_PAM
package/util-linux/Config.in:   select BR2_PACKAGE_LINUX_PAM
package/util-linux/Config.in:   select BR2_PACKAGE_LINUX_PAM
package/util-linux/Config.in:   select BR2_PACKAGE_LINUX_PAM
package/util-linux/Config.in:   select BR2_PACKAGE_LINUX_PAM

And then in turn, propagated to the reverse dependencies of those
reverse dependencies.

Bottom line: we really want to understand why it doesn't work on
Microblaze, and chances are that the problem is not Microblaze
specific. What issue are you trying to solve.

>  	depends on BR2_USE_MMU # fork()
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
>  	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
> @@ -16,8 +17,10 @@ if BR2_PACKAGE_LINUX_PAM
>  
>  config BR2_PACKAGE_LINUX_PAM_LASTLOG
>  	bool "pam_lastlog.so"
> +	depends on !BR2_TOOLCHAIN_USES_MUSL

Why?

>  	help
> -	  Build pam_lastlog.so module.
> +	  Build pam_lastlog.so module. Requires toolchain support for shared libraries
> +	  which microblaze does not have.

This does not make sense: the !BR2_microblaze dependency is on the main
option, and you're adding this to the BR2_PACKAGE_LINUX_PAM_LASTLOG
sub-option. Could you clarify?

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
