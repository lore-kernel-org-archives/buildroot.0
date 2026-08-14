Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F6EC5CFCF
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 19:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A04560738;
	Fri, 14 Aug 2026 19:59:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wUAWFSGY3SRB; Fri, 14 Aug 2026 19:59:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AB6360683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786737551;
	bh=TQj+STusr9vkUm5DDac3V1uWf07l54rihptorOzuVO8=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=RX7oJZRzrSEybZhZQmHCsViaJgkdeWGZt0CJC7+m8t7zGh+y4hpYv2QKxLq7FH8YL
	 Zd8AiocWxyP2tMPS6I7AFdm9xA8kYRhmOdZAk8lleW4V/HQE8mUXo2+K19T4v/PKkA
	 2yXolH9swS88P8UGXlcSy4kLAorfnsk/jRjFcksLsLT1xumg9kUqcP6SC05hzmr7gI
	 eiGiUxX6UTFssbPKgrl9xCr4af8B0eKJ0p1m4rkbTIQ9A0ZKljBpo1Y6Okw8ADkpbA
	 pAuhMXoc9IBTUw0HrL2TCDF3uvXsZguIW8Udf8YhgOhfMgYWb6/zUCuQvX1wxkMFIb
	 hJFo7Q7D4ZWhw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AB6360683;
	Fri, 14 Aug 2026 19:59:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C854423F
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 19:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE69480BA4
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 19:59:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ihl18LgYqimt for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 19:59:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 59817811D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59817811D2
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 59817811D2
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 19:59:07 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MDhlf-1wkD5r2xkd-008T39; Fri, 14
 Aug 2026 21:59:04 +0200
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Nathaniel Roach <nroach44@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Fiona Klute <fiona.klute@gmx.de>
Date: Fri, 14 Aug 2026 21:58:46 +0200
Message-ID: <20260814195856.3295644-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:s/qnhx0vV6KdOUFEN3V/H+qdS5G78HSn7D4oMZXyTUrMYD0GLVv
 WAegGeuS1ZFfEb2zHdy3T74ADMG7BKpU+AYRyGS5Pak/dqhuJWW2MUSCm/jg9MMu2I3vm5h
 XCa7o4JB4Xl5eQeywuRelIQfGPUpTcPK+PV7GQbrmZLKDnKGyOC9/BoSftvjVKxcMWVPbv5
 qon0R2BtbfFVIt/qrmQaw==
UI-OutboundReport: notjunk:1;M01:P0:32ejqWJ+bJo=;I9JwGjOVVIeuPW/r4izwYHrXgOr
 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
 m/YV6+AQYl53IxCg==
Subject: [Buildroot] [PATCH 00/10] Replace all wiki.gnome.org URLs
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

wiki.gnome.org has a big deprecation warning saying "All information
on this site is out of date and should not be used." I got annoyed
some package descriptions still had such links, so this series
replaces them: mostly with Gitlab links, in two cases with listed
project websites.

Side note: package/gstreamer1/gstd is the last package using
package/libsoup (as opposed to package/libsoup3), if that would be
updated we could get rid of package/libsoup.

Best regards,
Fiona

Fiona Klute (10):
  package/at-spi2-core: update project URL
  package/gvfs: update project URL
  package/libgee: update project URL
  package/libgudev: update project URL
  package/libpeas: update project URL
  package/libsecret: update project URL
  package/libsoup: update project URL
  package/libsoup3: update project URL
  package/cantarell: update project URL
  package/rygel: update project URL

 package/at-spi2-core/Config.in | 2 +-
 package/cantarell/Config.in    | 2 +-
 package/gvfs/Config.in         | 2 +-
 package/libgee/Config.in       | 2 +-
 package/libgudev/Config.in     | 2 +-
 package/libpeas/Config.in      | 2 +-
 package/libsecret/Config.in    | 2 +-
 package/libsoup/Config.in      | 2 +-
 package/libsoup3/Config.in     | 2 +-
 package/rygel/Config.in        | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
