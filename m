Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F44D0D16D
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 20:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28F3060BE2;
	Wed,  7 Jan 2026 20:00:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8n8ZVxhNbZmT; Wed,  7 Jan 2026 20:00:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED0C860B71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767816038;
	bh=MLvjKhuI6sYxt0Y13OImPSdKrz/PrnRWuvHeROwusUI=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=o/28eKrmhUVVOTHv7PrT/pBUcrNVNs+JiZ8gOPGbBzHS+day1YhNvKQuzlv0joaSR
	 b05rFjaqNqCp4nkTDTaM7h7CjZuyQLCFx1iJ1+YS+Go6/y5meods9rUVgMBxQuroP3
	 lFYf9+yYTfNePMa6vEWRpuOBWs1d9dNIWMZ0k1+Vw8wD0Iqh4bQSbB2RDCjYL4OP7b
	 NIVN7X5wczajG+pxb9KtHKvvzVJI2mXirANvdHOg6IEhgoyS4E+77PHloml5sJpE8P
	 A72TM9W3RFO49y+UU2gWOyTVoGdk6uDskEhmHoNS3dLoBz31adG6TiS/aPFzWbTicE
	 PbBl3t62aQfLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED0C860B71;
	Wed,  7 Jan 2026 20:00:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 041FE25B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 20:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3DBDF82317
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 20:00:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id knZzjgA_GvyW for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 20:00:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 095758226E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 095758226E
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 095758226E
 for <buildroot@busybox.net>; Wed,  7 Jan 2026 20:00:29 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-477a2ab455fso23553695e9.3
 for <buildroot@busybox.net>; Wed, 07 Jan 2026 12:00:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767816028; x=1768420828;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GzfQGxkQ0nkSvOAE+6JI3DlZRhZVUxkjWWzTj3lo6zE=;
 b=cjvu+WXxeNI0MOwgoOWFg7XHCB/d/eG/NuguiQbAXAIcr4b/LSelmbYL2e7ygVKppM
 Bp8Hp5wyIabTFkiB+mxK8EijW8ZP1IFkVMhJgPuueqSPvaDsB2NDRNaGUAjZrN3piqmS
 MDed50PGCUP+hflj0itqzMg8jBbEIqGbyD+1aiuS75w/bXWvMdOY9SXZ1vMLG5fuw5h5
 ScQOGxBdiKIUKnX7uWHRVgD/uqSC4AnHtidlNqhH36YUTHpfypSrRca3eLfY6bLm5bTj
 HKwDvEchLdjgYU7I7z1gHpAtHkDK+RpBO+k5/mOy9GLISwkwB4nSOXBsJwn/0RpPbvR7
 XdLg==
X-Gm-Message-State: AOJu0YwKd2Xx7LwkiFpKMm1oCcfV9Pj32lf6toPHMvWa32L8eZqFggn4
 IDfGqUjogGZ0NvkEVjOyBXyL56Er++L0RRuxN6aFhqFeGxOWZoFvjtKnqF9lcmtU4JMXNHt8lW+
 9GPeQyw==
X-Gm-Gg: AY/fxX47yqWCzC0TYYlvvBzUJIc0ZYsEmG1Ko1ItKOUxk4N1BhKima3EasfY2Uxy5hv
 CUIiEDUiSbu6m5+UVsbiPMQjTAJQ7Q8dEo+xiu7dQfOMvJTV/0v4Z9XU1h2fUSFlEZu/ZIP4HOv
 H98JotHrQcOTLotoJLca9PD+yvgHUTPydQl7JMJJUMDwAxAXTL+uIYwQc8p7gLjW9KrqAlYYg59
 dzw75tHlsOxCfip9HuWOXUvIhObMbiquXAPYa4ChwhqGw8tXVQzyl6/TnPTXVxTKcgzeI+17EMS
 LYLzu7kbZc3ysoPYbpNbZgqI8UjEIEXXN/GJdwvSDqlV3OZpCiwQfuCwruowULXYQ2Oidlgtc8j
 K0OA16SQoYmkivaMBSeEcWaoUIO+BOzZEzrSWzUiC9gApRl3plaQUUYDfcf8q9Rz3UJWZaBxveH
 0sqtEmeAP6ZDYGvYv7WlfsMKjO8PMKqgrC83s=
X-Google-Smtp-Source: AGHT+IFHPJcaqVfWX2SvjFQ92SfRq88U6rGmOmZVQOSrjsHihada7DWmAM4KQ1mV2Z0VKeqOaTHN4A==
X-Received: by 2002:a05:600c:46cc:b0:479:3a86:dc1b with SMTP id
 5b1f17b1804b1-47d84b4127amr40951215e9.37.1767816027669; 
 Wed, 07 Jan 2026 12:00:27 -0800 (PST)
Received: from vm-2404.. (46.184.66.37.rev.sfr.net. [37.66.184.46])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d8719e695sm18987435e9.17.2026.01.07.12.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 12:00:27 -0800 (PST)
To: buildroot@busybox.net
Date: Wed,  7 Jan 2026 21:00:00 +0100
Message-ID: <20260107200004.665611-13-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107200004.665611-1-francois.perrad@gadz.org>
References: <20260107200004.665611-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1767816028; x=1768420828; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GzfQGxkQ0nkSvOAE+6JI3DlZRhZVUxkjWWzTj3lo6zE=;
 b=g9n2qNjWgB0XU6JIg/CTncBIld5XNjclD63mFEd9T09QdA+K0ARcVGZ8aJkqbilGiF
 HY/MBibuRTZn9/57EV9VGH7TVQnMaN7bHpZein92mzvlJqis64EA3YrjjHIHBi4FlDon
 gt9mwwUQFeqVFHv1GESeHC5Qtej9vGzX6NUX3Msa3TiXQPRUu0yt5AFGYEle2yxjUkV7
 yMxNE1rhVznqGf21u+j4E32n4bSGYNn8wVHYHf3fqobSw4GDH2xdj/iuoBtGuDJUScCa
 OsAieaeSJCG8RAyqLDFd+StiokQc0f1CwVW/9ZX3z+YQcQq94Po/VVjwBigN/MieElT8
 JJ6A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=g9n2qNjW
Subject: [Buildroot] [PATCH 13/16] package/perl-libwww-perl: bump to version
 6.81
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

diff LICENSE: minor cleanup
    see https://metacpan.org/release/OALDERS/libwww-perl-6.81/diff/OALDERS/libwww-perl-6.77#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-libwww-perl/perl-libwww-perl.hash | 6 +++---
 package/perl-libwww-perl/perl-libwww-perl.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-libwww-perl/perl-libwww-perl.hash b/package/perl-libwww-perl/perl-libwww-perl.hash
index 5951c34a5..1271c656f 100644
--- a/package/perl-libwww-perl/perl-libwww-perl.hash
+++ b/package/perl-libwww-perl/perl-libwww-perl.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  e70e2f41a97b8d97608569d10b75b931  libwww-perl-6.77.tar.gz
-sha256  94a907d6b3ea8d966ef43deffd4fa31f5500142b4c00489bfd403860a5f060e4  libwww-perl-6.77.tar.gz
+md5  dd84e119517e07a1af261b8eb1fafe1e  libwww-perl-6.81.tar.gz
+sha256  ab30552f194e8b5ae3ac0885132fd1d4ea04c4c7fe6555765b98f01af70c1736  libwww-perl-6.81.tar.gz
 
 # computed by scancpan
-sha256  6186a79a305a0e62c5087f9737b4f66fa5793fa1b396da0126e3c8722c460245  LICENSE
+sha256  994ab45a4f8ef43f47b7baabc48d100838c42d226d8d161d6ac1f49c5f9d7c84  LICENSE
diff --git a/package/perl-libwww-perl/perl-libwww-perl.mk b/package/perl-libwww-perl/perl-libwww-perl.mk
index 38f68385a..ff1cbba45 100644
--- a/package/perl-libwww-perl/perl-libwww-perl.mk
+++ b/package/perl-libwww-perl/perl-libwww-perl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_LIBWWW_PERL_VERSION = 6.77
+PERL_LIBWWW_PERL_VERSION = 6.81
 PERL_LIBWWW_PERL_SOURCE = libwww-perl-$(PERL_LIBWWW_PERL_VERSION).tar.gz
 PERL_LIBWWW_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_LIBWWW_PERL_LICENSE = Artistic or GPL-1.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
