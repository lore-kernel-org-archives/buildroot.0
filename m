Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D7FC3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 08:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52F2481E23;
	Thu,  1 Aug 2024 08:45:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PUZVe6yXniJB; Thu,  1 Aug 2024 08:45:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F78981E1E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F78981E1E;
	Thu,  1 Aug 2024 08:45:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2D9EB1BF3C5
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 08:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1920681E1C
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 08:45:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zZoGl1smrlL3 for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 08:45:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.236;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B490981E1F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B490981E1F
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.236])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B490981E1F
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 08:45:53 +0000 (UTC)
Received: from unknown (HELO opfedv3rlp0c.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 10:45:51 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0c.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Aug 2024 10:45:52 +0200
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 10:45:49 +0200
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Thu, 01 Aug 2024 10:45:48 +0200
X-IronPort-AV: E=Sophos;i="6.09,254,1716242400"; d="scan'208";a="182257560"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Thu, 1 Aug 2024 10:45:48 +0200
Message-ID: <cover.1722501946.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-Originating-IP: [10.115.26.51]
X-ClientProxiedBy: OPE16NORMBX102.corporate.adroot.infra.ftgroup (10.115.26.3)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1722501954; x=1754037954;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RcpriqlX/t1BQQIscqWjyz5vCdAulIthtD5MLTmkYcQ=;
 b=ljQaFAcaxlF51tbz0YmP9+kLEllJTEPh/QMVTVMWDmk4gAVKT/5cHnSb
 UUONF/RdvgYW3fjko+5yEnyfyoY1jJkhbsXzFCePu/jJtJXnPB358eMFG
 fuangGI/QhK78QqMQ3FGIBwQNA8bzNiRIM74Pnrc6fAzbAh8QcaoORQ+v
 zsSIG5jxnpGXP30VOeYf4a2TPxM67lBIVf+G27NLhPlwlX925irkUJ5mw
 BsNo7dhveaqx9P40DH+oL0w8iA/asSTUmBpQGpAvs+uFi21NLIzTMRmH3
 kUxz02srD411MZJxumGGgKrEzbl5CnftfB1rwRO6GvkKKvcq2RPSVHpPx
 w==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=ljQaFAca
Subject: [Buildroot] [PATCH 0/7] package/go: handle CGO linking for the host
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
Cc: "Yann E . MORIN" <yann.morin@orange.com>, Anisse Astier <anisse@astier.eu>,
 Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

Hello All!

This series adds the necessary pieces to expose whether the go compiler
has CGO linking support for the host.

The overall issue with the go compiler, is that we have a single one
that can build for the target *and* for the host. Any limitation due to
the target thus leak to the host. This is notably the case for CGO
linking.

This series fixes that by adding a Kconfig symbol that represents
whether CGO linking for the host is available. Then, it goes on to fix a
few existing packages to add the new dependency.

Host variants of target packages that need CGO linking were found with:

    $ git grep -l BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS \
    |while read f; do
        [ -e "${f}.host" ] && echo "${f}"
    done

Which returns a rather short list:

    package/delve/Config.in
    package/moby-buildkit/Config.in
    package/runc/Config.in

And thus they are all three fixed.

There are only two host-only packages:

    $ git grep -l host-golang-package package/*/'**'.mk \
    |while read f; do
        grep -q -E '\(golang' "${f}" || echo "${f}"
    done
    package/mender-artifact/mender-artifact.mk
    package/skopeo/skopeo.mk

Skopeo is fixed in this series, as this is what prompted this work; so
it leaves mender-artifact to check. I have no idea how to check whether
a package needs CGO linking, though, so this is left as an exercise for
any interested party... This is however rather theoretical, as the only
hosts that do not support CGO linking (based on the target conditions)
would be mips64 or mips64el hosts, and it is very doubtful Buildroot
ever ran, runs, or will ever run on such hosts [0]; static-only or
thread-less hosts are also not widely deployed either...

[0] git grep -E 'HOSTARCH.*mips64' returns nothing before this series,
    so we have no special condition for running on mips64, which is a
    bit surprising...


Regards,
Yann E. MORIN.


The following changes since commit e321e81cf921346ec2d4cd1a9439016c7b2d3fb5

  configs/beaglebone: bump Linux to 6.6.32-ti-rt-arm32-r7 and U-Boot to 2024.07 (2024-07-30 23:44:30 +0200)


are available as patches in this mail series,

for you to apply patches up to 5cb88f8337a63230f90e02423005ba169e307549

  package/skopeo: bump version (2024-08-01 10:36:24 +0200)


----------------------------------------------------------------
Yann E. MORIN (7):
      package/skopeo: add missing dependency on host go arch support
      package/go: expose host CGO linking support
      package/delve: needs CGO linking for host
      package/moby-buildkit: needs CGO linking for host
      package/runc: needs CGO linking for host
      package/skopeo: needs CGO linking for host
      package/skopeo: bump version

 docs/manual/adding-packages-golang.adoc |  3 ++-
 package/delve/Config.in.host            |  1 +
 package/go/Config.in.host               | 12 ++++++++++++
 package/go/go.mk                        |  7 ++++---
 package/moby-buildkit/Config.in.host    |  1 +
 package/runc/Config.in.host             |  1 +
 package/skopeo/Config.in.host           |  2 ++
 package/skopeo/skopeo.hash              |  2 +-
 package/skopeo/skopeo.mk                |  2 +-
 9 files changed, 25 insertions(+), 6 deletions(-)

--
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
|                 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
| yann.morin (at) orange.com           |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
