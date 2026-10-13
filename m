Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89498CC6B0F
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 09:58:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 444C280D05;
	Tue, 13 Oct 2026 09:58:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0z-h3PqwEs0m; Tue, 13 Oct 2026 09:58:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 667F580CB1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791885516;
	b=iO2w6lBd+sYx2oOGP17BnKeaaCn84ODtfn55+6Y1mJ12rzGZ07OdkDf7FaAzWRcAoV+C
	 AR9EZoiZ4KHB0/3CQ3EqnHi5lw2yoy106dGoRdNOCANZiElXCaPL5W8tYtgfrJZQl0cc9
	 ioP/1mB4mlGm+z4qR1PhTZ9wQMFInHjeEUwpxm2yRvhsHupHxfNLZ4DQHbGzGAUR2f+Kj
	 6FJfm3BiePOqDbH1fgxfEGzaBWk4W5Mx2hLMx3+3m2dRI1mLfZuf98/mwiC9Z6yjotOG+
	 nBCUFAgLanr4lu+KcIXdGw5w5n7pbKGAXvr39xrEOuKJH+K5Eh0YVm0J6yHZXeztmxg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791885516;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=v8TWWqYLVC69D809zkrsqID+m1I5Nc02hDNmwNU3tqI=;
	b=rSV31ZvcMTr2rLXU4rcIzrjToYfDQuRsS8R+YWmAm7rXCv4yxnRtQxA1SvLGp7PJoXQV
	 cJjH5Bhg3BVXH+jVujNEDj5cXHAouGcHs4dTMAbmabxfLY3SRLL10cZ7hoYwms3Dj9kmY
	 3IlNOZYqLnCTByPkTckHpqlZ2zKVdRTYCGW9B/W/4/0d87rRw71DcuAagBS/bGD5Ipdyp
	 aFXEZieAiZ01ZEWzq1DE/FSAv3fy7AbZ2xgvq/T299h6xrGcol0Hc73vIswTiwx19C+dT
	 clnEjp/454v5q+fRivUQMwb8jdAWW+TIrKJng36SxjON8ORduZGyULdVmvJvYrAcd4w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791885516;
	bh=v8TWWqYLVC69D809zkrsqID+m1I5Nc02hDNmwNU3tqI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ghY93s2VkLX5mUC+yTIomgROK9XLoQ5A9iD+1eb+Fiv1hRSGBr6IzRwzAdXy78dJ9
	 R1EniPhDUCCMYWKcNVQK0nJBhaCn7/06mpWBwHV4tkCHbjfMZ3i1W2cBu09dQl+F2K
	 oFZHYqDNpE/VQOQXGjaw/dN7WU9biS3Dvm8nEjHLeewqAkOS2Z0q7NrB6cR7xs69i3
	 mrcGzbOyxy3TVCXeEt19eJqQ81t/igv/Tl36foAeTmpxSPAJbK6TIt0d4svyFC7Gyc
	 VccDel3eIp8GWVL6ob9UOjtBXdLsy5uqW3Bq3z6WVFTx78oTTMyu0Btn95QYX/l9Z6
	 pQ7T26nPXsbPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 667F580CB1;
	Tue, 13 Oct 2026 09:58:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B22E9235
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9896F60688
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:58:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tMkEHX5e8wyW for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 09:58:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7DB0E605F4
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:31::9"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791885513;
 b=qvTo2tWvRcSWVBo/fDRey1B7HDl+42y4ASijs8Zgt7f+MyTL47xh8IqnfwlVo9SSv0A7
 iIeaT4Viq2KZgMqgbb+uhRCGZImadpUvT98hiX51M3jAtDdtr3XfW6nXSmkm95ql++wK3
 FhywysKGkNCjDoY3+bfO5HlyxNrnS3ZphPsAZa6hSvhUF1Lmtg8/kiWjPyGI52P5Bzm+F
 xX1jYtH0ZhuoQdgoMkHu8SSvG/w6mEIi+kx8XjrO0FxamIOjvTm+jDUDr+mYxneaR3wuU
 yp3yuh+CIqENgQbrgRMvjM6tghJ+0ZwPMdlM12ikUQec8KF9kgMcxcqd/abFZyDFvCg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791885513;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=28ENUK0YxNgfy01DB1W86El3BquFazI6HtLmQjaKYQY=;
 b=Kaz53+m6EZX3qWYwrf5MZmxnLJzhR6Jj5nJV8hYT4ApZT11ksSHohAxDJ5NNFb1K6lfD
 ZOsqCFdXZp7YjwWbmd/wByLvmu5wuTREe7+b32grudhYaYl1TQw4ENQljpWN0Q3wLDWgk
 RhY2MlVrZ/P2xs4Q+ZuFKguMpe+/W7EpudaA17vE1V0aB0czEZt4akrIJ0cxNRGAb7f9n
 TMVVnDqJoXTSVgqnysdSm+0mR3EuuxjnXjl6Ad9Z75xlBzua8vvIh8aXc804sre0zx92t
 GCYAJPo134P89IuY4WPdJAqpohjseQMsWgYYClphglSMzud/MChvb/B0pcDrXvV91nw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=nimblex.net;
 dkim=pass header.d=nimblex.net header.i=@nimblex.net header.a=rsa-sha256
 header.s=google header.b=r7tZdxkJ; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::9"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:31::9;
 helo=mail-wm2-x09.google.com; envelope-from=bogdan@nimblex.org;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=nimblex.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=nimblex.net header.i=@nimblex.net header.a=rsa-sha256
 header.s=google header.b=r7tZdxkJ
Received: from mail-wm2-x09.google.com (mail-wm2-x09.google.com
 [IPv6:2a00:1450:4864:31::9])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7DB0E605F4
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:58:32 +0000 (UTC)
Received: by mail-wm2-x09.google.com with SMTP id
 5b1f17b1804b1-49e6eb11e9cso15590735e9.1
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 02:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nimblex.net; s=google; t=1791885510; x=1792490310; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=28ENUK0YxNgfy01DB1W86El3BquFazI6HtLmQjaKYQY=;
 b=r7tZdxkJxyMnR/ddvsYCRprbH4xLn7GjpkB3YdtggXdJ4EFfac/DrpewvXjCevYR33
 Hi7buNcl/KrCpmVRskr8BQxdOkEWkOuQI72KpQwGMz9VttG7ksOdak7mY8uqMBlwzEvr
 Tq8Mx6/4uvdE2fci1yhhVJXbpO+ZF74Fsrcbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791885510; x=1792490310;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=28ENUK0YxNgfy01DB1W86El3BquFazI6HtLmQjaKYQY=;
 b=hFeHgzQ9depEscPq3IOSutP3sm3I6+zL/40or4v3nFqJDLNo2zpZcuVO94eatKwEVg
 V4HqxcXJHyDvPEt/yz5P8flQ3lqJ6redpVTNVTtEM7Vgz8qNnjhqtsHrCWEKDl+PUIBR
 3HcoPjUhurUVNeqIiPIWfoKd8qFqBz1v6RE21/NzN83KkZKo0kdcvK5P2OlbonqqmoKH
 z0I0dC737wECAFV4bP/mWq999ylz4xKMmqO4GmT1gzDSF9yp7a9e0PzvDRmoX19z9M8D
 SDZmCMmn7C4Iz7kNezHkPElGnPq9ZTtBpoyMAA8L3K4Pmuyin9cBZU6cfJNmUqeU6jLk
 uOiw==
X-Gm-Message-State: AFq9FYJI3YuBfZsphHo5QSCLD2WDKC+FEml38NpIe8ikZyyy4l+DviEB
 G/cCvdXyo2SKNFMbN0KuTe3p525en4qwBUkh+uI+yEMm1T8h8vuGOamy1fITQlmZOYImNZVvbos
 Eyhz+5L9f+x03
X-Gm-Gg: AYBFou2frqfckfS76/5JAklSunHZCTM3lPO9mxjy3uE7uwH2LNGLBAiq8s4A8r7O3VU
 ERpgKt06pZ1bqlCzKA6V8VRtqnHpfVAKW5A37pejC2AQiTb3bvtfKeSRNPd46PEyH+qp9p+ypSK
 3e0xWzcv8XgYOJguyKbS5BPbSsPvivAWAGNqxXbh4lWRNztQydGI9xZVLFAenvbrpFtL4wvjVc5
 IwFfKO7of6xEfERqOu+Xr7dab12AYE5sZpL/vmy4pQO7yqQa7fFDO5ki9nJwYwTQkrIwCEOhLEj
 GOJjByTXFbRJcPbSTWhXCY2elmab468paQtkURibmYw+6mZi6sEYTOSu5lBy+Aw8MiB7ABDrXhu
 6OMJRefhchsmhXTnhO4FH3CiMmGtTl9yI7vep0aoML6KdzII9GarsVEsk304I3ulirMKkV1HgiX
 7BshfJaGCNfrMc64beDGRZZVioZ2LBVRcjClGDYXYX3yXMZbOu/GunkzPoe8xUse1PDyA=
X-Received: by 2002:a05:600c:8b06:b0:4a1:7ce1:2eaf with SMTP id
 5b1f17b1804b1-4a18e4e0963mr238605575e9.34.1791885509794; 
 Tue, 13 Oct 2026 02:58:29 -0700 (PDT)
Received: from nimblex ([2a02:2f0c:5601:8b00:fd52:90c6:53a4:beb])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0aaa5dbsm4415973f8f.12.2026.10.13.02.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 02:58:28 -0700 (PDT)
From: Bogdan Radulescu <bogdan@nimblex.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bogdan Radulescu <bogdan@nimblex.net>
Date: Tue, 13 Oct 2026 12:58:35 +0300
Message-ID: <20261013095835.3845366-1-bogdan@nimblex.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261011185735.3200892-1-bogdan@nimblex.net>
References: <20261011185735.3200892-1-bogdan@nimblex.net>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/nettest: needs SSE2 on i386
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

nettest depends, through rustls, quinn and rcgen, on the ring crate,
which refuses to build for 32-bit x86 targets without SSE and SSE2:

  error[E0080]: evaluation panicked: assertion failed: cfg!(target_feature = "sse") && cfg!(target_feature = "sse2")
    --> .../VENDOR/ring/src/cpu/intel.rs:26:9

This affects i586 and i686-class CPUs that lack SSE2
Make nettest depend on SSE2 support when building for i386.

Fixes: https://autobuild.buildroot.org/results/d04f770538412bee77851142ee007f2ff107e0ec
Fixes: 36fa00354730 ("package/nettest: new package")
Signed-off-by: Bogdan Radulescu <bogdan@nimblex.net>
---
Changes v1 -> v2:
- depend on BR2_X86_CPU_HAS_SSE2 on i386 instead of excluding the
  i586 Rust target, so i686 CPUs without SSE2 are also covered
- add Fixes: tag pointing to the commit introducing the package

 package/nettest/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/nettest/Config.in b/package/nettest/Config.in
index 0ec4dcdc4a..096ae79406 100644
--- a/package/nettest/Config.in
+++ b/package/nettest/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_NETTEST
 	bool "nettest"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	# i386: needs SSE2 for the ring crate
+	depends on !(BR2_i386 && !BR2_X86_CPU_HAS_SSE2)
 	select BR2_PACKAGE_HOST_RUSTC
 	help
 	  nettest measures download and upload throughput, latency,
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
