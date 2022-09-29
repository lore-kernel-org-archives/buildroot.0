Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CCA5C433F5
	for <buildroot@archiver.kernel.org>; Thu, 29 Sep 2022 18:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B8FB41A3B;
	Thu, 29 Sep 2022 18:04:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B8FB41A3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1uEOGjFLG8Mr; Thu, 29 Sep 2022 18:04:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1981841A08;
	Thu, 29 Sep 2022 18:04:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1981841A08
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 13C1B1BF3F3
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 18:04:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E175741A08
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 18:04:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E175741A08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8Ud-Ym_rDVuc for <buildroot@lists.busybox.net>;
 Thu, 29 Sep 2022 18:04:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BF0D41A05
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [208.88.110.44])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5BF0D41A05
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 18:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.savoirfairelinux.com (Postfix) with ESMTP id 9DDA39C0BB9;
 Thu, 29 Sep 2022 14:04:35 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id QxKxqXeWOBVJ; Thu, 29 Sep 2022 14:04:35 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.savoirfairelinux.com (Postfix) with ESMTP id F1AFB9C0BC4;
 Thu, 29 Sep 2022 14:04:34 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com F1AFB9C0BC4
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id JXsd3TFcoVoA; Thu, 29 Sep 2022 14:04:34 -0400 (EDT)
Received: from j1-slave-ryzen-3900-indu.sfl.team (unknown [192.168.51.254])
 by mail.savoirfairelinux.com (Postfix) with ESMTPSA id CED9E9C0BB9;
 Thu, 29 Sep 2022 14:04:34 -0400 (EDT)
Date: Thu, 29 Sep 2022 14:04:27 -0400
From: Thomas Ballasi <thomas.ballasi@savoirfairelinux.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Message-ID: <20220929140427.2aa8978c@j1-slave-ryzen-3900-indu.sfl.team>
In-Reply-To: <ec9bdbc9-3958-21f1-bfc0-82c29138f17f@benettiengineering.com>
References: <20220922214512.2098221-1-thomas.ballasi@savoirfairelinux.com>
 <ec9bdbc9-3958-21f1-bfc0-82c29138f17f@benettiengineering.com>
Organization: SFL
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
 t=1664474675; bh=6stRZrgfhIp0mvQMQAUUJbKUXglKWPsoK0Ev3KfF5CI=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=DY8alLojTM8VWpcf4Vbe9uh6TWFDZ04QCXz69G4yQfuKr8tuzVOEtjXONjLZLmZYM
 w/ipKXIDfcG6TSfCvj7YoSvhGmfjAAx4xsRMDC31OEezkdqQhsq3Y5C+BksPiwW2uy
 i6CeCKcFuqVvOdT4prQIhOajsxxuJVhFRhsdaGTFcHOCMx1bLgVgyFgYRgnp3iK2+G
 E7eLTr3YhGpV8adDVVGM5jPCHKEYGVqYmq9DQTFe1OMVramScRkWQxMaIBKm6dHEwH
 IdmoPqeHials4hqX5IDkCy6govGsiJ24kFm7VmnK+pS5ddmAL4kqx50+F9HeFTCWDF
 pgyppiHvO9lTw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=savoirfairelinux.com
 header.i=@savoirfairelinux.com header.a=rsa-sha256
 header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=DY8alLoj
Subject: [Buildroot] [PATCH] package/qt5/qt5webkit: fix generated artifacts
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
Cc: Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Giulio,

On Thu, 29 Sep 2022 12:43:22 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> > Generated artifacts of the installation process were wrongly
> > located, causing packages using qt5webkit (qt-webkit-kiosk and
> > python-pyqt5) to fail at build time. The changes aims at fixing
> > this issue.
> 
> "The changes aims at fixing this issue." should be:
> "Let's add a patch that:"

This isn't necessarily true. While the patch answers points 1 and 2,
the third one isn't really affected by it. I will try to rephrase the
message for more clarification as the way I phrased it is ambiguous,
thanks.

> What is the upstream status of this patch? Can you point here the URL
> of the pending patch?

This patch isn't pending for merge in the qt5webkit repository for the
reason that it may break other projects. At first, I made this patch to
counter the use of CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT, which
CMake's documentation seems to imply that it cannot be set by the user
but is set automatically by CMake, which leads to the unwanted
behavior. The patch makes it as if it was ON specifically for buildroot.

I reckon that it may be bad practice to create such patches, so I just
checked whether or not this variable can be set via CONF_OPTS and it
seems it can, leading to the same working behavior (it also doesn't seem
to be set in CMakeCache by CMake if not manually added).

I also made sure setting this variable doesn't have any potential side
effects as it is only used once in the case inside the patch.

Therefore, it seems to be a better fit to set INITIALIZED_TO_DEFAULT's
value in CONF_OPTS rather than bypassing its usage inside a patch. This
has been replaced.

> > More info @ https://bugs.buildroot.org/show_bug.cgi?id=14606
> 
> Here ^^^ it should be:
> Fixes:
> https://bugs.buildroot.org/show_bug.cgi?id=14606

Done!

> Also here please add:
> '[Upstream status: URL of this pending patch]

Patch is replaced, ignoring.

> The patch works correctly, so with commit log improve and the local 
> patch with Upstream status pointed:
> Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
> Thanks for contributing!
> 
> Best regards

Thanks a lot for the constructive review! I will send a v2 asap.

Kind regards,
Thomas Ballasi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
