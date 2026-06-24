Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B85CDB479
	for <buildroot@archiver.kernel.org>; Wed, 24 Jun 2026 14:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55DED6085A;
	Wed, 24 Jun 2026 14:06:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U1c91vhgOJ4a; Wed, 24 Jun 2026 14:06:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D49260829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782310012;
	bh=8UOMsuJJYxR1e/2twfvM2wjvv3pjZQOb6joEA3OYQF4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=nQOJ8wVExtntiU+Bf5uwiWo4jPC69lZUE1UecM7E3MGVi8QZFNnCwXSx9etPx4VDx
	 ncQjfc7bHC3XwoqrjmFjZNGau1ov6CJj9annXEs4lKugsf+H5Rw0JGDw0xVh/yRAcq
	 zczJgJMphITh3yD0/c+4CUSrjXH4zHhMSr3nOIOmneB5hAEvBVfQuuKd6Ui1UJc/4x
	 JcDvRDPpC7sacTHgzQcVSzMPW5wuHmEoMH2p49SWqjy4fzBjCHU9Dslrl2NhJsOYfE
	 FL6tedIBpNZgqKhWOtLodRrmAIgLQee/WTW8JDGcHhG0QhtsDcCfSW3nkqnzxs0C76
	 t36RHcElHvLiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D49260829;
	Wed, 24 Jun 2026 14:06:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D5538367
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 14:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6D2560840
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 14:06:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1F5FcCN7XTuU for <buildroot@buildroot.org>;
 Wed, 24 Jun 2026 14:06:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8DEF5607F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DEF5607F0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8DEF5607F0
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 14:06:49 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-490bc6a7958so15961335e9.1
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 07:06:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782310007; x=1782914807;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C04byVS0IFx2Kz2RIremyMXCu2eOeIplWQ73OgHQCOk=;
 b=S8znep7xcioZeoTmRrFW+z0/wPkuwUeu1vczuT6liUI5HrGkM9ztY9nT34PB+RCmxd
 AXQwOdDsHUaKOmxf5gCtaPC8I+KxH1zPch7wfu8eKykaf2/mnsWnKmk0SY7vBTUPANM5
 Qt3lIKpuB3LKri7K1h4KfzR8fIhDA1uTc2ajxQsUbCuBfo5Y0CVNsyUyZ8fTjT0xQ558
 UeYwMYoZeis3DHFG3QS+7CSnpz0XuAKWXIlIxg2VzfTVHvAcUFRm4I6oTtud9o4zUlAH
 r1l4PmbDvDTkVmL0/Xm1dhg+0ckNO7hV1GfHvtBHgd0q2sHjzZWSxV1aKmTbCDAikz9t
 OTTA==
X-Gm-Message-State: AOJu0YzxyyNTUu1SJgu2iQTC8M43UTzAb98pBVpF+mZAdOJI/lJLAED/
 4E1N7kRdHPuTsC5w1evRS8SpxFkOMs8gaicKcs/pJmVPGoYllmNZx362ozLO7xVHXjoMhceETsI
 2jVlo
X-Gm-Gg: AfdE7cmOtSbxYA3mtouAVDBhdmaWyl3CNquaHCayqOfIoyOIx4/+AGgoTpSJl06F6oF
 gQBvCOpO/UFeStDOgTGC0xqCneP/4+Qy12hoW2ixgAcjEI45NVQ76pSQomfBQxQQTGu1yyQL9wx
 Agz+kzLCoVsJcAO8iIcIvCVr5gvEPwER4rNsHvrejYCpp6XY83DV9yihhmI5Ec4dmpygr3PlhEE
 CrLGbHzNQrdNS3rMlOxQcVivatHO9cuBuRu1P/YYdeRoeG6sR39xibQ5pjOdSVIVx+CzRsqUpMd
 8/w3GEEeN4eQCAlyv8Rwi2orttgiUmY2KqaM7I9enUhkkSbVohPTqtN8U2dxpnxNM02XidwSRUO
 lLo+JeThBhQvPsyTv5ZM7r0ygyXtzBr9GFqNcX3h+ffqVfWvsT4VKVWBXFEWcD2JxXlAbnpWW6x
 Qie8Iu
X-Received: by 2002:a05:600c:178f:b0:489:32b:ac0b with SMTP id
 5b1f17b1804b1-492632a3483mr6417945e9.6.1782310006983; 
 Wed, 24 Jun 2026 07:06:46 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49260e14d0asm43700205e9.0.2026.06.24.07.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 07:06:46 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 24 Jun 2026 16:06:31 +0200
Message-ID: <20260624140645.185318-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782310007; x=1782914807; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=C04byVS0IFx2Kz2RIremyMXCu2eOeIplWQ73OgHQCOk=;
 b=EA9JNCnW8KSkqjvXPiEOGLf0NDpiGOCnTUETl+fLW0qelEPrxYYq08j4DgPLrSYKFs
 ELZJRLHbQvlXI1ztBCrYIjykasAatycKH+DaXciNPl1lGHqrhZ7fjdJahfLnGGpmW9cd
 mWm/rwK+l8xyAkqzj1FcwRmU6s+Xsz9aHsO/ooaGPIHquKa5UljDygRlmkYCIMOQxipC
 I48czVo+DZUFM8Hdv6WnEECnTd43209/IKUoUsLJcwN7F/kcYfr+q1763pMkwEbTkN9G
 Eie2DnEIJN850BoSL/W6spatObG4GyGrwscoxd0jyFyHdChazVxEfT21rhrxOYmiE2h8
 D/Vw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=EA9JNCnW
Subject: [Buildroot] [RFC PATCH 00/14] Add exportable vulnerability
 informations
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
Cc: Thomas Perale <thomas.perale@mind.be>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In Buildroot, we can put the ignore CVEs entries in different
categories:

- Vulnerability fixed by a patch.
- Vulnerability ignored because the internal tooling detect it as a
  false positive
- Vulnerability ignored because the database is wrong or not up-to-date.
- Vulnerability ignored because it doesn't apply to Buildroot
  (platform/hardware specific, ...).
- Vulnerability ignored because Buildroot is using an upstream fixed
  version (based on a hash for instance) while the CPE metadata
  reference the latest known version.

Since the introduction of `_IGNORE_CVES` the justification for the
vulnerability were added as a comment on top of the ignored
vulnerability.

With the introduction of the rule for the `CVE:` trailer it's now
possible to distinguish the vulnerabilities that are patched from the
one that are not-applicable for another unknown reason.

This series add support to tag the remaining 'IGNORE_CVES' entry with a
set of information that can then be exported with 'show-info'.

This was discussed during the post-FOSDEM buildroot hackathon. The idea
of using OpenVex for the annotation format as in the future multiple
SBOM output format might be supported and OpenVex looked like a good
candidate for the base annotation without re-inventing our own format.

This RFC to discuss: 
 - The OpenVex annotation used and how we make them map to the Buildroot
   cases (see the doc change). I also provided some example of ignored
   entries and how I make them map to give more context. Not all the
   entries are mapped yet.
 - Should we consider another format ?
 - How I translate this format to CycloneDX analysis.

Still TODO:

- The CycloneDX translation needs to change as it depends on
  https://patchwork.ozlabs.org/project/buildroot/patch/20260624101340.80670-8-thomas.perale@mind.be/.
  The current implementation is a rough draft that is used only for
  testing
- The STATUS and DETAIL variables needs to be replicated for host
  packages.
- Add a test case that run 'make show-info-all |
  utils/generate-cyclonedx' and verify no "in_triage" analysis remains.
  This depends on the two previous TODOs.

Thomas Perale (14):
  docs/manual: add vulnerability status and justification
  utils/checkpackagelib/lib_mk.py: check _STATUS value is supported
  package/pkg-utils: show-info expose vuln details
  utils/generate-cyclonedx: support vulnerability details
  package/sox: add vulnerabilities details
  package/php: add vulnerability details
  package/mupdf: add vulnerabilities details
  package/python-pip: add detail to vulnerability
  package/luajit: add details to vulnerabilities
  package/libuci: add vulnerability details
  package/glibc: add vulnerability details
  package/freeradius-server: add vulnerabilities details
  package/flex: add vulnerability details
  package/clamav: add vulnerability details

 docs/manual/adding-packages-generic.adoc      | 35 ++++++++
 package/clamav/clamav.mk                      |  6 +-
 package/flex/flex.mk                          |  7 +-
 .../freeradius-server/freeradius-server.mk    |  7 +-
 package/glibc/glibc.mk                        | 32 ++++---
 package/libuci/libuci.mk                      |  3 +-
 package/luajit/luajit.mk                      | 15 ++--
 package/mupdf/mupdf.mk                        | 10 +--
 package/php/php.mk                            |  3 +-
 package/pkg-utils.mk                          | 19 +++++
 package/python-pip/python-pip.mk              |  5 +-
 package/sox/sox.mk                            | 41 ++++++---
 utils/checkpackagelib/lib_mk.py               | 22 +++++
 utils/generate-cyclonedx                      | 83 +++++++++++++++----
 14 files changed, 227 insertions(+), 61 deletions(-)

-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
