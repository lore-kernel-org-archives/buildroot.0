Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0481AC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 16:08:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB52F61101
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 16:08:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BB52F61101
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86D6D40171;
	Tue,  3 Aug 2021 16:08:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1RZBMYhZAaL9; Tue,  3 Aug 2021 16:08:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8225C40253;
	Tue,  3 Aug 2021 16:08:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 11B161BF868
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 16:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F39A44019A
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 16:08:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AQVg7q9aapZR for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 16:08:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2539140171
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 16:08:26 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id p21so29649566edi.9
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 09:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ed5y9y7F83niOUAyZGT7icYuhVU/nfGNN6wuDXpzm7k=;
 b=N9KABmRCnxLgFJU07s/qZD/+sgo82qbOS7JuZZZHlhE3V4CF+S1yhKbqpQpzywIprC
 ZmpZJ2QJaZ+pENmUTdA7aMqUvkC3gBD+kbOg7ZRPuwyihL/gbhe+3XfUxw6jwzlZziTr
 A9dDvh5gNJGlPhhbDPxJDRSpMUPMXYQgN2kaNAoU9uIfxEI5w4dUkxVtZhvwawi6APbr
 Oqgmy+39eTcTa0pWgnWX4IqZgbzEXN22iFbZ5Op63LDgyhT9F1x6xaUd7xtQ2Af2at+m
 I33PPL6+UR/bRCy/O3dU8qlsSERqX8chwzOvw4FxtWTglSrfERzReaKySHjKjqUG28Hj
 sJ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ed5y9y7F83niOUAyZGT7icYuhVU/nfGNN6wuDXpzm7k=;
 b=o6+z4s1DoWjO/zFJoc9Zmg6rKkQaTnr+auY1Fq6k6rHYiOTj//GZAyFRe++GfpRZq8
 ZmTOVd+W/IfT0T0oCZcdC+NU74vTYImZymnyYm6FcHtFl0z35R3uz4kn5iDC6oSQpvtW
 LI04dQst22pRc8gHvgrrvzTeHPs0NUJ45SXLAxSZq5vFFL+Jpo3IaJW1aznwRuZXm2/8
 6KJoArDozReDTvaSrTKNLMf3/bLWDj8fzfUw6KaK0AuL9zcDWSaVVhhWBmdRnsM2A4a8
 zu4ZZPf6OdJ3DjIy2Bze/9SshGJYN2jGP0ShK8tpZN4Q7+sp17MTzC20NCwybWYgZ3Ln
 H6xA==
X-Gm-Message-State: AOAM530Yw+QyypS9+PZNnEvFRtShLsiVLNc37ccTAoriRtmYR6Sqvkgy
 /AxaDUqX/W0kmu3JBLSk4eczwA==
X-Google-Smtp-Source: ABdhPJybL1bworo2OzccVtfZOAY7q3b1QQaa2NPdV8YOKEtvJ/0AQmw509Ae6Xs7NYPpgRbT4OsR+w==
X-Received: by 2002:a05:6402:b6e:: with SMTP id
 cb14mr20280069edb.239.1628006904231; 
 Tue, 03 Aug 2021 09:08:24 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id u22sm8337253edo.77.2021.08.03.09.08.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 09:08:23 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210802093458.1531166-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <80b79e25-f27a-d86f-d592-854974e81425@mind.be>
Date: Tue, 3 Aug 2021 18:08:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210802093458.1531166-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/refpolicy: fix build with ftp
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Antoine Tenart <atenart@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 02/08/2021 11:34, Fabrice Fontaine wrote:
> Fix build failure raised since commit
> 61a47bb1037ac20772f4e0106aab956adffeee12
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/bde34d81a04b5ea96722dc56249089dce7e65b74
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 What's the upstream status of the patch?

 Regards,
 Arnout

> ---
>  ...es-services-ftp-te-make-ssh-optional.patch | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 package/refpolicy/0004-policy-modules-services-ftp-te-make-ssh-optional.patch
> 
> diff --git a/package/refpolicy/0004-policy-modules-services-ftp-te-make-ssh-optional.patch b/package/refpolicy/0004-policy-modules-services-ftp-te-make-ssh-optional.patch
> new file mode 100644
> index 0000000000..9269c7aff8
> --- /dev/null
> +++ b/package/refpolicy/0004-policy-modules-services-ftp-te-make-ssh-optional.patch
> @@ -0,0 +1,44 @@
> +From f26d4bc1b2a7b781c67891cb3bf4579c6582d630 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Fri, 30 Jul 2021 22:40:20 +0200
> +Subject: [PATCH] policy/modules/services/ftp.te: make ssh optional
> +
> +Make ssh optional to avoid the following build failure:
> +
> + Compiling targeted policy.30
> + env LD_LIBRARY_PATH="/home/fabrice/buildroot/output/host/lib:/home/fabrice/buildroot/output/host/usr/lib" /home/fabrice/buildroot/output/host/usr/bin/checkpolicy -c 30 -U deny -S -O -E policy.conf -o policy.30
> + policy/modules/services/ftp.te:484:ERROR 'type ssh_home_t is not within scope' at token ';' on line 92051:
> + 	allow sftpd_t ssh_home_t:dir { open read getattr lock search ioctl add_name remove_name write };
> + #line 484
> + checkpolicy:  error(s) encountered while parsing configuration
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + policy/modules/services/ftp.te | 10 ++++++----
> + 1 file changed, 6 insertions(+), 4 deletions(-)
> +
> +diff --git a/policy/modules/services/ftp.te b/policy/modules/services/ftp.te
> +index 0d84da71cf..5686b22581 100644
> +--- a/policy/modules/services/ftp.te
> ++++ b/policy/modules/services/ftp.te
> +@@ -481,10 +481,6 @@ tunable_policy(`sftpd_full_access',`
> + 	files_manage_non_auth_files(sftpd_t)
> + ')
> + 
> +-tunable_policy(`sftpd_write_ssh_home',`
> +-	ssh_manage_home_files(sftpd_t)
> +-')
> +-
> + tunable_policy(`use_samba_home_dirs',`
> + 	fs_list_cifs(sftpd_t)
> + 	fs_read_cifs_files(sftpd_t)
> +@@ -496,3 +492,9 @@ tunable_policy(`use_nfs_home_dirs',`
> + 	fs_read_nfs_files(sftpd_t)
> + 	fs_read_nfs_symlinks(ftpd_t)
> + ')
> ++
> ++optional_policy(`
> ++	tunable_policy(`sftpd_write_ssh_home',`
> ++		ssh_manage_home_files(sftpd_t)
> ++	')
> ++')
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
