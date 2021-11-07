Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A82E1C433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 08:45:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE81761374
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 08:45:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CE81761374
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6887C819D2;
	Sun,  7 Nov 2021 08:45:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BSCga-UaSB0N; Sun,  7 Nov 2021 08:45:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5F8C81919;
	Sun,  7 Nov 2021 08:45:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C00911BF3A8
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 08:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BCC2F402E5
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 08:45:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9woilgpFEvcO for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 08:45:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 75655402DF
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 08:45:10 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id A258820002;
 Sun,  7 Nov 2021 08:45:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mjdnV-0005wD-Hg; Sun, 07 Nov 2021 09:45:05 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20211106154525.910204-1-yann.morin.1998@free.fr>
Date: Sun, 07 Nov 2021 09:45:05 +0100
In-Reply-To: <20211106154525.910204-1-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sat, 6 Nov 2021 16:45:25 +0100")
Message-ID: <87sfw8bbhq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/tpm2-tss: fix build on host with
 setfacl
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
Cc: Yair Ben-Avraham <yairba@protonmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

s/with/without/ in the subject.


 > Since the bump to 3.1.0 in commit 470e2e9bc521 (package/tpm2-tss: bump
 > version to 3.1.0), the install is borked because it is looking for
 > programs at configure time, so it finds those on the host if they exist,
 > or do not find any at all, which can very well differ from what will be
 > present on the target.

 > But this is not totally unreasonable: there is no way, at cross-configure
 > time, for a package to find the tools that will be present at runtime.

 > All that can be done in such a case is to force the path to such tools.

 > However, in this case, tpm2-tss only uses setfacl if systemd-tmpfiles is
 > not available. If the call to setfacl fails, the install does not fail
 > (split on two lines for readability):

 >     @-$(call make_fapi_dirs) && $(call set_fapi_permissions) \
 >     || echo "WARNING Failed to create the FAPI directories with the correct permissions"

 > set_fapi_permissions is a macro that eventually expands to:

 >     (chown -R tss:tss "$1") && \
 >     (chmod -R 2775 "$1") && \
 >     (setfacl -m default:group:tss:rwx "$1")

 > So the call to setfacl will not even be ever attempted, because the
 > chown will fail first. Furthermore, it would look for the 'tss' username
 > and groupname from the host, which could differ from those on the
 > target.

 > So we can just fake the fact that setfacl is available.

 > As for the permissions, they are to be set on a directory that is in
 > ${runstatedir}, i.e. /run, which is a tmpfs, so there is no way we can
 > prepare them at build time. We'd need a startup script or systemd unit,
 > or proper systemd-tmpfiles support, either of which can be done in a
 > followup patch by an interested party...

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Yair Ben-Avraham <yairba@protonmail.com>
 > Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>

Committed after adding an autobuilder reference, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
