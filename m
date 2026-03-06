Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2FA4FCC062
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B79CC4208B;
	Fri,  6 Mar 2026 19:53:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U_hHC6hIIvRi; Fri,  6 Mar 2026 19:53:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4076F42072
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826791;
	bh=EX56mepw8if+tU6PSRwr48qtMiHywi4Iy+tdytx3ABM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qaUuHwRmedW31S7TfE1ChhiH0aAqKY7ngz2tGOCfvbjWeSmHORcwVYqTUSQCd4FiG
	 xFvIni9k0oQhYRA7+f13UszUYZsRiRUn4qPkyDYe7My3ufQ5h1XOCcZPUBPDMmzQe+
	 E1OSyVdG3qtZvOy3/EzawH5qROLbT0CbZ+dSUmI3PEZKICz9MUdtP9E3c/h8vrpxf7
	 yYl4bM0ZniihYBzoQ3cmxWV+DgS9Veo9c3TaiYdi8cnuFxiSfKRmW6AIwD2bR++Htu
	 T2SX0ioxSR9hSaoeQnJAXUvt6x1GQQFrZWj6Ts7lXXPzmBSWBFfYnyF0Mm3KnLTjHp
	 za9Y5sWkNHJSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4076F42072;
	Fri,  6 Mar 2026 19:53:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C52BB25B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA98761426
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9GWKOgUNNOTL for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:53:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9A80861472
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A80861472
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9A80861472
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:05 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-439c56e822eso3882531f8f.2
 for <buildroot@buildroot.org>; Fri, 06 Mar 2026 11:53:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772826783; x=1773431583;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=K0MApGsNeBuXnheoP1VnfLoi4AAcBQlYlhM7ZUyfgTU=;
 b=dKBWBL6nSSQKYK50fsUlvr/Jt8qtZWhY+51vRAAuzFjGflmQIVXXmaGhrTWrmGRznh
 oTJM3rW9WwPnKiBxWc4jSKKCFl6I1g3Hn5+hAfD/c1R/PsTK++c+uXeSpsZ42AtofC++
 WJ5ziJ9Ve9cKWyVizl6ZZ/prVfNW9LRZXCBkfAQdO11Vi1MESB2IYUbOA4qhpz4OmvVI
 +qfUVDS6khs6unkB4mFSR/5lO0+gnF0aIMyGkMTqUEZ8f817n0WTLAKBs1CJ0AxvNqzJ
 EsyhMogYMKWHHrOxUL4vXS62q8Hlus0DsCrEIdOWDkD1bx+NMfMipGONvlCQ6r5GkTXT
 V3EA==
X-Gm-Message-State: AOJu0YymWELyPBdTlzLyVcd0nTVSGegPXzyfgVyNd1HSrcaDxHCAOEla
 sCGmn2bi8PQXyn/V/FsmFCbCUyNiG+p94zLtEVaYjK6kIdIxuICyAtV3Bs7v1PkJSH0=
X-Gm-Gg: ATEYQzyfupc5OuxCmnZTwFi8bNSndEy6rLwOk4DmC/wgseubLzg0KxWMZFBJy4VLPIM
 0qweAPq5nIcTJ6O0HlAshCVKQR0+gNrbukN3J476Xc8uU3tZSLvrxL7gGePC2KNTNSvMtvxb/Z6
 qkUjSGjsSmuZ8hB2zb0kzsXiRuh+17ec37cd0YTIzceaGxkcm+rCo+cm/cSm4M7KnorKl/C5BJn
 +vnEbfFpmXL1tvu/Pt4tb71/JHVekYAfFrwTGV8t7WbhpmCPODFsPrZPLYkg/U7vrIWtmxmTfbM
 807VONFykTv2oYohY6V7qWBjNDZBfGAgezPmNGZc3QEimpSJvvmFU3cTpmAbUzKwRQfAovbzDih
 J7YXjGJnoEDz2C/O/hd2O5I1vJ8jPxr7XhTlKKOtzD9CE0T1UE3pDAOrNL8W8kWn14lc6d9RC/O
 zVZcfdP6rRaqq52Uo=
X-Received: by 2002:a05:6000:4205:b0:439:c677:5145 with SMTP id
 ffacd0b85a97d-439da65772dmr5491733f8f.22.1772826783457; 
 Fri, 06 Mar 2026 11:53:03 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae2b9d8sm6037936f8f.21.2026.03.06.11.53.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 11:53:03 -0800 (PST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri,  6 Mar 2026 20:53:02 +0100
Message-ID: <20260306195302.7339-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225094824.270893-1-thomas.perale@mind.be>
References: <20260225094824.270893-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772826783; x=1773431583; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K0MApGsNeBuXnheoP1VnfLoi4AAcBQlYlhM7ZUyfgTU=;
 b=CE2qzpq3s2+JbhQ44zlOHto75rqIuaCnx4/Zr1p/UUbqR+UvKih2J7EkfGZStzuMnb
 ube/Djsb7svU5FfkOAyn+xXLnIlD+jJtGDHwbcIDLs7szvEyCLol3nukqrW+B6Q4Ter/
 Irq1U6XaDafvyR/OgKccN3M5hXx6qDzKYlfEs1llFbkYAibg+c3oaX9EK2Fy97JOiWXb
 DLypkfhrEtslxRc274O7qCz4ntrzihUKE3wOher/ZALK8m5Z8eY9ftHzeLd5IuRtkyNx
 7lZLxjcNzTq/czdYJ9Ntfoa3dGy3tTEit8hZmKbaV6h9Hulfkl4L1T+UHjfunF47mV4f
 XYyA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CE2qzpq3
Subject: Re: [Buildroot] [PATCH 1/1] package/containerd: security bump to
 v2.0.7
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
> For more information on the version bump, see:
>   - https://github.com/containerd/containerd/releases/tag/v2.0.7
>   - https://github.com/containerd/containerd/releases/tag/v2.0.6
>   - https://github.com/containerd/containerd/releases/tag/v2.0.5
>   - https://github.com/containerd/containerd/releases/tag/v2.0.4
>   - https://github.com/containerd/containerd/releases/tag/v2.0.3
> 
> Fixes the following vulnerabilities:
> 
> - CVE-2024-25621:
>     Versions 2.0.0-beta.0 through 2.0.6 have an overly broad default
>     permission vulnerability. Directory paths `/var/lib/containerd`,
>     `/run/containerd/io.containerd.grpc.v1.cri` and
>     `/run/containerd/io.containerd.sandbox.controller.v1.shim` were all
>     created with incorrect permissions.
> 
>     https://www.cve.org/CVERecord?id=CVE-2024-25621
> 
> - CVE-2024-40635:
>     A bug was found in containerd prior to versions 2.0.4 where
>     containers launched with a User set as a `UID:GID` larger than the
>     maximum 32-bit signed integer can cause an overflow condition where
>     the container ultimately runs as root (UID 0). This could cause
>     unexpected behavior for environments that require containers to run
>     as a non-root user.
> 
>     https://www.cve.org/CVERecord?id=CVE-2024-40635
> 
> - CVE-2025-47291:
>     A bug was found in the containerd's CRI implementation where
>     containerd, starting in version 2.0.1 and prior to version 2.0.5,
>     doesn't put usernamespaced containers under the Kubernetes' cgroup
>     hierarchy, therefore some Kubernetes limits are not honored. This
>     may cause a denial of service of the Kubernetes node.
> 
>     https://www.cve.org/CVERecord?id=CVE-2025-47291
> 
> - CVE-2025-64329:
>     Versions 2.0.0-beta.0 through 2.0.6 contain a bug in the CRI Attach
>     implementation where a user can exhaust memory on the host due to
>     goroutine leaks.
> 
>     https://www.cve.org/CVERecord?id=CVE-2025-64329
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/containerd/containerd.hash | 2 +-
>  package/containerd/containerd.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
> index 4ec78897d9..0916c603bb 100644
> --- a/package/containerd/containerd.hash
> +++ b/package/containerd/containerd.hash
> @@ -1,3 +1,3 @@
>  # Computed locally
> -sha256  472747a7a6b360a0864bab0ee00a8a6f51da5795171e6a60ab17aa80cbd850a2  containerd-2.0.2-go2.tar.gz
> +sha256  2bbf9fedcf4ab31736fcb3ce224ef22610a87da9d53bbd8f6d205710fd849831  containerd-2.0.7-go2.tar.gz
>  sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
> diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
> index 2ef70ab5d7..a334f0fdac 100644
> --- a/package/containerd/containerd.mk
> +++ b/package/containerd/containerd.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -CONTAINERD_VERSION = 2.0.2
> +CONTAINERD_VERSION = 2.0.7
>  CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
>  CONTAINERD_LICENSE = Apache-2.0
>  CONTAINERD_LICENSE_FILES = LICENSE
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
