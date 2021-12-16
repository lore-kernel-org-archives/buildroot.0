Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F0CC433EF
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 19:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FAEA4017B;
	Thu, 16 Dec 2021 19:09:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FaV_WhK_LzfQ; Thu, 16 Dec 2021 19:09:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A5B94046B;
	Thu, 16 Dec 2021 19:09:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C171A1BF3A9
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 19:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B007A4017B
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 19:09:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0IBVrXuV056B for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 19:08:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B31440017
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 19:08:59 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id y22so19749874edq.2
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 11:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=yW/gwFD/+q320HsY5a8fKRA0kZTUhlhtaXQkcf1wFto=;
 b=OZNTCz+ytsmQ22cx1TtjAS5h3/bbXQ3OvSNhyf99PS5+Vo62QR37qZhFJ0iWWfkWIT
 bwNUIvPKf/exenZCc1u0qqPd5rx9W7dYLIIrbELTTesEjyGQyo7L8qCwth45Y9YCRDod
 QDIJzGjl5zHVxut8HtGNxSmmO1rQJq0XU2vSKk/SZoF+ZabVFIJ98ut4WW82HRVcsKn1
 1lTYCs262w0djfsqEhVp6zm4/+wwoSeHvD41MR8R4m0yCCdOG1+l7wPUOQVu8XLNC/Mx
 ds4mPc6EVbYfIYdqq3B+QGbBD8hlRSvlZqWb6N+AJ7qHbJNMM+V1SO+3J/DY+t7g33cA
 i8GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=yW/gwFD/+q320HsY5a8fKRA0kZTUhlhtaXQkcf1wFto=;
 b=Ghahrgk0/ELVVtmbQ1Gf17A+a9OGMRjhLXrWfEd8lTha5Wbkim4nzaODrwZrbp3Wm4
 uYLRvfvV0t8xtF319VyZdxYQ+XDEAbwzjhq1k6DjQ8KYdj7Gqp4hLrPAG4gMMhLXQiWe
 RKbYD62N2DXNNPF341m/a+Wq/MXEPYJ6EMHkFbypdeXB2tt5mOw+yQ4l8pUQUHJ+Wt2W
 4CeNWOdtG/2C7E0ngp19Ytq5dFz1LVBp0ofxdqZXEt3cekxDlJmM9G0bkDy4mX+5Ioyq
 Tpud0XUdhoBeS6SoczntoR3NXe6yNZcL9jjOwC8QJuqUFsgSKKKyLvFByYWLDBQJJJBm
 Up/A==
X-Gm-Message-State: AOAM533CKh0g0MJdzLRRci6biAStoyM2k4Nf5XWTj31wgiGmctOXdVrD
 jyKsHEmCdFpvEL/o5e0Tkts6XS4fhlm8rA==
X-Google-Smtp-Source: ABdhPJwn0GpFmOvg7NopKRpFrSvk72Zz2kwakZRQxptk/G8r5RnST/1sLTZ1eHg129apOhhJT2UZ6A==
X-Received: by 2002:a05:6402:1241:: with SMTP id
 l1mr3529875edw.115.1639681737783; 
 Thu, 16 Dec 2021 11:08:57 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id c11sm2904782ede.32.2021.12.16.11.08.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 11:08:57 -0800 (PST)
Message-ID: <2974d708-c565-3201-5800-c72ca68437b1@mind.be>
Date: Thu, 16 Dec 2021 20:08:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20211215171540.4506-1-peter@korsgaard.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211215171540.4506-1-peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH] package/privoxy: security bump to version
 3.0.33
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



On 15/12/2021 18:15, Peter Korsgaard wrote:
> Fixes the following security issues:
> 
>    - cgi_error_no_template(): Encode the template name to prevent
>      XSS (cross-site scripting) when Privoxy is configured to servce
>      the user-manual itself.
>      Commit 0e668e9409c. OVE-20211102-0001. CVE-2021-44543.
>      Reported by: Artem Ivanov
> 
>    - get_url_spec_param(): Free memory of compiled pattern spec
>      before bailing.
>      Reported by Joshua Rogers (Opera) who also provided the fix.
>      Commit 652b4b7cb0. OVE-20211201-0003. CVE-2021-44540.
> 
>    - process_encrypted_request_headers(): Free header memory when
>      failing to get the request destination.
>      Reported by Joshua Rogers (Opera) who also provided the fix.
>      Commit 0509c58045. OVE-20211201-0002. CVE-2021-44541.
> 
>    - send_http_request(): Prevent memory leaks when handling errors
>      Reported by Joshua Rogers (Opera) who also provided the fix.
>      Commit c48d1d6d08. OVE-20211201-0001. CVE-2021-44542.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/privoxy/privoxy.hash | 8 ++++----
>   package/privoxy/privoxy.mk   | 2 +-
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/privoxy/privoxy.hash b/package/privoxy/privoxy.hash
> index 92ecd1dd21..cf1056ecc4 100644
> --- a/package/privoxy/privoxy.hash
> +++ b/package/privoxy/privoxy.hash
> @@ -1,6 +1,6 @@
> -# From https://sourceforge.net/projects/ijbswa/files/Sources/3.0.32%20%28stable%29/
> -md5  3a0a8ebdf80e0a29154683e74cbf510b  privoxy-3.0.32-stable-src.tar.gz
> -sha1  3a298ab2599fc92555c86dc29a37742d7396a0d3  privoxy-3.0.32-stable-src.tar.gz
> +# From https://sourceforge.net/projects/ijbswa/files/Sources/3.0.33%20%28stable%29/
> +md5  d6caf3eaad4812f0658b68d5b3ba3a06  privoxy-3.0.33-stable-src.tar.gz
> +sha1  688da305077d8ecbcf6423e02201f01f7a7098f4  privoxy-3.0.33-stable-src.tar.gz
>   # Locally computed
> -sha256  c61de4008c62445ec18f1f270407cbf2372eaba93beaccdc9e3238bb2defeed7  privoxy-3.0.32-stable-src.tar.gz
> +sha256  04b104e70dac61561b9dd110684b250fafc8c13dbe437a60fae18ddd9a881fae  privoxy-3.0.33-stable-src.tar.gz
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
> diff --git a/package/privoxy/privoxy.mk b/package/privoxy/privoxy.mk
> index c1859ed5f2..06642200df 100644
> --- a/package/privoxy/privoxy.mk
> +++ b/package/privoxy/privoxy.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -PRIVOXY_VERSION = 3.0.32
> +PRIVOXY_VERSION = 3.0.33
>   PRIVOXY_SITE = http://downloads.sourceforge.net/project/ijbswa/Sources/$(PRIVOXY_VERSION)%20%28stable%29
>   PRIVOXY_SOURCE = privoxy-$(PRIVOXY_VERSION)-stable-src.tar.gz
>   # configure not shipped
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
