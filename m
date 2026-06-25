Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C40CDE000
	for <buildroot@archiver.kernel.org>; Thu, 25 Jun 2026 16:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7FB682C75;
	Thu, 25 Jun 2026 16:44:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CMR5N37mSf-s; Thu, 25 Jun 2026 16:44:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0EAB82F80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782405851;
	bh=ezwkkAIG5Ix7Iik3z7BW0ZVYB/FC5tO1fLOgsQs3pig=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gmbdRQ4Q4S1yaOATkP9IRBc19FwLmeVBXGRFJX3Rh/Ehb8gc2H/AV5oT7DfZewT5H
	 TzszNyx0KVTXlZocnYwBJiidXy3mEI3ljii8S79xNll1tMTyUjjE9C257sZjCwPpzq
	 bghK56SsE1gbvZ5RaswqqSrJ+w7x4v40mBYn8aOyizJsCoShL5ouqopOyhmTojXrHt
	 PGFQ/ClETtGbE8SV5OyrevvwfvldBorzbcOehQFj3gHljt0wZ8U0J/S5CPRj3ttTpD
	 8uCjNUpCXfcABY2FA2cbTyc5K4WOvPPZjMTVLBYL3Hz+wlmMQeHYYi0QkF/b3rWb5r
	 sL9srWibJsFFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0EAB82F80;
	Thu, 25 Jun 2026 16:44:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 597D0254
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 16:44:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 566AE41141
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 16:44:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TQaEMiuDZQsW for <buildroot@buildroot.org>;
 Thu, 25 Jun 2026 16:44:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D9B7B41140
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9B7B41140
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D9B7B41140
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 16:44:08 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MjjCF-1x1QZK2dL9-00mINg; Thu, 25
 Jun 2026 18:44:05 +0200
Message-ID: <ad0ef5be-b374-4264-93a7-c675dfea9762@gmx.de>
Date: Thu, 25 Jun 2026 18:44:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Cc: Alexander Dahl <alex@netz39.de>
References: <20260622130119.90146-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260622130119.90146-1-giulio.benetti@benettiengineering.com>
X-Provags-ID: V03:K1:66kBqSvobxTdOV70GPQLdKCFlvGPecMI/vjsBIfpdvIsNkkgICx
 Ot778N/JnmRQs2ARp0CxOZgkUukbrgTpnAs+2sNoXcBdv1yJ6yyLQUPhvVdOG7VGg/Avk/o
 uWyZk4TUFok7jVaB8mC+Hyvbg7DNQ3ttDicGpuYEkvMunLnabYUkQ+31HisuGDMaIkF9Xhr
 asKOG6wFO/OhbJZYOLgUg==
UI-OutboundReport: notjunk:1;M01:P0:n6483G2AF2s=;ArHR3qNIBN3qZ0tlAQ2IL0SZQ2s
 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
 =
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1782405845; x=1783010645; i=fiona.klute@gmx.de;
 bh=chFiTC3z+TPa2co4jVGSonbZcY5r78daPjrgrpNuxWI=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=LAyp2FE9Vvxg6+SuEWNJX1/qRpdRZJ0JrZPToTsvsVrNTOXKSL5ov35hPPglu6BI
 3EZMAYzXB5LD6SPs/myx6l9HW33JrVOj6LQwIIWHGZyLBmaRnFCdjPvcGAUQTIrOX
 /0d6MOjIKvhFV0CrFYBkE2lo6UR0il5m3PwhDajODuj9HBmDF++UXPCmDRlJ7yM9e
 KhXMNjku/Z1EQ7knzVMPl9S7fC6erKN/vqgcQwVL9ercYEe6G4SAjJWRKkppEfvaH
 3jLwGUmtctNh8NKOoO9t+qoNn4ss+z6sG2Sab2QHHeDTGhsRrgf1UXxDhRQsVmWNj
 BzXxpLDMmktcaBtxIA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=LAyp2FE9
Subject: Re: [Buildroot] [PATCH] package/util-linux: fix CVE-2026-27456
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 22.06.26 um 15:01 schrieb Giulio Benetti:
> As mentioned here[1] we require patch[2] to fix CVE-2026-27456.
> 
> [1]: https://lore.kernel.org/util-linux/c2fo4x3lcppsj77k564i4qodmon3wagx47qf4mqwjwdtiplupg@jmaqrlzp273h/T/#u
> [2]: https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/commit/?h=stable/v2.41&id=2dacaf3eea391e3bbf48e7d3ecce02cafe045b6d
> 
> Cc: Alexander Dahl <alex@netz39.de>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied after adding CVE: trailer to the patch file, thank you!

Unfortunately I missed it's also missing a UTIL_LINUX_IGNORE_CVES entry, 
sorry.

Best regards,
Fiona

> ---
>   ...at2-RESOLVE_NO_SYMLINKS-for-backing-.patch | 56 +++++++++++++++++++
>   1 file changed, 56 insertions(+)
>   create mode 100644 package/util-linux/0003-loopdev-use-openat2-RESOLVE_NO_SYMLINKS-for-backing-.patch
> 
> diff --git a/package/util-linux/0003-loopdev-use-openat2-RESOLVE_NO_SYMLINKS-for-backing-.patch b/package/util-linux/0003-loopdev-use-openat2-RESOLVE_NO_SYMLINKS-for-backing-.patch
> new file mode 100644
> index 0000000000..6d3b41603c
> --- /dev/null
> +++ b/package/util-linux/0003-loopdev-use-openat2-RESOLVE_NO_SYMLINKS-for-backing-.patch
> @@ -0,0 +1,56 @@
> +From 2dacaf3eea391e3bbf48e7d3ecce02cafe045b6d Mon Sep 17 00:00:00 2001
> +From: Karel Zak <kzak@redhat.com>
> +Date: Wed, 27 May 2026 15:15:22 +0200
> +Subject: [PATCH] loopdev: use openat2(RESOLVE_NO_SYMLINKS) for backing file
> +
> +Use ul_open_no_symlinks() instead of open(O_NOFOLLOW) when
> +LOOPDEV_FL_NOFOLLOW is set.  O_NOFOLLOW only rejects symlinks at the
> +last path component, but TOCTOU attacks swap intermediate components.
> +openat2(RESOLVE_NO_SYMLINKS) rejects symlinks at any component.
> +
> +Upstream: https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/commit/?h=stable/v2.41&id=2dacaf3eea391e3bbf48e7d3ecce02cafe045b6d
> +Signed-off-by: Karel Zak <kzak@redhat.com>
> +(cherry picked from commit 119d23f1e3f55cf10e3c66dab80fc308c9f26456)
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + lib/loopdev.c | 23 ++++++++++++++---------
> + 1 file changed, 14 insertions(+), 9 deletions(-)
> +
> +diff --git a/lib/loopdev.c b/lib/loopdev.c
> +index 76685be70..31377fc9a 100644
> +--- a/lib/loopdev.c
> ++++ b/lib/loopdev.c
> +@@ -1412,16 +1412,21 @@ int loopcxt_setup_device(struct loopdev_cxt *lc)
> + 	if (lc->config.info.lo_flags & LO_FLAGS_DIRECT_IO)
> + 		flags |= O_DIRECT;
> + 	if (lc->flags & LOOPDEV_FL_NOFOLLOW)
> +-		flags |= O_NOFOLLOW;
> +-
> +-	if ((file_fd = open(lc->filename, mode | flags)) < 0) {
> +-		if (mode != O_RDONLY && (errno == EROFS || errno == EACCES))
> +-			file_fd = open(lc->filename, (mode = O_RDONLY) | flags);
> ++		file_fd = ul_open_no_symlinks(lc->filename, mode | flags, 0);
> ++	else
> ++		file_fd = open(lc->filename, mode | flags);
> +
> +-		if (file_fd < 0) {
> +-			DBG(SETUP, ul_debugobj(lc, "open backing file failed: %m"));
> +-			return -errno;
> +-		}
> ++	if (file_fd < 0 && mode != O_RDONLY
> ++	    && (errno == EROFS || errno == EACCES)) {
> ++		mode = O_RDONLY;
> ++		if (lc->flags & LOOPDEV_FL_NOFOLLOW)
> ++			file_fd = ul_open_no_symlinks(lc->filename, mode | flags, 0);
> ++		else
> ++			file_fd = open(lc->filename, mode | flags);
> ++	}
> ++	if (file_fd < 0) {
> ++		DBG(SETUP, ul_debugobj(lc, "open backing file failed: %m"));
> ++		return -errno;
> + 	}
> + 	DBG(SETUP, ul_debugobj(lc, "backing file open: OK"));
> +
> +--
> +2.47.3
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
