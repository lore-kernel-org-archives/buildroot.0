Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE5ECC4332F
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 16:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 371D740632;
	Sun,  6 Nov 2022 16:21:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 371D740632
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pfk18_94hBZR; Sun,  6 Nov 2022 16:21:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D725404E9;
	Sun,  6 Nov 2022 16:21:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D725404E9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 79EE81BF32A
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 16:21:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51D92400E7
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 16:21:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51D92400E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mBtqVE_39-wU for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 16:21:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DB6C400B8
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5DB6C400B8
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 16:21:51 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id k4so5977491qkj.8
 for <buildroot@buildroot.org>; Sun, 06 Nov 2022 08:21:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2AKafCyfmAKegUEhNzrolANhvq27jR+U2qbDXWqD5t4=;
 b=lhPs1GnUg/bxeMj8guQNA4bCQISOPqLTLFiTaSI/zi2kaO8QVMAowaaUGGQE+/J2ph
 tam8EROxFhrb80cQi7I2GAgaTglTYrdT4uLu+B5QJH7AeOV/cOHPaYpPUu++QE4EnWeT
 DW9Yzl8Pafx26HhKwkkmLNZuYOLlxbeabR9vT1c5MQpcYRmMYkIuFfb6cCRudm3mxJC6
 X0lafu+gVQ+Z8fwKdeCyOK0BQ63fbyM/D70iKxDU1zgGOsjLbudRzWwnxH+1bfac7BYm
 P1RIVHIvJzTRRKvEWNmlGChf74rEzcKthMtn2M3xyueWyqWQ//kJjQcc0Afnt2vz3GlQ
 mJ6Q==
X-Gm-Message-State: ACrzQf3wWD5qeo9FKRBR1ggia0WxkegTh8v2reaJiVl5VN7Q4c6OZlqt
 3WTlOrpJrjk+Qe3GIJM3G8d3K2VhzYE8XZCGQmo=
X-Google-Smtp-Source: AMsMyM65hxIlDjqfnDNH6247gsEscLYTPlkp1C31aePC9CpSIMWONPoCk0TxlFCADkdYRNs4nPl9QYNc/MVLUx7Kd/w=
X-Received: by 2002:a05:620a:34a:b0:6fa:1d53:9529 with SMTP id
 t10-20020a05620a034a00b006fa1d539529mr30684702qkm.639.1667751710076; Sun, 06
 Nov 2022 08:21:50 -0800 (PST)
MIME-Version: 1.0
References: <10881_1666122188_634F01CC_10881_33_1_cover.1666122184.git.yann.morin@orange.com>
In-Reply-To: <10881_1666122188_634F01CC_10881_33_1_cover.1666122184.git.yann.morin@orange.com>
From: Norbert Lange <nolange79@gmail.com>
Date: Sun, 6 Nov 2022 17:21:38 +0100
Message-ID: <CADYdroO7gJybDDV+oBqwOEHyHptKcdqnetBKTQ-tVHQkHUAUuQ@mail.gmail.com>
To: yann.morin@orange.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2AKafCyfmAKegUEhNzrolANhvq27jR+U2qbDXWqD5t4=;
 b=BeWf9cyeyGZTmuvjAz3izYo0q5bZBGrnWL+7efAHp8O+5Xw0tGAkrdAyVbdrhyYhtd
 wC0kSFXbg0oDaOJnH/htLsu9AVVJV9XaIaLr5BR6UzymrOZGb5tUBpkEsNY33cYcHtfz
 icQ3I1niIKRlxae693VHhJ4uWUk0+x9lK+7JWKwyypIm5n6qfufT/C2xh3O/CKXmaHLj
 VhR3tc4idsX7Wjne+l9Kr47zB75IBne67xh3WaNXIDdM+UfceIp0da6g0GLc59Gcu3uB
 0n2IVIHYZwVsHs+VolVQGTOZ84zKty19O7sbwAU9+4TqZixShaGB91H2UF4oIEa6FWHl
 k32Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BeWf9cye
Subject: Re: [Buildroot] [PATCH 0/6 v3] systemd: sort out the conflict
 between var factory and tmpfiles
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
Cc: =?UTF-8?B?SmXMgXJlzIFteSBSb3Nlbg==?= <jeremy.rosen@smile.fr>,
 Romain Naour <romain.naour@smile.fr>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Di., 18. Okt. 2022 um 21:43 Uhr schrieb <yann.morin@orange.com>:
>
> Hello All!
>
> This six-patch series touches on the delicate intricacies of the systemd
> package and how we integrate it in Buildroot, especially with regard to
> read-only filesystems.
>
> The underlying issue is that systemd wants a writable /var filesystem
> (it will store a bunch of things at runtime in there). A lot of packages
> also expect a writable /var.
>
> The solution we implemented in Buildroot is to generate a factory for
> /var, and register that as tmpfiles, at build time, and mount a tmpfs on
> the then-empty /var at runtime, so that systemd-tmpfiles populates /var
> on boot. Having a tmpfs means /var is repopulated from a clean state at
> each boot, and people who want a persistent /var have to provide their
> own mechanism to mount their actual filesystem instead.
>
> However, for some people, this does not seem to work as expected, so we
> introduced a call to systemd-tmpfiles at build time, to pre-populate the
> rootfs from all the tmpfiles, of which our var factory, at build time,
> entirely leaving them the reponsibility to make /var read-write.
>
> These two mechanisms clash with each others; they do not prevent a
> system from booting, but they cause files to be duplicated between the
> factory and the pre-populated /var.
>
> To solve the issue, this series introduces new options, so the user can
> elect to use either, none, or both mechanisms, as they see fit.
>
> The first two patches make it easier to change the location where /var
> is nounted from, by making it a systemd mount unit, rather than use the
> legacy fstab, and move the factory to /usr/share as it is a system
> factory (/etc is for the administartor to provide overrides).
>
> Then we move together the two mechanisms under the auspices of a common
> package, to make it easier to later make them conditional.
>
> Then we introduce those two new options, that drive each mechanism. We
> make sure the behaviour so far is kept, for those who have setups that
> are functional as is.
>
> Eventually, we add a new way to provide a writable /var, which uses a
> pre-populated /var on which an tmpfs is overlayed with an overlayfs.
> This new feature still uses a tmpfs as the writable part, and like for
> the factory case, leaves to the user the responsiility to provide for a
> persitent filesystem should they need one.
>
> This series would not have been entirely possible without the input from
> Norbert, who provided the basis for the overlayfs-based solution.
> Thanks!
>
> Changes v2 -> v3:
>   - introduce the overlayfs-based proposal from Norbert
>   - some rewording
>   - some typo fixes (yah, Yann being Yann being me...)
>
> Changes v1 -> v2:
>   - split Yann@work initial patch into the first two patch
>   - move the systemd-tmpfile handling to the skeleton
>   - introduce options to enable/disable factory or systemd-tmpfiles
>
>
> Regards,
> Yann E. MORIN.
>
>
> The following changes since commit 5b5d3befef9c92a7485c1c68989d95749882ee2a
>
>   package/python-django: security bump to version 4.0.8 (2022-10-17 22:37:25 +0200)
>
>
> are available as patches in this mail series,
>
> for you to apply patches up to b3efa290e26b85b54ab27728bf190316cf2ab1ee
>
>   system: add option to use an overlayfs on /var on a r/o root w/ systemd (2022-10-18 21:37:43 +0200)
>
>
> ----------------------------------------------------------------
> Yann E. MORIN (6):
>       package/skeleton-systemd: move /var factory tmpfiles out of /etc
>       package/skeleton-systemd: systemd-ify mounting /var tmpfs with ro rootfs
>       package/skeleton-systemd: host the tmpfiles preparation script
>       system: add options for /var factory and tmpfiles pre-seed
>       system: introduce a choice for /var management
>       system: add option to use an overlayfs on /var on a r/o root w/ systemd
>
>  package/skeleton-init-systemd/factory/var.mount    | 18 ++++++
>  .../fakeroot_tmpfiles.sh                           |  0
>  .../overlayfs/rootfs-bindmount-var.service         | 21 +++++++
>  package/skeleton-init-systemd/overlayfs/var.mount  | 15 +++++
>  .../skeleton-init-systemd/skeleton-init-systemd.mk | 36 ++++++++++--
>  package/systemd/systemd.mk                         |  6 --
>  system/Config.in                                   | 67 +++++++++++++++++++++-
>  7 files changed, 150 insertions(+), 13 deletions(-)
>  create mode 100644 package/skeleton-init-systemd/factory/var.mount
>  rename package/{systemd => skeleton-init-systemd}/fakeroot_tmpfiles.sh (100%)
>  create mode 100644 package/skeleton-init-systemd/overlayfs/rootfs-bindmount-var.service
>  create mode 100644 package/skeleton-init-systemd/overlayfs/var.mount
>
> --
>                                         ____________
> .-----------------.--------------------:       _    :------------------.
> |  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
> |                 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
> | +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
> | yann.morin (at) orange.com           |_="    ,--' | / \ HTML MAIL    |
> '--------------------------------------:______/_____:------------------'
>
>
> _________________________________________________________________________________________________________________________
>
> Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
> pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
> a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
> Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.
>
> This message and its attachments may contain confidential or privileged information that may be protected by law;
> they should not be distributed, used or copied without authorisation.
> If you have received this email in error, please notify the sender and delete this message and its attachments.
> As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
> Thank you.
>

Hello Yann,

you did not cc me for
[PATCH 5/6 v3] system: introduce a choice for /var management

I would choose the world NONE instead of CUSTOM,
as that is what buildroot does with /var.

Later we could offer CUSTOM by for ex. only providing a var.mount
file, that expects a user-specific mount or similar.

+config BR2_INIT_SYSTEMD_VAR_NONE
+ bool "do nothing"
+ help
+  Choose this if you have custom dispositions (like a
+  post-build, fakeroot script, systemd units, or initramfs)
+  that prepare /var to be writable on a read-only rootfs.


but take my

Acked-by: Norbert Lange <nolange79@gmail.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
