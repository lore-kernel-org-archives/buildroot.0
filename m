Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD3AC6FD1F
	for <buildroot@archiver.kernel.org>; Tue,  2 Apr 2024 07:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8591640B87;
	Tue,  2 Apr 2024 07:32:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UczI8FTnATZA; Tue,  2 Apr 2024 07:32:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CE92400DC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8CE92400DC;
	Tue,  2 Apr 2024 07:32:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 646161BF2BB
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 07:32:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5DFEE60A40
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 07:32:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oiFedJgpyW1o for <buildroot@lists.busybox.net>;
 Tue,  2 Apr 2024 07:32:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D08ED60678
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D08ED60678
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D08ED60678
 for <buildroot@buildroot.org>; Tue,  2 Apr 2024 07:32:05 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-415db53d905so3339205e9.2
 for <buildroot@buildroot.org>; Tue, 02 Apr 2024 00:32:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712043123; x=1712647923;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nixJMZiAJjG0nE1RSSSeFmjflo/6XQHzc0LWfFB6G9s=;
 b=AEzLIVe611Z659vZhRzUgffTw8VEUGU5pzzRK5oV/mShgFoBC+/e6IZQw5eXopXQxP
 Mrx3JE+G04kZoU7rFPV2d6ycfFTVGmC6QYVUwxqjE78Ml4P6xiPofzh6V2Wt6Bq4+tfd
 a8cVThiShskThLOvoPZNLYATEpmp9CqrHLWlLBfMLXbe0iOncmXyEXPJJhXCA7WU7eUM
 mlsl9a2Nf4da0GSah/64DSb/ReveiMpwyKSW40EeQC65KFFXVpMf97Pv7RBJzcEJBMza
 4i9JOGjdsamtxutgiy4FrlXqSw5jemZu3WPJ7+2W8/taJNVCxyYEGx8aoXOKw+8LKmXE
 UW1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWa7DV2S47DmxllB11EUPfOivNVLsOZGkh+OxypTiypJlaC/ziCFAmYipriQXr/qFlU4yZcPJ8XPnWSYzJOsbfJEDwEoPXO6g==
X-Gm-Message-State: AOJu0Yyf+2KaRYo5C/F9BgB4QdSRw6uCYqWz9LOkMCSmLroCIZvoXg6H
 QziH6Fe3S9f+5wrwNLV6gA9GJs9YIybE1dGKIWL0EWryMRyIKKPT59lUg/qvFuE=
X-Google-Smtp-Source: AGHT+IEfnhZrW2gK+sCM+oTF/FFN2S/n42wkMy5YdgPHTVHj9k1BMiT6kBDJbZNFSFEHBgjebj2QzQ==
X-Received: by 2002:a05:600c:35d6:b0:415:46be:6239 with SMTP id
 r22-20020a05600c35d600b0041546be6239mr7573446wmq.36.1712043123237; 
 Tue, 02 Apr 2024 00:32:03 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 he11-20020a05600c540b00b0041568e91c41sm4524070wmb.41.2024.04.02.00.32.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Apr 2024 00:32:02 -0700 (PDT)
Message-ID: <3a0ae1fd-5460-4bd5-ae53-e2e753c50502@mind.be>
Date: Mon, 1 Apr 2024 22:12:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240331004133.636618-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240331004133.636618-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712043123; x=1712647923; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nixJMZiAJjG0nE1RSSSeFmjflo/6XQHzc0LWfFB6G9s=;
 b=S8ZJywk4CNQDou1OO9jnnQaqL18JX2Pt0uUeik4cTWuQ5NDxNrmhi383fB7nlOL7OD
 m7BA4qATi0sBo353MP0oMQUglMulPz7Fn8+vYvtcJ3shejzgwqW3BmnwuyeZ+XSq2Vb5
 VrhjRRpChEMk9IUn1yvLY6O5AVi9NiLQjkEerS9xfq3iwN8LFF2sXArAcu8IrXNywSH5
 McVYIvFlnqREaj5xPRnu98wMUVag+KxDIOxVBWvZlv9lBeO/xsIkpwT0ZCMJA439zR8H
 oHu24B5qO+CyrEJ0pf0WkRiyI3nR3pSXygu9WfcxLs+8PAAl9DJoJ7G9Iha3zkgK5fFZ
 es5w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=S8ZJywk4
Subject: Re: [Buildroot] [PATCH v9 01/18] package/python-canopen: add
 setuptools-scm build dependency
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Gustavo Heinz <gustavo@gsthnz.com>,
 =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Asaf Kahlon <asafka7@gmail.com>, "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Joris Offouga <offougajoris@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Attila Wagner <attila.wagner@onyxinsight.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Lionel Flandrin <lionel@svkt.org>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Mauro Condarelli <mc5686@mclink.it>,
 Christian Kellermann <christian.kellermann@solectrix.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 31/03/2024 01:41, James Hilliard wrote:
> The host-python-setuptools-scm dependency needs to be added
> prior to migrating setuptools to pep517 as this dependency
> is listed as a build requirement in the pyproject.toml.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied series to master, thanks, with a few changes as indicated in 
individual replies.

  Regards,
  Arnout

> ---
>   package/python-canopen/python-canopen.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/python-canopen/python-canopen.mk b/package/python-canopen/python-canopen.mk
> index 963c4ab801..09ec595ec6 100644
> --- a/package/python-canopen/python-canopen.mk
> +++ b/package/python-canopen/python-canopen.mk
> @@ -10,5 +10,6 @@ PYTHON_CANOPEN_SITE = https://files.pythonhosted.org/packages/49/55/67e555f6f4ea
>   PYTHON_CANOPEN_SETUP_TYPE = setuptools
>   PYTHON_CANOPEN_LICENSE = MIT
>   PYTHON_CANOPEN_LICENSE_FILES = LICENSE.txt
> +PYTHON_CANOPEN_DEPENDENCIES = host-python-setuptools-scm
>   
>   $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
