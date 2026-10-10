Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C113FCA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AC604095C;
	Sat, 10 Oct 2026 09:23:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kf9ZjXDubpLS; Sat, 10 Oct 2026 09:23:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A6CFB40967
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624195;
	b=FGLbNsnH+5nxabHfMHN/Xd/tfZuBzHG//0OBWbUFOvuOIBSRyaXMy1zShDjsofPTfiee
	 KwA2TgbuJm9CUMeqnhepZiczJE2PicZty8mx5PiHfoYu2qzXw0qb8SGG9cbKyuZ1EL2ZG
	 +eG5zoAf6gN6iqfqKJkqwbpYDaNprTrmMLlrgKBBLVVxYPIlqiI+jhB0iWT4TpEXxYmjj
	 pK4WeS50ZeqEFuGgdfKno0OTJRhZjw4iBA+YpKDDiTqXn3cxse0/3ltcCUVIrXCwyWmCy
	 2SQdaK2LzKXGFUuIYL1YnpGc4U7v2jz9HIMyqYcJKWJ/uIr7sGJaB3x7N/O/fAZeyeA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624195;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3EAA43+sRwrexC8pP6aY6PleBS28A4u4aWn+VTZx/SA=;
	b=CBzs/MtqbRxrU984DSgeTnUbr+vmsWcmWFavgGkPBKEeu6QqxF73ZDC+hNb8my2XsB59
	 8JdmdFjyMjuZ8ncn/mCLuqapPdebgx5YcBmG1km1o8ujDpLzta+fWiwBdNYc7zD8rJIho
	 Bs5MpqrDOBVJvkQIl3R2OyQq9u6tFmnabUoFAbytI92iBT7gZ69G8cglzVtWmvJVycBg3
	 4KObsZMbmO/nWAtjMAvUh6n35+kjfLMBDM7BjVzX27UH4IxN3W/a5mAB/0dDu8E3ED/4+
	 1rRF8MdXypFit8qTxrQojEcBTJY2P3vTEwGaZ2tkJLSaorTVw07Z5ktD4/tT8bRw68A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624195;
	bh=3EAA43+sRwrexC8pP6aY6PleBS28A4u4aWn+VTZx/SA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iSNazgPLyoo0BBFTY0hrC/EbeGLArBt993YvR3aOQsQ1cgbDRkV+imQWUECCpLFH9
	 bSlVH+vA/Dqp2+lvpMD+WAP6KgTnz8ZHE26dby3x/9OZacTjacP7JXQ9YSkPUb3PIN
	 zc2q6HwlsoJtCOE0UI39WX0uk97fmlnGeFVyPRuDA58n6C5apPe9SdkDICpX7LIAQY
	 vK2dNDEQXwJe1MVXnlNd5rbdi5+4SIC0foX50O0eNDhUr7iXlYLqY+M6vAab8h1QVE
	 mdfZCMrH5GwcUASAvN4vmSWQ3ZFKrn2NOoPkPJyuvOUOab/WqC0has2RmAlcMGMqlv
	 ZVl7CCoL5BiPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6CFB40967;
	Sat, 10 Oct 2026 09:23:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D33F2356
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B3D3960A3F
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:23:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HVuDKHGiR9rQ for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:23:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3CE4760904
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624191;
 b=LUWNaR1y1YucNYCDeG737xEiDmKGmeWe1gWCQKc0eiKThhLaJuy7G69tjwDTtEeSpCWT
 DDpyhFGCeV51bhRqsv/QCTrdRif/ibWLhRG99HupGK07rP2ufOuOiBzRT3P1Zpe5SOd0m
 oQmFaZKJTpdyKmcCvf73rDbDWTNs9kFprK+Ang1LjmIL+B4CHvm1MuFWKmqyfiJQDzCnA
 czoZ4LEOZ21YWCwDrbHq0vRnOxjJyG1/LWJyMrocgTifOfX2lnnKLn1UdapaKGMEvLjsO
 M5cQO8ygnFbfB/F4RD+MSFU3MPBFmB+RPdC6KrbdmB3ws47X0yNLmsNdEHEJY2jbc+A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624191;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=GU+7q66/k9kgbK91I3M9Q3Hd2KYid0LME78nEYUnOu0=;
 b=UwkvTtMvMQruXIJfxk0R5/EMKqXqEUQCp8HZc57c0TBR4rO1oqsQApU2z/e0qOCcK/UQ
 PGUMdkCjHbXhy0XrY4xyYfPYZkhkmHg1tOPlJAjH0qxKsvrwzhhESABZy8EAs+OSMI2gi
 /V+GB+WNeICMBywLA1WvrOWEni+4z+6BjY0qeV2qvALyaJnwFoD76wlYuBcsJD99yqfY8
 evYhNNNLjxgSUhntBle5EWHAxTuWkk6uKQ+9T0aKcirDklzkp+kCT914FwxAGD6Lt6ACX
 tOO1yULUCpvIDljNOSReKWLLypSD7fQ5NoAzBsaoU/N/JvFPelqefY68Xn3DP9lq1rw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Aqs7njh9; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::330"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3CE4760904
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:23:09 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4a02718da81so3739295e9.1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 02:23:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791624188; x=1792228988;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=GU+7q66/k9kgbK91I3M9Q3Hd2KYid0LME78nEYUnOu0=;
 b=j7I8PeNUcIKU4OnhsqLQtVmaaTrJG5F8smPfYe/nypviyyGFhP1UNDaxfMgxoW0TM5
 ovBifGHssd6XbzBVZqJR2PLMZDGTCB8AxnBYP2DRqgCrBfxP7qHRpvs1pAuFYwI/P42u
 5rp5swyZKk6Tcr6CKGufmjWm4SgkfZXtjo84bentfzn8I12Jfwwnzb6J7YN75bHSAC+B
 gEt8Ishuxt0Oa+ZKUAtAqAgYbqzV27Fmt/0rJtWL8uxHVQXX6ezlsBEw8+trfr0xUDcb
 FI2ob75ifPDssS2I0BW/6baL+VQ3PJDEHsoJoKu9YKQqx5NW2ZtSHvcSpKQNZ2MFYj0F
 z9Hg==
X-Forwarded-Encrypted: i=1;
 AKwUvBykATyUUvnhcgrN3X91dksuNhhn/jUxnR9+HuY0CwKLH1MGPuGmYAs+8vIw3W4zpZnVI2EPY0XvvcA=@buildroot.org
X-Gm-Message-State: AFq9FYIamCwImBRLcnSTbFgcQWDtmPxJQXVFxAY1o4ztezty1MZJdzxe
 ASSFcLHnhKr+nAQe29UB+kcbsaE24YwriwAe330+quBDMHnyrgIhm9dgVRKJlaz1Wu4=
X-Gm-Gg: AYBFou0LC4HOqvtmJcZNkM4b5HoRRiJL3r8Pb5pLfUxFzSB4thPR4aZ1gAJwZLw3/PE
 x03oZMeTcCRDMU1k2D3LqZSJlSFFrhd5CpuSDPEoW7zdSek5Otyjq3UGHXCGQr4ERcTyhWdKPm1
 rqHNqdbiP2gjNro75Tx7FS61Yr/z+zrMLL+mEAYlo9gICXxYqzTwJOJwSorkPity6sxnhXkk+ty
 Q1XiqKoqR4BQAkMtVdNZSv/saqZzRhI3HEvQ7wC2bqNJhQW9E+34MqYyA1n2Y/KUFyU1Cds+hUh
 w00/bjRWDSv9SLIn2D4KmMBJ4GZjW9LRa2s48T2H7eCqQkKmpK2K5/IexP7WqXfb4SQGTEDI7Kp
 DuD9LGXBp31qYyi62rKzl/OSHoCoLDppzoxFhSFxd76XmI54OR3UPPOhFrhfBSk2jaEIEnSOhkD
 IbYCzzLlt2o1xlOlJIs+3GYVAJhE/q4yy0cwHMG/xmTz739VstvXUhhdOzMF3N0BQgRnlrPS+DH
 U2UPI1E8rkoriz70uoxEKcs0DOS0HK/cmUwwQp3RpcjnZCBQLOLzIq+
X-Received: by 2002:a05:600c:8b70:b0:49f:e701:51c8 with SMTP id
 5b1f17b1804b1-4a18e4a01acmr86485255e9.9.1791624187936; 
 Sat, 10 Oct 2026 02:23:07 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-f938-e455-e8cc-7064.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:f938:e455:e8cc:7064])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be97d1esm183055825e9.8.2026.10.10.02.23.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 02:23:07 -0700 (PDT)
To: TIAN Yuanhao <tianyuanhao3@163.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 10 Oct 2026 11:23:07 +0200
Message-ID: <20261010092307.139085-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922122936.3945-1-tianyuanhao3@163.com>
References: <20260922122936.3945-1-tianyuanhao3@163.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/network-manager: set modprobe
 path to /sbin/modprobe
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
> With -Dmodprobe left empty, meson's find_program() bakes the build
> host's modprobe path into MODPROBE_PATH, which doesn't exist on the
> target.
> 
> Pass -Dmodprobe=/sbin/modprobe: both busybox's and kmod's modprobe
> resolve there; a missing modprobe only costs an error log at runtime.
> 
> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>

Applied to 2025.02.x & 2026.08.x. Thanks

> ---
>  package/network-manager/network-manager.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
> index bf4f29c3cc..c96f613831 100644
> --- a/package/network-manager/network-manager.mk
> +++ b/package/network-manager/network-manager.mk
> @@ -31,6 +31,7 @@ NETWORK_MANAGER_CONF_OPTS = \
>  	-Dqt=false \
>  	-Diptables=/usr/sbin/iptables \
>  	-Dip6tables=/usr/sbin/ip6tables \
> +	-Dmodprobe=/sbin/modprobe \
>  	-Difupdown=false \
>  	-Dnm_cloud_setup=false \
>  	-Dsession_tracking_consolekit=false
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
