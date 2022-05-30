Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F24F2C433F5
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 08:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D0A26115B;
	Mon, 30 May 2022 08:43:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LSD9yuKni4TT; Mon, 30 May 2022 08:43:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96FFF61158;
	Mon, 30 May 2022 08:43:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 507C61BF473
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 08:43:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3EBC14198A
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 08:43:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Azhc8N8pP3uF for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 08:43:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 178F2418AD
 for <buildroot@buildroot.org>; Mon, 30 May 2022 08:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653900231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mEauP80QluOs9sFrWZsRiUh3/2MM0zSHgUoMf7aa5FA=;
 b=J5sv32e7gc5pOCd/Kg1AvrLp9Kr+JIXuTWvS25WvZK0Kc9/x4/rMpekqGP/MSlt9jhjrDf
 hi9uDN061XHYJ6O0pi3CJBxTiidCnAPVsJcegDCAP4XiW8XO3yT6DklZERjDBeQLQEFezf
 To5IKFGFqqNXPqWUCcP9BmvOvqNaC5Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-149-IABUn4iPOLyHcrwel_c5JQ-1; Mon, 30 May 2022 04:43:46 -0400
X-MC-Unique: IABUn4iPOLyHcrwel_c5JQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC2921C08960;
 Mon, 30 May 2022 08:43:45 +0000 (UTC)
Received: from localhost (unknown [10.39.194.233])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C15641136E0;
 Mon, 30 May 2022 08:43:44 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <huth@tuxfamily.org>, buildroot@buildroot.org
In-Reply-To: <20220529165616.767186-1-huth@tuxfamily.org>
Organization: Red Hat GmbH
References: <20220529165616.767186-1-huth@tuxfamily.org>
User-Agent: Notmuch/0.34 (https://notmuchmail.org)
Date: Mon, 30 May 2022 10:43:43 +0200
Message-ID: <87a6azv29s.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Buildroot] [PATCH] package/kvm-unit-tests: Fix build on big
 endian aarch64 targets
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
Cc: Cyril Bur <cyrilbur@gmail.com>, Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, May 29 2022, Thomas Huth <huth@tuxfamily.org> wrote:

> When building with BR2_cortex_a76 in big endian mode, the build of
> the kvm-unit-tests is currently failing since the "--arch" option
> of the configure script is not set right. We also have to look at
> BR2_aarch64_be in this case to get this initialized properly.
>
> Fixes: f7228dadd371 ("package/kvm-unit-tests: add more arm support")
> Signed-off-by: Thomas Huth <huth@tuxfamily.org>
> ---
>  A failing build log can be seen here, for example:
>  http://autobuild.buildroot.net/results/760f43a2780b78c753e6b5d631cb744db896f575/build-end.log
>
>  package/kvm-unit-tests/kvm-unit-tests.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Ah, I had only tested LE, sorry about that.

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
