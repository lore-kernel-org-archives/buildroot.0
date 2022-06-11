Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDD4C43334
	for <buildroot@archiver.kernel.org>; Sat, 11 Jun 2022 17:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B14C642564;
	Sat, 11 Jun 2022 17:40:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Rt21QxVacpO; Sat, 11 Jun 2022 17:40:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEA1542555;
	Sat, 11 Jun 2022 17:40:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 199241BF82C
 for <buildroot@lists.busybox.net>; Sat, 11 Jun 2022 17:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0714B8412F
 for <buildroot@lists.busybox.net>; Sat, 11 Jun 2022 17:40:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F3sNG5TqSIZi for <buildroot@lists.busybox.net>;
 Sat, 11 Jun 2022 17:40:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 05CA584129
 for <buildroot@buildroot.org>; Sat, 11 Jun 2022 17:40:31 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id u12so3613950eja.8
 for <buildroot@buildroot.org>; Sat, 11 Jun 2022 10:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=uSWEplzlA7kSrPhhfbB2didYy/QofHx8MgWliO/nV2A=;
 b=azBV0R1dZk62f84zv5cDX5lVclf/s4v2TkMvAlUEQwFmlg5ywzliqeVlVKkAyNiiby
 L8/3nE9ZyVmV/0cQHkIYEG0AIlDBfEwrfH7Ofa3HJLNREIMFYsNXPa8uml5VY/mPE1rL
 Xm5xOuhqeL88oWMLB53pZv3t8AcQYZJPq5M1nlwcQP8u6IjLj9FhpVaav+1mcyIK04vL
 sLW3wq9kfJ5FmN4ZFwNWOOWKCRZtPF4idtMAjv4UeoF2QcHA9ljMJmtTaERYJPnjX8zR
 EIRrXOBcbuuvZaWO2/CKGyll7ddCvni4FkAbiKkN7et7lPgDcCnOaawvvTFXNq/SFPZO
 DaeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=uSWEplzlA7kSrPhhfbB2didYy/QofHx8MgWliO/nV2A=;
 b=t5/d/z23JEVH/BGF4nFut8WrJEbENmVFj3SUT5SLskJ8gcz3TnAUwnRj9thuiCE4MW
 hJ8bMFTAfdFhhHHRuThoaQHq8qEY60ICOqrAXxb/NJC8N0G6dl+cLRNA2JuQfLsBqsWE
 fHhb1AGlJ0nIn57aQ5jrmELsWjGFe+ZockKrNYgfhzeiUqgspgLv4wLapRJHhBlqjMjo
 wCq3svhHoPYmP2Jms9mca87h2etR0PhoRZqCdKkjA1oSj2LkZLXsZuWCMZ0Z3BJDTy2X
 fyqaI4YmPvyyvSdxa7k/aZXKnMilVkF50SJWPEbokyZvoflYD3ucISdMFJQFdjJ/LddL
 3C6w==
X-Gm-Message-State: AOAM530D9g7V78Dead8wNyEONyS0aeKlSoIYRVP+xI/Mfcs7XL7gakvk
 1lHz7lXrX7YPidkVzoRje/1S3Q==
X-Google-Smtp-Source: ABdhPJxkyH493Lc/iYCgvfy4HTMGEmhrDQbWe4/Hs25+At7XVtmGebYCtGxPJyob1N3Km+T+pxHvwQ==
X-Received: by 2002:a17:906:9f1c:b0:711:cdda:a01f with SMTP id
 fy28-20020a1709069f1c00b00711cddaa01fmr29295659ejc.372.1654969230219; 
 Sat, 11 Jun 2022 10:40:30 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 k8-20020a056402048800b0042cf43e1937sm1752965edv.75.2022.06.11.10.40.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Jun 2022 10:40:29 -0700 (PDT)
Message-ID: <b190b147-d669-855a-c5a4-0046586e0fc6@mind.be>
Date: Sat, 11 Jun 2022 19:40:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220606142118.1055501-1-fontaine.fabrice@gmail.com>
 <55581997-b9da-7187-204c-3a47b32d6350@mind.be>
 <20220606211315.GA427639@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220606211315.GA427639@scaer>
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Mauro Condarelli <mc5686@mclink.it>, Matt Weber <matthew.weber@collins.com>,
 Bernd Kuhls <bernd.kuhls@t-online.de>,
 =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>, Norbert Lange <nolange79@gmail.com>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 =?UTF-8?Q?Jos=c3=a9_Pekkarinen?= <jose.pekkarinen@unikie.com>,
 =?UTF-8?Q?Manuel_V=c3=b6gele?= <develop@manuel-voegele.de>,
 Pierre-Jean Texier <texier.pj2@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Asaf Kahlon <asafka7@gmail.com>, Lionel Flandrin <lionel@svkt.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/06/2022 23:13, Yann E. MORIN wrote:
> Fabrice, Arnout, All,
> 
> On 2022-06-06 21:06 +0200, Arnout Vandecappelle spake thusly:
>> On 06/06/2022 16:21, Fabrice Fontaine wrote:
>>> libopenssl needs atomic or the build will fail (e.g. on sparcv8 without
>>> libatomic):
>>
>>   I don't understand how it's possible that this error happens only with
>> James' fully random configs, and not with e.g. bootlin-m68k-5208-uclibc
>> (which I double checked does still have autobuilder results, and does not
>> have libatomic). In fact, there are successful builds of libopenssl without
>> libatomic, e.g. [1]. I found this with the autobuild query [2] (there's no
>> way to search for the absence of a symbol in the advanced search, but
>> m68k_cf5208 can't have atomic so it's a good way to search it).
> 
> I did some test, and indeed, sparc v8 fails to build. But leon builds
> successfully.
> 
> For sparc v8, there are indeed references to __atomic_fetch_sub_4 and
> __atomic_fetch_add_4. But for leon, none.

  I've had a look as well, and it looks like this is from
include/internal/refcount.h, which uses atomics under this condition:

# elif defined(__GNUC__) && defined(__ATOMIC_RELAXED) && 
__GCC_ATOMIC_INT_LOCK_FREE > 0

I guess GCC incorrectly sets one of these options?



>>> ${LDCMD:-/nvmedata/autobuild/instance-7/output-1/host/bin/sparc-buildroot-linux-uclibc-gcc}  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O0 -g2  -g2  -L.   \
>>> 	-o apps/openssl apps/asn1pars.o apps/ca.o apps/ciphers.o apps/cms.o apps/crl.o apps/crl2p7.o apps/dgst.o apps/dhparam.o apps/dsa.o apps/dsaparam.o apps/ec.o apps/ecparam.o apps/enc.o apps/engine.o apps/errstr.o apps/gendsa.o apps/genpkey.o apps/genrsa.o apps/nseq.o apps/ocsp.o apps/openssl.o apps/passwd.o apps/pkcs12.o apps/pkcs7.o apps/pkcs8.o apps/pkey.o apps/pkeyparam.o apps/pkeyutl.o apps/prime.o apps/rand.o apps/rehash.o apps/req.o apps/rsa.o apps/rsautl.o apps/s_client.o apps/s_server.o apps/s_time.o apps/sess_id.o apps/smime.o apps/speed.o apps/spkac.o apps/srp.o apps/storeutl.o apps/ts.o apps/verify.o apps/version.o apps/x509.o \
>>> 	 apps/libapps.a -lssl -lcrypto -ldl
>>> /nvmedata/autobuild/instance-7/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: ./libssl.so: undefined reference to `__atomic_fetch_sub_4'
>>>
>>> It should be noted that openssl3 has added OPENSSL_DEV_NO_ATOMICS but
>>> "this is intended for internal development only, to check the
>>> refcounting is properly coded.  It should never become a configuration
>>> option, hence the name of the macro.":
>>> https://github.com/openssl/openssl/commit/503d4745a115b82db01c1fb22baaddb153d27cdb
>>>
>>> Fixes:
>>>   - http://autobuild.buildroot.org/results/bce526d538f43a541fdfbc0c9b4a7cecebbbc539
>>>
>>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>>
>> [snip]
>>> diff --git a/package/openssl/Config.in b/package/openssl/Config.in
>>> index 7bf49b05f6..ed165569f0 100644
>>> --- a/package/openssl/Config.in
>>> +++ b/package/openssl/Config.in
>>> @@ -16,6 +16,7 @@ choice
>>>   config BR2_PACKAGE_LIBOPENSSL
>>>   	bool "openssl"
>>> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC
>>
>>   Unfortunately, this is not enough (and it is already a huge patch...).
>>
>>   The result of this new dependency is that openssl is only available if
>> BR2_TOOLCHAIN_HAS_ATOMIC (libopenssl) ||
>> (!BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL && BR2_TOOLCHAIN_HAS_THREADS &&
>>   !(BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU))
>>
>>   So, in addition to the packages that select
>> BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL, all the packages that select
>> BR2_PACKAGE_OPENSSL have to be updated as well...
> 
> This is going to be a huge change...
> 
> Can we maybe instead add an exception in the autobuilders, so that
> "fringe" architectures or variants just get excluded?

  Yeah, that's a good fallback. We already have a bunch of exception handling 
like that in genrandconfig.

  Regards,
  Arnout

> 
> Regards,
> Yann E. MORIN.
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
