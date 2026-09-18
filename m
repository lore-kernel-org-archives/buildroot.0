Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A08C982D2
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 04:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82DA640AE8;
	Fri, 18 Sep 2026 04:45:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GAq3t33ajaaN; Fri, 18 Sep 2026 04:45:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9BA9340AE6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789706754;
	b=RZF3i7Kv/juj6wot3U5QtIqPoH36vWJMuCSeVZCeAzo4e+HXlsoxpaPxxv6YZwIv7mKy
	 poY/hrH+BPbJrhLpvhupnMgMLDM0BuiayQlHmsxrnEyidAvkBD7lbqb7cO833fVkh5QWY
	 l6UL800OQkX/h+iNrEPvRlfcPD+f5QCnLfkK01ZLPY+7iavX13TJva78FMqYnYX0Ki1D1
	 QVsWch23O3xTZ01i59sshqItjtS2FheFB1+MN5krBz/R9lmNEg7YvJnnStJT+ulWMQcW6
	 eAUETxL0ZFdKuAHBG2LYbwiWumLuDDjDc1rUYheetlLwCMqRf0S3btS1U6nA7dZpF2w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789706754;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:Received:Received:
	 Received:Received:X-CSE-ConnectionGUID:X-CSE-MsgGUID:X-IronPort-AV:
	 X-Amp-Result:From:To:CC:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Patchwork-Hint:X-Originating-IP:X-ClientProxiedBy:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=x8cTlk2AWdGhfGqgdfZs3YzF7+WmdBndVZpTlAU+OJ8=;
	b=ZlISPQPcIK+bRlN2mTIj6RZ4R8uMSbiIw/xUzlfo8C9akAltn/6J5YksFUeGdA4XJrbs
	 s0Ml+xbZQT+SmmWV1RHK9BGS1VgvI9ecpfUARrMfny4ifwmfcCzX6ig672rFKE71HY1bW
	 Xrq7eaBkbeuUqkOfgsS0q1F4lLw/Z/L0lVXCGTt4gKFzOvl+aXAs1Ij5SpBgMPHwAmX1f
	 OJtyh5ckjEhikXH8XlR/V18ka/84VQ+/cY2QfTTi0L2XifPcooUX2+zYruMekMNQInA/z
	 X4zISTijFXmcOjvVfc3um2xbTqTziHApvDpkYO82xkkdvIHa4miQworiAeKTVq+F+YA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789706754;
	bh=x8cTlk2AWdGhfGqgdfZs3YzF7+WmdBndVZpTlAU+OJ8=;
	h=From:To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=j1YNvCAfcuquz1m3801WCKdu63kwvUPdogeZXTckA2RfxIL3SV7pWE6U6TZ77XI2p
	 1+rtytTgT0dXCfK+4KC99IkUcKx7FZQ+S9NPtcoBC6/DZO3Bk+eEYrIOHhMaDC5lSz
	 3gtaWL3PZKYwp4bl6ZZK1CW3k3zXWvv7ktSau9AIDf7kqszv6vXBr3swAQMBZF7Xau
	 0Ol38f8aMuaQP36qXVt/v1xbBdzB3XykQgcYgGkKvi34xvMGecDa+2UMDRLRjiwqL1
	 HKV5B5KeRgIYhXSUqR1IwZo5R91nQ8y55Nfme47M/H7DqYPbF4Da+538Azwq94Jc/i
	 yYzDYf3ipuZ/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BA9340AE6;
	Fri, 18 Sep 2026 04:45:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CA053AF
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 04:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A13B81183
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 04:45:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2XGlI0khmAii for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 04:45:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 01F4381182
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=80.12.126.238
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789706751;
 b=Q0gMWqPF3YjKJ9lgNx9vw3EgQsaeHnpkOUB9BEHVvPmIxXh9Q/j1Kz1Ol0hqtQJwLT3A
 osmYlV7TIobqxAZUH5kaARvUwg1KqEp45vQADQtusUYXJI3wkgA3pS/V39smyI+gBDj0s
 yupBEYEbEb82Z6qczOpKJzPtvYP/62W8vS9iuqkwgqhAfe6YEWrYhmZHIsWcHxXBk6MtM
 aD7TEAb+CwQCjfT4MpIg2wTprHt5z0i7alqeJR3CiCH5tTDFGrSirQdb9k2xkKniZrFu6
 QVaa/X+oUyB2ZQy/J5c2e6sjwiAOSWui/pJw2wqFhJSUwia37X5r3UemcrlVezRRLmg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789706751;
 h=Received-SPF:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
 Received:Received:Received:Received:X-CSE-ConnectionGUID:
 X-CSE-MsgGUID:X-IronPort-AV:X-Amp-Result:From:To:CC:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:X-Patchwork-Hint:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding;
 bh=iVh4cLcbOh1bNE1TFmucWFlkOficF6bnv+FU3GeYCHs=;
 b=c+9HcD7PKLdz2A9oUtjuYHolehv2w7nNQWczMVcKo7Nms/b2cE2LLGYzKGPXlL/14xnN
 w36jfJdkrEMSEhLvNttFX/9WEhn7VG92BA/kF8g2Onx0xtg0PeI8PE2knaj4pwYAr7Hln
 DNbablxh1jTiKpaNVXOuNzzz5CFLJRUgKqqDuhSsNYwn8xwgbkXegaIbjbeqPrTHIXZ1o
 WU1otobrE1GaENAFdfTlic9wDqT5Eq9wRUfX8AcxIGb+ebAp90tdP28+4W7D7H4c6BPL7
 FrnukH4VcCMDKzJLdjs6pIRKoADlyiNT1VMKfYDO0M18BT6K+xU26suLlR/WQPov36A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=orange.com; 
 dkim=pass header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b="Yof/SuYY"; 
 arc=none smtp.remote-ip=80.12.126.238
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.238;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=orange.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=Yof/SuYY
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.238])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 01F4381182
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 04:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1789706751; x=1821242751;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iVh4cLcbOh1bNE1TFmucWFlkOficF6bnv+FU3GeYCHs=;
 b=Yof/SuYY3FUCMpJ8IGN3Z6vtsap7AyWwIqS9o6J8xFJ8CdixcEC4tSs9
 vMwckDt6aafocVLM+WCPIDqWOEK9/eslfBedlMMRnLQTDs94n+d3UPbiw
 b1mLZGSgUfaJYDBfpwlI0CgeEn20TIcN/g7yU4DIqrALaw8G3ol9DD6pF
 hHGjrk3/Js3NRoi8WGMEYIACW6/SaEIR5KSY6hVEZv741wotEH9klevO/
 4PnvhU0GGUsnw2rxhIxXFayMeweliydGYVPxJWtNGWD7ep1/SphhCkgIX
 59G1LNbzKJvO3ONnSni2Xio2NOV811Ag66/IW8gsYC6uN0QZaCavkYfEM g==;
X-CSE-ConnectionGUID: cSRqYchcR8yZwvFAIHIj9g==
X-CSE-MsgGUID: CFf6yPjTRiub0Bq00gTDtg==
Received: from unknown (HELO opfedv3rlp0f.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 18 Sep 2026 06:45:48 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0f.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 06:45:47 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49;
 Fri, 18 Sep 2026 06:45:46 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Fri, 18 Sep 2026 06:45:45 +0200
X-CSE-ConnectionGUID: 9BHEI4J5SlWfGnjgRyM/Hw==
X-CSE-MsgGUID: mixqzu81RFORxCkP3ae2dw==
X-IronPort-AV: E=Sophos;i="6.27,103,1787004000"; d="scan'208";a="469705784"
X-Amp-Result: SKIPPED(no attachment in message)
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: Vincent Fazio <vfazio@xes-inc.com>, "Yann E . MORIN"
 <yann.morin@orange.com>
Date: Fri, 18 Sep 2026 06:45:45 +0200
Message-ID: <cover.1789706718.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX606.corporate.adroot.infra.ftgroup
 (10.115.27.30) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
Subject: [Buildroot] [PATCH 0/2 v2] support/size-stats: actually handle .pyc
 files
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

Hello All!

This small two-patch series properly associates .pyc files to the
corresponding package, to account for the PEP 3147 layout.

[This is a resend of v2, which did not end up on patchwork.]

Changes v1 -> v2:
  - use python's cache_from_source() instead of open-coding the
    path  (Vincent)


Regards,
Yann E. MORIN.


The following changes since commit 2ca7fb5e7bf7b416b72faf709bf1220eef0dc352

  package/wpewebkit: fix build with CMake 4.4 (2026-09-17 17:10:35 +0200)


are available as patches in this mail series,

for you to apply patches up to 71588ea1ac7d7cc7f5f5f30fcb9c02e84ec12ccd

  support/scripts/size-stats: properly assign pre-compiled .pyc files (2026-09-18 06:34:49 +0200)


----------------------------------------------------------------
Yann E. MORIN (2):
      support/scripts/size-stats: prepare for more .py associated files
      support/scripts/size-stats: properly assign pre-compiled .pyc files

 support/scripts/size-stats | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

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
