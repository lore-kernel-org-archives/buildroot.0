Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC781C25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 21:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D82F41681;
	Wed,  5 Jun 2024 21:39:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 54PblaQz6ayM; Wed,  5 Jun 2024 21:39:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C41B841684
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C41B841684;
	Wed,  5 Jun 2024 21:39:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9BA831BF5A8
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 21:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8533241684
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 21:39:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UNWLCY9N3teW for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 21:39:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 51E6041681
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51E6041681
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 51E6041681
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 21:39:07 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-35dcc681f70so244909f8f.0
 for <buildroot@buildroot.org>; Wed, 05 Jun 2024 14:39:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717623546; x=1718228346;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5Jhogi2iaRYNX+q+BF4iCiLkSsb8ddTYx6SViyvMEWg=;
 b=hIb+MHIqu5ZEa+gsnv39IbIDoLf/QXH/kzkIWJR63NOkWKBqSgn9nLZuZN4FfBJao3
 GTJmz1ezZYP7uHtxaSOgOSj/Bu8feLMuV+eU6rRwAhrHyBXKb8+3MUvDZUVZAUacL7es
 2rDzhRNWYqkUOtZC99jQe5D9YCTabffq/dlJWWt0km1+BwfqD4Yt4S0YzaXxTFkK8h4I
 huDdmYhNbm0hD0QMSHB813iAnxcGN6Aml0b29HReuxYx3tWyiCP5aaM/jasN3AFpgKX6
 +nCZ20DN8OF5FjjOpu3hwiTmuYkoJ54wj+xlMxpQXUR/eLO/N4tawrxjasPrkVNhZcLY
 6giA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXT87d6Yqq+Otv1PfymDXjKYR+5ziikSwyB74jTNy9d2cpKmsVHKLzYWTSbNPklhLiorZrRwSUxCu1FD0fMsXBt52wNy2J9+g==
X-Gm-Message-State: AOJu0YxbmAklmqy+GitsOW2pRx8D+gnyu1fkCFVH7ufKz1jJXLHPEc9T
 w/QpMvNH8YaSMik6n871XY2oXdh9ucDkvMR3DcJspEQ+LEU7+FAk/J3ZnFXdM1vVmT8AdGAmhx+
 +
X-Google-Smtp-Source: AGHT+IFoHjSEoVuIEi6uRKIbEYvC31seJ0JufKVPWB6vg0b3cVMyWNlXDlgHzmkbuCV2z2FDtL6cCA==
X-Received: by 2002:adf:cd01:0:b0:354:ddba:303a with SMTP id
 ffacd0b85a97d-35e8ef77ae8mr3050040f8f.54.1717623545614; 
 Wed, 05 Jun 2024 14:39:05 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd064b030sm15720386f8f.105.2024.06.05.14.39.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jun 2024 14:39:05 -0700 (PDT)
Message-ID: <32881b84-d291-473f-a128-ccac553c6af5@mind.be>
Date: Wed, 5 Jun 2024 23:39:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1717609998.git.yann.morin.1998@free.fr>
 <24eee82d7cade44c8ed6fc1675ea739a1ec70a18.1717609998.git.yann.morin.1998@free.fr>
Content-Language: en-GB
In-Reply-To: <24eee82d7cade44c8ed6fc1675ea739a1ec70a18.1717609998.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1717623546; x=1718228346; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5Jhogi2iaRYNX+q+BF4iCiLkSsb8ddTYx6SViyvMEWg=;
 b=KrWoDIHcjv4Sc9ovq3q9F2RSspRZpuW+0YKCCKamvvvSfOJ8LF8S+QuBLTNUSySixG
 dCmIgYn7LytEKV+vY+D8jrOKwIUkRAMiB8WJtiGZmWiX+dMgbhtYoKFiUQM3H0Cw80MW
 4F/QoeTlGpp7pUad+xjJrY3HzkB0jJnH0Nv26bFN2rJaK5ELha793GjYH9RX1u+3o91q
 uNfeubEPPzaXjtllyVR65emVg+XXI7SlsAnx9+yN9kYtfz9DBHp8KIt+6zl7WzgfDitv
 rcuriL/2nOjbiE4pY42HNRgsOOo6oL4L9bRuorjX4tMbtX3IT6thQz6jjdaoLes298P2
 1FOA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KrWoDIHc
Subject: Re: [Buildroot] [PATCH 07/10 v2] support/download/cvs: fix
 shellcheck
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/06/2024 19:53, Yann E. MORIN wrote:
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>   .checkpackageignore  | 1 -
>   support/download/cvs | 3 ++-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 8825d644ab..f8c5837e0a 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -1653,7 +1653,6 @@ support/dependencies/check-host-xzcat.sh Shellcheck
>   support/dependencies/dependencies.sh Shellcheck
>   support/download/bzr Shellcheck lib_shellscript.ConsecutiveEmptyLines
>   support/download/cargo-post-process Shellcheck
> -support/download/cvs Shellcheck
>   support/download/dl-wrapper Shellcheck
>   support/download/file Shellcheck
>   support/download/go-post-process Shellcheck
> diff --git a/support/download/cvs b/support/download/cvs
> index 0c079e2403..b771caf280 100755
> --- a/support/download/cvs
> +++ b/support/download/cvs
> @@ -40,12 +40,13 @@ shift $((OPTIND-1)) # Get rid of our options
>   # 10 minutes should do the trick.
>   _cvs() {
>       if [ -z "${quiet}" ]; then
> -        printf '%s ' timeout 10m ${CVS} "${@}"; printf '\n'
> +        printf '%s ' timeout 10m "${CVS}" "${@}"; printf '\n'
>       fi
>       _plain_cvs "$@"
>   }
>   # Note: please keep command below aligned with what is printed above
>   _plain_cvs() {
> +    # shellcheck disable=SC2086  # We really want word splitting in CVS
>       eval timeout 10m ${CVS} "${@}"

  My shellcheck 0.9.0 (compared to the 0.7.1 in our docker image) complains here 
that "${@}" is pointless here because of the eval. That seems correct. Shouldn't 
this be '"${@}"', which also removes the need from quoting in the caller?

  Shell is icky...

  Anyway, applied (unchanged) to master.

  Regards,
  Arnout

>   }
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
