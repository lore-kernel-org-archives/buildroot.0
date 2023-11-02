Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13946C4332F
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 18:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A0C58521E;
	Thu,  2 Nov 2023 18:42:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A0C58521E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rGrMSIRyxA50; Thu,  2 Nov 2023 18:42:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C908D85224;
	Thu,  2 Nov 2023 18:42:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C908D85224
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 491A11BF287
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 18:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2DEE843549
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 18:42:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DEE843549
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 09Aziycp0nZO for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 18:42:00 +0000 (UTC)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F0D4A404A0
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 18:41:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0D4A404A0
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-6c3077984e8so1237480b3a.0
 for <buildroot@buildroot.org>; Thu, 02 Nov 2023 11:41:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698950518; x=1699555318;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=guBRqWpPWKFXMOezIKJd2JTKjZyZ4w27NUvzse1IxUY=;
 b=Srdc578pBZT3WQBa6kMtfS60SG6b/KEBZ9REdO5DmXmcsg6+HprgK71OSF74yDd1sV
 A5t2aB1YM87omFQp1Ac4QqYdBQGyrFwCCD2imp/T/XZWilm5PRuEbXCeXcMhJe5ypfNo
 i0eKV99dLj/2eUpvK4HwRvfJpC7KkzlYd7Ct3JI23iEfm9TPXFiDeA73wGjNSVOGujNt
 aEwzyG3ZroleDWxRfU0GbSWWCd3LMvoS6Xk8jA4qFPAqbRiywTTncaSS3S+JnlORafGe
 zT0zacqC+EPIrWTfZZmzOQLZtfAjmFXWXgW6eqN5lfjVKdZiGTqdrSz3KS+toH6MTP6F
 TpHA==
X-Gm-Message-State: AOJu0YwE5cCmlDabDnzG4RRX7XgLSjMGmCa4YPAzbUuZa3CrMW+zjMNn
 3WGkdL41x2p56ENGLLJ1mTwZ9P+1zF78AZV5uH32BZ5h
X-Google-Smtp-Source: AGHT+IEX+mH5KaUc9v0CIWJKAnjJCAE4KgyLPhXwupddomdH8psDqStk7hti+e/DJ6Yq7Yi3CtAwHA==
X-Received: by 2002:a05:6a00:93aa:b0:6be:bf7:fda5 with SMTP id
 ka42-20020a056a0093aa00b006be0bf7fda5mr18849141pfb.12.1698950518505; 
 Thu, 02 Nov 2023 11:41:58 -0700 (PDT)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.196])
 by smtp.gmail.com with ESMTPSA id
 b21-20020a056a0002d500b00688965c5227sm77604pft.120.2023.11.02.11.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 11:41:57 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu,  2 Nov 2023 12:41:53 -0600
Message-ID: <20231102184154.46185-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1698950518; x=1699555318;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=guBRqWpPWKFXMOezIKJd2JTKjZyZ4w27NUvzse1IxUY=;
 b=lzRo/SGGQzn2FbVdJuG0r+Js2pwB8px3e2m4US7x/pKvwS3KuAJ8fLzUWz248myFiN
 o3eHUiGXpLMmAsCyrPiKwRjr7fN52hg4LlJOxaMGPfu/Ao8sCs6EQL+gu0vm0IL/LKYz
 bMdiEs8GRH6zP4omRjVn43O6CRDOtKFVTsnL8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=lzRo/SGG
Subject: [Buildroot] [PATCH v2 1/2] package/postgresql/postgresql.service:
 set locale for initdb to C
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Peter Seiderer <ps.report@gmx.net>

Systemd creates a /etc/locale.conf file with LANG="C.UTF-8". On boot, systemd
reads /etc/locale.conf and sets the LANG environment variable,
(see the locale_context_load_conf method in local-setup.c.)

When initdb.c is called, a check for the LANG environment variable is called,
and if it is set to something other than "C" initdb attempts to load the
corresponding LC_CTYPE file in /usr/lib/locale/. IE: If LANG is set to C.UTF-8,
then initdb.c attempts to load /usr/lib/locale/C.UTF-8/LC_CTYPE. However, these
files do not exist on a Buildroot system, and as such, initdb throws the
following error on startup:

```
initdb: error: invalid locale settings; check LANG and LC_* environment variables
pg_ctl: database system initialization failed
```

To fix this issue, add "Environment=LANG=C" to the package provided
postgresql.service file to force Postgresql to use the C locale.

Tested-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2:
  - Get to the root cause of the problem and provide a better explination of
    what is happening.

  - Use Environment=LANG=C isntead of -o --locale=C

 package/postgresql/postgresql.service | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/postgresql/postgresql.service b/package/postgresql/postgresql.service
index 539eea8964..c470c7181e 100644
--- a/package/postgresql/postgresql.service
+++ b/package/postgresql/postgresql.service
@@ -16,6 +16,10 @@ StandardOutput=syslog
 StandardError=syslog
 SyslogIdentifier=postgres
 
+# Overwrite the LANG variable to prevent systemd from passing the LANG
+# environment variable set in /etc/locale.conf.
+Environment=LANG=C
+
 ExecStartPre=/bin/sh -c "if [ ! -f /var/lib/pgsql/PG_VERSION ]; then /usr/bin/pg_ctl initdb -D /var/lib/pgsql; fi"
 ExecStart=/usr/bin/postgres -D /var/lib/pgsql
 ExecReload=/usr/bin/kill -HUP $MAINPID
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
