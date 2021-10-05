Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3196FC433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:37:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2D1961207
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:37:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E2D1961207
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B67E1408C4;
	Tue,  5 Oct 2021 19:37:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3piPGDQU52Jz; Tue,  5 Oct 2021 19:37:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CFBD407EE;
	Tue,  5 Oct 2021 19:37:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 09C181BF334
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05A8C4024E
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:37:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NstMNZzteEbO for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 19:37:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D4B864023C
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 19:37:15 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id r18so746583edv.12
 for <buildroot@buildroot.org>; Tue, 05 Oct 2021 12:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=H9ymnPE2c2TbWx3WBZ5vmnTAocb/nOlVwGckmv1jWns=;
 b=I0oDaNeDmhTlA7qRN2b2l4jsao3xvvfr2YbxtUnY0zYoLpfJbqETl/PHuJFUeq99+/
 y8k/Cl+BciVanSrWFiSeBDyGlPqCVZoFeGkJwXitwoYYZcOiTMda5QCVCNWT/JG7NfOW
 HJQtTCrKweJsqsw4U1I3pC87Auha40DyswyhxdScrZAbLOeWVh2/mtTSvOmeJ4aCgYcX
 7WVPFva639PhSbDJsfdfrSglj1HMWSpOZp94CrHBRV/Y8b+B8jcUHBpffO1JrLL4F5Xp
 qTz21WzHVSVPgA9QHqvItTh1UcPqIVeyxZsrM5kahXVD7SlnhVW5EfvTUatmjy6XyMi7
 2xKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=H9ymnPE2c2TbWx3WBZ5vmnTAocb/nOlVwGckmv1jWns=;
 b=o05VLmuW1Q4WQjNjP+PGPWDzglqvXeFCL3ZB1MX/SRzrj27ef9jkZjj4WM5AZHjLqx
 bH18dvCfGrP/DkWCLsXNuuUuaDGjBNnmql7wMIOVsxhOdjRtsPfMVMTlQvP7JwlkTXHX
 HW0GSNNYQqyn+UK19dG/JBGGL5SA59J8sajfMQc7UbJIgijCD9q1eu/b71pkAuwE39Y6
 TRF6DPdgs2zj6evXLAAZGfthL8cybUps/rgeCbBXElCgP5CJtUZUvx52azYSiFUR1pDb
 2m7L+JsKCzrWpYovcjznqC+0YBxXjMlO2SwmBPzertRGEaKBCL2/V14X1ES0oy8TnpWe
 1N1w==
X-Gm-Message-State: AOAM530KhVeW5tYaAykplpFkkLcf0rw3J2S2OeOYk8+FK1SfvH1eYK78
 vnNfTBA6xRnmGElpCs0+PQgjlw==
X-Google-Smtp-Source: ABdhPJyehiHKorLbO9kw6VXFRmOKoOzOVmx3I/o79F3aPfgKbLFfs8yrLidG0P06j0uGsm4GBgqZjQ==
X-Received: by 2002:a17:906:2b91:: with SMTP id
 m17mr26427207ejg.202.1633462634073; 
 Tue, 05 Oct 2021 12:37:14 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id d14sm5537283ejd.92.2021.10.05.12.37.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 12:37:13 -0700 (PDT)
Message-ID: <fcaa52c3-3ac3-1601-7763-80db54df8d1a@mind.be>
Date: Tue, 5 Oct 2021 21:37:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210927211837.1499743-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210927211837.1499743-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/atftp: security bump to version
 0.7.5
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Ryan Barnett <ryan.barnett@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/09/2021 23:18, Fabrice Fontaine wrote:
> - Fix CVE-2021-41054: tftpd_file.c in atftp through 0.7.4 has a buffer
>    overflow because buffer-size handling does not properly consider the
>    combination of data, OACK, and other options.
> - Update hash of license file (license replaced with current version:

  I didn't grok this sentence so after investigation I replaced it with "license 
replaced with current version of the GPL text".

  Applied to master, thanks.

  Regards,
  Arnout



>    https://sourceforge.net/p/atftp/code/ci/bf22ccaef34f5dcdbd48de8b0bea3ef97b9d3545)
> 
> https://sourceforge.net/p/atftp/code/ci/v0.7.5/tree/Changelog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/atftp/atftp.hash | 4 ++--
>   package/atftp/atftp.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/atftp/atftp.hash b/package/atftp/atftp.hash
> index 158e9e3b33..6b0d9a5879 100644
> --- a/package/atftp/atftp.hash
> +++ b/package/atftp/atftp.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  d3c9cd0d971dfc786d7a5f4055c35d4e66aafc8102ac03473ef225bdf7edb26a  atftp-0.7.4.tar.gz
> -sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  LICENSE
> +sha256  93c87a4fb18218414e008e01c995dadd231ba4c752d0f894b34416d1e6d3038a  atftp-0.7.5.tar.gz
> +sha256  86dc744860e6dfacfeba2f33fea908db03fe67c7e37a878285b7aae8e4596735  LICENSE
> diff --git a/package/atftp/atftp.mk b/package/atftp/atftp.mk
> index 3db966c169..70ef4c0fae 100644
> --- a/package/atftp/atftp.mk
> +++ b/package/atftp/atftp.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -ATFTP_VERSION = 0.7.4
> +ATFTP_VERSION = 0.7.5
>   ATFTP_SITE = http://sourceforge.net/projects/atftp/files
>   ATFTP_LICENSE = GPL-2.0+
>   ATFTP_LICENSE_FILES = LICENSE
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
