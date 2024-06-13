Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B776CC27C4F
	for <buildroot@archiver.kernel.org>; Thu, 13 Jun 2024 13:16:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64515605C7;
	Thu, 13 Jun 2024 13:16:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o1mqj2wxYhbm; Thu, 13 Jun 2024 13:16:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BA2160F08
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BA2160F08;
	Thu, 13 Jun 2024 13:16:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3F4EF1BF34C
 for <buildroot@lists.busybox.net>; Thu, 13 Jun 2024 13:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D7AA60F08
 for <buildroot@lists.busybox.net>; Thu, 13 Jun 2024 13:16:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6EUfN9rdki-F for <buildroot@lists.busybox.net>;
 Thu, 13 Jun 2024 13:16:56 +0000 (UTC)
X-Greylist: delayed 431 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 13 Jun 2024 13:16:55 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 40FB7605C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40FB7605C7
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.239;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.239])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 40FB7605C7
 for <buildroot@buildroot.org>; Thu, 13 Jun 2024 13:16:54 +0000 (UTC)
Received: from unknown (HELO opfedv3rlp0a.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 15:09:42 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0a.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Jun 2024 15:09:42 +0200
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 15:09:40 +0200
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Thu, 13 Jun 2024 15:09:40 +0200
From: yann.morin@orange.com
X-IronPort-AV: E=Sophos;i="6.08,235,1712613600"; d="scan'208";a="159398189"
Date: Thu, 13 Jun 2024 15:09:40 +0200
To: Herve Codina <herve.codina@bootlin.com>, "Yann E. MORIN"
 <yann.morin.1998@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 <buildroot@buildroot.org>
Message-ID: <ZmrvlKDKqq6twZFe@tl-lnx-nyma7486-2>
References: <20240612-ppd-merge-b4-v2-1-81044690d046@collins.com>
 <ZmqDYG4BrrY7ybPI@tl-lnx-nyma7486-2> <ZmrtFMBU1ByWEsqh@bspbox.kirk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZmrtFMBU1ByWEsqh@bspbox.kirk>
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX408.corporate.adroot.infra.ftgroup
 (10.115.27.17) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1718284615; x=1749820615;
 h=date:to:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=ujCjrDCicr4dlt/rYKrCtJ+52WBz/Y2s7yAjwiy6HaA=;
 b=n+7BeOPBIruUuJ519+tT7f/Z0cjW+F/SyjKa21WguwHoKHXAPw3dzzVk
 KKUUYufbFsirKWRfyPdUutbNwlPynKgz/gPGFVLap20a5TbvfS4Q5RHii
 rxjCN7gXbICPVXflXhpR1QWCPqjGxCyNiY1Uhi8JR5yebUr2X4phFmfG3
 DejMVmTECbH5h4fKTcvG9A15S8yRTpOAQFXmaBDPnvySdU544gORluXox
 9+3OJXnyFKpUYZQN3UwIfUwUVl+icvjvV3biNXsiUiMhKEDvnQHRHM0YW
 Ww4C2U9DL58vGALtkosAeIYbQC0sdNoo5A52NvIN73q6s+WBhJGgjYF+b
 A==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=n+7BeOPB
Subject: Re: [Buildroot] [PATCH RESEND v2] ppd-merge: speed up
 per-package-rsync
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Brandon All,

On 2024-06-13 12:59 +0000, Brandon Maier spake thusly:
> On 2024.06.13 07:28, yann.morin@orange.com wrote:
> > On 2024-06-12 18:22 +0000, Brandon Maier via buildroot spake thusly:
> > > From: Brandon Maier via buildroot <buildroot@buildroot.org>
[--SNIP--]
> > > This only supports the 'copy' mode, which is used in the finalize step.
> > > The 'hardlink' mode requires specifying each source tree with the
> > > --link-dest flag but enforces a maximum of 20 trees.
> > 
> > I think that last sentence for the hardlink mode no longer applies with
> > this new iteration, since the hardlink case is no longer handled.

Ah, yeah, I got slightly confused.  "The 'hardlink' mode would require..."

[--SNIP--]
> This will get worse once your host-finalize patch is applied. As it will
> rewrite many files in output/host/ so they no longer match the
> per-package/ files.

Not my patch; it's from the other Yann (check emails ;-) ).

[--SNIP--]
> > The only results are dangling symlinks that are only valid at runtime
> > (e.g. [XXX]/staging/dev/stdout that points to ../proc/self/stdout).
> I tested this and it appears `diff` is printing errors because it can't
> find the symlink. But the symlinks themselves are identical, so this
> shouldn't be a regression.

Exactly, sorry if I was not clear: the symlinks are dangling the same
way both sides.

Regards,
Yann E. MORIN.

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
