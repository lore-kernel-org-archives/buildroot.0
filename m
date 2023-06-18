Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD9AEB64D7
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 13:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6444B611C9;
	Sun, 18 Jun 2023 13:18:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6444B611C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8kLQrz4T9nsF; Sun, 18 Jun 2023 13:18:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9ABB8610FA;
	Sun, 18 Jun 2023 13:18:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9ABB8610FA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 04BF41BF59E
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF474610FA
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:18:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF474610FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4hi2_8ZE_feq for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 13:18:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEE8F605A3
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CEE8F605A3
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 13:18:08 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-519608ddbf7so2646465a12.2
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 06:18:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687094287; x=1689686287;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y+BxuGHN6lokPReT/kn40VxQX8dhPyXMDo6YxvEMAeQ=;
 b=fN9ebX63+HX9xIfU9nduEmYsDUsY9AVNYdAn9Zsok2+hOA3C5Uwwop3RmS8IlSoNfX
 YnxSsXiPfXjdyXVVoys9m7LOMLT2rp1+JiDek2c+wHnw4vlOqFIZyFeelRY0gFDu++Go
 CPsmBukqRWdlXUhSaWf8JlrxX+K1lNrRM+n4HRIvG2fXjt7KAGPnPmFZurm7lTsnZEvB
 4KODmxeS0Tl95LU136afrUYvA6J7WByoSkyfvKVnDyP/azgQ2blZKu8rhoFwNyQpq/Ti
 rjYK1VihVhkKIL0++VdBBTGv+/NISXkVfY+/V/r9MSvU4saO2LqCBBCUuskUGjwMK0i5
 jD5w==
X-Gm-Message-State: AC+VfDxzKxfIB5OqRcd42Kbv+f3IH70BiwxugudH57jiG6J7Q3U7MYUi
 tntxuvX29/oFzttMu5bWSvTk4g==
X-Google-Smtp-Source: ACHHUZ5w62yGEi7EWB5fOkfqtSRu/NroFeXZrJer5C9h01CaErVN+A52GqMf4wJ7XvsdtfVh0goybw==
X-Received: by 2002:a17:906:7312:b0:96a:3119:ac0 with SMTP id
 di18-20020a170906731200b0096a31190ac0mr5317637ejc.69.1687094287001; 
 Sun, 18 Jun 2023 06:18:07 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 n25-20020a170906379900b00977cc473b41sm13499924ejc.142.2023.06.18.06.18.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jun 2023 06:18:06 -0700 (PDT)
Message-ID: <9d1ab6fa-2d10-d17b-bcf1-47e90dd7eab4@mind.be>
Date: Sun, 18 Jun 2023 15:18:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20230605080911.2027474-1-james.hilliard1@gmail.com>
In-Reply-To: <20230605080911.2027474-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687094287; x=1689686287;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=y+BxuGHN6lokPReT/kn40VxQX8dhPyXMDo6YxvEMAeQ=;
 b=OYEHvPCGLL7XwCtbs38jP2zvi/N3M7MeDoT6gKiyY5QezJol39FgZKQQzaXsNEDJ70
 CZZa2b7cHI2IBTM1IpXVS0MtRI7S9yE6SyY9UOsrZHawKtZ/19F9tRYhFugg/2JtppLf
 l0C1mnRajuVGQqCRF9JkZRh6Iuj1SAZFsR287SvPgUcz3AK8FSO7LCJIU1CZDUA26J1k
 9bxbBLdXvpIppm+3/ogxaGdjw5qI2WgmKkKvZbCNzXSPVRslHTC+83hfSirZvL2Vi+Rj
 afdaGVuiXQFPL7whzD4ftu5OBzuklEk9uD2e0F/A2BSG7RV+smnAB4oUpjTSB2aUFcxt
 Iiqw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OYEHvPCG
Subject: Re: [Buildroot] [PATCH 1/1] package/python-installer: bump to
 version 0.7.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/06/2023 10:09, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-installer/python-installer.hash | 4 ++--
>   package/python-installer/python-installer.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-installer/python-installer.hash b/package/python-installer/python-installer.hash
> index 97d455b87c..577b23a7ab 100644
> --- a/package/python-installer/python-installer.hash
> +++ b/package/python-installer/python-installer.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/installer/json
> -md5  ac5fee994b04f228c151306f5ad96b04  installer-0.6.0.tar.gz
> -sha256  f3bd36cd261b440a88a1190b1becca0578fee90b4b62decc796932fdd5ae8839  installer-0.6.0.tar.gz
> +md5  d961d1105c9270049528b1167ed021bc  installer-0.7.0.tar.gz
> +sha256  a26d3e3116289bb08216e0d0f7d925fcef0b0194eedfa0c944bcaaa106c4b631  installer-0.7.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  37b8b9f2569892fa54406383d431169dbb2115980d78b7efba6eeae5664c484f  LICENSE
> diff --git a/package/python-installer/python-installer.mk b/package/python-installer/python-installer.mk
> index 3430e46b51..094a918090 100644
> --- a/package/python-installer/python-installer.mk
> +++ b/package/python-installer/python-installer.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_INSTALLER_VERSION = 0.6.0
> +PYTHON_INSTALLER_VERSION = 0.7.0
>   PYTHON_INSTALLER_SOURCE = installer-$(PYTHON_INSTALLER_VERSION).tar.gz
> -PYTHON_INSTALLER_SITE = https://files.pythonhosted.org/packages/c9/ab/a9141dc175ec7b620fffe7e0295251a7b6a0ffb4325d64aeb128dff8c698
> +PYTHON_INSTALLER_SITE = https://files.pythonhosted.org/packages/05/18/ceeb4e3ab3aa54495775775b38ae42b10a92f42ce42dfa44da684289b8c8
>   PYTHON_INSTALLER_LICENSE = MIT
>   PYTHON_INSTALLER_LICENSE_FILES = LICENSE
>   PYTHON_INSTALLER_SETUP_TYPE = flit-bootstrap
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
