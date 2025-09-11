Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44ACCCAC58E
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 19:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19C436F4E9;
	Thu, 11 Sep 2025 19:29:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wR_I10dHUJB8; Thu, 11 Sep 2025 19:29:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 460A16F4CD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 460A16F4CD;
	Thu, 11 Sep 2025 19:29:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A29FB443
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:29:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 890A084B16
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:29:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fSPYn_UcBayH for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 19:29:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8D24784B12
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D24784B12
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8D24784B12
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:29:04 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-628f29d68ecso2274250a12.3
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 12:29:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757618942; x=1758223742;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4yuLAJ8b6+osP+FpD24Q6uRqiNiIjj8cDBGCxxpJ9mw=;
 b=a7tfY5SOqmh4wb6hBpQaIv785rOQVBSo4lelVG9DxpGTsfSo69imKYudmjEPjIbykE
 JWOJqpeZBkpV/jkyjXMdsZOuAyGxa6bimPXcYHGwlywZyLTMkx5DYH4fUdTfZe1o8Sac
 FfQ1xo6K1PazSH3ahVxKnWY9CigOw+be/0UACqkN81EB4olA4VHiAOEyr9+NWG19TiJG
 b0yklbMU4qKdY6dpp8m7ls8yasQyBwihkyOj6zvuIdVpiy/zzc3cSgNjTvunfSKmbXVI
 770ky7EiUB876iQUELOVZYDW9x/z7Siun7F66462Kq/paqKJCM0Wk1BGl+Ijj3101/TS
 NEvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWx7mKZwCsfpGkuFp/eW34pMGpDA/Rw34i7tMxm7RMXDFlhEzrAFG4edEfZ0Nb7bojW1Yo51W5PfAI=@buildroot.org
X-Gm-Message-State: AOJu0YyNLwT5mfLva84lbj1gqCluv72AnWUWEu6G9npGoMKd0OHLVRF8
 8a04PXoJp4UEsfXcit90GbSIkGPENNryjuTpa0DGcGa0fW0Ugqp2RZF4v6Xwvlu3iTEJR+lp3ei
 v4q6sH7Y=
X-Gm-Gg: ASbGncsosiJaEnNE9Fe6arcD5DuPt6rJ2qKVPcifl+oZfILxtXUJCQHZeuMzlnW9Tyd
 21eHrtit4/+4WzOB3srRXHzUy50bHTut9M5jGbDJWinkorBg8/IB8K5SjFqMbLTZJNFXZkzsYT7
 F6YT3D57SRhTCjdzPAcIAIH+LTpmkZy1uECh7zA1vpdhwax0Z7dp374hWAdO+sQNeyAsLcmhuUI
 Mq9mqrN/tZzm8nIavouZjdvXez5jUdgx2pPUowEkhtayox9VYz/Nc9aS35MFyZsM+Lr7QnGQAqV
 Ijp67nHIdmM8rlAoGEixGAI8EdnyVTrLqCUJiaVwR17Z5QU3mw+YEgWGwXhLmVCp2skN/mQ3Uap
 9317min3zjN05M3DjXOGcQTIcP/23TzkjRZABjFAZB8fe7So=
X-Google-Smtp-Source: AGHT+IFC/XzSZt0rZNMtn5ncFvq+Pc20Abr9vr95z8JJCbueBQpFlNnLvPz7Op7qCd8dZI2LHQwyYQ==
X-Received: by 2002:a05:6402:40cd:b0:62e:db9e:92c7 with SMTP id
 4fb4d7f45d1cf-62edb9e9435mr205110a12.20.1757618942317; 
 Thu, 11 Sep 2025 12:29:02 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.79])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62ec3400cd4sm1770547a12.41.2025.09.11.12.29.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 12:29:02 -0700 (PDT)
To: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 11 Sep 2025 21:28:37 +0200
Message-Id: <20250911192837.2673097-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250902221547.2205648-2-romain.naour@smile.fr>
References: <20250902221547.2205648-2-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1757618942; x=1758223742; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4yuLAJ8b6+osP+FpD24Q6uRqiNiIjj8cDBGCxxpJ9mw=;
 b=NfaXTxu5ck6X2DClWPhrPYp+fe2DpzT9gQLibRb5JHAVTrwqHNibadz9KW2h0BAmpY
 AP7lltyzC7dIZCZGYLF7IG/F9mlwHlvAZ7W2ip1Epe4gHOU2mDrB9RswFZuF+FNdJdgQ
 XWheoNrE7Wo13sdMSl/QOrVB0wQsnJMrCnzqCdYW0C+8a/f0LTGR/0bEWugZkkKIsndz
 tLtj57CGTx+2S9C3550hbzxVTNr3D/8kg9j8niumCxtwruZnAuuZgLC/rJIbLR6Q3krB
 9B/jIxD3M+zUGudQ430TWIBJ7m0OHc01aiTY6aoHxtk4wKJd9wa8NG9W3Oxo6gQzStwf
 ef0g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NfaXTxu5
Subject: Re: [Buildroot] [PATCH 2/2] package/firewalld: add missing nftables
 json runtime dependency
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
> Now that firewalld has been fixed for Python 3.13,
> TestFirewalldSysVInit still fail at runtime due to missing nftables json
> support [1].
> 
> cat /var/log/firewalld
>   2025-09-02 21:34:50 Traceback (most recent call last):
>     File "/usr/lib/python3.13/site-packages/firewall/core/fw.py", line 649, in start
>     File "/usr/lib/python3.13/site-packages/firewall/core/fw.py", line 613, in _start
>     File "/usr/lib/python3.13/site-packages/firewall/core/fw.py", line 510, in _start_apply_objects
>     File "/usr/lib/python3.13/site-packages/firewall/core/fw_transaction.py", line 133, in execute
>   firewall.errors.FirewallError: COMMAND_FAILED: 'python-nftables' failed: Error: syntax error, unexpected '{'
>   {"nftables": [{"metainfo": {"json_schema_version": 1}}, {"add": {"table": {"family": "inet", "name": "firewalld"}}}, {"delete": {"table": {"family": "inet", "name": "firewalld"}}}, {"add": {"table": {"family": "inet", "name": "firewalld"}}}]}
>   ^
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/11198422467 (TestFirewalldSystemd)
> 
> [1] https://github.com/firewalld/firewalld/commit/1582c5dd736a11177ec320eb4ecbeb09fcae313a
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to 2025.05.x. Thanks

> ---
>  package/firewalld/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/firewalld/Config.in b/package/firewalld/Config.in
> index cc8411b34d..407f57c604 100644
> --- a/package/firewalld/Config.in
> +++ b/package/firewalld/Config.in
> @@ -14,6 +14,7 @@ config BR2_PACKAGE_FIREWALLD
>  	select BR2_PACKAGE_GOBJECT_INTROSPECTION
>  	select BR2_PACKAGE_JANSSON # Uses the nftables json interface
>  	select BR2_PACKAGE_NFTABLES
> +	select BR2_PACKAGE_NFTABLES_JSON # runtime
>  	select BR2_PACKAGE_PYTHON3
>  	select BR2_PACKAGE_PYTHON_GOBJECT
>  	help
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
