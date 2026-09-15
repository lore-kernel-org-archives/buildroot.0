Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B7B2C88E75
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 09:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E8834057E;
	Tue, 15 Sep 2026 09:57:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zvi3dHn8kMys; Tue, 15 Sep 2026 09:57:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 21E3F4055B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789466221;
	b=ba/HEi85CxO+OMtZRoANDg66Z9QtJcWrQ/UTrdpMcti/LcJ7KDSjTRmOLpk/9wo8G7nh
	 YFY7oPzR/Ps2advar2lpB1O6prPWCgRCBnhcx2Lrzu6yBQIeKHgtPXQg5l2wF6rs0K6Zi
	 jfW0cT+sTNtJoW9ALWmnLdvhenvFAKIbHouB4JJEI20affoi371G6gaiqVfBPMvKm5r0S
	 HdxqE+IKEx3SsR2HqBjDFo9qHBECkcZGRsuVim0dqR6RdLNcGtimtrWRNInMGpiJ1ySjW
	 p5QBGZz4fySNhOglc2SDOm5etjmaPQBTZ5izJGWiIbpugYzGpNTFpI7m8KxtQ8l3sBw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789466221;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=lzdMmjkr+C/OQBLr2ZpLwHyqyczc7GSOFwTVjgwTxgc=;
	b=KE94L91+ylZqk4hJPZGYigkgus6KoIo1Oig7/DsSDQxC9xJbEv5V9eLc65NPSDURD6HJ
	 mUsxHv4MCLnm8Y3DlFbIuFFhE2qo71uB5ZmXB8v1QT3xV/aP2pN2mbmg6SYL18iTOwNX0
	 IdgE2+AVGJVcc+ZM0/oONUfR9fAZveM2+SXibdmgsIr8J3Dpvcjc4ogcl85u8DcdBTSKQ
	 sLNxf96Q2uCYSsXro/n3zbmU1oz9GVVtrF/hsy7t4QROsvuMYHBq11RGmfLavQcitUVW9
	 mLkxrRSZlknRTxQquYpd1G0lFOYNjE3NhTj5OR/AG10pPkZ2k3GT1A9xKc+CamWyiUA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789466221;
	bh=lzdMmjkr+C/OQBLr2ZpLwHyqyczc7GSOFwTVjgwTxgc=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=hBXhlsIZ0zVIuDZDEtL8suBmlIzVBnWtZuFOyKTiPVR3BdJnufqPB210sUWqv9H/s
	 stNp/TVzjolRjb6voi/62DwOKto2Ly75WyaxpW+PdnpmqbGZp7M3isNufOhmKZah7k
	 5jto3icuycmwOPS6NrER+kdn0jBW3h20HX3l8tJK3xeSCCqZKzW3AamF3lWITMxH1R
	 AEnibLgsSj/sYkZnJAtX2IEy3bVmNdyk6r+sWC4n/Hv8GBQAh227wU87U4iuImtSUU
	 mEjYVHkTpo3Nb4ZQzDITwOScH+HmHLt9dXXZzUcvPl0MI0g4/gViZNew51ongpF/Wn
	 8v2IIltx4Hhlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21E3F4055B;
	Tue, 15 Sep 2026 09:57:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C4A9EB
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 09:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E5224055B
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 09:56:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9S1NY0EBckf2 for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 09:56:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DB8C740544
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789466218;
 b=RX+Y3jT4geiQifKOnpt2YBigJiLmpxaHdFezOxw+GO4HgZDKBH8TxQsM8D/Dtt1fn9uD
 /1iQgshe/sDFJHy+1yXxhsx+T1MmOfssnr/Bxe48HI13tG/kFL11IDGxIZyGo5HgvjLCh
 evNi6QyRA9As81rUp0oyEpcMP/SzuDFgXldgnv+CIRdNHrCFydSqUxuIwoagMcM3LOT6u
 Iaqu0GdjxXg2LGK44txapAbbomBkbO78oUGuSDQME/PF9Lq9zJuyy6g+avNW6CqPibVns
 nuvNiQAAsUxArSSiZHYJwTm7yNTnBNCRR0lPkRxTuO/psFI41Q8QxaYmSCtFslewoTw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789466218;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=iK1SSqnvMFz3IGRQLyGN1cQl+rORCZPdQ1G5kayd1vM=;
 b=ta+eV/1XnTN4snzE5v6FzNqNX3DXCthH6pVE3/IIeGymvcjEnMPJ/mIVTykMbkGsPyKH
 KjaANrhOACcaUMkLBenxPUd0KUSdOZdDxC7ZcVlp8ugP7J1ifp6CFzJiliEZin3fpT3lt
 mT3l9zDrVydQCqPZKar0MTrP/Jv1OCi/k0jnyt+LGtduV0MSv+eMT2F1FtJYUXHNSMJxi
 ZpOf+PfE3lGBPQHYFEHLM77vtHVT/RFmebQ8n8Yf6jVyftx9LJaPy/6KuEDOYKWDmOX0q
 xIcuAEU//f2ODBP8oH9OLBra9QPWYahLeqbSDHsdsTabWwUODKohTCE/SghtUJ/QlTw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=eL2vCmY9; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:30::10; helo=mail-wr2-x10.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr2-x10.google.com (mail-wr2-x10.google.com
 [IPv6:2a00:1450:4864:30::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DB8C740544
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 09:56:56 +0000 (UTC)
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-482f633cd78so1514082f8f.1
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 02:56:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789466215; x=1790071015;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=iK1SSqnvMFz3IGRQLyGN1cQl+rORCZPdQ1G5kayd1vM=;
 b=u7C7njiS+ivI9ngfxQIPj20X3rPuEcyJYgoVuONN/l263MVHRMeZOJSaAKIST+9BQi
 dpg70bHoOCWO+5DSzNUeiYz43dukbyOeMWen//jRsRhV54JX0VGTP2YxtGWnk03w8gJK
 mmDEIA9X4TxVcupVqqEkXhHm9fYdwBQVw2AfFHIbOBvim/UQYY3WVamR1NhnAH5HVubz
 n2G7yTrxAOoZWF12EXQOzXP1XqOmz0rCprlby/PSb8ErocYGUKAhfGOAbmDi6HxUiESV
 V/L9TySZ/IO2f34yQJE+0XUZdgYMixF+X5jMhme83JnYyNWkUGhjX59k0eNayTf4qj/Y
 hzJg==
X-Gm-Message-State: AFuF++lDy/0fIryqxbER214l9vPT8OYUhNqEppr44GEZGiYqAX8I0DhA
 /EKd2uPhuVAGunFCv5bvPE1uz0dcfI7Bl0hyV+V/QeMdTNW4HrYTq4KXCGFIjjvsi6VDEu36jew
 /qL9C
X-Gm-Gg: AYBFou2131o1Z3F9r+8/fmojCFhZI5HUB5g+gOiNn/q5kCLxMdh48ZgKcLHHuXhnbo/
 WXJS5ei0Ds56db3XAsqhLXSs5+YgxBymHgH3M37dRdXdyUaZqZ8GQLuzen/3KaE6X/7qopHOrbo
 MCn199xFkiMTQcY/kmV3+j3rZAkFZ3kTAUriVVwgauyTx3GUFU8EiKF4Ldy1CxLrn8Vx7GdDZCO
 1JbbFcDV6o3oN8rwFCJsD8NoQK5AjYvOS6JWRG/3aY0sQ5okWnt0sYfB2kX+rjYpLf+WJ8O12Bp
 Ji6hBpIkirm4HW6vu2TNtLBMEWR9VI7YFkT6h/HjKjUgH2gHW6+HHIDR/PRJ4JK54k8puEnXr+C
 0S7rIHbRQhmQEDz6uG3hN2o2tDMxDVjlhQayGWb9FIL7FeW/XQahVnX29ypCmEas2eJ/Xfviyf2
 WuszP0i20GEIuIdI731bo2vKmZ3GPfKxUYSq+GRwoDuv/lf+ja8D7TNkPve7RmfAzNxxPFckzth
 pc=
X-Received: by 2002:a05:6000:25f4:b0:486:f9ea:796f with SMTP id
 ffacd0b85a97d-48702b5b1efmr8251305f8f.41.1789466214722; 
 Tue, 15 Sep 2026 02:56:54 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-486eb2ecfc3sm31841411f8f.4.2026.09.15.02.56.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2026 02:56:54 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Alexey Lukyanchuk <skif@skif-web.ru>
Date: Tue, 15 Sep 2026 11:56:51 +0200
Message-ID: <20260915095653.279455-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/zabbix: update SITE
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

Zabbix version 7.2 is no longer maintained. The version 7.0 is the LTS
and the stable moved to 7.4 [1]. The source location moved from "stable"
to "oldstable" directory.

This error is present in the autobuilder since the 22nd of May.

[1] https://endoflife.date/zabbix

Fixes: https://autobuild.buildroot.org/results/636/636c4514c67f1b0fcd20976d064f17b0e0a314fe//
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/zabbix/zabbix.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zabbix/zabbix.mk b/package/zabbix/zabbix.mk
index caa69fda38..50bdfed609 100644
--- a/package/zabbix/zabbix.mk
+++ b/package/zabbix/zabbix.mk
@@ -6,7 +6,7 @@
 
 ZABBIX_VERSION_MAJOR = 7.2
 ZABBIX_VERSION = $(ZABBIX_VERSION_MAJOR).13
-ZABBIX_SITE = https://cdn.zabbix.com/zabbix/sources/stable/$(ZABBIX_VERSION_MAJOR)
+ZABBIX_SITE = https://cdn.zabbix.com/zabbix/sources/oldstable/$(ZABBIX_VERSION_MAJOR)
 ZABBIX_SELINUX_MODULES = zabbix
 ZABBIX_LICENSE = AGPL-3.0
 ZABBIX_LICENSE_FILES = COPYING
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
