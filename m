Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E447EFED3EA
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B09B84D8B;
	Fri, 24 Apr 2026 16:26:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mdk99j704kLQ; Fri, 24 Apr 2026 16:26:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8378684E35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777048011;
	bh=Ct12m6x3NHAhpk9JkOaZZ5Qaks6EW+5EM/vTOt9peJc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=N7l3PzRxGOjgqMdAe+zttIw6mnrBX7deJ7PLXyQpQ3F6sSvBlYr/qMgoaDUzwhqI+
	 JftI1CQwh+1ztsoyh/PQTYC7I8Z3LSi/Gmw/mfcWpFjtFLFNRyhNKJpFGHevQGgPbd
	 U5GOvhn/MZEEfcR6ICptBMoMZEP3iV4ZpXht3IBNC5QJU+w1SDF/7zf5JvZQtTxNCT
	 k4pQgYJ/nXk/Ht146fJyMYDZhqqubPN/fgLrja+ClXIHX2x4h+ZihPrcxHmwvO99nA
	 VP1dEbjVQfFYbxSURZAgBbRlJYaWzcGyQCLLtJdSnH8cE1H+cTegH6r5iud394p4v1
	 ZE1FvqZCnB6hA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8378684E35;
	Fri, 24 Apr 2026 16:26:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 98A91194
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8ABEE429B8
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:26:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nLfsJpvFAQIS for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:26:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6279E429B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6279E429B7
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6279E429B7
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:26:46 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-488b0e1b870so131935485e9.2
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 09:26:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777048004; x=1777652804;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xuU3CwfHPl0bmes221NcTyaWGjTLg4QoniSJTn6Ta6E=;
 b=matT+hsDyzdImml7f+ylF5QZHjg9PjzmbYgh4Xgq9wygNwzDlfXThI3pSS3hNNz31+
 OZyZ6E9mChLINYURn7nszW3faRMwq8AintcM/3nGCwfV13j7mq4qXMmqITpbLpOzJp8h
 bOOU/rm9/WHRV7rP3r+12NEcBJt3KChRlYtEQdP1/U2KJmHhBaV4ncqlkT9u/R8BiJ0/
 ey6vgmBQuxBV2DWlnqmC1R7+H2jX+lci4WpI9DJvhmLRsAdntOCNZi5Zl1dz91+K5XFa
 4Abg3xQQQfpFrRdb9O5orYWRiNJNCv0fJsbY3pfZk2E9pHtYYjsHoZcyEiAXlWS6Gg8Q
 5hJQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+JQGHEGeHzdexcQqz9hI/wYwCPbZzUbAjyJzCjdk461iGAX1Sn5WPK3leG2Y7FmngdipxYHFowGxk=@buildroot.org
X-Gm-Message-State: AOJu0Yyx+OKnFYqUGZ8h0ihtRRCRTdPdCh48CO6Xx/ivigMs9eLfVam6
 0C/Qve6VQ5cVnKaDh0mHDSn4lmGOlzFJGyzlMJz1EQhvWz1TSbcLUHf/RsMKKNGxgfQ=
X-Gm-Gg: AeBDievgdKAbG6OOZjWkAkoMeLRyX/bVyxQ6ljp0bSJdpkU6PCC3fkNy/3z/AUX3plS
 vIe7TS3lwPfev9w7nvOssAv6qL0+Lp8l3bvYG7/OhvelvIoDZN7zOVpnxNg94LnF+nw6KuEoV1l
 QKimLI/X5U1amF8oKLVIB6Geqsar6tiPItHnoRNhbIcp3ArGJ64Jk8THAwKRzK6rQaqkYbIoXxM
 kl0vhsIb2f/jKtfRVDnUUK17WKYaXHaWMdJ7Y8NB0kQCOdxXGQSYWCUF8SJTX7tdMsMm2c7jZua
 W450GSQY7tIiX67+lQWwGHtu8WQ9UnBpb0y1kPxme7H14ASl4UaxnCbdqF2aUecL3b+BDD27CMu
 qTSw5WOwOzrVIFT67UlGzTmRt40qjM6G7ODD85zpdtHRGMsi8kg6DqgWlpgXKysQZiJ8eA8H+1Z
 UFndMWvj2+TEpQ6R3krPRGXpmQJn4EOdTWmlBX
X-Received: by 2002:a05:600c:350e:b0:488:a82f:bb95 with SMTP id
 5b1f17b1804b1-488fb7861c0mr490221735e9.29.1777048004118; 
 Fri, 24 Apr 2026 09:26:44 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb74c789sm178191585e9.5.2026.04.24.09.26.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2026 09:26:43 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:26:43 +0200
Message-ID: <20260424162643.161128-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260420154559.2707314-1-titouan.christophe@mind.be>
References: <20260420154559.2707314-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777048004; x=1777652804; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xuU3CwfHPl0bmes221NcTyaWGjTLg4QoniSJTn6Ta6E=;
 b=ffvdC/xo1bYG6kvCAeo0i9yHm3wNyyws0mjH7lWnk8KaGOvqFT0fSaLJSk/KXahjui
 8I1lfruN8kkMGRRNATIXhzNB7uoEou1qQcWH9+27NIuzHsBiBlTwZLgftgqfHb26qFBg
 sMuq+OXIt4f7s0hyyDlmaakGsjcrVJjqrpDV2Z8GZD/nP/gOtAeiVHu79HCwXjaB8EMY
 PutmuSO4HSeQ+l0jZ3tYGim/vz6rzapJopNzhHdCfIMhek/u5yi0ET06CJw9eM+7DGDZ
 fO55/Is7BLjKfW2A3sMWnO75JeETMmzWX5vEQdUOwSp+7IhdbTM25Dj5p8IrsVeu1Y6u
 VANg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ffvdC/xo
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/systemd: add patch
 for CVE-2026-40226
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> This backports the fix for the following vulnerability:
> - CVE-2026-40226:
>     In nspawn in systemd 233 through 259 before 260, an escape-to-host
>     action can occur via a crafted optional config file.
>     https://www.cve.org/CVERecord?id=CVE-2026-40226
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  package/systemd/0001-Fix-CVE-2026-40226.patch | 90 +++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 package/systemd/0001-Fix-CVE-2026-40226.patch
> 
> diff --git a/package/systemd/0001-Fix-CVE-2026-40226.patch b/package/systemd/0001-Fix-CVE-2026-40226.patch
> new file mode 100644
> index 0000000000..250b6aff33
> --- /dev/null
> +++ b/package/systemd/0001-Fix-CVE-2026-40226.patch
> @@ -0,0 +1,90 @@
> +From b3131f63747db53ad76a9aab2d21da1ce9d59b9d Mon Sep 17 00:00:00 2001
> +From: Titouan Christophe <titouan.christophe@mind.be>
> +Date: Mon, 20 Apr 2026 12:04:45 +0200
> +Subject: [PATCH] Fix CVE-2026-40226
> +
> +This is the concatenation of the 2 upstream commits:
> +
> +===============================================================================
> +[1/2] nspawn: apply BindUser/Ephemeral from settings file only if trusted
> +
> +Originally reported on yeswehack.com as:
> +YWH-PGM9780-116
> +
> +Follow-up for 2f8930449079403b26c9164b8eeac78d5af2c8df
> +Follow-up for a2f577fca0be79b23f61f033229b64884e7d840a
> +
> +Upstream: https://github.com/systemd/systemd/commit/61bceb1bff4b1f9c126b18dc971ca3e6d8c71c40
> +===============================================================================
> +[2/2] nspawn: normalize pivot_root paths
> +
> +Originally reported on yeswehack.com as:
> +YWH-PGM9780-116
> +
> +Follow-up for b53ede699cdc5233041a22591f18863fb3fe2672
> +
> +Upstream: https://github.com/systemd/systemd/commit/7b85f5498a958e5bb660c703b8f4a71cceed3373
> +===============================================================================
> +
> +CVE: CVE-2026-34155
> +
> +Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> +---
> + src/nspawn/nspawn-mount.c |  4 +++-
> + src/nspawn/nspawn.c       | 18 ++++++++++++++----
> + 2 files changed, 17 insertions(+), 5 deletions(-)
> +
> +diff --git a/src/nspawn/nspawn-mount.c b/src/nspawn/nspawn-mount.c
> +index 874d54e734..cba69cf0a9 100644
> +--- a/src/nspawn/nspawn-mount.c
> ++++ b/src/nspawn/nspawn-mount.c
> +@@ -1311,7 +1311,9 @@ int pivot_root_parse(char **pivot_root_new, char **pivot_root_old, const char *s
> + 
> +         if (!path_is_absolute(root_new))
> +                 return -EINVAL;
> +-        if (root_old && !path_is_absolute(root_old))
> ++        if (!path_is_normalized(root_new))
> ++                return -EINVAL;
> ++        if (root_old && (!path_is_absolute(root_old) || !path_is_normalized(root_old)))
> +                 return -EINVAL;
> + 
> +         free_and_replace(*pivot_root_new, root_new);
> +diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
> +index 459caa7c58..8692c771ba 100644
> +--- a/src/nspawn/nspawn.c
> ++++ b/src/nspawn/nspawn.c
> +@@ -4626,8 +4626,13 @@ static int merge_settings(Settings *settings, const char *path) {
> +         }
> + 
> +         if ((arg_settings_mask & SETTING_EPHEMERAL) == 0 &&
> +-            settings->ephemeral >= 0)
> +-                arg_ephemeral = settings->ephemeral;
> ++            settings->ephemeral >= 0) {
> ++
> ++                if (!arg_settings_trusted)
> ++                        log_warning("Ignoring ephemeral setting, file %s is not trusted.", path);
> ++                else
> ++                        arg_ephemeral = settings->ephemeral;
> ++        }
> + 
> +         if ((arg_settings_mask & SETTING_DIRECTORY) == 0 &&
> +             settings->root) {
> +@@ -4795,8 +4800,13 @@ static int merge_settings(Settings *settings, const char *path) {
> +         }
> + 
> +         if ((arg_settings_mask & SETTING_BIND_USER) == 0 &&
> +-            !strv_isempty(settings->bind_user))
> +-                strv_free_and_replace(arg_bind_user, settings->bind_user);
> ++            !strv_isempty(settings->bind_user)) {
> ++
> ++                if (!arg_settings_trusted)
> ++                        log_warning("Ignoring bind user setting, file %s is not trusted.", path);
> ++                else
> ++                        strv_free_and_replace(arg_bind_user, settings->bind_user);
> ++        }
> + 
> +         if ((arg_settings_mask & SETTING_NOTIFY_READY) == 0 &&
> +             settings->notify_ready >= 0)
> +-- 
> +2.53.0
> +
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
