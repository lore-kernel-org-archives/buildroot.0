Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43473CD1292
	for <buildroot@archiver.kernel.org>; Thu,  4 Apr 2024 12:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EA8941AEC;
	Thu,  4 Apr 2024 12:45:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jLDxRd1lnceX; Thu,  4 Apr 2024 12:45:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B37F741AEF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B37F741AEF;
	Thu,  4 Apr 2024 12:45:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DC35F1BF3D8
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 12:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6EEC822C5
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 12:44:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Rfc7DkaTTBv for <buildroot@lists.busybox.net>;
 Thu,  4 Apr 2024 12:44:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1388D822C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1388D822C3
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1388D822C3
 for <buildroot@buildroot.org>; Thu,  4 Apr 2024 12:44:55 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4162bac95d4so2341255e9.2
 for <buildroot@buildroot.org>; Thu, 04 Apr 2024 05:44:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712234694; x=1712839494;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rNU09pGtD6b0UvtrkWEIHTZ/qNE3UHDkKCIRnUcIjJQ=;
 b=uttv8ligrwoNDHsgiA8p7EkZNQKFASCSrRD+ulPH2uga0zKdLl6DOB1NyioO6CqjHE
 6CoKG83IvnIXxOYItRIEx3KL3gvr+Gy9NJ1IJ7FeebKn2pNjfGjvaC/KG917BksqcYXz
 9jFsjkia+xTi7gNH5n1+xLit5W6zk8onL/AuMs74j/L/+PoBSL1MXe5Pa82j9qX+Lk/k
 jKDxytSUGt4hk1Xse/9xxwvSfrWky8qjILljrAeXjCBmul5ij6v7X9Nr4/Mm9P1IPa6k
 hKoIUjhWjShBQLWPBjcj09SeEhRbanRnBeByTd9nd3zLTqv/W5xvTzrpS8sFz62t6Jgg
 wxIg==
X-Gm-Message-State: AOJu0YyCPmIUix+j37GBzW2SJXDAuZdRdHLwpoPrcuvzAW2+W412FR8K
 woB44RZo8vT2fum29nE4SWOfQ5Dsl4Dzvtu4uFA+jPc+4bX2TiuXUkiYqh9aI0weSscu95zy7Bm
 O
X-Google-Smtp-Source: AGHT+IHloMbPJmi73hx6SEpvUvBoIkbUW/wYMNvBIOWOx6Fu91lMZH05ez0I8DRJX8yaOOKvDaXeKg==
X-Received: by 2002:adf:f1d1:0:b0:343:41ef:ab1e with SMTP id
 z17-20020adff1d1000000b0034341efab1emr1876498wro.44.1712234693691; 
 Thu, 04 Apr 2024 05:44:53 -0700 (PDT)
Received: from localhost.localdomain ([79.132.235.33])
 by smtp.gmail.com with ESMTPSA id
 r5-20020a056000014500b00341dc343e21sm19913663wrx.65.2024.04.04.05.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 05:44:53 -0700 (PDT)
X-Google-Original-From: Thomas Perale <thomas.perale@mind.be>
To: buildroot@buildroot.org
Date: Thu,  4 Apr 2024 14:43:28 +0200
Message-ID: <20240404124329.768546-5-thomas.perale@mind.be>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240404124329.768546-1-thomas.perale@mind.be>
References: <20240404124329.768546-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1712234694; x=1712839494; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rNU09pGtD6b0UvtrkWEIHTZ/qNE3UHDkKCIRnUcIjJQ=;
 b=CCBRK7x3KiD2S+jNDtSWFPMB++aWeo/KadjeXOqkQq+mIQBV6fYKDfE1MvGBO6ZnXS
 NXSmfdSa896srDgF3w/ZIKZJy9rjG8DxRKJh0RoMu+jRsmr+U2s5HtdHdwkZ1BwBPhN1
 sF3vI78oJgWDBTbr8Wv8zvLuWhpUQq7Reow/PM4MzNDSmghKvIDRF2HqP6YimxKPO5u1
 XuhE4DD7klyB1EITRTA78+fUSr/CVuijwntt1Cd6JDTzP5s93HQlReFvjFruNTnFBW3L
 pPZwDBUmiyLnGcWfBn3xe6hPYTHamJNQKFM+cWH4xzc0cykvbY77n31wul01/FNSD9P9
 S5AQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=essensium.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=CCBRK7x3
Subject: [Buildroot] [RFC PATCH 4/5] support/misc/cyclonedx.mk: support spdx
 license check
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

To improve the tracking of the licenses of the components, the file
`support/misc/cyclonedx-spdx.mk` that contains a definition of every
approved SPDX licenses ID is included in this patch.

This file has been generated by the `support/misc/cyclonedx-spdx.mk`
rule included `support/misc/cyclonedx.mk`. It will remain there to
re-generate the file if it's updated.

Knowing if a license name is a valid SPDX ID or not, allows tools
such as Dependency Track to directly show the license content of
components with a known SPDX ID.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/misc/cyclonedx-spdx.mk | 617 +++++++++++++++++++++++++++++++++
 support/misc/cyclonedx.mk      |  35 +-
 2 files changed, 651 insertions(+), 1 deletion(-)
 create mode 100644 support/misc/cyclonedx-spdx.mk

diff --git a/support/misc/cyclonedx-spdx.mk b/support/misc/cyclonedx-spdx.mk
new file mode 100644
index 0000000000..81c387fd23
--- /dev/null
+++ b/support/misc/cyclonedx-spdx.mk
@@ -0,0 +1,617 @@
+# List of approved SPDX license
+# See https://raw.githubusercontent.com/CycloneDX/specification/1.5/schema/spdx.schema.json
+define spdx
+0BSD
+AAL
+Abstyles
+AdaCore-doc
+Adobe-2006
+Adobe-Glyph
+ADSL
+AFL-1.1
+AFL-1.2
+AFL-2.0
+AFL-2.1
+AFL-3.0
+Afmparse
+AGPL-1.0
+AGPL-1.0-only
+AGPL-1.0-or-later
+AGPL-3.0
+AGPL-3.0-only
+AGPL-3.0-or-later
+Aladdin
+AMDPLPA
+AML
+AMPAS
+ANTLR-PD
+ANTLR-PD-fallback
+Apache-1.0
+Apache-1.1
+Apache-2.0
+APAFML
+APL-1.0
+App-s2p
+APSL-1.0
+APSL-1.1
+APSL-1.2
+APSL-2.0
+Arphic-1999
+Artistic-1.0
+Artistic-1.0-cl8
+Artistic-1.0-Perl
+Artistic-2.0
+ASWF-Digital-Assets-1.0
+ASWF-Digital-Assets-1.1
+Baekmuk
+Bahyph
+Barr
+Beerware
+Bitstream-Charter
+Bitstream-Vera
+BitTorrent-1.0
+BitTorrent-1.1
+blessing
+BlueOak-1.0.0
+Boehm-GC
+Borceux
+Brian-Gladman-3-Clause
+BSD-1-Clause
+BSD-2-Clause
+BSD-2-Clause-FreeBSD
+BSD-2-Clause-NetBSD
+BSD-2-Clause-Patent
+BSD-2-Clause-Views
+BSD-3-Clause
+BSD-3-Clause-Attribution
+BSD-3-Clause-Clear
+BSD-3-Clause-LBNL
+BSD-3-Clause-Modification
+BSD-3-Clause-No-Military-License
+BSD-3-Clause-No-Nuclear-License
+BSD-3-Clause-No-Nuclear-License-2014
+BSD-3-Clause-No-Nuclear-Warranty
+BSD-3-Clause-Open-MPI
+BSD-4-Clause
+BSD-4-Clause-Shortened
+BSD-4-Clause-UC
+BSD-4.3RENO
+BSD-4.3TAHOE
+BSD-Advertising-Acknowledgement
+BSD-Attribution-HPND-disclaimer
+BSD-Protection
+BSD-Source-Code
+BSL-1.0
+BUSL-1.1
+bzip2-1.0.5
+bzip2-1.0.6
+C-UDA-1.0
+CAL-1.0
+CAL-1.0-Combined-Work-Exception
+Caldera
+CATOSL-1.1
+CC-BY-1.0
+CC-BY-2.0
+CC-BY-2.5
+CC-BY-2.5-AU
+CC-BY-3.0
+CC-BY-3.0-AT
+CC-BY-3.0-DE
+CC-BY-3.0-IGO
+CC-BY-3.0-NL
+CC-BY-3.0-US
+CC-BY-4.0
+CC-BY-NC-1.0
+CC-BY-NC-2.0
+CC-BY-NC-2.5
+CC-BY-NC-3.0
+CC-BY-NC-3.0-DE
+CC-BY-NC-4.0
+CC-BY-NC-ND-1.0
+CC-BY-NC-ND-2.0
+CC-BY-NC-ND-2.5
+CC-BY-NC-ND-3.0
+CC-BY-NC-ND-3.0-DE
+CC-BY-NC-ND-3.0-IGO
+CC-BY-NC-ND-4.0
+CC-BY-NC-SA-1.0
+CC-BY-NC-SA-2.0
+CC-BY-NC-SA-2.0-DE
+CC-BY-NC-SA-2.0-FR
+CC-BY-NC-SA-2.0-UK
+CC-BY-NC-SA-2.5
+CC-BY-NC-SA-3.0
+CC-BY-NC-SA-3.0-DE
+CC-BY-NC-SA-3.0-IGO
+CC-BY-NC-SA-4.0
+CC-BY-ND-1.0
+CC-BY-ND-2.0
+CC-BY-ND-2.5
+CC-BY-ND-3.0
+CC-BY-ND-3.0-DE
+CC-BY-ND-4.0
+CC-BY-SA-1.0
+CC-BY-SA-2.0
+CC-BY-SA-2.0-UK
+CC-BY-SA-2.1-JP
+CC-BY-SA-2.5
+CC-BY-SA-3.0
+CC-BY-SA-3.0-AT
+CC-BY-SA-3.0-DE
+CC-BY-SA-3.0-IGO
+CC-BY-SA-4.0
+CC-PDDC
+CC0-1.0
+CDDL-1.0
+CDDL-1.1
+CDL-1.0
+CDLA-Permissive-1.0
+CDLA-Permissive-2.0
+CDLA-Sharing-1.0
+CECILL-1.0
+CECILL-1.1
+CECILL-2.0
+CECILL-2.1
+CECILL-B
+CECILL-C
+CERN-OHL-1.1
+CERN-OHL-1.2
+CERN-OHL-P-2.0
+CERN-OHL-S-2.0
+CERN-OHL-W-2.0
+CFITSIO
+checkmk
+ClArtistic
+Clips
+CMU-Mach
+CNRI-Jython
+CNRI-Python
+CNRI-Python-GPL-Compatible
+COIL-1.0
+Community-Spec-1.0
+Condor-1.1
+copyleft-next-0.3.0
+copyleft-next-0.3.1
+Cornell-Lossless-JPEG
+CPAL-1.0
+CPL-1.0
+CPOL-1.02
+Crossword
+CrystalStacker
+CUA-OPL-1.0
+Cube
+curl
+D-FSL-1.0
+diffmark
+DL-DE-BY-2.0
+DOC
+Dotseqn
+DRL-1.0
+DSDP
+dtoa
+dvipdfm
+ECL-1.0
+ECL-2.0
+eCos-2.0
+EFL-1.0
+EFL-2.0
+eGenix
+Elastic-2.0
+Entessa
+EPICS
+EPL-1.0
+EPL-2.0
+ErlPL-1.1
+etalab-2.0
+EUDatagrid
+EUPL-1.0
+EUPL-1.1
+EUPL-1.2
+Eurosym
+Fair
+FDK-AAC
+Frameworx-1.0
+FreeBSD-DOC
+FreeImage
+FSFAP
+FSFUL
+FSFULLR
+FSFULLRWD
+FTL
+GD
+GFDL-1.1
+GFDL-1.1-invariants-only
+GFDL-1.1-invariants-or-later
+GFDL-1.1-no-invariants-only
+GFDL-1.1-no-invariants-or-later
+GFDL-1.1-only
+GFDL-1.1-or-later
+GFDL-1.2
+GFDL-1.2-invariants-only
+GFDL-1.2-invariants-or-later
+GFDL-1.2-no-invariants-only
+GFDL-1.2-no-invariants-or-later
+GFDL-1.2-only
+GFDL-1.2-or-later
+GFDL-1.3
+GFDL-1.3-invariants-only
+GFDL-1.3-invariants-or-later
+GFDL-1.3-no-invariants-only
+GFDL-1.3-no-invariants-or-later
+GFDL-1.3-only
+GFDL-1.3-or-later
+Giftware
+GL2PS
+Glide
+Glulxe
+GLWTPL
+gnuplot
+GPL-1.0
+GPL-1.0+
+GPL-1.0-only
+GPL-1.0-or-later
+GPL-2.0
+GPL-2.0+
+GPL-2.0-only
+GPL-2.0-or-later
+GPL-2.0-with-autoconf-exception
+GPL-2.0-with-bison-exception
+GPL-2.0-with-classpath-exception
+GPL-2.0-with-font-exception
+GPL-2.0-with-GCC-exception
+GPL-3.0
+GPL-3.0+
+GPL-3.0-only
+GPL-3.0-or-later
+GPL-3.0-with-autoconf-exception
+GPL-3.0-with-GCC-exception
+Graphics-Gems
+gSOAP-1.3b
+HaskellReport
+Hippocratic-2.1
+HP-1986
+HPND
+HPND-export-US
+HPND-Markus-Kuhn
+HPND-sell-variant
+HPND-sell-variant-MIT-disclaimer
+HTMLTIDY
+IBM-pibs
+ICU
+IEC-Code-Components-EULA
+IJG
+IJG-short
+ImageMagick
+iMatix
+Imlib2
+Info-ZIP
+Inner-Net-2.0
+Intel
+Intel-ACPI
+Interbase-1.0
+IPA
+IPL-1.0
+ISC
+Jam
+JasPer-2.0
+JPL-image
+JPNIC
+JSON
+Kazlib
+Knuth-CTAN
+LAL-1.2
+LAL-1.3
+Latex2e
+Latex2e-translated-notice
+Leptonica
+LGPL-2.0
+LGPL-2.0+
+LGPL-2.0-only
+LGPL-2.0-or-later
+LGPL-2.1
+LGPL-2.1+
+LGPL-2.1-only
+LGPL-2.1-or-later
+LGPL-3.0
+LGPL-3.0+
+LGPL-3.0-only
+LGPL-3.0-or-later
+LGPLLR
+Libpng
+libpng-2.0
+libselinux-1.0
+libtiff
+libutil-David-Nugent
+LiLiQ-P-1.1
+LiLiQ-R-1.1
+LiLiQ-Rplus-1.1
+Linux-man-pages-1-para
+Linux-man-pages-copyleft
+Linux-man-pages-copyleft-2-para
+Linux-man-pages-copyleft-var
+Linux-OpenIB
+LOOP
+LPL-1.0
+LPL-1.02
+LPPL-1.0
+LPPL-1.1
+LPPL-1.2
+LPPL-1.3a
+LPPL-1.3c
+LZMA-SDK-9.11-to-9.20
+LZMA-SDK-9.22
+MakeIndex
+Martin-Birgmeier
+metamail
+Minpack
+MirOS
+MIT
+MIT-0
+MIT-advertising
+MIT-CMU
+MIT-enna
+MIT-feh
+MIT-Festival
+MIT-Modern-Variant
+MIT-open-group
+MIT-Wu
+MITNFA
+Motosoto
+mpi-permissive
+mpich2
+MPL-1.0
+MPL-1.1
+MPL-2.0
+MPL-2.0-no-copyleft-exception
+mplus
+MS-LPL
+MS-PL
+MS-RL
+MTLL
+MulanPSL-1.0
+MulanPSL-2.0
+Multics
+Mup
+NAIST-2003
+NASA-1.3
+Naumen
+NBPL-1.0
+NCGL-UK-2.0
+NCSA
+Net-SNMP
+NetCDF
+Newsletr
+NGPL
+NICTA-1.0
+NIST-PD
+NIST-PD-fallback
+NIST-Software
+NLOD-1.0
+NLOD-2.0
+NLPL
+Nokia
+NOSL
+Noweb
+NPL-1.0
+NPL-1.1
+NPOSL-3.0
+NRL
+NTP
+NTP-0
+Nunit
+O-UDA-1.0
+OCCT-PL
+OCLC-2.0
+ODbL-1.0
+ODC-By-1.0
+OFFIS
+OFL-1.0
+OFL-1.0-no-RFN
+OFL-1.0-RFN
+OFL-1.1
+OFL-1.1-no-RFN
+OFL-1.1-RFN
+OGC-1.0
+OGDL-Taiwan-1.0
+OGL-Canada-2.0
+OGL-UK-1.0
+OGL-UK-2.0
+OGL-UK-3.0
+OGTSL
+OLDAP-1.1
+OLDAP-1.2
+OLDAP-1.3
+OLDAP-1.4
+OLDAP-2.0
+OLDAP-2.0.1
+OLDAP-2.1
+OLDAP-2.2
+OLDAP-2.2.1
+OLDAP-2.2.2
+OLDAP-2.3
+OLDAP-2.4
+OLDAP-2.5
+OLDAP-2.6
+OLDAP-2.7
+OLDAP-2.8
+OLFL-1.3
+OML
+OpenPBS-2.3
+OpenSSL
+OPL-1.0
+OPL-UK-3.0
+OPUBL-1.0
+OSET-PL-2.1
+OSL-1.0
+OSL-1.1
+OSL-2.0
+OSL-2.1
+OSL-3.0
+Parity-6.0.0
+Parity-7.0.0
+PDDL-1.0
+PHP-3.0
+PHP-3.01
+Plexus
+PolyForm-Noncommercial-1.0.0
+PolyForm-Small-Business-1.0.0
+PostgreSQL
+PSF-2.0
+psfrag
+psutils
+Python-2.0
+Python-2.0.1
+Qhull
+QPL-1.0
+QPL-1.0-INRIA-2004
+Rdisc
+RHeCos-1.1
+RPL-1.1
+RPL-1.5
+RPSL-1.0
+RSA-MD
+RSCPL
+Ruby
+SAX-PD
+Saxpath
+SCEA
+SchemeReport
+Sendmail
+Sendmail-8.23
+SGI-B-1.0
+SGI-B-1.1
+SGI-B-2.0
+SGP4
+SHL-0.5
+SHL-0.51
+SimPL-2.0
+SISSL
+SISSL-1.2
+Sleepycat
+SMLNJ
+SMPPL
+SNIA
+snprintf
+Spencer-86
+Spencer-94
+Spencer-99
+SPL-1.0
+SSH-OpenSSH
+SSH-short
+SSPL-1.0
+StandardML-NJ
+SugarCRM-1.1.3
+SunPro
+SWL
+Symlinks
+TAPR-OHL-1.0
+TCL
+TCP-wrappers
+TermReadKey
+TMate
+TORQUE-1.1
+TOSL
+TPDL
+TPL-1.0
+TTWL
+TU-Berlin-1.0
+TU-Berlin-2.0
+UCAR
+UCL-1.0
+Unicode-DFS-2015
+Unicode-DFS-2016
+Unicode-TOU
+UnixCrypt
+Unlicense
+UPL-1.0
+Vim
+VOSTROM
+VSL-1.0
+W3C
+W3C-19980720
+W3C-20150513
+w3m
+Watcom-1.0
+Widget-Workshop
+Wsuipa
+WTFPL
+wxWindows
+X11
+X11-distribute-modifications-variant
+Xdebug-1.03
+Xerox
+Xfig
+XFree86-1.1
+xinetd
+xlock
+Xnet
+xpp
+XSkat
+YPL-1.0
+YPL-1.1
+Zed
+Zend-2.0
+Zimbra-1.3
+Zimbra-1.4
+Zlib
+zlib-acknowledgement
+ZPL-1.1
+ZPL-2.0
+ZPL-2.1
+389-exception
+Asterisk-exception
+Autoconf-exception-2.0
+Autoconf-exception-3.0
+Autoconf-exception-generic
+Autoconf-exception-macro
+Bison-exception-2.2
+Bootloader-exception
+Classpath-exception-2.0
+CLISP-exception-2.0
+cryptsetup-OpenSSL-exception
+DigiRule-FOSS-exception
+eCos-exception-2.0
+Fawkes-Runtime-exception
+FLTK-exception
+Font-exception-2.0
+freertos-exception-2.0
+GCC-exception-2.0
+GCC-exception-3.1
+GNAT-exception
+gnu-javamail-exception
+GPL-3.0-interface-exception
+GPL-3.0-linking-exception
+GPL-3.0-linking-source-exception
+GPL-CC-1.0
+GStreamer-exception-2005
+GStreamer-exception-2008
+i2p-gpl-java-exception
+KiCad-libraries-exception
+LGPL-3.0-linking-exception
+libpri-OpenH323-exception
+Libtool-exception
+Linux-syscall-note
+LLGPL
+LLVM-exception
+LZMA-exception
+mif-exception
+Nokia-Qt-exception-1.1
+OCaml-LGPL-linking-exception
+OCCT-exception-1.0
+OpenJDK-assembly-exception-1.0
+openvpn-openssl-exception
+PS-or-PDF-font-exception-20170817
+QPL-1.0-INRIA-2004-exception
+Qt-GPL-exception-1.0
+Qt-LGPL-exception-1.1
+Qwt-exception-1.0
+SHL-2.0
+SHL-2.1
+SWI-exception
+Swift-exception
+u-boot-exception-2.0
+Universal-FOSS-exception-1.0
+vsftpd-openssl-exception
+WxWindows-exception-3.1
+x11vnc-openssl-exception
+endef
diff --git a/support/misc/cyclonedx.mk b/support/misc/cyclonedx.mk
index 3906a3b60a..1d7199c92c 100644
--- a/support/misc/cyclonedx.mk
+++ b/support/misc/cyclonedx.mk
@@ -7,6 +7,8 @@
 #
 ################################################################################

+include support/misc/cyclonedx-spdx.mk
+
 # Note: to avoid conflict with <pkg>_VERSION `_SPEC` is added
 CYCLONEDX_VERSION_SPEC = 1.5

@@ -24,6 +26,22 @@ CYCLONEDX_VERSION_SPEC = 1.5
 # Turns "Public%20Domain,%20GPL-2.0" into "Public%20Domain GPL-2.0"
 _cyclonedx-licenses-as-list = $(subst $(comma)%20,$(space),$(1))

+# _cyclonedx-license-attribute -- according to CycloneDX spec correct SPDX
+#                                 licenses must use the 'id' key while
+#                                 other use the 'name' key.
+#                                 If a SPDX license is followed by parenthesis
+#                                 to describe its scope it will be threated as
+#                                 a non SPDX license.
+#
+# $(1): a license name with space encoded. Since all official SPDX license names
+#       are a single word (no spaces), it's not an issue to keep them url-encoded.
+define _cyclonedx-license-attribute
+	$(if $(filter $(spdx),$(1)), \
+		"id", \
+		"name" \
+	)
+endef
+
 # _cyclonedx-license -- create an entry of a cyclonedx component license list
 #
 # For more information on license object see
@@ -33,7 +51,8 @@ _cyclonedx-licenses-as-list = $(subst $(comma)%20,$(space),$(1))
 define _cyclonedx-license
 	{
 		"license": {
-			"name": $(call mk-json-str,$(1))
+			$(call _cyclonedx-license-attribute,$(1)):
+				$(call mk-json-str,$(1))
 		}
 	},
 endef
@@ -195,3 +214,17 @@ define cyclonedx-json
 		}
 	})
 endef
+
+# Use this rule to update the `cyclonedx-spdx.mk` file. The rule will
+# override the cyclonedx-spdx.mk file with a variable called 'spdx' that
+# contains the list of the SPDX license supported by CycloneDX spec.
+.PHONY: support/misc/cyclonedx-spdx.mk
+support/misc/cyclonedx-spdx.mk:
+	$(WGET) -O - https://raw.githubusercontent.com/CycloneDX/specification/$(CYCLONEDX_VERSION_SPEC)/schema/spdx.schema.json | \
+		$(JQ) jq -r '.enum[]' | { \
+			echo '# List of approved SPDX license'; \
+			echo '# See https://raw.githubusercontent.com/CycloneDX/specification/1.5/schema/spdx.schema.json'; \
+			echo 'define spdx'; \
+			cat; \
+			echo 'endef'; \
+		} > $@
--
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
