Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA25CD8CAC
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 18:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 08E2840111;
	Tue, 10 Oct 2023 18:11:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08E2840111
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cLs3mFX670CG; Tue, 10 Oct 2023 18:11:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F20604157B;
	Tue, 10 Oct 2023 18:10:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F20604157B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5CBF21BF2C2
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 18:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 327AC40111
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 18:10:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 327AC40111
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2GUPmSQVDSbd for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 18:10:57 +0000 (UTC)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ADF5D4157B
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 18:10:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADF5D4157B
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-53829312d12so235536a12.0
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 11:10:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696961454; x=1697566254;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PFe/d/IzC0mNAbcye4QIJmRyXrLfkX1i34N0Fgs/Elw=;
 b=LwSYCIM+tmT/VxgmILDnKLA9ga99b10ij2qCdjvwg49iSYtBGd1NsQLr8625PKFbAV
 BzbGzrpDp8SRhywVfJF/oVYj2eW+vBm00k92fGaFf/4DReodedeXHIMJuE8uF9tNhW1E
 lisPcDcTAHFhpbHI2hxHDETaermOkq92Gbk/xdyoh39wby9GBGqHStRohX2l6vpCakM+
 8dIwUPXVT5Om36PhMFuGhZGKEGs03AIJzjLk/SeREZjDNuY4r+r6pOAnc/1CKoT/mx7+
 6iuhlYOtqUs9TO/2t8v6kCsSoCKZt8lQnTjQ6SNH6cPFkZ//xO6DMs397Pp9O0vKCA3E
 Rrkg==
X-Gm-Message-State: AOJu0Ywi06qXmNoLL/n/+1vS5ZrfX4exMw64+ZlYTRZDydpsHrwrYuJo
 bQwoVJfbvjncCN6+K8p7S5kfcQ==
X-Google-Smtp-Source: AGHT+IE6xAtsn4pGZLO1J686aw65aNSm3Q5q4qcV2hSdRsJlsHL9d1zmwjCzfnpD1vdBt+WnXR5Q1Q==
X-Received: by 2002:a05:6402:2547:b0:531:14c4:ae30 with SMTP id
 l7-20020a056402254700b0053114c4ae30mr15029218edb.0.1696961454302; 
 Tue, 10 Oct 2023 11:10:54 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 h14-20020aa7de0e000000b00532eba07773sm8032356edv.25.2023.10.10.11.10.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Oct 2023 11:10:53 -0700 (PDT)
Message-ID: <e5f26a18-911b-1cc3-770f-1fdff91bc2e8@mind.be>
Date: Tue, 10 Oct 2023 20:10:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-GB
To: Charles Hardin <ckhardin@gmail.com>, buildroot@buildroot.org
References: <CAN=fXj3uioP_fhczziposSJ1A-t+QzE0kyYj8D5AqZVd8Gmt-A@mail.gmail.com>
In-Reply-To: <CAN=fXj3uioP_fhczziposSJ1A-t+QzE0kyYj8D5AqZVd8Gmt-A@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1696961454; x=1697566254; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PFe/d/IzC0mNAbcye4QIJmRyXrLfkX1i34N0Fgs/Elw=;
 b=g+xkMcU9gX/GUJFDNjE5Edr2VCmYmsNx4SQxvKNro776YN8GnJdTQ3W30f63h3doh0
 6xwuzwy4qXFUg7RrYEKbJI4+KbXhJArF/VrwB/FvKPqbSZoFEA7v/LlxO5Bw7cyAxJA+
 S9nodJ2X07LeuJ+7gpAE41octjGinye7dtQF+r+4ZqAPbJTAP9O0zIM88xCPX/L19tdg
 kvB+oQybDi7P8kRPLHDfzEjthO4472JovYUOTZUgFSmPjyXjQfh5jPc0/XIAMKjNglbT
 TjJ42s43LvQ2hL/l4sIoTXiFAHYx9e8iOcEGlA/00HNSY4dL2GHXSsAzOyzZZ3a3QmT8
 7QIg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=g+xkMcU9
Subject: Re: [Buildroot] [RFC] Per-package and relocatable SDKs problem?
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
Cc: Charles Hardin <charles.hardin@chargepoint.com>,
 Brandon Maier <brandon.maier@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Charles,

On 09/10/2023 23:37, Charles Hardin wrote:
> For the curious,
> 
> We have discovered a problem in that the per-package build of the host
> directory is doing an rsync to finalize the tree from the last
> per-package directory in the dependency chain (in our case below this
> is qt5tools). This means that several text files like the one below
> (shasum) contain the per-package directory path in them.
> 
> For example - a per-package build and check the BUILD directory to
> check the shasum script
> 
>      $ head -5 host/bin/shasum
>      #!/home/ubuntu/emb-platform-build/falcon/ucb/per-package/qt5tools/host/bin/perl
>          eval 'exec
> /home/ubuntu/emb-platform-build/falcon/ucb/per-package/qt5tools/host/bin/perl
> -S $0 ${1+"$@"}'
>              if 0; # ^ Run only under a shell
>      #!perl
>      ... snip snip ...
> 
> This works in the build path but will fail when the SDK is made and
> relocated because the relocate-sdk.sh script doesn't handle
> per-package paths.
> 
>      # Make sure file uses the right language
>      export LC_ALL=C
>      # Replace the old path with the new one in all text files
>      grep -lr "${OLDPATH}" . | while read -r FILE ; do
>          if file -b --mime-type "${FILE}" | grep -q '^text/' && [
> "${FILE}" != "${LOCFILE}" ]
>          then
>              sed -i "s|${OLDPATH}|${NEWPATH}|g" "${FILE}"
>          fi
>      done
> 
> 
> The OLDPATH is the old location of the directory without the concept
> of the per-package paths in the tree. So, is this something that is
> known? Tried searching the mailing list and commits and didn't see a
> reference to this problem so was a bit curious.

  I believe that should be fixed by [1].

  Apparently nobody else encountered this problem up to now because that patch 
never received any Acked-by or Tested-by :-)

  Regards,
  Arnout

[1] 
https://patchwork.ozlabs.org/project/buildroot/patch/20221227154300.10556-1-brandon.maier@collins.com/



> 
> Charles
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
