Return-Path: <SRS0=TKET=PH=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49AE4C433F5
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 20:25:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D2FD6128B
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 20:25:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4D2FD6128B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 142014061B;
	Tue, 19 Oct 2021 20:25:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1AhFJpHVJb7Y; Tue, 19 Oct 2021 20:25:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73A004062E;
	Tue, 19 Oct 2021 20:25:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BD9651BF476
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 20:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACCF56065F
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 20:25:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e9i7z9tJBm74 for <buildroot@lists.busybox.net>;
 Tue, 19 Oct 2021 20:25:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B08D16064C
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 20:25:52 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id r4so10745651edi.5
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 13:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=eyWr1C4W4R0ei6/u4qt3q644AWcF/pfb+6YJP+6vrk4=;
 b=ht+nvGyd8d8rRj7QfH9n+EjKYtXShzWgL1p7bGWl2ssMv1fj9MTHIYzIolswx7DLxv
 Trp70g5IiLn0J2y1x7JkjkPuDkqUBay3gzS70vE/KydxQbRB+h4xHm02K3gi4trZvfpi
 MuJLut9WLK9WZpCTpr3zxIQBOqiTDCkwVlnip/KYGwG3ZSFfLuPx+4chnqdaezjtTtZb
 U7tMD7Ag9PrQHi2CtdqSk+vIbeJDWzzM1gwrPdhCgMGTtOEK66/SV34LSkiGkoKCzEJh
 ZcJjJX2U7+v2mR/qbcbSW5IHrhbLwY9gO8kCFnFzXqKpRQ4iSuSSCmgIWSIxbCAvwxjI
 V+DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=eyWr1C4W4R0ei6/u4qt3q644AWcF/pfb+6YJP+6vrk4=;
 b=QZC1M7v4UxEw4ROhNtNKg1X/ZtUekbW4VdIE6/BLqV3TrHMps0Kiomr2s3unAYfCSM
 0cErCP5jOpdPhqK5uT/4vJqdRIiWNFBKGAyrH7ooyHz9SNhWXXDXHXQ4Go+QLvzOi4Zf
 tc+nz7LVkOGGdugr5tCM2zV2Ldy62oSt3YQyCCEXtqLCKU+jY533lroWCPTEt+zF78M2
 HI29rSrocZ7Op8zrooAhNxRY/5LB4B1M45R5Ndbe9xM/lh6ZgLts0Gk/ejA0it77Yv2y
 wr8AWIodGmfsxO+XfwfVvM5zyiD1RXss4gQpnuvJTKDnOCRBZyfxv2qzbYyl+tqmkuXe
 B9gg==
X-Gm-Message-State: AOAM530JPr0Ue5Ygy2NU16pZCJCjAK9QF8gEp3t7C0z5k9DllMOnFKEO
 L+OBWOvpIOaFupi8IxLwGEpXoeWPF/VnIfOb
X-Google-Smtp-Source: ABdhPJzV/yQiK3/tg14JWytb4MR2VQDEhu5q8J7LHPDlOMW8dchJ9T13sUBHTxeppU9HGbEt89C+fg==
X-Received: by 2002:a17:906:720e:: with SMTP id
 m14mr40697261ejk.500.1634675150719; 
 Tue, 19 Oct 2021 13:25:50 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id cr9sm55029edb.17.2021.10.19.13.25.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 13:25:50 -0700 (PDT)
Message-ID: <13c3735c-9fd1-abfd-1b06-1d7ccf2425ff@mind.be>
Date: Tue, 19 Oct 2021 22:25:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Will Eccles <will@eccles.dev>, buildroot@buildroot.org
References: <20211018203038.32453-1-will@eccles.dev>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211018203038.32453-1-will@eccles.dev>
Subject: Re: [Buildroot] [PATCH] package/openssh: reset umask when init
 script exits
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

  Hi Will,

On 18/10/2021 22:30, Will Eccles wrote:
> S50sshd updates umask to 077, but does not reset it when it exits. This
> results in the root user's umask being configured incorrectly (assuming
> a default of 022 or otherwise).

  Can you explain in which context this happens?

  Normally this script is executed by /etc/init.d/rcS, which contains this code:

      case "$i" in
         *.sh)
             # Source shell script for speed.
             (
                 trap - INT QUIT TSTP
                 set start
                 . $i
             )
             ;;
         *)
             # No sh extension, so fork subprocess.
             $i start
             ;;

  Since the script doesn't end with .sh, it will fork, so the umask doesn't "stick".

  Same when you execute the script interactively: the umask isn't inherited by 
the parent shell.

  And when you source the script, the trap doesn't even trigger at the end of 
the script, so this patch doesn't actually reset the umask.


  So I don't understand how it's possible that this patch fixes your problem.


  Regards,
  Arnout


> This patch adds a trap to reset umask
> when the script exits. This is convenient on systems where, for example,
> configs such as /etc/profile may not be sourced by the root user. It may
> also prevent issues with other init scripts which may inherit this umask
> unintentionally, leading to improper permissions elsewhere in the
> system.
> 
> Signed-off-by: Will Eccles <will@eccles.dev>
> ---
> Backport to: 2021.02.6, 2021.08.1
> (These are the releases on buildroot.org as of this writing, but as far
> as I can tell, even releases as far back as 2012 have the same problem.)
> ---
>   package/openssh/S50sshd | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/package/openssh/S50sshd b/package/openssh/S50sshd
> index 22da41d1ca..94cf4c14e8 100644
> --- a/package/openssh/S50sshd
> +++ b/package/openssh/S50sshd
> @@ -6,6 +6,8 @@
>   # Make sure the ssh-keygen progam exists
>   [ -f /usr/bin/ssh-keygen ] || exit 0
>   
> +# Reset uname at exit
> +trap "uname $(uname)" EXIT
>   umask 077
>   
>   start() {
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
