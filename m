Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93EC4D41C02
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 08:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 672DB40B93;
	Thu, 11 Dec 2025 08:27:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QNSq2g4j1COC; Thu, 11 Dec 2025 08:27:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A024740BE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765441647;
	bh=VP9Zkp5yAW1mWZGrPub8+PK3V54K/bwvMkSrMuHoqfU=;
	h=Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JrDWGHEMlM5r2Vae9xk3mQOgTo34j9lffrepnIyjW2JGm2e1YlSVhI9owITyX1MZt
	 ablS9h2RGh2C4AkSJ8n4LTzkTWmtT4PiHkejr1G/tttvd7fzv7nuHFVNtUVat+MUpj
	 Jsj9L1rxCnaax2w1rUQaTIB3/BObHou+kIYcXbemr/PcGx+x543p/cTvUS0OVFO+u9
	 FTUE6dSQof0NJ7YxhALhGDN8c3F7h1bxoRAdAazlOGeKjVrztTp7ypQGsa8aYmLnJ5
	 bm+pHKOmZUkK2ZrcfTraQiXC2l+lISuueesAsbENi+yLE+ORLintU6cF5xQ9b3sRMF
	 K0r9KblO+jgOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A024740BE5;
	Thu, 11 Dec 2025 08:27:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 234592C6;
 Thu, 11 Dec 2025 08:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14E6C40448;
 Thu, 11 Dec 2025 08:27:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2I6b02cKYAJQ; Thu, 11 Dec 2025 08:27:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C58DB4005B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C58DB4005B
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C58DB4005B;
 Thu, 11 Dec 2025 08:27:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 866FBB97A06B; Thu, 11 Dec 2025 09:27:22 +0100 (CET)
Message-ID: <31aa9f3b-d429-46c6-8bd5-1a153f5e86f6@rnout.be>
Date: Thu, 11 Dec 2025 09:27:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB, fr-BE
To: Buildroot Mailing List <buildroot@buildroot.org>,
 ML_BuildrootUsers <buildroot-users@buildroot.org>,
 buildroot-lts-sponsors@buildroot.org
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1765441642; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language;
 bh=bG1k4zDjkAh4Qg3IKUDpxMG0OU0N8iKt9xt7wAr8egk=;
 b=Fg58v547CH1nyWuPq4TWg63bWIEdmmSaWoLxZoVvvTnWmfQudzZEsWtKsMkQD+0PdsGOy9
 fVtdpnNCZw4L9oCSCBVJjfg+9f7BMhYmfnDBwbTG63hPfsN2ptXB7jlygjrGdePdgyD+Hu
 pEcr33dOwM8dB4L4T6zz5YfIgcqD7xj9tGwLXiqcoao6KrlsHRxRs58RyquQ3ES6kuY8X1
 c/RPdfD7p+T/AitD8cojDIHEH8yfu6xuPYgP1a4vxo1l+HQ/ZVssjHEITAN4356HIWze7x
 7cY1+BvfJYyGfX+MBBGF8z0zzdwhbbw9lzfh9d8PSL6wHhV76gAHQzZYb2qmuQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=Fg58v547
Subject: [Buildroot] Buildroot 2025.08.3 released!
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(https://buildroot.org).

Buildroot 2025.08.3 is released - Go download it at:

https://buildroot.org/downloads/buildroot-2025.08.3.tar.gz

or

https://buildroot.org/downloads/buildroot-2025.08.3.tar.xz

Or get it from Git:

https://gitlab.com/buildroot.org/buildroot.git (2025.08.3 tag)

Buildroot 2025.08.3 is a bugfix release, fixing a number of important /
security related issues discovered since the 2025.08.2 release.


Important / security related fixes:

- asterisk: CVE-2025-1131, CVE-2025-57767, CVE-2025-49832,
             CVE-2025-47780, CVE-2025-47779
- gnutls: CVE-2025-9820
- libpng: CVE-2025-64505, CVE-2025-64506, CVE-2025-64720, CVE-2025-65018
- luksmeta: CVE-2025-11568
- mariadb: CVE-2025-30693, CVE-2025-30722, CVE-2023-52969,
            CVE-2023-52970, CVE-2023-52971
- openvpn: CVE-2025-13086
- postgresql: CVE-2025-12817, CVE-2025-12818
- python-django: CVE-2025-64458, CVE-2025-64459
- python-startlette: GHSA-7f5h-v6xp-fcq8

Infrastructure updates/fixes:

- New script support/scripts/cve-check to enricht CycloneDX SBoM with
   CVE information from NVD database.

Updated / fixed packages: 18xx-ti-utils, asterisk, enscript, gnutls,
libpng, libroxml, libteam, linux-headers, luksmeta, mariadb, nbd, neard,
nss-pam-ldapd, open-plc-utils, openjdk, openjdk-bin, openvpn, oprofile,
pdmenu, perl-net-ssleay, postgresql, python-django, python-starlette,
redis, sane-bacends, sbc, sdbusplus, sdl, swipl, tailscale, thermald,
tmux, tor

Removed packages: bctoolbox, belle-sip, belr, linphone, mediastreamer,
mongrel2, ortp


For more details, see the CHANGES file:

https://gitlab.com/buildroot.org/buildroot/-/blob/2025.08.3/CHANGES

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -s -n 2025.08.2..

     26  Bernd Kuhls
      7  Thomas Petazzoni
      4  Peter Korsgaard
      4  Thomas Perale
      2  Arnout Vandecappelle
      2  Giulio Benetti
      2  James Hilliard
      2  Julien Olivain
      2  Marcus Hoffmann
      2  Titouan Christophe
      1  Scott Fan
      1  Thomas Devoogdt
      1  Yi Zheng
      1  Zoltan Gyarmati

Regards,
Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
