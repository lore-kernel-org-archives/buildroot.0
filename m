Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A560C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 20:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37204415E1;
	Thu, 10 Mar 2022 20:38:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IkOPjqW-mIQG; Thu, 10 Mar 2022 20:38:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBB4E415D6;
	Thu, 10 Mar 2022 20:38:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BBD441BF331
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 20:38:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7EC94057F
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 20:38:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HEwz14TGJQ8y for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 20:38:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D685640154
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 20:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1646944721;
 bh=HFQXvnTMLlN8qqJQZlqPrSfRSrCWePsFT+tUhI3J+5g=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=NKpVrZnzd5y/9fADZYBjq2wjK5j5eRTCNqteYxQ3rHxbf30Gm0D7BrAlV2sWEQ8bQ
 SgU7rg7IcXsC2dE+jKUM8mW/Ro9SCLZ+2MSow8LCoRn2hjq3rynb6kElTjRDFwdXZs
 KYcyMYpg+o3xQQOUAq9BMuGZXtJV0O2IlNaFfzRM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.204]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MxDkm-1oLV972sGm-00xdMr; Thu, 10
 Mar 2022 21:38:41 +0100
Date: Thu, 10 Mar 2022 21:38:40 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: John Keeping <john@metanate.com>
Message-ID: <20220310213840.32655ec7@gmx.net>
In-Reply-To: <20220310140350.1955655-1-john@metanate.com>
References: <20220310140350.1955655-1-john@metanate.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:pmGZq8SP2TDI0j56g1jYP4cvhreNkn2NjgKkbxU+Dn7rKoxFwvW
 cGL3h2hUVZJVcbvBkfvT6tgOFaChBT4bmjUmDapCwqhOfTeBsz6dYKm5uZj8PUp9pne4k3L
 sZPY1YWoID8anlIasB7Fr41iRC2SVIXz+93yvJ+rh4Lj9+zKoDoqlCuNcPLcuHCJHLvs9Ec
 5XEGrhd7P/SIyeKSmlGBg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OZWDdZKdcTg=:KjmpjQGcKiuhIW10IZR6it
 ixTbEQwf0Ru9Et/Is9d+qZpCcF18KwvZPtkQhSyzIIj3DlwGWCreDLiEomSnFJuZpjpJEjUCr
 NHKJjNYgjy8YPpdqd8QIiLgzglz7wbT8W/YCvWXGfBbtzMbk/CH7BgM59yk19w+rMFAbsdJOl
 biYeAewVcGjmM9pIp7JFdR4198sm3IAF68bLnHHX0aWz/ngACwS6KGmcG9+tN3aA2ycxCa7xT
 TV/gHfW3QcT6Jiu5JmmC+gB0UyGVwOPCpgPcs6ZX/jXwICaVoKTA7q6ehOqHhEEXTTPBhsz2x
 QfyxJNoTVOvyGlZLs+UF9SJrfU02xKhCp1xUYestQ4RkJGJ+pf3Le8eJ5BJrH5c4JRRnK/M5X
 pClp199AlG6BJd8DF2g6W2fHeenfQ/yAzTanWlMYoOBlf1e23UGUXjGk0w44ZEk8fZgCTnVo4
 pYcIwW24XtnGNsNSur4p+zTeFlsrW0nmBOAy+OBX9hswTttb3rojvorncLVoTQ9xE3XAcWaZ1
 JnaxN5wmJiWcE/J1FMr6Mh/E1u8AN3He+ZJoh4edfK626Z+WjDBjHQp/UH9p+Mdrl6DYLH9x2
 MS8m6EOGk2W6DH5WKeenHn+j3yTbicyX7Y9ub53lvG9RnZhOppMLV/fZbS1W3jZZ2gAJkWtQ+
 eFUow2SCHwqE6yhU9ntuQgP2iP2AGHfHU9PhGQjMcZPn/xqz4qKss9OTNhLd5xfvBxNWNMiLR
 qENfN62Gex1LmiApU1J1IC8EBOR/5mQSk5XcqgrNBXyDVopuTpChg9SgOLKIycn/fhE6k1aFI
 ypP6FhWb9KzzrjNuqtOT8Fn9Xg6IYGVZ0Ttq+Evml7MTeBlzNQ5DwpbYs5CLXUuD9705+fGy9
 rPpVSuSl7ugw/skgCFX4p1Xr49haXmNziOGAfxLXxAs+9tmroAqcPoZrrGT8l1jyR9aI0PIcM
 mWtcQ81NyS4KHToJD0btivQG9e1fGQ92BGxIExkNPG8UXP44jDZyGVDiuR7hJnBd9CnZmI945
 S1YllmToJmV6eqyJtfZxDGzJj32jloSbJ3YhS0dIQLkltQGcJCL7ZGzwxC0G8LdC3KWCSeorn
 y8kyPWL+UAHsEo=
Subject: Re: [Buildroot] [PATCH] package/openssh: backport upstream fix for
 32-bit
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello John,

thanks for the patch, some minor nitpicks...

Better patch subject would be:

	package/openssh: add upstream patch to add seccomp ppoll_time64 support

On Thu, 10 Mar 2022 14:03:50 +0000, John Keeping <john@metanate.com> wrote:

> sshd is broken on 32-bit systems because ppoll_time64 is used by the
> application although it is not allowed by the seccomp filter.
>
> Apply the upstream patch to fix this.

Better:

  -add upstream patch ([1] to add seccomp ppoll_time64 support

[1] https://github.com/openssh/openssh-portable/commit/284b6e5394652d519e31782e3b3cdfd7b21d1a81.patch

>
> Signed-off-by: John Keeping <john@metanate.com>
> ---
>  ...llow-ppoll_time64-in-seccomp-sandbox.patch | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 package/openssh/0001-Allow-ppoll_time64-in-seccomp-sandbox.patch
>
> diff --git a/package/openssh/0001-Allow-ppoll_time64-in-seccomp-sandbox.patch b/package/openssh/0001-Allow-ppoll_time64-in-seccomp-sandbox.patch
> new file mode 100644
> index 0000000000..34b309bd9a
> --- /dev/null
> +++ b/package/openssh/0001-Allow-ppoll_time64-in-seccomp-sandbox.patch
> @@ -0,0 +1,31 @@
> +From 284b6e5394652d519e31782e3b3cdfd7b21d1a81 Mon Sep 17 00:00:00 2001
> +From: Darren Tucker <dtucker@dtucker.net>
> +Date: Sat, 26 Feb 2022 14:06:14 +1100
> +Subject: [PATCH] Allow ppoll_time64 in seccomp sandbox.
> +
> +Should fix sandbox violations on (some? at least i386 and armhf) 32bit
> +Linux platforms.  Patch from chutzpahu at gentoo.org and cjwatson at
> +debian.org via bz#3396.
> +

Missing:

[Upstream: https://github.com/openssh/openssh-portable/commit/284b6e5394652d519e31782e3b3cdfd7b21d1a81.patch]
> +Signed-off-by: John Keeping <john@metanate.com>
> +---
> + sandbox-seccomp-filter.c | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/sandbox-seccomp-filter.c b/sandbox-seccomp-filter.c
> +index 2e065ba3..4ce80cb2 100644
> +--- a/sandbox-seccomp-filter.c
> ++++ b/sandbox-seccomp-filter.c
> +@@ -276,6 +276,9 @@ static const struct sock_filter preauth_insns[] = {
> + #ifdef __NR_ppoll
> + 	SC_ALLOW(__NR_ppoll),
> + #endif
> ++#ifdef __NR_ppoll_time64
> ++	SC_ALLOW(__NR_ppoll_time64),
> ++#endif
> + #ifdef __NR_poll
> + 	SC_ALLOW(__NR_poll),
> + #endif
> +--
> +2.35.1
> +

With this fixed you can add my

Reviewed-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
