Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D43CA9ECC
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 20:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 797374047C;
	Sun, 11 Oct 2026 20:33:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kQkHm4iD8XQz; Sun, 11 Oct 2026 20:33:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8C1344056B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791750782;
	b=rjI3TLChd/PD0l00X9rpdXhQQGP/sqH4aiKsQpD+1+dN6NkHMrWMoM5DueXqKlQyaJMp
	 fb07/gbzclkABO3KjghQsKOpxh9g1oa4JL593KooDz+0X0EThX0cW3n5uGh1qaMO6Mt2+
	 b+GNU94FlkZqZP+0/tgXhVfQXhHI9PLE+4kTPyxh7iEu7uMXNIsoEDJ4owIFnHkMmNmaI
	 abtV0Kx6O+hVW6eM4bYAfzgmzaxhTpGK2Li5ocNNcsPAxQwyy/m2yyiWrYdDHlUeVKCJB
	 mXD6HqCOLauBRbBkwLwGPn2hl9g2xd7C+ZbHKqewyXM95PzP63fGZnKwKS/EjcrCEPw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791750782;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=DADVXK8jAcpt5EzLoMex2sGem0trIA//tMHoV2WYWIM=;
	b=jjyIHN7C9yQ+YTmU+ozTtvhvE0eMG+d43JCqUWcfBzYVXYR0Kw3pEerjZaN5B7wNGO2I
	 Jj9h3i3YeHPWifBa0fjrLoxzaPFOTxDK+U0ZT0Y7BD7ycnZ6p8PNdQjGszMxPPqIoeKZv
	 Ig/7tQtBp+cQAhdhhwZIFmR4v5tolgPSnu1eYU4iAADg6FNgYuRJjI0Ifb6vyVtGE/k1c
	 hCqshSeRjOyDN+ShB3pKClyLwlSFZxsAlGTxoM3g64a/uAPd+47sQYEfep5Ce6m5iAZun
	 3Z6w+vo1C5hSDPEgdbvKkWEvKEVE0gCykEjf1DWJgBJmzKU3OEPrMUl3tiAlvboE79g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791750782;
	bh=DADVXK8jAcpt5EzLoMex2sGem0trIA//tMHoV2WYWIM=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=RNyI1ADBJwzAEuHYP+GOBcwZ7lb05de58W2nBrsxbPJ5V27dWGnr8mAHbaMFvhXf4
	 cTEYaHvt2N+mVmEyfRO3uNAlxMNloCSJoNlJL0t7UmO5FGc/3KoR148Gg2lN1m7aPi
	 1cIGvu7ysNlxSiiG7QBq0oH5mstrG+1H1kR7zzSsGfSOJDJuoxrBGnY0Xl2pIxMQpz
	 asPOZbB381nKMeMXIsl+TXS8SlUb+eJvmjRLp83G6vaYHAvzuNhI9E3VXyrdVXkJhZ
	 g7nk/AwFvVv57ze1/SRCd2ccJKSLQC6fBKMdrn9Wj8Kr/3WxH4wDMOI0+WHlpFNp1J
	 oDhrWL6TszZZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C1344056B;
	Sun, 11 Oct 2026 20:33:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A8601380
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 20:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A784605D7
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 20:33:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M986qedEN-Jh for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 20:32:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 09E34605D2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791750779;
 b=KTR35B/r3BCe1HDxm/fs8b5X231yELCdhi/vdqlZs/TYhZk062SYXeY7hv5cLJK/pwWc
 IEu8JXFIrh7XJ6InxJn+wat/JqMV7bRjHGJ+i05lukgJRjYf5dJDAIAmD9ZXDIcxDv1bB
 olZgzxo0/dftNATT+B4iN/EXVEN0CwFUp+SYfmjn5B2BGwTINqPJFjAySJ1CmzhylEniE
 K4+zUDxvgl93/YvffAiSWPaLafzMKuxr+yoQMXvDLX+F6Xl2f5Z3i+0t5U4wnXMXdMfPh
 dMWSAsSdiqGCqYpjWvtk6kaur/bawY9DJA4Kaq4XzXnSBfbC4SGB9myOM8T+O/tjisg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791750779;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=/AvZCY+QWJWwWAUveM8iRGyZ1TvBbe6w40DCZ5UZGhA=;
 b=s3sfnhMBQCydyH/8Jy5SU5w5zBZxIGPdQmzxtyHVJJBpaSbCsyERwLUbs32hvrqu6a9/
 cnVseT/kYgO9uJZgPYVRHxN6B5ZGYZ3qbpaMb0kICOoF4Ksf3yXGWJiD1DJfp5XgDz4jV
 tNNS7CocVRyDn2L5bRAimNnKUYik+b2t+zYKAzcux0320sNLRvnuP5B/BafhwAMYTXZIX
 aLTL5qiFcZE5K08uWLEzNobVWwcy/gOvzzYSMl/e3FuMpCOAm9LZ3BwyEunTLWsoFP39D
 4fTEXxnLzMYfBOS+e/Rnwfm7MHjgCnHH/1sJOxKhWLQj7nL9+t4eLeFDPpj9oq0KO0Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=DH2JYDTf; 
 arc=none smtp.remote-ip=212.227.17.21
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 09E34605D2
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 20:32:57 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M7JzQ-1xJIXi0pLw-005sgv; Sun, 11
 Oct 2026 22:32:54 +0200
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
	Fiona Klute <fiona.klute@gmx.de>
Date: Sun, 11 Oct 2026 22:32:28 +0200
Message-ID: <20261011203230.2072127-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:tcGqz+h5ytja1Qvi12PV4eTxao+HsadS5Q1EN0gCvquKzS+1gRr
 vm/UmZb6qGVms8qGCs3zRgqyYaJk4Wtdz929iOpzsY+b1wDxaFpldSKTsoOFylnq51wWx/d
 /W8OXwSI8VMceiX9o5zIOJpWydd+fPsAFLKuS2/V5s2ZdwfTDSlJzQ4AmmLIhoxjnucZQEb
 c+A7acbVezq0bCycFy1+Q==
UI-OutboundReport: notjunk:1;M01:P0:WTOkbB/ptjY=;P4WhEIEA9ZKKQlzvTD6T1u0Iqeu
 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
 2LdtFTPg==
Subject: [Buildroot] [PATCH v5 0/2] Add external tree information to SBOM
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi everyone,

this series adds information about external trees that were used in
the build to show-info and utils/generate-cyclonedx output. Having
this information is important to accurately interpret SBOM data:
External trees may add or modify packages, and in that case the
Buildroot version alone will not be enough to precisely identify the
packaging that was used. To be able to identify which packages come
from external trees, it also adds a new package_dir field to
per-package data in make show-info output, which will be an absolute
path for packages from external trees.

One open point regarding CycloneDX properties: I've added a
BR_EXTERNAL_TREE property to packages from external trees with the
bom-ref of the external tree, following the pattern of the existing
BR_TYPE. However, the CycloneDX specification recommends (but does not
require) registering properties with the CycloneDX property taxonomy
(see https://github.com/CycloneDX/cyclonedx-property-taxonomy).

I think it'd be good to do that for Buildroot, instead of using BR_*
without namespace. It would mean registering a "buildroot" namespace
for CycloneDX and maintaining documentation on supported properties
within that namespace. Adding a section to the manual or an
independent file to the repository should work. I'd be happy to add a
document specifying the current properties (modified for the
namespace), but I'd want agreement among us maintainers before working
on that. Either way it doesn't need to hold up merging, we could
always add the namespace later.

Best regards,
Fiona


Changes v4 -> v5:
* Rebase on changes in master
* Name package property in show-info output "external-tree" instead of
  "external" for clarity

Changes v3 -> v4:
* Former patch 2 has been merged (commit
  b10f50399afcdc1cfaed06387b3f51d2dfa27ad0).
* Add an "external" mapping with external tree name and version to
  show-info output for packages from external trees (new patch 1).
* Use that "external" mapping and "package_dir" to derive external
  tree information. This removes the need for a separate input file
  with external tree info (patch 2, replacing former patches 1 and 3).
* @Titouan Christophe: I've dropped your Tested-By due to the major
  changes, of course you're welcome to re-test. :-)

Changes v2 -> v3 (in patch 1):
* Fix merge conflict after reordering of metadata structure in commits
  6098cc45d64e9e7928f888b7cdf79533813d19c4 and
  9cbbc477626c433fe78614de9474f8446b7e2389

Changes v1 -> v2 (all in patch 1):
* drop unnecessary default=None for "--external-trees" option
* fix help string for "--external-trees" option ("%" needs to be "%%"
  so it's not treated as a formatting specifier)

Fiona Klute (WIWA) (2):
  package/pkg-utils.mk: include external tree info in show-info output
  utils/generate-cyclonedx: include external tree information

 package/pkg-utils.mk     | 12 ++++++
 utils/generate-cyclonedx | 91 ++++++++++++++++++++++++++++++++++++++--
 2 files changed, 99 insertions(+), 4 deletions(-)

-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
