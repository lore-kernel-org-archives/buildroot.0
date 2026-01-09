Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B014D1680C
	for <buildroot@archiver.kernel.org>; Fri,  9 Jan 2026 10:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0DE9809EF;
	Fri,  9 Jan 2026 10:50:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fmyTl2iZvo-V; Fri,  9 Jan 2026 10:50:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A944180971
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767955854;
	bh=N54kbZpJ5uuvcQX8NQ1ofggNwktOo+7QWw7HOJIklo4=;
	h=Date:To:From:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OI97f7D7f1HcSTVpoAZo/rKFPvwLggpOyfmdQ4ueA0rP3AwY5pxUPIJ7UhNxK2COb
	 YENyTUl7z9zCoGep6m7J8s1GYeB+eZWAKyhVXoDtkuEmS9OIvAXuVCYnuwzB78UKId
	 mBzC2xHW2WtXRzxZ1UdwO0MS3Sa78OsUS4SzET2kd6J+9LMXmisK5VGZE2SI4apqSx
	 xoYmRngOnEu3mLiGEWpYmOmNStpmd3Bf9BY5A99rW7yq4e4RU1gaOpwwwzPbF6h16g
	 u3EK3VhLSOe/5hF017F1ZRkJTmeqmnNlgSjUwId0+89LMPbfxfOBY/ZyVNotslIr4F
	 V/oV3S64ZGnbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A944180971;
	Fri,  9 Jan 2026 10:50:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 161F012E
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 10:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 088DE402EE
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 10:50:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jUw4S6VQFigU for <buildroot@buildroot.org>;
 Fri,  9 Jan 2026 10:50:52 +0000 (UTC)
X-Greylist: delayed 1084 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 09 Jan 2026 10:50:49 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 63225401EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63225401EA
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2.57.139.104;
 helo=mail4.zenbox.pl; envelope-from=karol@linuxdev.pl; receiver=<UNKNOWN> 
Received: from mail4.zenbox.pl (mail4.zenbox.pl [2.57.139.104])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 63225401EA
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 10:50:49 +0000 (UTC)
Received: from mail4.zenbox.pl (localhost [127.0.0.1])
 by mail4.zenbox.pl (Postfix) with ESMTP id 3A0E525396CD
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 11:32:43 +0100 (CET)
Received: from mail4.zenbox.pl (localhost [127.0.0.1])
 by mail4.zenbox.pl (Postfix) with ESMTP id 1461A255BBFA
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 11:32:43 +0100 (CET)
X-Virus-Scanned: amavisd-new at mail4.zenbox.pl
Received: from mail4.zenbox.pl ([127.0.0.1])
 by mail4.zenbox.pl (mail4.zenbox.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ew1QQ-oVJtrV for <buildroot@buildroot.org>;
 Fri,  9 Jan 2026 11:32:41 +0100 (CET)
Received: from [192.168.0.228] (83-168-79-135.static.ipv4.korbank.pl
 [83.168.79.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail4.zenbox.pl (Postfix) with ESMTPSA id 78DE5252DC2C
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 11:32:38 +0100 (CET)
Message-ID: <a6bd180a-e0a8-4576-9c2c-853442bbe073@linuxdev.pl>
Date: Fri, 9 Jan 2026 11:32:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
From: Karol Przybylski <karol@linuxdev.pl>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=linuxdev.pl; s=x; 
 t=1767954759; bh=Ny8hbvxJxFcUfkezCWhc//9vWpKrEgCIOVyPFHbJ5MM=;
 h=Date:To:From:Subject;
 b=XFKCPhYwlZHPEqfBhTuo7sEAo7VdUa/vNkkw9dmHy7invw8SF7vtgEhXDt1H1OFXL
 aKI6l3zWZ1vx17Sak7gqyrlWDCsV0iC6xHHpWs0iv1g8d64QgyWkfkTsNeItaHx6ad
 AOZljvIbrUWeKKL4b8/pSjgjQxECwytkljg293/xSJDeypfJ0t3U164VXtoJ+I/ipk
 5C31pYZPs4ekyxWGKtaowJwDDmLGGb+JWqymM/iMX92ybN3yTcULe3a6VNBjX6pRmt
 mdfSod24Nkc5cj8Im9+M5GINXbRPNQmgYNuTZiSiufLo0cpoonRyT4zTCfPCQXwIXg
 hz+VVzSe4ceCw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linuxdev.pl
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linuxdev.pl header.i=@linuxdev.pl header.a=rsa-sha256
 header.s=x header.b=XFKCPhYw
X-Mailman-Original-Authentication-Results: mail4.zenbox.pl (amavisd-new);
 dkim=pass (2048-bit key) header.d=linuxdev.pl
Subject: [Buildroot] raspberrypi4_64: U-boot boot failure with
 dtoverlay=miniuart-bt
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When building u-boot for Raspberry Pi 4b I noticed that there is a 
conflict with dt overlays.
Running u-boot without serial interface works, that is after commenting 
out line dtoverlay=miniuart-bt
However, output is then only visible on external HDMI screen, since we 
don't have UART connection anymore.
This problem is not visible on buildroot branch 2024.11.x

Steps to reproduce:
git clone https://gitlab.com/buildroot.org/buildroot.git
cd buildroot
git checkout -b my_root origin/2025.11.x
make raspberrypi4_64_defconfig
./utils/config --file --enable BR2_TARGET_UBOOT
./utils/config --file --set-str BR2_TARGET_UBOOT_BOARD_DEFCONFIG "rpi_4"

After flashing sd card img, copy u-boot.bin to boot partition, replace
kernel=Image
with
kernel=u-boot.bin

With such configuration, the system never boots, u-boot probably fails 
somewhere along the way.

host machine Ubuntu 22.04
version of Buildroot 2025.11.x
target for which the build fails Raspberry Pi 4b
package(s) for which the build fails U-boot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
