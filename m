Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D50DEECAAD1
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 21:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81F3C60E0D;
	Sat, 27 Aug 2022 21:15:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81F3C60E0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d9ypVcBsJucJ; Sat, 27 Aug 2022 21:15:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80A44605B1;
	Sat, 27 Aug 2022 21:15:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80A44605B1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6731E1BF479
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 21:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 413D64038E
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 21:15:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 413D64038E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id plH9HtHUSjSZ for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 21:15:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36AE6400CC
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 36AE6400CC
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 21:15:35 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id b16so5939041edd.4
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 14:15:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=PlI9sj7tWNI+sH1+5I4rMzmK7gC96ffq8ZYq9PYlbOU=;
 b=mejHlVHbTcLtiXm2p1Z7/tNJBS7me6gfE4BiYqPXR3O2sbJAnv8F83th9lxNC8vf5P
 GjMZydF2EdnuYsm90FCNJskedRZCxGlkEtPNtQscWVT26ZBYA4mXmbxJEW02aNunCTX1
 6vHLezMhKpvJY5SiRzPxQXFaNt11dMtXZgrExnjoT9bEzzidKmb4PvS4BfoEWIpjaR09
 BBIDR9CvgdfbsuEii8rqeLiZ2qABbV7HhLJ5eo+8ettyZ7as2qFJtxPGzVLcmVNiKWjc
 GoGA7Z2HfGj95pm6BZvETlRYzFl2WKahIQC737UtVvoYO0dQbhWJwWWGELYy/58eXet1
 3sKA==
X-Gm-Message-State: ACgBeo1Mz/LBe9Dd1qGynS60OIkkRoqzdkRRTiSW+8NrcvDjde+SEgio
 wVIDowbt/tiJIsi6O1Zob+W19w==
X-Google-Smtp-Source: AA6agR6TYa41EkaOiyCi1ETM2IAZS5yNPTcN2/6SIeUILxwDpLnsb5sWpA8FY07jqKCOuX+bDXQoFQ==
X-Received: by 2002:a05:6402:1e8c:b0:43d:db52:78a8 with SMTP id
 f12-20020a0564021e8c00b0043ddb5278a8mr11085718edf.324.1661634933423; 
 Sat, 27 Aug 2022 14:15:33 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 m24-20020a509318000000b00445b5874249sm3268906eda.62.2022.08.27.14.15.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Aug 2022 14:15:33 -0700 (PDT)
Message-ID: <05404f6d-7300-93af-f1e2-056a715baaa5@mind.be>
Date: Sat, 27 Aug 2022 23:15:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-GB
To: Jesse Van Gavere <jesseevg@gmail.com>, buildroot@buildroot.org
References: <20220826135503.20612-1-jesseevg@gmail.com>
 <20220826135503.20612-3-jesseevg@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220826135503.20612-3-jesseevg@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc;
 bh=PlI9sj7tWNI+sH1+5I4rMzmK7gC96ffq8ZYq9PYlbOU=;
 b=Wi+TRC6r3UYBroiyj/Xny0DfQkytqKnNhFKpTel75xXeqqxETlnwty5XffKPzU1M4n
 6vnhprBeeJLbFY1RZcQaTdn/usCkiIiTbUdUhghUB+P+AWRKDl18fUKwpj5Ax7Q3zVBr
 XgwqwcaIoSuAKqemQUtqb1MKSPwFEy6Lnbn+uF9Nd9XDmnngrCnTeWeK8n30y3TCpUvL
 upA8P7EOFJwRPZTXFSdPbonFiCoGt65jwFJpWAzpSr2NikG1GK24FAFnIPdrANc9AneB
 w3srP1/9tNdiMPlDKEPbxt6wNmV41a6iQV6J/PPq4pIK6flXPXiHPnFQAX4W0u3b2m1r
 ZeLQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Wi+TRC6r
Subject: Re: [Buildroot] [PATCH v4 02/29] package/qt6/qt6base: Add license
 information
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/08/2022 15:54, Jesse Van Gavere wrote:
> Add license hashes to the hash file and add the information into the makefile

  Commit messages are normally wrapped at 72 columns.

> 
> Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
> ---
>   package/qt6/qt6base/qt6base.hash | 6 ++++++
>   package/qt6/qt6base/qt6base.mk   | 2 ++
>   2 files changed, 8 insertions(+)
> 
> diff --git a/package/qt6/qt6base/qt6base.hash b/package/qt6/qt6base/qt6base.hash
> index 31ed2494af..5efc5c2815 100644
> --- a/package/qt6/qt6base/qt6base.hash
> +++ b/package/qt6/qt6base/qt6base.hash
> @@ -1,2 +1,8 @@
>   # Hash from: https://download.qt.io/official_releases/qt/6.3/6.3.1/submodules/qtbase-everywhere-src-6.3.1.tar.xz.sha256
>   sha256  0a64421d9c2469c2c48490a032ab91d547017c9cc171f3f8070bc31888f24e03  qtbase-everywhere-src-6.3.1.tar.xz
> +# Hashes for license files:
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
> +sha256  0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
> +sha256  88ec689407cf2df9b2eb5c45952564d51ce73c129a3bdffb15c0d2d161ad7558  LICENSE.LGPLv3

  You clearly just copied this from qt5base... However, the name has changes to 
LICENSE.GPL3, and the file has been reflowed and the Qt-specific blurb in the 
beginning has been removed. So the hash is not the same.

> +sha256  ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL

  This one also had some whitespace differences with the qt5base one.

  Applied to master with the hashes and filenames fixed, thanks!

  Regards,
  Arnout

> diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
> index c67d94e193..7a0838b2bc 100644
> --- a/package/qt6/qt6base/qt6base.mk
> +++ b/package/qt6/qt6base/qt6base.mk
> @@ -7,6 +7,8 @@
>   QT6BASE_VERSION = $(QT6_VERSION)
>   QT6BASE_SITE = $(QT6_SITE)
>   QT6BASE_SOURCE = qtbase-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6BASE_VERSION).tar.xz
> +QT6BASE_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
> +QT6BASE_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
>   QT6BASE_DEPENDENCIES = \
>   	host-ninja \
>   	host-qt6base \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
