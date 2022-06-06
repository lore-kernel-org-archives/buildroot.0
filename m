Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47590C43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 19:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B75AE83F4A;
	Mon,  6 Jun 2022 19:06:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xodtTYkXXXf5; Mon,  6 Jun 2022 19:06:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A57EC83F47;
	Mon,  6 Jun 2022 19:06:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 128031BF982
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 19:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C60C408DD
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 19:06:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OYYDkSMrkte4 for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 19:06:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B3F78408D6
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 19:06:30 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id c2so20073589edf.5
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 12:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ivmceVJcQXb2xDbODoXsZWLGyiwt8k1jni/avLi0hkc=;
 b=GkH1DUr87u//ph4R5FIKeYLkdP560bezY17k9yM3yp3eFT/4IRv4Er038o8M6CohjR
 bd0vqKHLcoZlITOvV2h8tbb7NjnA3WNDJWFvfFtNo5txmdf9acWr5bOJqXZD5XDRPJXP
 QYAVt/9CIRhE5+ZN+/tLBz7STyRqAyID6W7ul7HENnjdG6oGzcp6x4altn1+T79LKGDZ
 zWk27LwA9NbUzlCoIVLwP90UGJ5s2tnUA1A7IqmkWpe9AWDzUVO1vPz8qoHGhPloYZdD
 Yix1Yjft0G6JbZOY6K5+VcnrkUGmNTSagsQH33s3duF9jB3IhXwu6qLzcIpVYxK2YSI9
 +w2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ivmceVJcQXb2xDbODoXsZWLGyiwt8k1jni/avLi0hkc=;
 b=ovSnrEJWbuN8MANOliQ9IzOEcqQuG4uXjEmV61oKL3zmx58bMiOa9WjFbhXFUrRx1o
 tK7wnnx6V33SWZsSMEB9o0/1kFWQ712sysr675PfZJKF/rY1jYJAJnXucA+bAuwx/Fc4
 kg7x41e/0T3nuyWHv1kvkcgbF7l/XR14W9WWZu+/YL1pZ4SeZ0qxTLDMG2WEeRa9n1mk
 95nU2heb7kHJS8VdWdF/3scQx/N2gr5QZCcJx1lZhGq6VwY5fVFUcaIK2/bK3HGhskKk
 ki1B+FJX3oHlZH+we49iRXxH5P4aLWwAKfkBKGEzLvsWwU0+vONcBJVdkt9U//2zZmBH
 TTwA==
X-Gm-Message-State: AOAM531bpAwt5SMQN1Vi1lpRI437tbLkGDUy5EsFED3NZiJETjGoSR+v
 AzdW2e3cfIrPEmdYoXbzjMSHcg==
X-Google-Smtp-Source: ABdhPJzFy6Lk8nnhchtbhi0eGeylkBTAo9K98h++4dbmphk+jVLK5KVwj9H4O5/QxtGo+51P8yFcpw==
X-Received: by 2002:a05:6402:11cd:b0:42f:c5a3:c441 with SMTP id
 j13-20020a05640211cd00b0042fc5a3c441mr17155121edw.62.1654542388796; 
 Mon, 06 Jun 2022 12:06:28 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 be5-20020a0564021a2500b0042e09f44f81sm7778386edb.38.2022.06.06.12.06.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 12:06:28 -0700 (PDT)
Message-ID: <55581997-b9da-7187-204c-3a47b32d6350@mind.be>
Date: Mon, 6 Jun 2022 21:06:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220606142118.1055501-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220606142118.1055501-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/openssl: libopenssl needs atomic
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
Cc: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Gustavo Heinz <gustavo@gsthnz.com>,
 Sven Haardiek <sven.haardiek@iotec-gmbh.de>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>, Matt Weber <matthew.weber@collins.com>,
 Bernd Kuhls <bernd.kuhls@t-online.de>,
 =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Peter Seiderer <ps.report@gmx.net>, Norbert Lange <nolange79@gmail.com>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 =?UTF-8?Q?Jos=c3=a9_Pekkarinen?= <jose.pekkarinen@unikie.com>,
 =?UTF-8?Q?Manuel_V=c3=b6gele?= <develop@manuel-voegele.de>,
 Lionel Flandrin <lionel@svkt.org>, Pierre-Jean Texier <texier.pj2@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/06/2022 16:21, Fabrice Fontaine wrote:
> libopenssl needs atomic or the build will fail (e.g. on sparcv8 without
> libatomic):

  I don't understand how it's possible that this error happens only with James' 
fully random configs, and not with e.g. bootlin-m68k-5208-uclibc (which I double 
checked does still have autobuilder results, and does not have libatomic). In 
fact, there are successful builds of libopenssl without libatomic, e.g. [1]. I 
found this with the autobuild query [2] (there's no way to search for the 
absence of a symbol in the advanced search, but m68k_cf5208 can't have atomic so 
it's a good way to search it).

> 
> ${LDCMD:-/nvmedata/autobuild/instance-7/output-1/host/bin/sparc-buildroot-linux-uclibc-gcc}  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O0 -g2  -g2  -L.   \
> 	-o apps/openssl apps/asn1pars.o apps/ca.o apps/ciphers.o apps/cms.o apps/crl.o apps/crl2p7.o apps/dgst.o apps/dhparam.o apps/dsa.o apps/dsaparam.o apps/ec.o apps/ecparam.o apps/enc.o apps/engine.o apps/errstr.o apps/gendsa.o apps/genpkey.o apps/genrsa.o apps/nseq.o apps/ocsp.o apps/openssl.o apps/passwd.o apps/pkcs12.o apps/pkcs7.o apps/pkcs8.o apps/pkey.o apps/pkeyparam.o apps/pkeyutl.o apps/prime.o apps/rand.o apps/rehash.o apps/req.o apps/rsa.o apps/rsautl.o apps/s_client.o apps/s_server.o apps/s_time.o apps/sess_id.o apps/smime.o apps/speed.o apps/spkac.o apps/srp.o apps/storeutl.o apps/ts.o apps/verify.o apps/version.o apps/x509.o \
> 	 apps/libapps.a -lssl -lcrypto -ldl
> /nvmedata/autobuild/instance-7/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: ./libssl.so: undefined reference to `__atomic_fetch_sub_4'
> 
> It should be noted that openssl3 has added OPENSSL_DEV_NO_ATOMICS but
> "this is intended for internal development only, to check the
> refcounting is properly coded.  It should never become a configuration
> option, hence the name of the macro.":
> https://github.com/openssl/openssl/commit/503d4745a115b82db01c1fb22baaddb153d27cdb
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/bce526d538f43a541fdfbc0c9b4a7cecebbbc539
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

[snip]
> diff --git a/package/openssl/Config.in b/package/openssl/Config.in
> index 7bf49b05f6..ed165569f0 100644
> --- a/package/openssl/Config.in
> +++ b/package/openssl/Config.in
> @@ -16,6 +16,7 @@ choice
>   
>   config BR2_PACKAGE_LIBOPENSSL
>   	bool "openssl"
> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC

  Unfortunately, this is not enough (and it is already a huge patch...).

  The result of this new dependency is that openssl is only available if 
BR2_TOOLCHAIN_HAS_ATOMIC (libopenssl) ||
(!BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL && BR2_TOOLCHAIN_HAS_THREADS &&
  !(BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU))

  So, in addition to the packages that select 
BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL, all the packages that select 
BR2_PACKAGE_OPENSSL have to be updated as well...


  Regards,
  Arnout

[1] 
http://autobuild.buildroot.net/results/a65/a657ed52268c26ea1f88ff22bae2e1d11d23a6f5//
[2] 
http://autobuild.buildroot.net/index.php?status=OK&symbols[BR2_m68k_cf5208]=y&symbols[BR2_PACKAGE_LIBOPENSSL]=y




[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
