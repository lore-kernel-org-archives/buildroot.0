Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69DB7C44501
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:52:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DB3340D05;
	Fri, 10 Jul 2026 13:52:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rlLrenoiZnk8; Fri, 10 Jul 2026 13:52:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51FFD40CD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691522;
	bh=bwR3nreFOCtoGOaud5P+ogudehjWaxqHU9SqQSgCRws=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gSzSQfbaDOAq+kBygIXwtxw8z2WQDYhjpDyC1JhMhS4fc4Hmm5/rDP5nNENwaYHEC
	 9c/dC0rWadohcKlCuGAUr0KeIp0b/2h9Jqevx0mGJFfF8cGBb1s5m3fA2b/Kguq7ar
	 G3+G3AVh5SEqFBw6VQmGUMk5CCs2quT14tM2WQYjV3C9p0DXU/ZuqWaAuheModc14p
	 q5OGAPzi3qDmhcQQvlfIgx7rJMtLNUYpG815anyEi/iyInqhjeGGF0sIFC735VH298
	 RP/7u1Hnz3inXCsAy9moulv7jVWoHvWGpy/gBN9rN4ruyMotcr/zCHxrtOAP4kdE0u
	 ASpcpTg+88huw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51FFD40CD5;
	Fri, 10 Jul 2026 13:52:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BC64EA3C
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2290606C6
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:51:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vu-6-YLl5LNJ for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:51:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8C7D5606B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C7D5606B4
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8C7D5606B4
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:51:58 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-493f6de72faso2155885e9.0
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 06:51:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783691516; x=1784296316;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=PuYILKzdzljYxc1OLfBxHj650+UJZdXMIuGHdUYJxXw=;
 b=Rmz1nh81u6hLSu87d71mQtJjKy8L0T6q21g4uJGgURVUc9I+tmzJETYuHanf2RRXOo
 QRw4kflQOT4HpxHzxIjSPrqebWKEwsMu7Blhqqq6ysFm6yD+AjKy7J+Y2/cF78AR92nG
 huynpzMfX86c/SmjGV/1k9DNQp4SSGhJr1exLUWorKW3nU9dQopGom7kYdJl2dWxxJON
 1v2kiIRrKI0ihapCx/ZzypkCwLk+07i7/BRmaYfJ0vsXm0+wAqLHHEaf4srpPNvEpSW3
 wj9A3u/XPSiVZ2ji7vte4Rtg6/fAZjw9kQs1KU2ZRKKvtigUbTShm0nti56NrSnbPtDP
 foeg==
X-Gm-Message-State: AOJu0Yz7mmzW9I2omajNr796LT9TwRoTwHK9QZhoyPZiW+gjWpEnIDT3
 +A3NPMmYKsG94jV9LZzXlcBH9QJcBAREYikP3ZKbne0/xEoVAaweyMEys6TrgsTIfMOwioOmpd9
 9CwLM
X-Gm-Gg: AfdE7cno6e1OlG+3pTjX+7wy2d4zGNwBvehnGwI7xAf3ZDco5VWQ4rx/Q4LapG9MdIj
 LeOgvpvLAIWNsYCHMlnpKbBAfWz4bJ1A8igrFree21bV+yeXfsJQj7hBd54qmH9lG6X9Q8U5A1y
 uxxshkuo77nY9o3g16oQaEqHTybyKdgtgy5GU0puV14aXqOCbVPi5TApYjQL214u5LiXEcyv7Zi
 HJZsWvM5JKVjJviO0MVS1Spq+SxFrpmeubOiRNruE1+/mnEmJtCRY8hsNykZHQN7/eF1+RoFwIa
 XAyRCS7Q6Besjd0YOCp2Kb6GnMTKxrL9oi76is1BXWsZGnCQMuVkG8Duff85z/8XN4+AhiK3Qjl
 zvoc/Mvu0HKlnI0Vct+ynDQUDVevLqGp7+r4S7nfDzCGZeI6Hxo4e4UsJGzcPV9/DtF6QWUMt15
 nWZT3xBKqAfZRGpkhj
X-Received: by 2002:a05:600c:4858:b0:493:edde:54c8 with SMTP id
 5b1f17b1804b1-493f2b2ece3mr21463045e9.8.1783691516395; 
 Fri, 10 Jul 2026 06:51:56 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9de1d91bsm65791998f8f.4.2026.07.10.06.51.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 06:51:56 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 10 Jul 2026 15:51:55 +0200
Message-ID: <20260710135155.759833-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260629214710.736022-1-thomas.perale@mind.be>
References: <20260629214710.736022-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783691516; x=1784296316; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PuYILKzdzljYxc1OLfBxHj650+UJZdXMIuGHdUYJxXw=;
 b=FeXVHIS1sh1eC3/rmQQIZKP97phs0BI+PrFaYJ1PcoW/hXBibd1IIRSklgOaw0Kojq
 gML/oKq9weIQIOVsNYlMgnt6GY//WckjUH6JfsWWKS2WsKO8a6RW9aWtbUP4XE+DEpZG
 Fz/WnlzDZlGVtQuRxqv6VYHDZ/Ows3N3wqo0olgRpGqMWjdQVDGXgnpJwKVbA9vKTjBa
 ErwaIKu31DdFsF76B/SJ1yhRCZegGReewvXmMfHY/OuyHPQ3Wqic+Db480fQpvfd9NAK
 skcfuHjxoT2m/YoYVuggMJOz95tAEWD+m83r7nz681ABqI6RfW66ITXHzttsVWV/HInm
 aJQQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=FeXVHIS1
Subject: Re: [Buildroot] [PATCH] package/mariadb: security bump to v10.11.18
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
> For more information on the release, see:
>   - https://mariadb.com/docs/release-notes/community-server/10.11/10.11.18
> 
> It fixes the following vulnerabilities:
> 
> - CVE-2026-48163:
>     MariaDB server is a community developed fork of MySQL server. From
>     versions 10.6.1 to before 10.6.27, 10.11.1 to before 10.11.18, 11.4.1
>     to before 11.4.12, 11.8.1 to before 11.8.8, and 12.3.1, during the SST
>     the donor node is interpolating parameters that the joiner sent into
>     the command line. Not all parameters were properly validated which
>     could allow a malicious joiner to execute arbitrary shell commands on
>     the donor side via the rsync SST method. This issue has been patched
>     in versions 10.6.27, 10.11.18, 11.4.12, 11.8.8, and 12.3.2.
> 
> For more information, see:
>     https://www.cve.org/CVERecord?id=CVE-2026-48163
> 
> - CVE-2026-48165:
>     MariaDB server is a community developed fork of MySQL server. From
>     versions 10.6.1 to before 10.6.27, 10.11.1 to before 10.11.18, 11.4.1
>     to before 11.4.12, 11.8.1 to before 11.8.8, and 12.3.1, a high-
>     privileged MariaDB user could've used wsrep_sst_receive_address or
>     wsrep_sst_donor global system variables to execute shell commands as
>     the uid of the mariadbd process on the galera joiner node. This issue
>     has been patched in versions 10.6.27, 10.11.18, 11.4.12, 11.8.8, and
>     12.3.2.
> 
> For more information, see:
>     https://www.cve.org/CVERecord?id=CVE-2026-48165
> 
> - CVE-2026-49261:
>     MariaDB server is a community developed fork of MySQL server. Versions
>     10.6.1 through 10.6.26, 10.11.1 through 10.11.17, 11.4.1 through
>     11.4.11, 11.8.1 through 11.8.7, and 12.3.1 with  `wsrep_notify_cmd`
>     enabled would execute shell commands embedded in the name of the
>     joiner node. This is fixed in 10.6.27, 10.11.18, 11.4.12, 11.8.8, and
>     12.3.2. As a workaround, anyone who cannot upgrade now should disable
>     `wsrep_notify_cmd`.
> 
> For more information, see:
>     https://www.cve.org/CVERecord?id=CVE-2026-49261
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2026.05.x & 2025.02.x. Thanks

> ---
>  package/mariadb/mariadb.hash | 4 ++--
>  package/mariadb/mariadb.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
> index ca23b36a38..e2c13e3302 100644
> --- a/package/mariadb/mariadb.hash
> +++ b/package/mariadb/mariadb.hash
> @@ -1,5 +1,5 @@
> -# From https://downloads.mariadb.org/mariadb/10.11.17
> -sha512  788803b15afbb6193111774a233d0db0604f27ebae3b4b439368e2d7caeffb662846e530fa65f453a6d77541cedb99112ea319c7c0c2ce5074c32aefb06a51aa  mariadb-10.11.17.tar.gz
> +# From https://downloads.mariadb.org/mariadb/10.11.18
> +sha512  45fa3c746138aa51b55d61efe11d44b0476fdcb104d5a40929ca2910145668ae749664e2afed7f9d59825d5b2b14e920c012513a4efa4eb0f8af1607d44ae31b  mariadb-10.11.18.tar.gz
>  
>  # Hash for license files
>  sha256  ff437f42ea15b42f3d9617e691b9f159f38a0b1b0748e482304857a5026ede90  README.md
> diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
> index c718c1ce7b..7d3c505ada 100644
> --- a/package/mariadb/mariadb.mk
> +++ b/package/mariadb/mariadb.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MARIADB_VERSION = 10.11.17
> +MARIADB_VERSION = 10.11.18
>  MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
>  MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
>  # Tarball no longer contains LGPL license text
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
