Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50FD6C52D7C
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 20:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A55981D4F;
	Thu, 22 Aug 2024 20:16:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WdltNkPNgHJX; Thu, 22 Aug 2024 20:16:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A23081D5F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A23081D5F;
	Thu, 22 Aug 2024 20:16:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D15181BF59F
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 20:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BED9D6063F
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 20:16:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r7P8JAqc1tDJ for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 20:16:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8F91760612
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F91760612
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8F91760612
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 20:16:46 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5bf01bdaff0so1496983a12.3
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 13:16:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724357804; x=1724962604;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ufSDurMtRa13ZJ1p+lbRXN5HWEez2M2Ny0WdscOfkNw=;
 b=e1O4tnwLJxkpDu9hqRmYq3vk+PoKb10rGpuFdyDsm9fyd514SiRAx/hFq5wI5o9jOD
 AS+iaaET4kAF5xcC2yiNnM1N0I5qZjrCX+QeYPMFQtJXyYyQyRWyzS9ASE0cOvKMY1yp
 qLBPC1dgPrOpBHACVygNYS5Cx9rfajvH9hR2izQzoN4bjA0qXx8N3IzAM6+2YrCK7DMl
 guh2r18XdEASenPBmSnJyQXdgLdARTZIhU8a2IWsrldxJG7TpPgKGniGN6ADt1+3WQL/
 5j0hRH8fkHgkICZpZLOgHYt2pbXt4drZ3KfZfgIM897VvoypGXu/jILN8W1OrG37IG3A
 eeJg==
X-Gm-Message-State: AOJu0YwLM3ecN6RT8m1qAfvhAvJDechs6X1VLvLt2XfEksfv8fGeV00C
 Lj4JmyFPUJ1e0V8/B1VdHg9+TRq+hzYqWxe/n/YwGunlIBG4K7C8
X-Google-Smtp-Source: AGHT+IEnuh0Fziq4Yr8of3HTtYHQ1Xc95vQdyw1eAepulkHwABb/EqUmVTX05CA00itI/bVgVbWYjA==
X-Received: by 2002:a17:907:c25:b0:a77:e2e3:354d with SMTP id
 a640c23a62f3a-a8691af9888mr314530066b.23.1724357804006; 
 Thu, 22 Aug 2024 13:16:44 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f220ce6sm162238066b.10.2024.08.22.13.16.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 13:16:43 -0700 (PDT)
Date: Thu, 22 Aug 2024 22:16:39 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240822201639.GE1160317@pevik>
References: <20240822182050.65230-1-bernd@kuhls.net>
 <20240822182050.65230-4-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240822182050.65230-4-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724357804; x=1724962604; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ufSDurMtRa13ZJ1p+lbRXN5HWEez2M2Ny0WdscOfkNw=;
 b=hYDK6PjLZ2SPVVLopUrkyhQ/am2tTJwXuqlGgEByJz7qNBj0LvftkGlB+a5/4v4v4K
 dJPI8G6jhmQU15m3feOpycUIW4hYAy32GSScNDPkIqcs0vjDlsGbGePjhlef7fYG/sIv
 8vlw49Xf9n9q7BEXlzdqsgkmxr3nh0ZXzQJ58chcPh+X97Psv2sF4MGbR00fs0kqE4mb
 +o4zezZVoZXFoQ+10o6XQn44LyXk0aZF0mvnqZL1YengkYMISbPOh83OXjv53ePJhBgL
 8iLDiWmgDXuouq186e0sV4/lLLDNDbG15EreDWJbE8fHw5wC+WyJgX0cb9olzg2OD4wu
 qdww==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hYDK6PjL
Subject: Re: [Buildroot] [PATCH/next 04/13] package/samba4: bump version to
 4.20.4
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Marcin Bis <marcin@bis.org.pl>,
 Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Louis-Paul Cordier <lpdev@cordier.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

NOTE: it'd be nice to fix old warnings (not related to this update):

$ ./utils/check-package package/samba4/*
package/samba4/S91smb:33: should be indented with tabs (https://nightly.buildroot.org/#adding-packages-start-script)
package/samba4/S91smb:39: should be indented with tabs (https://nightly.buildroot.org/#adding-packages-start-script)
package/samba4/S91smb:40: should be indented with tabs (https://nightly.buildroot.org/#adding-packages-start-script)
package/samba4/S91smb:42: should be indented with tabs (https://nightly.buildroot.org/#adding-packages-start-script)
package/samba4/S91smb:43: should be indented with tabs (https://nightly.buildroot.org/#adding-packages-start-script)
package/samba4/S91smb:45: should be indented with tabs (https://nightly.buildroot.org/#adding-packages-start-script)
package/samba4/S91smb:46: should be indented with tabs (https://nightly.buildroot.org/#adding-packages-start-script)
package/samba4/S91smb:48: should be indented with tabs (https://nightly.buildroot.org/#adding-packages-start-script)
package/samba4/S91smb:49: should be indented with tabs (https://nightly.buildroot.org/#adding-packages-start-script)
package/samba4/S91smb:51: should be indented with tabs (https://nightly.buildroot.org/#adding-packages-start-script)
package/samba4/S91smb:0: DAEMON variable not defined (https://nightly.buildroot.org/#adding-packages-start-script)
package/samba4/S91smb:0: run 'shellcheck' and fix the warnings
package/samba4/0001-build-find-pre-built-heimdal-build-tools-in-case-of-.patch:0: missing Upstream in the header (https://nightly.buildroot.org/#_additional_patch_documentation)
package/samba4/0002-ldap_message_test.c-include-stdint.h-before-cmoka.h.patch:0: missing Upstream in the header (https://nightly.buildroot.org/#_additional_patch_documentation)
427 lines processed
14 warnings generated

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
