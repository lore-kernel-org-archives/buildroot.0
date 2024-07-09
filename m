Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 744ABC3DA41
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 11:45:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2949680EBB;
	Tue,  9 Jul 2024 11:45:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VHy7sk_rVkwW; Tue,  9 Jul 2024 11:44:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D36081A23
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D36081A23;
	Tue,  9 Jul 2024 11:44:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 732A21BF59A
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 11:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B0DD4027C
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 11:44:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rNqX1DU0Tlke for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 11:44:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.121;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E8978401FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8978401FB
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.121])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E8978401FB
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 11:44:56 +0000 (UTC)
Received: from unknown (HELO opfedv1rlp0d.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 13:44:54 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0d.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Jul 2024 13:44:54 +0200
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 13:44:52 +0200
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Tue, 09 Jul 2024 13:44:51 +0200
From: yann.morin@orange.com
X-IronPort-AV: E=Sophos;i="6.09,194,1716242400"; d="scan'208";a="167284415"
Date: Tue, 9 Jul 2024 13:44:51 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Message-ID: <Zo0is1FyTmzcIPbi@tl-lnx-nyma7486-2>
References: <20240704101631.1860647-1-fiona.klute@gmx.de>
 <20240708235339.5dbf3da4@windsurf>
 <42d13dfb-0ac3-4939-b50b-a4187df30e89@gmx.de>
 <20240709120659.60e32214@windsurf>
 <f93e8075-a773-4d47-b6fe-04bb714b06db@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f93e8075-a773-4d47-b6fe-04bb714b06db@gmx.de>
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX303.corporate.adroot.infra.ftgroup
 (10.115.26.12) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1720525497; x=1752061497;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=+jdwuXxCxOdkepPX2buCRGjquh+DkLbs61Q0z6RyMPE=;
 b=X9YQMomYcMbp6ympTVplwgahxnG/m3ACzy7C5pNlFWSGCmkYoa10t0Dw
 atNgu+eRidW2PSgchFdX1QUI2a3ZVRB9ErfABWmhl2oiHV3NV02tMy4Bk
 ime/wGozRxFECHIHceEfOJXpl7K/ywc3eFLRdgAJFm4cB3s/53vXzJ1RF
 t17boGuuROljDnSlAgGqr7wdb3pVyIAFHgfHX8Gop1ovPsN2D65DKpsHi
 FR8XDGXdB0mMvNqYvlP3D7vQP4HI3wU9FIincuc39dhtAzmUbQ0/Hw/Qu
 dImZlfIrWGRgipGGPFjbu5PhSvMrWzLlKue8RnNLDz9Sy22ICYY4Qe+QY
 Q==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=X9YQMomY
Subject: Re: [Buildroot] [PATCH v4 0/3] Refactor OpenSSH init.d script
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fiona Klute via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fiona, All,

On 2024-07-09 13:31 +0200, Fiona Klute via buildroot spake thusly:
> Am 09.07.24 um 12:06 schrieb Thomas Petazzoni:
> > Hello Fiona,
> > 
> > On Tue, 9 Jul 2024 11:55:56 +0200
> > Fiona Klute <fiona.klute@gmx.de> wrote:
> > 
> > > The script is functional, but the use of long options was intentional
> > > for readability and I'd rather have it preserved. Having existing
> > > scripts in a hard-to-read style doesn't seem like a good reason not to
> > > be more explicit in new/updated ones [1]. That was the reason for the
> > > question (and patch) about which Busybox options I can rely on when
> > > writing init scripts.
> > > 
> > > Regarding the added "-q", if a start (stop) command fails because an
> > > instance is already running (not running) with the current version you
> > > only get "Starting sshd: FAIL", while with my version you'd see the
> > > *reason* in start-stop-daemon output. That seems important to me. I only
> > > had "-q" in the reload function because the "stopping" output of
> > > start-stop-daemon (when it's actually just sending a SIGHUP) seemed like
> > > it might confuse someone.
> > 
> > I'm fine with both, but then I think the documentation and the
> > canonical example it refers to should be fixed first. This is how we
> > declare what is the "right" way of doing things. Otherwise, we'll keep
> > on using these as a reference for all future scripts, and we don't have
> > a reference point that tells us how things should be done when fixing
> > existing scripts or adding new ones.
> 
> Makes sense, I'll try to update the reference.
> 
> Is there some way to get an asciidoc
> "include::package/busybox/S01syslogd" to work instead of copying the
> code into docs/manual/adding-packages-directory.adoc (as it is now, and
> not exactly identical)? It seems like the path is resolved relative to
> $(OUTPUT)/docs/manual instead of the source, I didn't dig into the
> Makefiles enough to see why yet.

This is so that "documents" can have generated parts. This can be
achieved by defining [DOC]_POST_RSYNC_HOOKS, similar to what we can do
for packages. For the Buildroot manual, you could add such a hook to
copy what you need.

Note that you can't include a file from a code-block in asciidoc, so
you'll probably have to generate proper asciidoc, something like.

    define MANUAL_INIT_SCRIPT_REF
        { \
            printf '---\n'; \
            cat package/busybox/S01syslogd; \
            printf '---\n'; \
        } >$(@D)/S01syslogd.adoc
    endef
    MANUAL_POST_RSYNC_HOOKS += MANUAL_INIT_SCRIPT_REF

And then you may include::S01syslogd.adoc

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
