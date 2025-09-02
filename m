Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A6CBCA1009
	for <buildroot@archiver.kernel.org>; Tue,  2 Sep 2025 22:15:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1061941F5F;
	Tue,  2 Sep 2025 22:15:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fit555Zk04Rt; Tue,  2 Sep 2025 22:15:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A58841F63
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A58841F63;
	Tue,  2 Sep 2025 22:15:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E34D439
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 22:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 037B041F5F
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 22:15:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B6halRHPjlYy for <buildroot@buildroot.org>;
 Tue,  2 Sep 2025 22:15:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::442; helo=mail-wr1-x442.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EE95041F63
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE95041F63
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE95041F63
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 22:15:52 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id
 ffacd0b85a97d-3d4dcf3863dso1974128f8f.1
 for <buildroot@buildroot.org>; Tue, 02 Sep 2025 15:15:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756851351; x=1757456151;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D+SFpPRlWvNZo4rY3iKjMGxhNJhba5KinEiXvQhinK4=;
 b=URteWbUR8lQ/iiXWLgzMo8wizqcOzR9utkd2M/drVvd5ydd/n61WmhtLgktTW0GSSw
 RIbDp8OXqYKxzy1eJMmwWb35guFYslaTPl6DcuwS2Vsh1JDnIpDrz/Sxdoee7mgc3FSb
 ztQ+epAwbxXQXSy3VXVsDp2F36nYN5DaQu6Gp3+GM2utV2e4ZnRru2GlY2gPm0DBJKVR
 2ZvcgU46idBed849i3PdPYFZvzZc39DwfwiKbsUpCwnGsNqD8h1cGZRwaKNChCVNefhK
 3YBKWB3r3qfdGQYn7OTg+fzup7iEodY9GotJmjMcKRUReaTdhDjZJ6wgVj78hR9fVNU7
 78LQ==
X-Gm-Message-State: AOJu0Yzc21kB8gTycf8VhULmkNmmP0d3lhDtCOqmdjVp/IvERDE7Mmd9
 uQ/0b0qwqgZkpy9boyt7klMypwT/WNOTiN8m+KocHbvCruYMn7Ynjy4B9CzLa97VvqWjGYYAUy5
 LHYJVm6gw9A==
X-Gm-Gg: ASbGncs9IsQiVrUxlyH1wVuEW49cL6jswibbD9x1AoHb/nXRaX0EclCwDhsAhMWBSmM
 EPk5QJRHuhf2svsjw8NuNT9y66nXAnNB/vcCNhVdae3zLzcArjO73OPh7CUOrjNHPfaqxPI4p/L
 PiR0+G0nx83VL60gbL2ox8pCblydrVAQdrnhicchidqmzjk1yIuJHHXHITBgekxrwjS1rLmb/DM
 o2xN0oZMU4/ooo+WJPjB20mc4K7Kqx5ICz+DwACdoIV9ZkPE1CirRUeMuDb43nUlEFh5YUmH31Q
 JgXF3vbZ2ubmfXe0Ecq1IaSAC3Q7luohohRUTbPKgbZpdGzpVRN8w/ligI+JXfBlx/r59P7CuNS
 zPTSfQp6Qx4fo4PZpuzqboKVaP5vdgNT/ckxL8Oln99WSYohYvU9Px3B8njwBpL2j2F2Og3IS4/
 3mVJQMxa5gJiej/xoZ4247QYwhpEDDMcs=
X-Google-Smtp-Source: AGHT+IHmzDHAajZPPaPjWLEj4xWxxTmSE8vtRU6ZO7sCTe/Zk8lE9ILox05IXAY6zlQNPpdiPil+uA==
X-Received: by 2002:a05:6000:1a8c:b0:3cd:96bb:b948 with SMTP id
 ffacd0b85a97d-3d1df15a131mr9869190f8f.47.1756851350999; 
 Tue, 02 Sep 2025 15:15:50 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3db9b973869sm2218006f8f.18.2025.09.02.15.15.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 15:15:50 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Wed,  3 Sep 2025 00:15:47 +0200
Message-ID: <20250902221547.2205648-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250902221547.2205648-1-romain.naour@smile.fr>
References: <20250902221547.2205648-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1756851351; x=1757456151; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D+SFpPRlWvNZo4rY3iKjMGxhNJhba5KinEiXvQhinK4=;
 b=pQ2evq1p//Etfn89A9pB5G6Z4BenyMDGrxY1UPjy7/jo33LxHFe98buyOtARFi7EAS
 ULY6KAVw0D0CJ8DlNx1g/F4f4kB9IPbivhJdN+v/NmcvOMfrE+NTpF2pVxNy/zdBL61P
 X2eprVfIhnVVX52NyHJVd545ZzJ9sccTWroRM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=pQ2evq1p
Subject: [Buildroot] [PATCH 2/2] package/firewalld: add missing nftables
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that firewalld has been fixed for Python 3.13,
TestFirewalldSysVInit still fail at runtime due to missing nftables json
support [1].

cat /var/log/firewalld
  2025-09-02 21:34:50 Traceback (most recent call last):
    File "/usr/lib/python3.13/site-packages/firewall/core/fw.py", line 649, in start
    File "/usr/lib/python3.13/site-packages/firewall/core/fw.py", line 613, in _start
    File "/usr/lib/python3.13/site-packages/firewall/core/fw.py", line 510, in _start_apply_objects
    File "/usr/lib/python3.13/site-packages/firewall/core/fw_transaction.py", line 133, in execute
  firewall.errors.FirewallError: COMMAND_FAILED: 'python-nftables' failed: Error: syntax error, unexpected '{'
  {"nftables": [{"metainfo": {"json_schema_version": 1}}, {"add": {"table": {"family": "inet", "name": "firewalld"}}}, {"delete": {"table": {"family": "inet", "name": "firewalld"}}}, {"add": {"table": {"family": "inet", "name": "firewalld"}}}]}
  ^

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/11198422467 (TestFirewalldSystemd)

[1] https://github.com/firewalld/firewalld/commit/1582c5dd736a11177ec320eb4ecbeb09fcae313a

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/firewalld/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/firewalld/Config.in b/package/firewalld/Config.in
index cc8411b34d..407f57c604 100644
--- a/package/firewalld/Config.in
+++ b/package/firewalld/Config.in
@@ -14,6 +14,7 @@ config BR2_PACKAGE_FIREWALLD
 	select BR2_PACKAGE_GOBJECT_INTROSPECTION
 	select BR2_PACKAGE_JANSSON # Uses the nftables json interface
 	select BR2_PACKAGE_NFTABLES
+	select BR2_PACKAGE_NFTABLES_JSON # runtime
 	select BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_GOBJECT
 	help
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
