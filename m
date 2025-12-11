Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 920F8D41C02
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 08:27:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33D5340BE5;
	Thu, 11 Dec 2025 08:27:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 39QluoA244J8; Thu, 11 Dec 2025 08:27:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64EDE40BE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765441625;
	bh=4tdJw1su2zPUB1EEXMa5SW5ZTA4TBgSfOUZZVvEAoS8=;
	h=Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Qdo8ckFds0vwa4yAbYuhejK5NxvR2QQJUo78i1/Ay8/PIy4Pd21flDfdtwkwLu4K/
	 sWC7+lI5jXaFmfhyl+OAJHroODqGnUGY6dAKBURDJb/dGPXv4WfX2UQSWuBIrHPSwu
	 JbNoa6iP4u5rwOGrVcLUoXBl2MJ1pBK922lduWp5hvIJuk0FZIxa6cKZtD0D/kv9pZ
	 K9gpKwLnXi1NVnoPPwHGTDCLb//csosR/U9RQG7SxEmqnBKR0etoA8nzuOEtKtVZf2
	 XdPqS2mpWOQXcauKballhcDJmffBScLZdtIhX7fBEfSeolCpw/Fi+X/XOJO/qZwv5/
	 iFoIQwlNmRlRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64EDE40BE9;
	Thu, 11 Dec 2025 08:27:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 31C0F2C1;
 Thu, 11 Dec 2025 08:27:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22A6761531;
 Thu, 11 Dec 2025 08:27:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eQPBci6Nqenz; Thu, 11 Dec 2025 08:27:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AD102608D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD102608D9
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AD102608D9;
 Thu, 11 Dec 2025 08:27:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EF331B97A06B; Thu, 11 Dec 2025 09:26:59 +0100 (CET)
Message-ID: <903acb17-d505-44b1-a4c8-6ee1d1e04853@rnout.be>
Date: Thu, 11 Dec 2025 09:26:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB, fr-BE
To: Buildroot Mailing List <buildroot@buildroot.org>,
 ML_BuildrootUsers <buildroot-users@buildroot.org>,
 buildroot-lts-sponsors@buildroot.org
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1765441620; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language;
 bh=yDfMBMj3PF0a0tR+Q3cUJLahETSTgbOzcaphaZn8Z70=;
 b=RIvIyLq89vvY1qp1zwDIwED43fOgGYYx62VjITVg/DU0Ftt6wyP2DTbI3twv7wg7qmn3ri
 Zt+GmyDUzwa0l21ageuCJaqgN9gRV0Oy16lE6CNtSttsaD47BzoDsFA3FG2wQPdf900mYp
 VuRfEHEybSoXrkr9h6zdb+gdYJh0zkXk/Hc9xymzFsxvvFQxm41BGyx5IMuMm5p64nHZMy
 LULyxBJEYMxKcGAqLzC3vp1YBMqQwOhOCSDXVDyPPKzBvIl6WJX1Nk5INDLoaFeFfvPUW5
 aUvPAQhhJs0fTuvSkkEiKO5cMLaRNKoH0bvqNFhLUZCt3wWAhQRH+g5cCNB14w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=RIvIyLq8
Subject: [Buildroot] Buildroot 2025.02.9 released!
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

Buildroot 2025.02.9 is released - Go download it at:

https://buildroot.org/downloads/buildroot-2025.02.9.tar.gz

or

https://buildroot.org/downloads/buildroot-2025.02.9.tar.xz

Or get it from Git:

https://gitlab.com/buildroot.org/buildroot.git (2025.02.9 tag)

Buildroot 2025.02.9 is a bugfix release, fixing a number of important /
security related issues discovered since the 2025.02.8 release.


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

Updated / fixed packages: 18xx-ti-utils, asterisk, gnutls, libpng,
libroxml, libteam, linux-headers, luksmeta, mariadb, nbd, neard,
openjdk, openjdk-bin, openvpn, oprofile, perl-net-ssleay, postgresql,
python-django, python-starlette, redis, sdbusplus, sdl, swipl,
tailscale, thermald, tmux, tor

Removed packages: bctoolbox, belle-sip, belr, linphone, mediastreamer,
mongrel2, ortp


For more details, see the CHANGES file:

https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.9/CHANGES

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -s -n 2025.02.8..

     19  Bernd Kuhls
      6  Thomas Petazzoni
      4  Thomas Perale
      3  Peter Korsgaard
      2  Arnout Vandecappelle
      2  Giulio Benetti
      2  James Hilliard
      2  Julien Olivain
      2  Marcus Hoffmann
      2  Titouan Christophe
      1  Scott Fan
      1  Thomas Devoogdt
      1  Waldemar Brodkorb
      1  Yi Zheng
      1  Zoltan Gyarmati

Regards,
Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
