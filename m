Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03817C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 12:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EFF860FE0;
	Sat, 23 Jul 2022 12:48:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EFF860FE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eLdyTsbQlzIc; Sat, 23 Jul 2022 12:47:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A99E160FDD;
	Sat, 23 Jul 2022 12:47:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A99E160FDD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BFF8A1BF36E
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 12:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A3FB40AE8
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 12:47:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A3FB40AE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PcuvuXvUObQD for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 12:47:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B298C40AD1
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B298C40AD1
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 12:47:55 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id d13so2153913wrn.10
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 05:47:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=wWvl9MWUta+Unzkcp5EXYoRmxpQSkR8QZwcqrERt1iQ=;
 b=Um/StBpGM2SNROhC6zoVcF59tJb973JYJIwbPFAHYNK+U+xl9HncUcoQ1yOxNBOH5A
 E+fkBwW98yajsXICHlx3/4oThmDZTz/6Bs0xX6CFv6BOyEmQVB40r3RzQCCRUmwGMmym
 J4asyZMrm26FAnfLGVk/Zn0b7nF84VzFDDiqGUEb+ylVMEq+e/jiRBXKC4cnSI9/WR7p
 XfhlCnghJinwwrS7IvDDePGSKqlddZvHNezrtm1I299K0W6sjDiHD5OqEBrc6GoUPREJ
 TlfygQoZKSnkWQNr6f5iVCgz3M3DruN3vFSTi6nSmxqg/r9/YN+VhV8Q+guhQp9Mre7r
 1ADQ==
X-Gm-Message-State: AJIora9u6TZJOatelrw+8IwafzWj6E3AG4vmZoCaVrA0xP1z2DiCWIe2
 55RYzyAaU6+SRQduLVId83NAzw==
X-Google-Smtp-Source: AGRyM1sKVray+AWwD+/ur0jDyRbI0lHzuNjOultUoD6GQ7jdT7SkmOSgmjke4m8ehlU9vthkjspGHQ==
X-Received: by 2002:a5d:470b:0:b0:21e:47f4:9a8b with SMTP id
 y11-20020a5d470b000000b0021e47f49a8bmr2745527wrq.173.1658580473719; 
 Sat, 23 Jul 2022 05:47:53 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 i4-20020a05600c354400b003a326b84340sm12694658wmq.44.2022.07.23.05.47.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 05:47:53 -0700 (PDT)
Message-ID: <0f201981-84b3-db70-6fa1-091c3ae61882@mind.be>
Date: Sat, 23 Jul 2022 14:47:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Colin Foster <colin.foster@in-advantage.com>, buildroot@buildroot.org
References: <20220720171125.2914642-1-colin.foster@in-advantage.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220720171125.2914642-1-colin.foster@in-advantage.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=wWvl9MWUta+Unzkcp5EXYoRmxpQSkR8QZwcqrERt1iQ=;
 b=Vi5bhBZPbuyMQZLBEv4GULbN9bTcIT85DW/+PnRf0rMJVIWhmL9NRlYC6QWT4SJGPy
 yjaCePXiyh0pwSJ40SC8T3HiETZ986IZkaAiq9qtGYiDKb3/bv6V+eJUCxS+YnBGpfbM
 zVJab1IlyUKgrTRowxD6ngH/x3781RtziBmW9PO0T8AJqHiUWZ1YRwB6ePHcosbNAAJz
 0dKtiD40IZTIAJ1mBVrntHYtJs9wMDlFapeKXLOSD64fpdM49Bg3BtY/UQV8RgGZeSie
 flKJlpS+g9h4gA7kQpOiGhb5kjyJGgFmbCse3jyDP6dImpnEM1kczDioCaI8k0LlJONt
 /AKg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Vi5bhBZP
Subject: Re: [Buildroot] [PATCH v1] package/mstpd: fix mstpd bridge-stp use
 of pidof
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 20/07/2022 19:11, Colin Foster wrote:
> Through mstpd version 0.1.0, the bridge-stp script uses the '-c'
> option to the pidof command. Busybox does not support this option, so
> mstpd does not work.
> 
> This has been fixed in the main development branch of mstpd, but it is
> unclear when the next release will be. In the meantime, apply the fix
> here so that mstpd will be useable until the next version release.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>

  Applied to master, thanks.

  Would it be useful to add a runtime test for mstpd to detect such issues?

  Regards,
  Arnout

> ---
>   ...pport-different-versions-of-pidof-13.patch | 48 +++++++++++++++++++
>   1 file changed, 48 insertions(+)
>   create mode 100644 package/mstpd/0001-bridge-stp.in-support-different-versions-of-pidof-13.patch
> 
> diff --git a/package/mstpd/0001-bridge-stp.in-support-different-versions-of-pidof-13.patch b/package/mstpd/0001-bridge-stp.in-support-different-versions-of-pidof-13.patch
> new file mode 100644
> index 0000000000..daa591131b
> --- /dev/null
> +++ b/package/mstpd/0001-bridge-stp.in-support-different-versions-of-pidof-13.patch
> @@ -0,0 +1,48 @@
> +From 181c453fc1a00573e19f14960dcc54ad84beea7c Mon Sep 17 00:00:00 2001
> +From: colin-foster-in-advantage <colin.foster@in-advantage.com>
> +Date: Tue, 12 Jul 2022 23:01:09 -0700
> +Subject: [PATCH] bridge-stp.in: support different versions of pidof (#137)
> +
> +* bridge-stp.in: support different versions of pidof
> +
> +Busybox uses a version of pdiof that doesn't support the -c option. As
> +such, this renders mstpd non-functional on any Busybox system.
> +
> +Just use the standard form of pidof to detect any running instances of mstpd.
> +
> +Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> +---
> + bridge-stp.in | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/bridge-stp.in b/bridge-stp.in
> +index 47cbe79..3807873 100755
> +--- a/bridge-stp.in
> ++++ b/bridge-stp.in
> +@@ -139,7 +139,7 @@ case "$action" in
> +         fi
> +
> +         # Start mstpd if necessary.
> +-        if ! pidof -c -s mstpd >/dev/null; then
> ++        if ! pidof -s mstpd >/dev/null; then
> +             if [ "$MANAGE_MSTPD" != 'y' ]; then
> +                 errmsg 'mstpd is not running'
> +                 exit 3
> +@@ -212,12 +212,12 @@ case "$action" in
> +         done
> +
> +         # Kill mstpd, since no bridges are currently using it.
> +-        kill $(pidof -c mstpd)
> ++        kill $(pidof mstpd)
> +         ;;
> +     restart|restart_config)
> +         if [ "$action" = 'restart' ]; then
> +             # Kill mstpd.
> +-            pids="$(pidof -c mstpd)" ; Err=$?
> ++            pids="$(pidof mstpd)" ; Err=$?
> +             if [ $Err -eq 0 ]; then
> +                 echo 'Stopping mstpd ...'
> +                 kill $pids
> +--
> +2.25.1
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
