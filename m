Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 455E6C624D3
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 13:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FEB940B20;
	Fri,  4 Sep 2026 13:42:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ABQpV7H0sxBt; Fri,  4 Sep 2026 13:42:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2260E40BBF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788529367;
	b=FCBt0Jh+pY3VXWaEHFmxS0izgnq47NMlBSZHOoLdTLg2IP/VsDq1Xj6GhTad5RM2Qa1i
	 8apqlGFmvWrfb6CSRsajH2vLm1vFIB/jfYnvPcMgEW2Z0k1G5eDCRLSShb2djdlZAuTGO
	 Qz68phdkUdOU7TI+mCksnHW73blqnP/jwq2UR3xmcGqezrwKSu67deRMxfJUZGAEbbfTY
	 u5yR1yAcqeZoUtyXaK9Y2cuv1+8EB+BC3/U/YlehQM4/c+6cg/9fHfR2IhEowGmlq1dp5
	 pYsFrjHnbggNyzt9LLrcz7ocMc5pnoyaKpOhVHQ76gG8/OtR1A4dlx9hLFgzzsr14bg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788529367;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=pAY+6O0FP7CnRXrenGk86mNhJ2QGCOH6EFyA2KBRa7I=;
	b=KSlaOv7chFdmP3OHMOrayeuQtC2ECK/cWvXNUGJgffONGmk8aXfhxs8sJfdtGNyXcOqu
	 3LHEVsIZkavuftwbBF0wbGTwQselhbZkDMcycFaDRpOfQd2Vqi0+nUkhHWo2Bt41u+QjX
	 hiG0f5liOi5pu+jV7ElLiBjQl4z8q0Gk6wnUtl21177neHX833PkaCWSCo0dKrcDKvkim
	 aKSqJoZPECcwDLFPOOdsO9IVnQus/wPV6oVuN07Qu+64QrHsA1tFkfCKbE6QmXxjh20Us
	 /yY46qgQTrRQhqfzzuUJndYjKehWn4iHqhD77OVt/1xNyi3pDrKIsJfQiu+zAjkl2RQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788529367;
	bh=pAY+6O0FP7CnRXrenGk86mNhJ2QGCOH6EFyA2KBRa7I=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Hg3gMxK8cf7fwzhEkZIfSq8S63rip7Ste2W3outEbf2e/1aNoF4RRNdo5hOUzCPbm
	 HBLLOCHuQWfOSJi9kyqxNTgZBEyetSLHo+CUDQkvkUGC5rOyBjQ+tY71l2GXyc/gs2
	 Zo4ITXeqW0KMLATspnGnsUdpSOoMjqZIwoLAMrJQtoXbgzgRiMzzD9yBiZQt0pmsgr
	 sD65fNI9yQVke7KL0meoaKCwjpphXbA+znLgNQnxbUg+6EUOVxS1trjec24rWPyDox
	 2f64w3oJ1zwdYvjtmGkDGzoCpp6O1LKC9ip+/fB78Is8fwmYI4JBi8pW5gaaqYJu88
	 1LprndQS+v+GQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2260E40BBF;
	Fri,  4 Sep 2026 13:42:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6694410E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 13:42:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 580C181197
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 13:42:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AI6NUpqb7hoP for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 13:42:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 28ECA81198
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788529364;
 b=eMsfd719wlxwcMz7lB3JWsdwOJ3+if/2DEoGwgMpb+1xbEqj2RDAbLSFiy53MXwhkMQ5
 fDkBz2ND27aFKKWscAumQ+K8hEHDaGu8b5OCkuJ+Vq+8xIfO14zna9YLadi8H3RDJ4Asf
 VEg0W1Sft6ymiAxtdmElgxKuvAZeXQytNUfqTW7H9rLoWlcXEcrTq3cPkgFAscwukJmys
 YiKxuYKFfrhZ0u1bWgF1m4VOnjKyMAuMmaB88+laB/W082eaTU6l6T8KEoGUX4YjOchpn
 alZZUi/Gh3V/s8nOFa4iUws64PwZILjgvp5NtsXdlo4rxvuEBEhKsMiA5ynOMggV9EA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788529364;
 h=Received-SPF:DKIM-Signature:Received:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
 bh=bBWuupZzugFH4kCzBYlhtTXm5RMQxe8AgO7n4Xr78vs=;
 b=oLDnwMsC47YLbakPJTM2hwaCmq8eff0nH6hGhRmqJSeVY0TjU3PfLIYnU6H5ZNBHWPKp
 KJ1M7qzLmK+zKvcQKHO84SsV0rauUS8WfWgsLLXKqjBf4kPUZR+sPih2vUk8XWFzMSz+B
 xfEBAQptPQys3eyFM1IRExB2wmZqQDp3mqlkoI8bKyvC+DGi2Dxb3BmZRL0SiTFuUGNR/
 lHHe4RIJAiPFKoJs6kkQoAm8jWxLvTYcynJzs78tXPLKu4QqdZk2KorEp5jrzbtA7IVgj
 wwxgaQIOQ3zN+L+GKVizc6yfeGR38d80ZIYhMHI4Pju8TxldlW3zjhsBmNXqf4tecoQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=163.com; 
 dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=ViJB4jl6; 
 arc=none smtp.remote-ip=117.135.210.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=117.135.210.5;
 helo=m16.mail.163.com; envelope-from=tianyuanhao3@163.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=ViJB4jl6
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 28ECA81198
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 13:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=bB
 WuupZzugFH4kCzBYlhtTXm5RMQxe8AgO7n4Xr78vs=; b=ViJB4jl6Zy6u3ZaYQ0
 XGmrhs/mKf2ojzlPcZXHz08jBRM/hScHsusjwUj4P6xRfMwKpy34TrzEG8yDyfF6
 BcfiwWF7qiBirU6fWXb3Shlh8Oz8kqXWCprdlbkla3gGeLWYSB4zTGv/016/VH/c
 f++Fpi8p9fOM6R/1sz5Bd0IXk=
Received: from ubuntu.localdomain (unknown [])
 by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id
 _____wBXjArKyppq+kW9Ag--.36383S2; 
 Fri, 04 Sep 2026 21:42:35 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: buildroot@buildroot.org
Cc: TIAN Yuanhao <tianyuanhao3@163.com>, Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Scott Fan <fancp2007@gmail.com>, "Yann E. MORIN" <yann.morin@orange.com>
Date: Fri,  4 Sep 2026 06:42:08 -0700
Message-ID: <20260904134208.4707-1-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-CM-TRANSID: _____wBXjArKyppq+kW9Ag--.36383S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFWDAr45Gw13Ar1UuF45ZFb_yoW8Gw15pr
 4Ykw18KFW8Kr1UGr1UZ3W29343Wa98Zrs5Awnayw4jv3W5JFykJFWftFZ0vrs7JrsrCw15
 JF1Iqr45uanFvaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRLYFAUUUUU=
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/xtbC-Qsms2qaystCpQAA31
Subject: [Buildroot] [PATCH 1/1] package/chrony: switch chrony.service to
 Type=notify
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

Since 4.7, chronyd implements the systemd notify protocol natively
(upstream commit cb11184, "main: add support for systemd
notification"): it sends READY=1 to $NOTIFY_SOCKET once fully
initialised and ready to accept commands.

Type=simple cannot observe that signal. systemd marks the unit active
as soon as the process starts, before chronyd is ready, and gpsd may
follow immediately: its drop-in br-chrony.conf orders it only with
After=chrony.service.

Switch to Type=notify so the ordering holds. chronyd's -n mode
(don't detach) suits Type=notify, and no libsystemd dependency
is added.

Cc: Bernd Kuhls <bernd@kuhls.net>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: Scott Fan <fancp2007@gmail.com>
Cc: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
---
 package/chrony/chrony.service | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/chrony/chrony.service b/package/chrony/chrony.service
index 210122cf5d..2d619dd6da 100644
--- a/package/chrony/chrony.service
+++ b/package/chrony/chrony.service
@@ -8,6 +8,7 @@ Conflicts=systemd-timesyncd.service
 # correct time to work, but we likely won't acquire that without NTP. Let's
 # break this chicken-and-egg cycle here.
 Environment=SYSTEMD_NSS_RESOLVE_VALIDATE=0
+Type=notify
 ExecStart=/usr/sbin/chronyd -n
 Restart=always
 
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
