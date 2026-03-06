Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F61FCC062
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B09261472;
	Fri,  6 Mar 2026 19:53:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tgeuCsJ4ReKV; Fri,  6 Mar 2026 19:53:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB03D61497
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826796;
	bh=jYCwgN3JYeUx+PMOXjU3mbktJdvnNZKWDrlEDPq+hes=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kEwvcCWVy8B/TJNKsO5ZiOYjDAxDzgtwGdGw6/ijv4xiucNnQ/FK1p/p7FzJp5hoz
	 PtOmw4PekZSopBGkzRZAxtCvmadFrnoANoFFvVRiQvSHuW30GC7mz5lF9l/HdmszSs
	 mxq7yjJcGTQnql/ruonCqU6SMSqAxmdO/4h5PvpZWicDVVQRgZFidFRaSCrmDFoOB7
	 4rUJrYYL4m+CEFsnrmfW+APXL2786SNyC3BXziKWn7nmjUzrEk1uKQpN49J7+HD0jM
	 7dUanLVN6XRDKt0MgK4nskEDdr3+7x6RkLQGjhYx+GFog4urlJox674/0+jQj86dnN
	 GsmL/NWCDcsvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB03D61497;
	Fri,  6 Mar 2026 19:53:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 896F1169
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F6A183D65
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jAI1ETMiXEm2 for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:53:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5D13B83D56
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D13B83D56
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5D13B83D56
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:10 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-48371bb515eso142373435e9.1
 for <buildroot@buildroot.org>; Fri, 06 Mar 2026 11:53:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772826788; x=1773431588;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QB7ipHsJLUgWGKPqMbeZOlklMujB72I+shT4ro6vJCY=;
 b=J0HMZj1HytW/GNKZqeVTdeuGfTb4ivUYrlEJKjxE3oS4ZXLKz1DQIoX96FQe0AOJt0
 QHNr3ZQxKovo/NctdUBobLXsRQzCD+rO44zvbPSeSkMpoJng/bBpTD3cbY30dx45E0Cq
 V89V/DrdphcCu95Hoz95Baji7kgG4fBQNzoqHhYFBFlulSCYWh6/2Es6FRcmAuTY9lx+
 /KV5Db4RxXw8tvJ/9YEl1/3h2tkqs+EsshsqhRISe+/SY1ujVB9TQ2Ycq4FImKJVk1ll
 uIpfy/uaDLoLLumZM599ZQ4ETtJibRDuMXJHdTr3/+C3WQG7RY3ID+T0BbK4vVDicnwl
 pHzw==
X-Gm-Message-State: AOJu0Yxtbb2oerW0z3Zt90U1Gad1NgDdiao46KjhANFVn7P30QvxruTZ
 MsBrYW0TF0/x67bpKqdGsNtqUptiJEKRGfueGPi7T+o1LpSWPzUe+WICLLjcKU9cb7cQ4DxuU76
 UKBDX
X-Gm-Gg: ATEYQzyjiI6duXAxCPqg7ERwxPhKcy79QIJcz6JlRF4WL0qyPiPHGCl8Jplyop+tmm7
 I0ISPPnb4V5sktqSbUkvHQ/d22hR8ju7vCz1tQGbwANKU1ngG3iZ2jxyzTDQEhDW8wa8JZOBfSW
 yICrEU2yAgKBZxO9omsTFjleO4xmoscAD1AsG0Dt60SsnuKNnIdWoDPcOWzWcrmlBRfNuJcIijF
 fIycrYT/i/eLiKipz6uRxgChDb7KRBchV+4yy4rO0I3LXsAAgr+mUlOi7JAo9N+vQXwNy6vVuWc
 CXQErGIr+OYzGbhdTT9uhLbXoKM7kZvSpiS6MxVdj5YaeQ0kYkEj9NkP+LPNqJJaCUmnAWZtWf+
 1kdHh2eBymobcNUwPyAupPa05XFpTQCQS/EpFD4Pb5NNH/uPiakBDzyFWrLLr+1q9YduG+H6py9
 ++2Qk7B9AZPZIiAok=
X-Received: by 2002:a05:600c:608f:b0:483:8e43:6dce with SMTP id
 5b1f17b1804b1-4852696937cmr52747095e9.29.1772826788296; 
 Fri, 06 Mar 2026 11:53:08 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4852378de92sm41264025e9.0.2026.03.06.11.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 11:53:08 -0800 (PST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri,  6 Mar 2026 20:53:07 +0100
Message-ID: <20260306195307.7584-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226080651.19171-1-thomas.perale@mind.be>
References: <20260226080651.19171-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772826788; x=1773431588; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QB7ipHsJLUgWGKPqMbeZOlklMujB72I+shT4ro6vJCY=;
 b=JfgwA0+GuYfUrHjE45xXDNtm3/nBRzdM+20xgJU4Z67R8NIlZEbHO1nQa0BC26zMHW
 LgMMIo1J5OEs6WCUgOCcjEqZc3TuzGdv3hlt4XLzUP5Wd+SUn1ury0pQmYREzNM71UGv
 /eXIZTSHBqClBBWhRet8vd5+0SuGl/YcO87AKfeMkkIQvPeYdtVo6m4iDIBkQUm6EXOM
 eLHYF4PY2r+27Ea766i7aFoJX88NuUD9I2AnU+mH5u1S2zV10eB5zUJtqpND1qAFfCY0
 9v1L/RkMlq5P3h8Uy7kGj02F/qGNkRmXlcTUgYwV2YLvPlAYrpWobCFLCRwvfraHyT7X
 0R8A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JfgwA0+G
Subject: Re: [Buildroot] [PATCH] package/igmpproxy: add patch for
 CVE-2025-50681
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
> Fixes the following vulnerability:
> 
> - CVE-2025-50681:
>     igmpproxy 0.4 before commit 2b30c36 allows remote attackers to cause a
>     denial of service (application crash) via a crafted IGMPv3 membership
>     report packet with a malicious source address. Due to insufficient
>     validation in the `recv_igmp()` function in src/igmpproxy.c, an
>     invalid group record type can trigger a NULL pointer dereference when
>     logging the address using `inet_fmtsrc()`. This vulnerability can be
>     exploited by sending malformed multicast traffic to a host running
>     igmpproxy, leading to a crash. igmpproxy is used in various embedded
>     networking environments and consumer-grade IoT devices (such as home
>     routers and media gateways) to handle multicast traffic for IPTV and
>     other streaming services. Affected devices that rely on unpatched
>     versions of igmpproxy may be vulnerable to remote denial-of-service
>     attacks across a LAN .
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2025-50681
>   - https://github.com/younix/igmpproxy/commit/2b30c36e6ab5b21defb76ec6458ab7687984484c
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  .../igmpproxy/0001-Fix-Buffer-Overflow.patch  | 25 +++++++++++++++++++
>  package/igmpproxy/igmpproxy.mk                |  3 +++
>  2 files changed, 28 insertions(+)
>  create mode 100644 package/igmpproxy/0001-Fix-Buffer-Overflow.patch
> 
> diff --git a/package/igmpproxy/0001-Fix-Buffer-Overflow.patch b/package/igmpproxy/0001-Fix-Buffer-Overflow.patch
> new file mode 100644
> index 0000000000..b9f03386a8
> --- /dev/null
> +++ b/package/igmpproxy/0001-Fix-Buffer-Overflow.patch
> @@ -0,0 +1,25 @@
> +From 2b30c36e6ab5b21defb76ec6458ab7687984484c Mon Sep 17 00:00:00 2001
> +From: Jan Klemkow <j.klemkow@wemelug.de>
> +Date: Thu, 17 Apr 2025 19:02:16 +0200
> +Subject: [PATCH] Fix Buffer Overflow #97
> +
> +CVE: CVE-2025-50681
> +Upstream: https://github.com/younix/igmpproxy/commit/2b30c36e6ab5b21defb76ec6458ab7687984484c
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + src/igmp.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/igmp.c b/src/igmp.c
> +index a80c4e58..838694ce 100644
> +--- a/src/igmp.c
> ++++ b/src/igmp.c
> +@@ -94,7 +94,7 @@ static const char *igmpPacketKind(unsigned int type, unsigned int code) {
> +     case IGMP_V2_LEAVE_GROUP:        return "Leave message     ";
> + 
> +     default:
> +-        sprintf(unknown, "unk: 0x%02x/0x%02x    ", type, code);
> ++        snprintf(unknown, sizeof unknown, "unk: 0x%02x/0x%02x    ", type, code);
> +         return unknown;
> +     }
> + }
> diff --git a/package/igmpproxy/igmpproxy.mk b/package/igmpproxy/igmpproxy.mk
> index f2c32939ff..d7d7691c8f 100644
> --- a/package/igmpproxy/igmpproxy.mk
> +++ b/package/igmpproxy/igmpproxy.mk
> @@ -13,4 +13,7 @@ IGMPPROXY_LICENSE_FILES = COPYING GPL.txt Stanford.txt
>  
>  IGMPPROXY_CPE_ID_VENDOR = pali
>  
> +# 0001-Fix-Buffer-Overflow.patch
> +IGMPPROXY_IGNORE_CVES += CVE-2025-50681
> +
>  $(eval $(autotools-package))
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
