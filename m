Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C155FF512E
	for <buildroot@archiver.kernel.org>; Tue,  7 Apr 2026 17:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1617660642;
	Tue,  7 Apr 2026 17:37:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pCKfjobIAEN2; Tue,  7 Apr 2026 17:37:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29A7060DC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775583440;
	bh=cv/gjHzEvKhu22ukIGu5+MSxJ/uC0KOBXe8RrX6eVbg=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=bB2e+ftFYyKvutHfq4hKA1sVxweOe9kEVzmy7mQZfCZg/PQ3GmPHOfyyINkf2/yd7
	 UnvsGqk7pFV5DinIOt3M6enc4nIpUWxi0ktlRdTTFWyuRmaMetVeKCHxeo1kN8jn9O
	 T/CJUKKd8lDBLTXo2e7SezXfbWddm38IG6kLD8s7x9tfUGcK220zzVNiEFtUcQMq+Q
	 XYWS/IoAcWkWOwpPCm3pK8a4YqXDTZxgQxPOHES8bkA9CEMhRhsQmHyrigqE7G6Ahp
	 KfvjCKtRFXoxLkLojocbvojWoM24cZNrMcGtlptEa1K2aL3ccTw3+/tHgs8NH327sD
	 pZy42wcKV8RPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29A7060DC6;
	Tue,  7 Apr 2026 17:37:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AF6E237
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 17:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 502FE60DC7
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 17:37:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j12pwdavk4Fd for <buildroot@buildroot.org>;
 Tue,  7 Apr 2026 17:37:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:1600:4:17::bc0a;
 helo=smtp-bc0a.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EAA4860642
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAA4860642
Received: from smtp-bc0a.mail.infomaniak.ch (smtp-bc0a.mail.infomaniak.ch
 [IPv6:2001:1600:4:17::bc0a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EAA4860642
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 17:37:16 +0000 (UTC)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown
 [IPv6:2001:1600:4:17::246c])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fqtgG2VB8zBYm;
 Tue,  7 Apr 2026 19:37:14 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4fqtgF4bRtzyCC; Tue,  7 Apr 2026 19:37:13 +0200 (CEST)
Date: Tue, 07 Apr 2026 19:37:06 +0200
Message-Id: <20260407-generate-cyclonedx-br-v1-0-03c45ccba2ed@cherry.de>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCQAxG4auUrA1Mg7bgVcRFJ/NbIzKVTJVK6
 d0ddfkt3lupwA2Fjs1KjpcVm3JFu2tIr0MewZaqSYJ0YR96HpHhwwzWt96njLRwdJYoSQ5dG3p
 Rqu3DcbHl9z2d/y7PeIPO3xlt2wfHQQWYeQAAAA==
X-Change-ID: 20260407-generate-cyclonedx-br-2b2d2561072c
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>, Martin Bark <martin@barkynet.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=0leil.net; s=20231125; t=1775583434;
 bh=WyieeFrIbOPdk6bZwmPVtQOKaM8TEqH31WKsYgl/6x8=;
 h=From:Subject:Date:To:Cc:From;
 b=ksE6pY/iPiz8uRYzkh4c4iw8PuhLEh4k39olobBExQoHTD5tYlpVEP7YtqJWhcovu
 vte8tgO6YFjq3CzKsnfKNel6UnjqhaXdEzDmT+KO9aqiSHBLakNFqRdvKS7ZP0w4wQ
 jNFAbRbdsIxKXfc/Pz8Ch/if0NFQqMih5yfmBni9IDgrzwqhBYj9A4d2Lc12y3ne7i
 jVOgIaa71jsxWSHmoU3XjfmunRF6U+1Tq+jFLFSjfbKlmhzPqRcu0SoIDUNg+iJEgU
 yYEmn3DQpLhQTt6HFty2WQUBnKDb0FVnUI4S2Bl50otPflp/nNT50yF/bTAhRD2ab/
 qYPAHo8f1IYwA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=0leil.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256
 header.s=20231125 header.b=ksE6pY/i
Subject: [Buildroot] [PATCH 0/4] make utils/generate-cyclonedx runnable with
 Buildroot host packages
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
From: Quentin Schulz via buildroot <buildroot@buildroot.org>
Reply-To: Quentin Schulz <foss+buildroot@0leil.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It may be beneficial to be able to run the script from Buildroot host
packages to avoid external dependencies. I for example build Buildroot
within some ancient container where I don't have a recent-enough Python
to run generate-cyclonedx with. I already build host Python as part of
my build, so it seems like a good opportunity to reuse it for running
generate-cyclonedx with it instead of going for a separate container
just for running that script.

This however required a few changes. First, I needed to enable
BR2_PACKAGE_HOST_PYTHON3_BZIP2 otherwise importing the bz2 module would
fail.
However after looking at the code deeper, there isn't a way right now
for this script to actually receive a compressed patch to parse,
therefore instead of requiring that option to be selected, the
compression "support" is removed from the script entirely.

Then, I got hit by Python telling me it does not know what HTTPS is. The
issue was that the ssl (well, technically _ssl) module wasn't built
unless BR2_PACKAGE_HOST_PYTHON3_SSL is enabled and without that, no
HTTPS support.

Going further, Python would then complain that it cannot verify the
certificates. The answer was to build a host variant of ca-certificates
for host Python to use. Another option is to go for host-python-certifi
instead, with the following diff:

  diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
  index fad0671166..461743692e 100755
  --- a/utils/generate-cyclonedx
  +++ b/utils/generate-cyclonedx
  @@ -51,7 +51,13 @@ if not SPDX_SCHEMA_PATH.exists():
       # Download the CycloneDX SPDX schema JSON, and cache it locally
       cyclonedxpath.mkdir(parents=True, exist_ok=True)
       try:
  -        urllib.request.urlretrieve(SPDX_SCHEMA_URL, SPDX_SCHEMA_PATH)
  +        import ssl
  +        import certifi
  +
  +        context = ssl.create_default_context(cafile=certifi.where())
  +        with urllib.request.urlopen(SPDX_SCHEMA_URL, context=context) as response, \
  +                open(SPDX_SCHEMA_PATH, "wb") as f:
  +            f.write(response.read())
       except urllib.error.URLError as e:
           if "CERTIFICATE_VERIFY_FAILED" in str(e.reason):
               raise Exception("Couldn't verify certificate. Try enabling BR2_PACKAGE_HOST_CA_CERTIFICATES.")

The downside is that users running this script externally from Buildroot
will need to install certifi Python module to run the script. I guess
we could run urlretrieve first and if it fails, then fallback to
certifi. What do you think?

So, this adds a couple of messages hinting at the user what may be
missing for generate-cyclonedx to run. Note that
BR2_PACKAGE_HOST_PYTHON3_SSL and BR2_PACKAGE_HOST_CA_CERTIFICATES are
optional, they only are needed if the SPDX schema isn't available yet.
One can also decide to download it externally with wget/curl in the
appropriate location and avoid having to build host ca-certificates
and/or host Python with ssl support (it does bring host-libopenssl
after all!).

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Quentin Schulz (4):
      utils/generate-cyclonedx: remove "support" for bz2 and gzip compressed patches
      utils/generate-cyclonedx: better error message when host Python is built without ssl
      package/ca-certificates: enable host package variant
      utils/generate-cyclonedx: hint at missing Buildroot host package on a specific error

 package/Config.in.host                     |  1 +
 package/ca-certificates/Config.in.host     | 12 ++++++++++++
 package/ca-certificates/ca-certificates.mk | 30 ++++++++++++++++++++++++++++++
 utils/generate-cyclonedx                   | 29 +++++++++++++++--------------
 4 files changed, 58 insertions(+), 14 deletions(-)
---
base-commit: ac4c32f6f839d1b813125e64f0e23a98922ac602
change-id: 20260407-generate-cyclonedx-br-2b2d2561072c

Best regards,
--  
Quentin Schulz <quentin.schulz@cherry.de>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
