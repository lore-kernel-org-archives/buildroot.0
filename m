Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F7B9C79F85
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 12:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37BFD6062C;
	Sun,  6 Sep 2026 12:53:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h6YFfPhF6JmF; Sun,  6 Sep 2026 12:53:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 47AB460609
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788699189;
	b=QT+iusgqUZM2BpkkmKcQWiCruF1laVOlWa6ye66CvvsiKbwhWDOYvbe4TvftoUkhnGfw
	 H5Y2waodoDrYuRobhR3zNLmeLmB6B97bfcKb5LC8db1PT3mg4OMXP4nQnJPMJfccdUjho
	 mVvax3b30lvF85cNcExztlqV8FN7qtZunqoCJRHsqJQWBStO/dvXxTpmP0jaJjxR7jBOX
	 z7vb16F8VzaOa0aPtOh/TOuaR1vJKirqU/iEc/DtmQ8deLYjJ1P43Rbw7GAof/JeP9xDg
	 Y+C5h7VvYBCqu48gBrCIVf9bPnkkX6w7lmBf6Wg0oZey24+iS2FfnwPdSs2Sh1Zw6tg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788699189;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Date:From:To:X-Priority:X-Mailer:In-Reply-To:
	 References:X-NTES-SC:MIME-Version:Message-ID:X-Coremail-Locale:
	 X-CM-TRANSID:X-CM-SenderInfo:X-Coremail-Antispam:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=65scUHs85h3K9uQIS72iM+Odqk975AtTj8Iw43jHJjg=;
	b=MBC/5OdYF1pf9sipjWzUPvXjtkeQpl9UUACTbpBy2EGcrxaPa+3e1THFvLNd61Xa+h7P
	 sQfugX47XT0MlvG1jopKM2AS3xJMOWA8J3qAuU2eYnFGdcEnWGovRtAmt8IeB3aEPBPTB
	 1RHHlpr2d9TlKVn0Aol5Jw5MQ8DURfptA6ehlJS/rWwCCCCoonakDEG5BrZ04dfRo9zE6
	 83EK2+yekaGrFRTajEMiSsLh+9GIWz4LbZfjSLtr2KP5L8cwv2i8+SSohTkAx1nzowUPm
	 DHjUNK6vXhd9XIpzcU/6rG96GmbywqztuULr4L//cePjZnExY2OWpGYynx3xONntc/Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788699189;
	bh=65scUHs85h3K9uQIS72iM+Odqk975AtTj8Iw43jHJjg=;
	h=Date:From:To:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZHqDgvihdeAq6dGQ/DKcZOtVFjVqVEWweWE4H+q445q+hvs9IiOsEUXH/go1KaWEp
	 +I+IvAmSIaZUTt8pD+xVlPIbNhzk8gxWaAHYOIzo+qFg5enPFkvjDKnJ/NMx5yKoT2
	 vMpF9+rTbL3cf9z8cD8HeNnglgFpk41SplhcREV7If7AIy9JFCQG9QbIQmNEdgLtRO
	 oAbw9BCPJ5ZQcxPBKlv1L/zLhgIzOsG2PH3ZUmkOgFeUvwfrO393DAueIG0trZbQef
	 ifLJ1e3GK8thSMp+pUu6VPvEIp588XP2IoYPvB52sDkPYJ+0wpLCXq3MV5srEnwzWg
	 E/PmMBmt2cKaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47AB460609;
	Sun,  6 Sep 2026 12:53:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 23B112C7
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 12:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15AF4405EF
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 12:53:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oP_MiNLVtKdS for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 12:53:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3DB70405E7
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788699184;
 b=WnsmcaPfVmevmnBZSjLcLD5+rW9lSneW3Tp6PkgSE2zbYPptYNpDX0o7s9GbNlv13GNP
 F83MDP0nCeJf4VsldlYBqQLc1NGI9snUQVc5fxroc9Kcnse4grsP0i+tX07Og+/pWEa7A
 VBKSqut7RSaRE5APbqppN+hmT78w0cisX15XOuVIZVBHEjkJcDKY3hjFgIUIRo3inpqcy
 8lubhca1jmm48avV4l4Pyksd2VpFq/ZhLeuhDvIEuF1uvWWplglfsVeGz31tYHMIbEmZ2
 gzDlII+Qs0Iu9ouOk1BsXgvfW78od57N6VNdLbz4rf/DWnd6d1hV1mrOoQ793taEt6w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788699184;
 h=Received-SPF:DKIM-Signature:Date:From:To:Subject:X-Priority:X-Mailer:
 In-Reply-To:References:X-NTES-SC:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:X-Coremail-Locale:X-CM-TRANSID:
 X-CM-SenderInfo:X-Coremail-Antispam;
 bh=6Qf7SmjQ4vMpWPn1YyXTLkrBcJ7R+oLTiC7qsCLSuZw=;
 b=AgL6d78pimv7PYuUBsHeDpARtkeQ7qG+tPGyqhJMLknUaqKVZQf1pkgly0VO2h+APKnd
 v2MVbtBgSOI0q0pw0UiCvoa4ENOZdiWiRLzgGvQ6+IFedcvj6cNGSzAz8qy8U+x+TkEmE
 axPOMclwemdcnoQ4dPpcS7vyGYmTzgblBh6Cd7kHyqd3yOyhbqLr/OT7In87sVYFBj8I0
 rNwzCWo0aVk0Dh7Brin9qI3XR3n9x4n+kJQscrpHpxeU4F9Ft2h5AEeX+nWYkjzJEC8QQ
 0TsdgZcANmELZVB7ljF7UQSbjQeawSK31iqVxBBETEL9DeMQiqKVjM1GTXdAZDSEp7Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=163.com; 
 dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=V6ivrzsy; 
 arc=none smtp.remote-ip=220.197.31.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=220.197.31.5;
 helo=m16.mail.163.com; envelope-from=tianyuanhao3@163.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=V6ivrzsy
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3DB70405E7
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 12:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=6Qf7SmjQ4vMpWPn1YyXTLkrBcJ7R+oLTiC7qsCLSuZw=; b=V
 6ivrzsyrYdcE0jaN1vnkPTHCpvGa0FZsCHBuyueOb/O0aVzRrpI9UmZDUcL7zCso
 QKFz3v0fTnooPBQ8lrhEiO/35y3PY13FSOfo9EFNGdv84jm8+M4yJZSD3oWuwxqo
 k0BF24liBpkhJbUu51hTOVucri4BQF09ul2K8Nr3vU=
Date: Sun, 6 Sep 2026 20:52:49 +0800 (CST)
From: "TIAN Yuanhao" <tianyuanhao3@163.com>
To: buildroot@buildroot.org
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20260906113037.4454-1-tianyuanhao3@163.com>
References: <20260904134128.4656-1-tianyuanhao3@163.com>
 <20260906113037.4454-1-tianyuanhao3@163.com>
X-NTES-SC: AL_Qu2TCvqStkkt7yKaZOkdmE8Rge05W8a0vf4k1YdUc+wGgSfT4xwQZEJOEFvM4cemJDiPsxOLThRo+uhwQ6Zhe3gZJXz6xFUO74mXcKMLmw==
MIME-Version: 1.0
Message-ID: <609f5255.22f5.1a076c751cc.Coremail.tianyuanhao3@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: kCgvCgD3P7QiYp1q03VAAA--.19144W
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/xtbC4gKiMGqdYiKNowAA3r
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
Subject: Re: [Buildroot] [PATCH 1/1] package/chrony: add 50-chrony.list for
 systemd-timedated
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

It's really weird that I can't find this patch on patchwork.buildroot.org.















At 2026-09-06 19:30:37, "TIAN Yuanhao" <tianyuanhao3@163.com> wrote:
>systemd-timedated discovers NTP services from ntp-units.d/*.list.
>Buildroot's chrony package never installs one: on a systemd image
>without timesyncd, 'timedatectl status' reports
>
>    NTP service: n/a
>
>and 'timedatectl set-ntp on' fails with
>
>    Failed to set ntp: NTP not supported
>
>even though chronyd is running.
>
>Install 50-chrony.list, following the convention set by Debian,
>Fedora and Arch, so timedatectl can manage chrony.
>
>Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>Cc: Peter Korsgaard <peter@korsgaard.com>
>Cc: Scott Fan <fancp2007@gmail.com>
>Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
>---
> package/chrony/50-chrony.list | 1 +
> package/chrony/chrony.mk      | 3 +++
> 2 files changed, 4 insertions(+)
> create mode 100644 package/chrony/50-chrony.list
>
>diff --git a/package/chrony/50-chrony.list b/package/chrony/50-chrony.list
>new file mode 100644
>index 0000000000..6b9cca00bb
>--- /dev/null
>+++ b/package/chrony/50-chrony.list
>@@ -0,0 +1 @@
>+chrony.service
>diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
>index d1745419a2..b2311df667 100644
>--- a/package/chrony/chrony.mk
>+++ b/package/chrony/chrony.mk
>@@ -85,6 +85,9 @@ endef
> define CHRONY_INSTALL_INIT_SYSTEMD
> 	$(INSTALL) -D -m 644 package/chrony/chrony.service \
> 		$(TARGET_DIR)/usr/lib/systemd/system/chrony.service
>+	# advertise chrony.service to systemd-timedated
>+	$(INSTALL) -D -m 644 $(CHRONY_PKGDIR)/50-chrony.list \
>+		$(TARGET_DIR)/usr/lib/systemd/ntp-units.d/50-chrony.list
> endef
> 
> $(eval $(generic-package))
>-- 
>2.54.0
>
>_______________________________________________
>buildroot mailing list
>buildroot@buildroot.org
>https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
