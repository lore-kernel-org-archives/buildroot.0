Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA0CCD1292
	for <buildroot@archiver.kernel.org>; Thu,  4 Apr 2024 12:44:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FF5F417F9;
	Thu,  4 Apr 2024 12:44:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QX7i8cMo_uyn; Thu,  4 Apr 2024 12:44:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CEEB8417E6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEEB8417E6;
	Thu,  4 Apr 2024 12:44:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 782381BF990
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 12:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F12E417E3
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 12:44:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mtypchp299Ww for <buildroot@lists.busybox.net>;
 Thu,  4 Apr 2024 12:44:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4EA06417E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EA06417E1
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4EA06417E1
 for <buildroot@buildroot.org>; Thu,  4 Apr 2024 12:44:36 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-516c1fc2128so1147949e87.3
 for <buildroot@buildroot.org>; Thu, 04 Apr 2024 05:44:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712234673; x=1712839473;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eWppsMoYJwT7J3ljCi27Xz8vfYBP96Cd2D2akJxICAQ=;
 b=PpB+KHby7ZekotjD12/iSJMLMroP8PxXrXb911rxar0AG7guyWqg/xIga/jM2yEK6E
 sOdlIMaHWesp0283VqBghXLJ+dSIkyP0cBWKGOiOjbfDMWDDSq88IxH+LzOEn+DNF9e/
 eSi8o2UpjqZsoSL49OH5zKtcUELVMK+hWsSIb8Dt0spb+kg/avxV9CU7ZBy4cWfSZP+I
 yTKM82CFhetNThUWABN1059vdW3cYC8C6nCGIgEqVZrwXQQL+zWPsNhS4tZHw2EGBniG
 /eg3btd+pDpDfrFmYa6PMCz8TAJ+1JgTdX29+/cYSSQohtaYxxwPZzy83JP8W8/ZQ96T
 krqg==
X-Gm-Message-State: AOJu0Yxni7yx2DytmrACMbRO3PisRhaNq83/YllTL0zanqqAh3/85HqF
 MzJyFASIvPsDfwYGuR4ldrniAZdHsiUQIo3jj4rSqgjWs5ZCtko1cnxoR+kfchrRTEqd5uXZbYH
 d
X-Google-Smtp-Source: AGHT+IGyCEJhwH475ZlBNWrFwy1lEXnshYp55XygKmDSGfrbm/vdBGVaYa/Uly9OChEP3ZyDhOKo/Q==
X-Received: by 2002:a05:6512:361a:b0:513:ce4c:93f1 with SMTP id
 f26-20020a056512361a00b00513ce4c93f1mr1988184lfs.33.1712234673591; 
 Thu, 04 Apr 2024 05:44:33 -0700 (PDT)
Received: from localhost.localdomain ([79.132.235.33])
 by smtp.gmail.com with ESMTPSA id
 r5-20020a056000014500b00341dc343e21sm19913663wrx.65.2024.04.04.05.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 05:44:33 -0700 (PDT)
X-Google-Original-From: Thomas Perale <thomas.perale@mind.be>
To: buildroot@buildroot.org
Date: Thu,  4 Apr 2024 14:43:24 +0200
Message-ID: <20240404124329.768546-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1712234673; x=1712839473; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eWppsMoYJwT7J3ljCi27Xz8vfYBP96Cd2D2akJxICAQ=;
 b=Lb7Tca2nbxzABxR+KgUAe4Skzq/asPdHMhjQ2StfghTbBJ4xn92GDWcZmJbd9FR6cr
 SlwIQuZnqfbXEqZGbJaQCMGrxZTFUZAem+KRNDW/t03a6CfVL68m4K9gpc+n/qm79/oj
 u6gUublF49wCxbJXzVkMX72TIIYVug+EzHmrcf8uqinkAmkgKSWvlXIv0YgR6NWQgRdC
 pb+qkJFgP4RopIjmNDvN9hieyGz0M07pCHKTmcZ29/W7UCcyCEA8ffpXcWJ0bGz9v5kf
 gS+HA3roaYt0lK8Nvpblo8Z8m9moCHw9LSGISQ7zKiTTs2JBzFi1NQwCEmjn7I1PG768
 XTyw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=essensium.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=Lb7Tca2n
Subject: [Buildroot] [RFC PATCH 0/5] Support SBOM in CycloneDX format
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Reply-To: Thomas Perale <thomas.perale@essensium.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This RFC patch series propose to add support for the CycloneDX
SBOM format.

There is a growing need to generate SBOM from buildroot
configurations. Right now, there are different solutions available
for buildroot users `show-info`, `legal-info` and `pkg-stats`.
They all generate similar information (`show-info` showing more) but
in a format that is specific to buildroot.

CycloneDX is a format already supported by tools such as
https://dependencytrack.org/ that helps track software,
vulnerabilities, etc ...

A DependencyTrack instance has been deployed at https://dependencytrack-lqgs7zhwmq-ew.a.run.app/
so you can play with CycloneDX and see the possibility. Be mindful
that I used a Google Cloud instance with cold start enabled so it can
take several minutes to initialize if no one has used the service.
Login with username `buildroot` and password `buildroot`.
All the project you create will be publicly accessible and removable,
just so you know.

To generate a CycloneDX SBOM compatible with DependencyTrack I found out
that one line minified JSON does not work and I had to format it. I
used the tool `json_reformat` to do it but tools are also available
online. I use the following command:

  make cyclonedx | json_reformat > sbom.json

This is a first sketch and I hope to gather comments on functionality
the community want me to include. I already have a todo list of feature
I plan to work on:

- [ ] Find a solution to handle versioning. The "version" property
      should be incremented every SBOM generation.
- [ ] Add more buildroot 'property' to components
  - [ ] Infrastructure (cmake, cargo etc).
  - [ ] Match the column of the `pkg-stat` command and add the missing
        one that don't have a place in the current CycloneDX spec to a
        corresponding property
- [ ] Make it configurable like pkg-stat
- [ ] Use PACKAGES_ALL if no .config
- [ ] Fix licenses list if there are commas inside parenthesis. Example
      of wrong license list:
              {
                  "license": {
                      "name": "LGPL-2.1+ (libblkid"
                  }
              },
              {
                  "license": {
                      "name": "libfdisk"
                  }
              },
              {
                  "license": {
                      "name": "libmount)"
                  }
              },
- [ ] Introduce a variable `_UPSTREAM_NAME` that defaults to `_RAWNAME`.
      For most python packages for instance, buildroot `python-` prefix
      shouldn't be in the upstream name. This `_UPSTREAM_NAME` can also be
      used e.g. for the default of CPE, PURL, and maybe in other places
      too.
- [ ] For patches downloaded using `_PATCH` variable (rarely used).
      Modify the pedigree to specify the URL instead of writting the
      content.
- [ ] Include the list of upstream URL with `externalReferences` the type
      will be `distribution`
      https://cyclonedx.org/docs/1.5/json/#components_items_externalReferences
- [ ] Add rule to the gitlab ci that check the SPDX licenses are up to
      date.
- [ ] Upstream changes to Dependency Track
  - [ ] Support 1-line minified JSON
  - [ ] Support showing patches and property

Thank you !

Thomas Perale (5):
  package/pkg-generic.mk: add PURL package variable
  package/pkg-utils.mk: urlencode/urldecode macros
  support/misc/cyclonedx.mk: support CycloneDX format
  support/misc/cyclonedx.mk: support spdx license check
  Makefile: add command to generate SBOM in CycloneDX format

 Makefile                       |  13 +
 package/pkg-generic.mk         |  12 +
 package/pkg-utils.mk           |  12 +
 support/misc/cyclonedx-spdx.mk | 617 +++++++++++++++++++++++++++++++++
 support/misc/cyclonedx.mk      | 230 ++++++++++++
 5 files changed, 884 insertions(+)
 create mode 100644 support/misc/cyclonedx-spdx.mk
 create mode 100644 support/misc/cyclonedx.mk

--
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
