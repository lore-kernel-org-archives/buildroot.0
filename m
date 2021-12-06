Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD4BC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 21:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E80D74020B;
	Mon,  6 Dec 2021 21:17:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s2tlCRaigwFm; Mon,  6 Dec 2021 21:17:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 555D440193;
	Mon,  6 Dec 2021 21:17:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CCE2E1BF334
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 21:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD214827E0
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 21:17:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LlEsLEu5jGvt for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 21:17:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CE5B88278F
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 21:17:53 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id w1so48420598edc.6
 for <buildroot@buildroot.org>; Mon, 06 Dec 2021 13:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=dK2GyGpLhb2BfeqHGkZwWDugrT8bR1mxeAz/OXjuG3k=;
 b=aQeVC4pxDwXFGGwpI0Ee6TRWZKEZF8ktung5QyDcDwJM50/dU9TBJKglO/EE3WSPi0
 IntjhkhAFypk7XEPGCAVfzXwJLjzk+TaQkrGJbZJ22vcQVIkgsM8p+lAv+j3glGBavml
 4o1QU7jJJNHbXGsDUItIPnk6K9CnL3n3fbKwVb3Gr3+N+Hc8j9U/arkwOQudFubnt5j5
 qeW/w6jJ8IngPH9xmXzjG7w5zcG5u5pFONrLlSQSkMCpgfWX/9Ym9fGTxL1VgZaJF1CR
 RAZAmMro5F8SYcI4imR8c3W0MQgmG3wV+DeCm/n3tu+kv/9SVoKleSfknNN829JnLZ0G
 u3vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=dK2GyGpLhb2BfeqHGkZwWDugrT8bR1mxeAz/OXjuG3k=;
 b=Xh+aaMzc9IH7uvnK1DIm1i8g8/vjLevlhQlORKIs1y1y0nEv1BUdcBGPrsUyN+limY
 DpRyMkRWMTQrXAsUEl+CRO1wiEK60ThO6cZAEosjJr9g+GxlnKvtpYCTpGii3OeTeW7z
 QAqIZqt21nr+Yc/RDlWronjoFh/ge+ap4T9b7seFibeeN7SUYT5nNJc5ex+Hxkppcmqn
 /51E55AA2O8ZbPr7QOGlc4IdSQtGBaVE1a+D/5Wi4zZ8amSOC5OpG1q5WJ8QAYwMt+wH
 uhNe/k4jbXwljISjd8qQcw+ZuGej+WSN7fgGXmnCKLHnv9NRIaD+0VPrwbE7NG9qbsFl
 mPPw==
X-Gm-Message-State: AOAM532B4S9gCdjgDFByQU7JVSamfUjkARjQyR3RMQYVvls34tcGwiks
 Zc/BEl5CnNII9yzOn2d6x4mE3g==
X-Google-Smtp-Source: ABdhPJz1BzRLvtCyd0jvc3ZyWvHFLBEhUcTUiF0cvs4rYKsOby/leoufB0rx8y65R19P0WlIeIl+Hg==
X-Received: by 2002:aa7:d748:: with SMTP id a8mr2379540eds.21.1638825472073;
 Mon, 06 Dec 2021 13:17:52 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id x15sm8589834edq.65.2021.12.06.13.17.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Dec 2021 13:17:51 -0800 (PST)
Message-ID: <21af8b91-10e6-8ddf-5344-d4d33475a14d@mind.be>
Date: Mon, 6 Dec 2021 22:17:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20211127100219.2121658-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211127100219.2121658-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/4] package/python-charset-normalizer: add
 host variant
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/11/2021 11:02, James Hilliard wrote:
> A host variant of the python-charset-normalizer package will be needed
> for the host-python-requests package.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Series applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-charset-normalizer/python-charset-normalizer.mk | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/package/python-charset-normalizer/python-charset-normalizer.mk b/package/python-charset-normalizer/python-charset-normalizer.mk
> index e1b805fbfb..7fe9f96996 100644
> --- a/package/python-charset-normalizer/python-charset-normalizer.mk
> +++ b/package/python-charset-normalizer/python-charset-normalizer.mk
> @@ -10,5 +10,7 @@ PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/9f/c5/3
>   PYTHON_CHARSET_NORMALIZER_SETUP_TYPE = setuptools
>   PYTHON_CHARSET_NORMALIZER_LICENSE = MIT
>   PYTHON_CHARSET_NORMALIZER_LICENSE_FILES = LICENSE
> +HOST_PYTHON_CHARSET_NORMALIZER_NEEDS_HOST_PYTHON = python3
>   
>   $(eval $(python-package))
> +$(eval $(host-python-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
