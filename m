Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5CE5CD6E55
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 07:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD05361145;
	Wed,  3 Jun 2026 07:50:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zKfkCtRb5oLx; Wed,  3 Jun 2026 07:50:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8FD261147
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780473020;
	bh=L8NlCJUk+quO4Ll0Y+tMKV0G4zhenayNciM29MbCXDY=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=YIJ1B+lAjzaM6xTS+WeAA44EB30+pZFtoyz/OeP8O8DgguDI+x3ON+kujz8hUHzO8
	 LxPPENKfiWLijnPwZbM3fa4KGAPIcNmTXYGTe0GoE69VAfY/4Jom6+R2Lt4PGC97yg
	 keIlmbcZyMhwM9ryYYKozHPcoC+GqvDJeSm3enTunE8GZhXgtbT7jpfBN580bwwZ+4
	 RTVHz5zvdCkwmA6meiprBp1C+LDSX8IK3KgAmz7tD7hRQ0+5GmAcP8QQwXw6T9P37Q
	 d/hGBf+PkmgDewJANQ65WN5OzIOhso4WCiDP4J3IewnApiDwqnCV2FiTRGhjw57UNq
	 HsPBcpURQ4JUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8FD261147;
	Wed,  3 Jun 2026 07:50:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 66F92192
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 07:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C8B8423F9
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 07:50:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KKpd3DDZml6a for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 07:50:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.121;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DEAED423DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEAED423DB
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.121])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DEAED423DB
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 07:50:18 +0000 (UTC)
X-CSE-ConnectionGUID: RFzvPzUHQaSpkAOk/U29WA==
X-CSE-MsgGUID: JkO/6q6ZQH+CloONNmEF3g==
Received: from unknown (HELO opfedv1rlp0d.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 03 Jun 2026 09:50:15 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0d.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 09:50:15 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37;
 Wed, 3 Jun 2026 09:50:13 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Wed, 03 Jun 2026 09:50:13 +0200
From: yann.morin@orange.com
X-CSE-ConnectionGUID: UKGtXO3qTvWbIlVbcAVk1w==
X-CSE-MsgGUID: AsW5UJArTpm3FB0yLj5mHA==
X-IronPort-AV: E=Sophos;i="6.24,184,1774306800"; d="scan'208";a="437612593"
X-Amp-Result: SKIPPED(no attachment in message)
Date: Wed, 3 Jun 2026 09:50:13 +0200
To: <buildroot@buildroot.org>
Message-ID: <ah/ctYm8TTBT9DRs@yd-6wlzhs3>
MIME-Version: 1.0
Content-Disposition: inline
X-Originating-IP: [10.115.26.51]
X-ClientProxiedBy: OPE16NORMBX604.corporate.adroot.infra.ftgroup
 (10.115.26.32) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1780473019; x=1812009019;
 h=date:to:cc:subject:message-id:mime-version:
 content-transfer-encoding:from;
 bh=OFKJ5Cfkr2UfZYw1aNGpsJoZB7jmq/KDgndo3ZZn+z8=;
 b=S7eaaWtQi0XJ6MqG1pvq68ukUr2TeGMJeP6dfJH0fqJjxNqke6qSfsno
 PPcHkLLvEEcjXiSHu/5lk5/huZLTvQ4c95mi7CseReMpd/wVPeO4TfDna
 YmJXh8XBIRHt9jiHEJWuEMMhBrKHsZMqRXnMeGBVGHEaZ1aESU7iXAfJC
 yZQfsVtrNfuGufKulA+W/1jEr/SjIvoR7zsO1QIhGX3rsTQ9HNlM66rYJ
 vL42rFNURzRIzApsXHLmeBSo0BwsvqIlHvhgYswjMQQBVTCGKpYKVdK59
 p+n3v/wQb9+W9997fHEVEr0dNME6RNduBNa+vI1KkNP9g7H+dsIHuH4zW
 Q==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=S7eaaWtQ
Subject: [Buildroot] mosquitto: fails to build in reference docker image
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
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All,

Mosquitto 2.1.2 fails to build with ccache in the reference build image:

    $ cat >.config <<_EOF_
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_CCACHy=y
    BR2_PACKAGE_MOSQUITTO=y
    # BR2_PACKAGE_MOSQUITTO_CLIENTS is not set
    # BR2_PACKAGE_MOSQUITTO_BROKER is not set
    _EOF_
    $ ./utils/docker-run make olddefconfig
    [...]
    $ ./utils/docker-run make mosquitto
    [...]
    make[3]: Entering directory '/home/nyma7486/dev/work/buildroot/output/build/mosquitto-2.1.2'
    [ 98%] Building CXX object lib/cpp/CMakeFiles/mosquittopp.dir/mosquittopp.cpp.o
    In file included from /home/nyma7486/dev/work/buildroot/output/build/mosquitto-2.1.2/lib/cpp/mosquittopp.cpp:17:
    /home/nyma7486/dev/work/buildroot/output/host/opt/ext-toolchain/i686-buildroot-linux-gnu/include/c++/15.1.0/cstdlib:83:15: fatal error: stdlib.h: No such file or directory
       83 | #include_next <stdlib.h>
          |               ^~~~~~~~~~
    compilation terminated.
    [...]
    make: *** [package/pkg-generic.mk:273: /home/nyma7486/dev/work/buildroot/output/build/mosquitto-2.1.2/.stamp_built] Error 2

So, the issue is the infamous sysroot explicitly added as an -isystem
path. We've had such issues in the past, but if I remember correctly,
we're supposed to have fixed those... I have no idea what is adding
those here...

We do not have such failures in the autobuilders, because noone use the
reference build image; and in fact we have tons of successful builds of
mosquitto with ccache in there:
    https://autobuild.buildroot.org/index.php?status=OK&symbols%5BBR2_iCACHE%5D=y&symbols%5BBR2_PACKAGE_MOSQUITTO%5D=y

The only difference I could spot that might be of interest, is that the
reference image has cmake 3.25.1, while we build cmake 4.3.2...

And indeed, adding 'select BR2_HOST_CMAKE_AT_LEAST_4_3' to mosquitto
does "fix" the build issue; I have no other cmake version than the
3.25.1 in the ref image, or the 4.3.2 we build, so I can't test
intermediate versions...

I checked, and mosquitto only claims to require cmake 3.18 (which is
anyway the oldest we may accept as an existing host-installed cmake).
In any case, I'm at lost at what to do here...

Any insight would be greatly appreciated... Should I just spin the
select above, or is there a more fundamental issue we need to track
down?

Regards,
Yann E. MORIN.

PS. In Cc all people registered with cmake, ccache, or mosquitto.

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
