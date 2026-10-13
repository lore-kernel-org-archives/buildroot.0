Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB993CC6B19
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 23:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E3C280CB1;
	Tue, 13 Oct 2026 23:29:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m4ELDWWqQuge; Tue, 13 Oct 2026 23:29:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 304B380CBD
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791934192;
	b=GCZL0Of6lAUJ1qk22ui+rkusxdJ+2EuqHgCyh+4iYwvu87/sMNoj1do2jA4o8FV/F2r1
	 W/207CsSh1RQv5i2cJ1PVgPpIUvEzoV2LrM97M0dJEOSrlLJczJPWZX/tCToEq2pGvtXV
	 mgSj3FwvANz7wiX3jbQVYIiLAP5vUfqYXs53OD5WjRffBeqq366gl/7YXKj9DVYh0e83G
	 0aT/Q0bdS0jNrqlnbWQ8cS9bejeBoLLn/cV83Ei5YzLkHmPx3/MdWqIeDXQAo0IcCvsu8
	 HXldGrU2FOsfOPZa629XUm787ljCOvHa6CziJCmzwCMDRF5jrv3y4kRqcazOO/eYAWA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791934192;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=9042//7sA4l+KE9ombd+vmDIJwa59gx6j5UqbzNYF2w=;
	b=lEtKq7LuPcxbFDbmWKuFngu6PsrXLx61s8XOZVdW0WohaIFDizuwsJM1Dw3LZwyao8R4
	 umyG/9jS46LXB7Fz3Ek5Oi6ZaX09QTolCV9V8+jkFltPYzz8MlecpeapOCpjtOQNCSBIN
	 aRyRou/rB/3kvNgV0sPrj024odHVb3odrqglRm3ESM+nB6BQrz8eppr6dYbUwsYSm0NN7
	 39dOE9NRg0e2fcPXbDQlPMLfNJdIys8UVyxEad7WRNE374uUpzxK5KXAXkd+pLHQLPd1Z
	 kuwwlAuE/oyJM6Y6OGeHSGvoSmGazg421R3uT7T5YXiyVbAWvTFK84zbom0iFvRblKw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cgBAr4oN;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791934192;
	bh=9042//7sA4l+KE9ombd+vmDIJwa59gx6j5UqbzNYF2w=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=FbwaVdEfvrlaFmv0joe0zySOkKGSh6vzyr09q5HNSDe4dnhvyKKkmC82Igf++jAQq
	 4v9JkWo8+WZSRcC1+hoflJ3vUtkNyQhuR2zy7T5XFK0OOkfpzEMPf97eykmPalSrdx
	 +MolTckq8MFbBEbqpx5O6fgLlHT16f0rgwK7dRt21KRjInGM1kbXRuksKM1FvPTTjN
	 xGG+XaTf28AvkvF6tcvCDZLzWfWVeIQTdQ6Si0NqI34ihS7zz9ln6/uxDF7YRV09Xy
	 yfEQiG/uH+Mayi4fhYDGPbCYerC162lhYoYRMeSQU7/DwrCMNHureH0kyNYoFLN1HA
	 DTBIarKEtDeZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 304B380CBD;
	Tue, 13 Oct 2026 23:29:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2492875
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 23:29:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0AA6980CC2
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 23:29:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AK1sa0r1hbSF for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 23:29:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4C59B80C42
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c30"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791934190;
 b=V/YWOgZHrTsdMPYZK+M1w55JgDYn2jS5T/gYyZp4HsFsP6U3QeRGsuoCAAz2sVC0zH1c
 DSFBc0oeplZg00Azjn+BEOYyOdwQSvD+zXtrhNikpLK9dkV5FbkmFSk70eTal2Rze/wVG
 8yhEqAZZlWp/B0eVHRxL2q+KNNSHGdtZ6uegcmPdYIW+L4veZFORVdyk0XhYKSnuHHjbH
 MHQtcNT21tN4LJ24ywz9Oxje2J066Dk+CxTjPVOCgjz4JJ8t+gzFceSawUl1rxJiu1MkP
 6alv/Sa2domI1fQ1tbKXL47lGkNjC1UMPsvOHSsY9zzb8B/7L9HSyWS7rgO/wAb6KSw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791934190;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=pDiEB0xXMfxnnuQpcynpwJDQH1P+n6Gwlq9Tg/O4Zq4=;
 b=M2dRD/d88r1uw4cC0uX9eY1LLumJBlL4zkIS7AKVLvbYBJ7EJNPusIlmbamjUAYF9sw2
 Gwqf+Rvm92Jks2Gq4/9rK9ONa10jSnSQysNNB3wgWsbi3dCpXw+Rmrr8/Dsj5SfZrn3dF
 pUOXHpjxDTadvYcUtHIPZn32zyNm3VTRb6Fsn5cWXq+lS1rUILC21VQl/9g9+En0VLRDp
 97IXR2WnmgxI5Z+Cy7YShex/zvbK14eamoEcjs0NXuYGKZ8ci0Dh9DB1Bb/SUbC/IrJbv
 RObA56Zuq/rsZYYX/8+/1ztjIvG3HcMcLrDYteHyehrfLNydA5RiQ9HMlZhyK2G9V4w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=cgBAr4oN; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c30"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c30; helo=mail-oo1-xc30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=cgBAr4oN
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C59B80C42
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 23:29:49 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-6dfc4510440so2134048eaf.0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791934188; x=1792538988; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pDiEB0xXMfxnnuQpcynpwJDQH1P+n6Gwlq9Tg/O4Zq4=;
 b=cgBAr4oNTnvjWyxKZupbDmsjl47jmgbdQOlwARMT/LpaGunL4TJFEx1XAjRi2RcIBW
 4rK+zL8SFEWHYAUksKGu9m+KSozDBh8z9/F8BlAPWoa7RYVOLJ08ywB/2h7wFpohyfMr
 FqbqQxitBKIeqSBiiJ2ZNf7vDNA44STl6fMDME6OVoa6835Zf3MznCliiDU8B/mkNQPx
 54Rzw111HAd8W2RRaT8ZYvsLTCzzqJdTUUDHMc1Fq49TeaAiDNeLBJP8QQ8Qs2NDGLUz
 FRPOwECJNG8fK0sOvKYNdB8pNylsHZu4u8XLoXA5oizVRNAa5Byh0dFbT9i0gf7qz58N
 cz9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791934188; x=1792538988;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=pDiEB0xXMfxnnuQpcynpwJDQH1P+n6Gwlq9Tg/O4Zq4=;
 b=r01L2LbMt++8tjA/6bBhfNipPsSX7TSadWSAJIVkvSR+XjgLFFiMHNYSCZ2E6TSgu2
 wj3ItZM1qiWBrgBPBoPy2CDV+1weh/Bf8pTo5N15oresKczMYmEnkvvqPE+Byuq9yP8j
 CLnjow5h8nsMozjEajgOOyaiKFq8T0Z5Zl0IO/Reksf/2oTQlsEpRojhHx553hWH+cLg
 4IRQyl3aewKgn7OvUocDrAMWhd/eWZFsB1l32o8UCyDwJDdmoLQ+4jvkx1DwTPhNIHY3
 iPQ5zQXP6yjYL01Ye4RZtuEiDiAYs5vGpqIti1I+fUw6wI2sinZA9UCRYAUq1enUDB03
 Tcgw==
X-Gm-Message-State: AFq9FYIAm+tls+kcWFo+fnBrfa49vdadMwQRcEER3d2IwucLnbeo0Uyo
 6vSrHIM46o8DUN0J+kUAK44gYsnxFF4kKar8lKdCBqkVof0p0W94rWyipfIsxoR1
X-Gm-Gg: AYBFou1RJk4WiC31rM1umPUqc/FnrJnDX8GEmksigPmqr4Q2yvo/xIjQq4/XzTsWqr7
 1JA0RGZikMEXgUcKne+WQPrLRjvtzMbgkSLhQQZHCZRHzEevOoBC4HpoIM2H6On2XQyfqaiKYzf
 QK2u5GzZbp22iMPnN8LwPVt/pgCSJSJxVM6wHxkNt/QvGTYAjBNHKIlLlQssJSkXyvLrPuznloM
 wo0NR3JhyCBQ2MO8NT5sDuYqfGDTb61SiuGe1CHaTUpelM5qFoCx2uO9qLtc1K7q9HOQkRDYMQ6
 3/Eyfxn57IMWzstIab6aBT6CdIi7qNzdxRBRlfLon2euQU3StWSr1t+zzIkkAWDUhhmS+i19tQM
 5yhAOsFLDpQ1DTRWbTcWmboc1hKfynSB6d8ElDNQGmD0qEdKqVm0+f5N/LAa61qa9hih/wHMVyF
 OwB3V4ph3l0zrg78LdN8OmokFYOKEzTlU3ZmzRSbpYtMOGyP4TqHByHzzgaDCdvYmroZSFjZZpg
 oMtEz53Ns3eO6YkYoJJ0gM/uuEpPFJzs+yWAABPFqwLrkej6llxM6mtf7b7pMli6JH4pl+7/B+7
 LUdytIfBdpin5M/oFsfSqLn/P94uB5HlbtApgR5y3UaNHbBGO7B0UKhQf+u92a55c3N9uyugkId
 uWN6+5b6tQkmvG30hrcq/KIShyjnt7wh7Bnde+S+w9tE=
X-Received: by 2002:a05:6820:822:b0:6fa:3c7:8798 with SMTP id
 006d021491bc7-6fa03e803femr2351790eaf.56.1791934188000; 
 Tue, 13 Oct 2026 16:29:48 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a6dfbd6a92sm828514fac.9.2026.10.13.16.29.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 16:29:45 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 17:29:34 -0600
Message-ID: <20261013232940.2690456-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013232940.2690456-1-james.hilliard1@gmail.com>
References: <20261013232940.2690456-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/9] package/python-more-itertools: add host
 variant
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enable a host variant for host-python-jaraco-functools and
host-python-jaraco-text, which are needed by the standalone
pkg_resources package.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-more-itertools/python-more-itertools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-more-itertools/python-more-itertools.mk b/package/python-more-itertools/python-more-itertools.mk
index fa3d859905..6fe90f84ac 100644
--- a/package/python-more-itertools/python-more-itertools.mk
+++ b/package/python-more-itertools/python-more-itertools.mk
@@ -12,3 +12,4 @@ PYTHON_MORE_ITERTOOLS_LICENSE = MIT
 PYTHON_MORE_ITERTOOLS_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
