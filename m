Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B69DC433EF
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 17:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0976942010;
	Fri, 17 Dec 2021 17:44:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q55_ngARNqF7; Fri, 17 Dec 2021 17:44:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A97F42002;
	Fri, 17 Dec 2021 17:44:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B223C1BF2AF
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 17:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A17D584D29
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 17:44:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wpxveagYu6lg for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 17:44:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B3F5484CE8
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 17:44:45 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id y12so10578954eda.12
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 09:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/9daZQ8F9ftxsIT50cuEr2Kzblawsfoi0XE17CJ10Eo=;
 b=SbAryuuNIYY0GH+Es6PQiYuRDRmBf9YwuL2AoiafPbO5WgoRrS9q9BgIGIpQ5kieM6
 VYqM+Atfw35PmSHIhwHOBMWgTCygrjmKTgobnlmfJLEYFzQvlF7dJUZsyE1r989fCw0H
 6NChe4lk2cQ/vizXLBUAqtJEVSjnrexZpZ6jcs/pQfJ2FLdl7m9pI6ulyxT6N3EDtZf1
 jMgccDqzb6k6aqEZ+LODCArDOxznQTmCgsOAtUApcs3IpG/HF/Scl7bsVyV6Rj87C2pD
 JIO8rjf7Q/93mKjddxZQkQjltDdr7pqITYi+riVnSKwFVgkNlvBc5hZzabtareeW1M5/
 gc8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/9daZQ8F9ftxsIT50cuEr2Kzblawsfoi0XE17CJ10Eo=;
 b=Hc+5a/S8Ioi77DmVIUrJIQRfau5DCFvtYKG0Jy6sz6YJ9fhviwomHa8y0IUMS7IR/v
 T28sw7ZUedS20NdT0TxNE3I/xKfAa45+uiclXDj/pKWMZBH8bkif81muEmD6t0+pyamv
 dmLolx7Kq3RssZAVLZ2uXxaZhbXH+v26xib52JgSjmOI1c+ezW/hjMJEYdL2RYNyxZzG
 Ksnzhk4MRk0XrJea6o1A6qxOA1440EWomlHgmsjp/KRRoTzmfQeAa0WAMhlexMMSuVh0
 PVI8aciFVCOYbEZeAvpYM99lwGxjQIo4y2N/jnrGXt3HkrdvXYcbnFZ/j4mzW8gS0I+l
 ikZA==
X-Gm-Message-State: AOAM533tDK3ThOeXto7WFcskDezkr81ScFPmbp4sW3b0S7CIuLuAC0us
 CqplGXu2bDqfldsINF4iSa0vcg==
X-Google-Smtp-Source: ABdhPJz4D5DqaIvPJevp1NLI53ShIHbfNfRnJ/f+EYn9Bc7Tcnc6xeFzjFp5tOsOeYlY/bFxw4mDEw==
X-Received: by 2002:a17:907:9152:: with SMTP id
 l18mr3411576ejs.382.1639763084002; 
 Fri, 17 Dec 2021 09:44:44 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id d1sm3074686ejo.176.2021.12.17.09.44.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 09:44:43 -0800 (PST)
Message-ID: <f7fc2019-491e-fd02-d62a-d23a5a86d8e5@mind.be>
Date: Fri, 17 Dec 2021 18:44:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211216225339.1067213-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211216225339.1067213-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/tcl: bump to version 8.6.12
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
Cc: Davide Viti <zinosat@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/12/2021 23:53, Fabrice Fontaine wrote:
> - Refresh patch
> - Update indentation in hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Both applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/tcl/0001-dont-build-compat.patch | 14 +++++++-------
>   package/tcl/tcl.hash                     |  4 ++--
>   package/tcl/tcl.mk                       |  2 +-
>   3 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/package/tcl/0001-dont-build-compat.patch b/package/tcl/0001-dont-build-compat.patch
> index c0d5d85da7..7a7d959cd2 100644
> --- a/package/tcl/0001-dont-build-compat.patch
> +++ b/package/tcl/0001-dont-build-compat.patch
> @@ -7,7 +7,7 @@ anything buildroot is using as a standard C library will be good enough
>   to not have broken behavior.
>   
>   Signed-off-by: Andrew Ruder <andrew.ruder@elecsyscorp.com>
> -[Fabrice: Update for 8.6.9]
> +[Fabrice: Update for 8.6.12]
>   Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>   ---
>   
> @@ -15,11 +15,11 @@ diff --git a/unix/tcl.m4 b/unix/tcl.m4
>   --- a/unix/tcl.m4
>   +++ b/unix/tcl.m4
>   @@ -2725,7 +2725,7 @@ AC_DEFUN([SC_TCL_CHECK_BROKEN_FUNC],[
> -     if test ["$tcl_ok"] = 1; then
> - 	AC_CACHE_CHECK([proper ]$1[ implementation], [tcl_cv_]$1[_unbroken],
> - 	    AC_TRY_RUN([[int main() {]$2[}]],[tcl_cv_]$1[_unbroken]=ok,
> --		[tcl_cv_]$1[_unbroken]=broken,[tcl_cv_]$1[_unbroken]=unknown))
> -+		[tcl_cv_]$1[_unbroken]=broken,[tcl_cv_]$1[_unbroken]=ok))
> - 	if test ["$tcl_cv_]$1[_unbroken"] = "ok"; then
> + #include <stdlib.h>
> + #include <string.h>
> + int main() {]$2[}]]])],[tcl_cv_$1_unbroken=ok],
> +-		[tcl_cv_$1_unbroken=broken],[tcl_cv_$1_unbroken=unknown]))
> ++		[tcl_cv_$1_unbroken=broken],[tcl_cv_$1_unbroken=unknown]))
> +	if test ["$tcl_cv_]$1[_unbroken"] = "ok"; then
>    	    tcl_ok=1
>    	else
> diff --git a/package/tcl/tcl.hash b/package/tcl/tcl.hash
> index 913190b95c..2b82a1938b 100644
> --- a/package/tcl/tcl.hash
> +++ b/package/tcl/tcl.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256 ad0cd2de2c87b9ba8086b43957a0de3eb2eb565c7159d5f53ccbba3feb915f4e  tcl8.6.9-src.tar.gz
> -sha256 c0a69a2bfd757361ec7e6143973b103c90409316b49e9c88db26ad6388e79f16  license.terms
> +sha256  26c995dd0f167e48b11961d891ee555f680c175f7173ff8cb829f4ebcde4c1a6  tcl8.6.12-src.tar.gz
> +sha256  c0a69a2bfd757361ec7e6143973b103c90409316b49e9c88db26ad6388e79f16  license.terms
> diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
> index 7c456e89b3..97754b63d0 100644
> --- a/package/tcl/tcl.mk
> +++ b/package/tcl/tcl.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   TCL_VERSION_MAJOR = 8.6
> -TCL_VERSION = $(TCL_VERSION_MAJOR).9
> +TCL_VERSION = $(TCL_VERSION_MAJOR).12
>   TCL_SOURCE = tcl$(TCL_VERSION)-src.tar.gz
>   TCL_SITE = http://downloads.sourceforge.net/project/tcl/Tcl/$(TCL_VERSION)
>   TCL_LICENSE = TCL
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
