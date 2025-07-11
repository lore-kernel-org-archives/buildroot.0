Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C92C8303C
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CEB760F1D;
	Fri, 11 Jul 2025 10:46:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VvhQgnfAtoGp; Fri, 11 Jul 2025 10:46:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 751A760BBD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 751A760BBD;
	Fri, 11 Jul 2025 10:46:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E8DCB1E1
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:46:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA9DA82A28
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:46:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J3eU-8tuGwg6 for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:46:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.236;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2A80A8264A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A80A8264A
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.236])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A80A8264A
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:46:05 +0000 (UTC)
X-CSE-ConnectionGUID: 4RmAXijER12bUNZpqHsDcQ==
X-CSE-MsgGUID: ojbqyS5lSsCnEEj3dR0OOw==
Received: from unknown (HELO opfedv1rlp0f.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 12:46:02 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0f.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Jul 2025 12:46:02 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57;
 Fri, 11 Jul 2025 12:46:00 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Fri, 11 Jul 2025 12:46:00 +0200
From: yann.morin@orange.com
X-CSE-ConnectionGUID: FtreiaCzR3yScJTthq0p+w==
X-CSE-MsgGUID: M1HabwJRT3adEnWFiNfvHw==
X-IronPort-AV: E=Sophos;i="6.16,303,1744063200"; d="scan'208";a="308163336"
Date: Fri, 11 Jul 2025 12:46:00 +0200
To: Thomas Perale <thomas.perale@mind.be>
CC: <buildroot@buildroot.org>
Message-ID: <aHDraIU0IcOvOYkC@yd-6wlzhs3>
References: <20250711102103.91C5986353@busybox.osuosl.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250711102103.91C5986353@busybox.osuosl.org>
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX304.corporate.adroot.infra.ftgroup
 (10.115.26.13) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1752230766; x=1783766766;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=aHriqNsJKMPEgy6r16apQBba7c9AVMGgZ0BmC+wgRPQ=;
 b=c0f/xni5jrlQTFkuCZs/mGAu1zIgJ/2ZJp3eminN+LAcuEfgFROvmWSC
 lNgW9tIcznbpjWvMnOIqIoE3Dj/P9EVtkQLn5mvoWUBZvTnb1JnTj9qXb
 S0d92f+OZw6DR8Z0ZpDSBr3WscpVY/AS/Ce8xDju+1Sh6N2qUkGuF30gl
 I2gYIeAt/uSTyXdAcjkt/L2XgTUunY/8OBnhhias+hJKSjZ9LWRtvk4KC
 OF1Io1sQRDwdRgtoreuFuI4IE9WjZou30BjeMezb9EB6vGh/+sIMI9XMf
 9KSsQPtDAoSPDMcGcXnJPfLW5/4Fc53svd8Dd5/C2d00gECpQBb2MREcO
 Q==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=c0f/xni5
Subject: Re: [Buildroot] [git commit branch/2025.05.x] support/testing:
 enable lpxelinux for syslinux runtime test
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

Thomas, All,

On 2025-07-10 11:31 +0200, Thomas Perale via buildroot spake thusly:
> commit: https://git.buildroot.net/buildroot/commit/?id=5d6d1da5e4da4c4184e16b06c6f8deab9eb8217b
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x
> 
> The syslinux runtime test (which is in fact a build-only test) ensures
> that syslinux does get build at least once a week (via the gitlab-CI
> weekly pipeline). Runtime testing would need much more work, though, but
> nothing in syslinux is currently runtime tested anyway.
> 
> Reported-by: Julien Olivain <ju.o@free.fr>
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> (cherry picked from commit a6ddf2b91ddd037eaca947fdc99135f63fa0755c)
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Why was this patch backported to 2025.02.x and 2025.05.x?

Installing lpxelinux was only introduced in commit 48639f074c31
(boot/syslinux: add option to install lpxelinux), which is only on
master, and was not (and should not be) backported to any previous
release.

Regards,
Yann E. MORIN.

> ---
>  support/testing/tests/boot/test_syslinux.py | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/support/testing/tests/boot/test_syslinux.py b/support/testing/tests/boot/test_syslinux.py
> index 41152cde7e..17fe904263 100644
> --- a/support/testing/tests/boot/test_syslinux.py
> +++ b/support/testing/tests/boot/test_syslinux.py
> @@ -21,6 +21,7 @@ class TestSysLinuxBase(infra.basetest.BRTest):
>          """
>          BR2_TARGET_SYSLINUX=y
>          BR2_TARGET_SYSLINUX_ISOLINUX=y
> +        BR2_TARGET_SYSLINUX_LPXELINUX=y
>          BR2_TARGET_SYSLINUX_PXELINUX=y
>          BR2_TARGET_SYSLINUX_MBR=y
>          """
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
