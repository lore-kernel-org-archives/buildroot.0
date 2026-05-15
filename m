Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52191CD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26CB861589;
	Fri, 15 May 2026 13:33:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ctb0cslRE0VB; Fri, 15 May 2026 13:33:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46C50615AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778852034;
	bh=FyX9zt/kRywodkrmn7C5MrNTh95lAexi1vNLSu0ZxkU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KvsDjmN1QZAnTx/wOnpIwo/hi05Wtwt7SOI6Qki2kCLciFCSfGN3hUbfYqhLAQTc/
	 PCSOfsvF7IhLFZDE5Gv/buya0jXxSZTO9Opt/pZvsGkZhM62Q+Ugtcjl7vA+l5wLaE
	 lpXtH5uLh1MIB3UqUVMiqVGFa+p4KZceIaY1bvgvISre+DC6aRa1WkdE7PNmwAowFS
	 qeJSxwP5qgVPN7aq+0NIXgXaJVQ+An+pUzoERgpMNIyNYsph2DPRqNHEji45Lxlw+w
	 yBaAgQM/I49YOSPsl6BAmbLWGNIVnyTqElzW47ms72PxWI1qhITm8QDOLMmwPipN/U
	 eymXtiPFi8NGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46C50615AD;
	Fri, 15 May 2026 13:33:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A23336F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FEC784316
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:33:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VJpDo_NRt4ot for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:33:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0913D842A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0913D842A1
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0913D842A1
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:33:48 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-488b0e1b870so151925785e9.2
 for <buildroot@buildroot.org>; Fri, 15 May 2026 06:33:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778852027; x=1779456827;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=73OOM25USkM54Nv+VBoyV5fS2CxvASgidDa5nQsp0TY=;
 b=JGIbwNZ4OTxg/PKzznkB4FUTP6ZR7HDytIAhwsl73++3NZ1dOh0OA+3f1NJ2tjsHfC
 UCu9isK+kkS98o61+ZYsp0HlFUnx/v0pP2cS0inUM8Ic1cAP73e25X8wvAj7/IDw/F3r
 PK/LNym7B0X53fK1T4+5oZMb0Ngsu4UPuJCzTC9pZiYk81F9OeqZm2QpgBvCnhH8gXBz
 zfs56oWVXn0DC5DvLsNzy3sO5vLnF7vw9m3AL+/PkOQsiV3lcGFzbWgcFqUIwCQElCt8
 f6M79eEYAR39nEgymaa5Xhgxcshzq9hnVLLyWwiI9NXzC6f6lDqNiBoNkCzlubpmzeu0
 QSvw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+8+2YGzCCxA47h0KClWy4jV4IiCGujemj+12+r3t86vA5l7g1vktVt4Tyebu1EObu3fkpIR1+1oaM=@buildroot.org
X-Gm-Message-State: AOJu0Yy64qBkKTB8/BcYVS8cgKKQiHt/uLdvPzFPfHyWd8e4zQpRfNEL
 1yGH9JfRUDvtJepJoDziH1d7rk3/XC0jlZ5/++AOriLWgAtl/kiNFARwN9Qe2EcUaG4=
X-Gm-Gg: Acq92OEOHnEjhCz/bYnJI0setkGc9TcWr5pGk825Dy41haQiuRYKo6NvJSs8ZmR8GzI
 lgYCEh2Eaxmx3E2ZGHXIugwqnKF8C4A0liX78IfNhOHkqPJ7hdjAt1noN4SSKhbfoPo/y2FZGFz
 bBYmVhYKfB1lw05P5hGb96WK8EgjjhsT+7O63OMrKqT6czAqNzugfMNFqGiWcsie1sAfo33bubq
 XGzI5jZBpUVl7GNI0IxaXanTSUHBeZL3MmtybUOrHuYQHtHB+hjO8dsuLNM+PrLoqtu5xnDzVJD
 PHVv0aAzf5YGDb3deR/gYx5UxU/YAx6TFzwtpNhN1cAHlOKuczFN63/Dw6JC/K0IGbpEpqs1U2G
 8+VL/uU7Hv/sIdxtNrCflk6Fu9n08+WKPjPeIlu84PyIG8oIQUGm2Ov/nmd5yqKO9mt4PmLJ/bS
 U7nwQ7+5fu70JazEzKBZmNrVpnkHsfMEvvtIrdmTxWLFb8WS/DUKUlWko=
X-Received: by 2002:a05:600c:858d:b0:488:f453:b976 with SMTP id
 5b1f17b1804b1-48fe651c8b1mr37630535e9.27.1778852026843; 
 Fri, 15 May 2026 06:33:46 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9e768072sm14501197f8f.5.2026.05.15.06.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 06:33:46 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 15:33:46 +0200
Message-ID: <20260515133346.315685-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501123100.1918951-26-bernd@kuhls.net>
References: <20260501123100.1918951-26-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778852027; x=1779456827; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=73OOM25USkM54Nv+VBoyV5fS2CxvASgidDa5nQsp0TY=;
 b=T9ouGh6WVjwno0tvAV3ehKIHlqDVSHuiKNU09T+HuUls2hGhgsSif+xgbquUsfTsML
 XdDYM86SMwnbpXuiZHwipzkOHV12wLyh+AHJkRG/WixVnvchNCUF1WIZFimtCmAbfoAg
 mixK+rk2eXEXmo0jcefAgTfRfbatrGzx7vf1tE6nh0oMkR9YUGht5t9NkzFT67OntDkg
 UvHuXJHSubViOo1e5HDq4Qpda/C+zV5ySR4LjdqWx5k0ohw+Xme4nGMcH2DtEybwWqgv
 2YHkuNdFaiJpc6P/MBdfiTdWT4Mj43aOdsOLSyzOr9/19k19NmRZBAHvv/DdMb3uC2gK
 fmLQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=T9ouGh6W
Subject: Re: [Buildroot] [PATCH 26/75] package/python-lmdb: security bump
 version to 2.2.0
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
> https://github.com/jnwatson/py-lmdb/blob/py-lmdb_2.2.0/ChangeLog
> 
> Version 2.1.0 fixes the following CVEs:
> 
> - **CVE-2019-16224**: heap buffer overflow via `MDB_DUPFIXED` without
>     `MDB_DUPSORT` in on-disk `md_flags`. (#429)
> 
> - **CVE-2019-16225**: `SIGSEGV` from `P_DIRTY` flag set on mmap'd disk pages,
>     causing `mdb_page_touch()` to skip copy-on-write. (#429)
> 
> - **CVE-2019-16226**: out-of-bounds `memmove` in `mdb_node_del` via corrupt
>     `mn_hi` making `NODEDSZ()` huge. (#429)
> 
> - **CVE-2019-16227**: NULL pointer dereference of `mc_xcursor` when
>     `F_DUPDATA` is set on a node in a non-DUPSORT database. (#429)
> 
> - **CVE-2019-16228**: divide-by-zero from zero `mm_psize` in meta page
>     header. (#429)
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.02.x. Thanks

> ---
>  package/python-lmdb/python-lmdb.hash | 4 ++--
>  package/python-lmdb/python-lmdb.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-lmdb/python-lmdb.hash b/package/python-lmdb/python-lmdb.hash
> index 679d552d1c..ad111605bc 100644
> --- a/package/python-lmdb/python-lmdb.hash
> +++ b/package/python-lmdb/python-lmdb.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/lmdb/json
> -md5  de895e4a88eeb179aa0c185a08523d62  lmdb-1.8.1.tar.gz
> -sha256  44ef24033929e9cc227a7e17287473c452b462d716f118db885c667c80f57429  lmdb-1.8.1.tar.gz
> +md5  f6f491b825302966f63b3fdee2ef80fd  lmdb-2.2.0.tar.gz
> +sha256  53020e20305c043ea6e68089bc242d744fba6073cdb268332299ba6dda2886d4  lmdb-2.2.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
> diff --git a/package/python-lmdb/python-lmdb.mk b/package/python-lmdb/python-lmdb.mk
> index dbdc80bfda..ba3d257fdd 100644
> --- a/package/python-lmdb/python-lmdb.mk
> +++ b/package/python-lmdb/python-lmdb.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_LMDB_VERSION = 1.8.1
> +PYTHON_LMDB_VERSION = 2.2.0
>  PYTHON_LMDB_SOURCE = lmdb-$(PYTHON_LMDB_VERSION).tar.gz
> -PYTHON_LMDB_SITE = https://files.pythonhosted.org/packages/23/19/392f028e7ebcc1cc8212fe8a315a909b7a556278456f0bab9234d3a3b665
> +PYTHON_LMDB_SITE = https://files.pythonhosted.org/packages/21/44/d94934efaf8f887b6959f131fde740fcaa831edfd13eb5425574637cddd5
>  PYTHON_LMDB_LICENSE = OLDAP-2.8
>  PYTHON_LMDB_LICENSE_FILES = LICENSE
>  PYTHON_LMDB_DEPENDENCIES = host-python-cffi host-python-patch-ng
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
