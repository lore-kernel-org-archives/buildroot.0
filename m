Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF19ECC6B12
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE99F80B49;
	Tue, 13 Oct 2026 20:59:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FjkqnrjRlTks; Tue, 13 Oct 2026 20:59:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D261E809CF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791925187;
	b=YY/mlUkLn4kloeSg1ep532oXVj3Ay1Gf+TsJWsq32gUn6rMW0AK80LLC5f0fXSugYc9M
	 e/cyGP35owy+qkb3eLh50lvLuvVf4GegZVGqBu9kUcT5k9amR+yi1SQizx6R1Zdq2ESTl
	 7wJkLOEXsd/KfkZmteCP2HQkglE4rdOYbBG1VNJVVKtmHuT9eeRhu0/JD46QkIEsWW2q2
	 AeMi1yPadRibI2Q4D+q0TZ8qJkqOs/D5aSXNkdhKghOPpGmzyw1aBWKK7C22x83qmYnHO
	 GUVDmt8t+I6GREP6xYlWBRTAJ9ozuRWjS4xUTH4wIhEAxpTl0SI/heAnx5eiOOc1fug==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791925187;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=m7pniGES4ZaBcqAXwqSqgHwja96kVacLee0pjhbioy0=;
	b=CPjPg4btSM08yJUBx/h9WgvwUgUCk5ltNxQd9VLRmIJqzy+lig8rlqyJGxzN59b9+W1y
	 Y60uOHYbke8Z9U85n3TiUDrF0UeZorHphIbTJXGIwpsKgHaqQkouC+Tbqz8IN34DdBvqz
	 AEC1NzryJDRer7KoS6HsASxBiJbPc+C3Av34VbRrLIOyQbTlDlTHnOkKc+l7C/pOV7MhF
	 sihurJrdaQxO4HGiA/ayPpRubGZHibI/s36BwnhSpr/9OlMEAKlR8F+2AUSxnvP8eMbsa
	 DzdQs3Ha+XYhQ0fFAmaqXZXrlkn8BwoO9FF9NO84FWPD1K7pt/zeqkzp2GVloJ+qkzw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791925186;
	bh=m7pniGES4ZaBcqAXwqSqgHwja96kVacLee0pjhbioy0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RrA5+VqauTEgs+JHPqnu1a2KmL/7oZk1O7dalhysjpJDXiiH+nls8+olr6cQs+smk
	 MVrUMvJRbqSGd5gsyu/fDOaHTpGjBeR31sipyvqLRvUIancoUAYQM/feldowRGvyJ2
	 IcESo2XE7fQPOBPvt1HahfRgKffeERNbiXCYih8MSC2cbrRRqRMdG8L1fcVS3Sne+9
	 oEKKD8Ycb6Ey79gg3wEQoNEiUfDUSwZW1WxGrgBsk6kpyCAfYCja3/SdWX4v20Ud78
	 gwfmLktEn2EP3447sopvieBJNEC93Xcu00Pg7UnaMdGnAOiIe1TQ6O4bytDPGmZW7i
	 X1K5lICoQjMAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D261E809CF;
	Tue, 13 Oct 2026 20:59:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 347EF2AE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:59:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31DD3400DB
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:59:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zcArH4s9Irey for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:59:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 346664008F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791925184;
 b=J7fHZRJfjv2OjpzMt4mSiP0YfBxzKJf/qkmylEmrCYlKowlVqEn+++Z4uCoPb/qC3MVb
 PbnU2ij6K1iO++j0waA9YRgZIvR/3kiCfl4fNr5WN+WfAjPflO7NYebiukTN/jRBvI2os
 6JlAOUjrlWRMTemVe+c050po9iwFWVZTPQMnb/gWzBRXJ9ykg7WcDKmzwA+YhThNSWAyz
 3Xw4RzH2Q3S9CBGBLI5DQ/47Gqm1M4BXoN0PTw36uZKwvw5/obnt4koHIk74NuV3mEp6H
 TGTokrvny9H6UJwkga2aa9IqSlYpWe2vpyKx1nJeP47EpKWBx5bUGybiszU0IIqDagQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791925184;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=k2j7VXqU0HYg2Ho3y82YuG5tgi0Gx+w4q4P/3L2/EWM=;
 b=oYBn8pfSQxVgyv8D3tHIh+TnWcQi72O/5d/TOJETQ7qgOcp9OBFeAxgxWR8u0NfTpfsr
 j5GIf0btglcoXRYSnDZaX5xM5BW3o5dqfYcyMiFo1t8Afq6TWaP4V5fK/YFcaBv3CEeUI
 DiGePz+PCClVLM5QrERwusunAeldTNGpPnq/FHKYQg+TgsQRq+Kevi4Dl3YRL8Fgno8MU
 AnKmIRn8JG+DLq2qAgYco5rMR/qWSRXHT96sQvNuVAoSnyoMarqcoWGNxh3a2lQUu2i/H
 hDTP9yOo1v///7Pt4I35+PkvBs4HKu07xH8cSn+YefZCK6XBWkV9deUviiMtcUBU5+g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b="T0a3X/xq"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::430"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 346664008F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:59:40 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-48b0ef9c76eso2681114f8f.0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 13:59:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791925178; x=1792529978;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=k2j7VXqU0HYg2Ho3y82YuG5tgi0Gx+w4q4P/3L2/EWM=;
 b=s9QVBhEyq5RnFV2ELyG5CrTX4r3v0mJQWwNy+cu82UCqhqn0wmDxS1w6euMZr0jUUx
 TN+LcMiHc/JEJVcb8p4i6N7KbSeduQadBOvDjRd9UkLYoxkF3fNS6+bCF9phlpGN5KCq
 S8eLKIsMCs1IK48BX5YCziFJCAkjRZGMoQY+JxmJiMOogVNXM9RtTBFR5By+A9+ViA8s
 ghQcHIsPfMFx+jPR//CHZzUkSN9rqQmGdBT9pet/ohaRgo/aeO6ZVBITudiPdbwQOMLj
 1LfsnBPMG1c7HrraeHnyD6JXI5ylMOLzTQ8sWsTVJRJvbF4CeU5yjh2YDcuP3Q+cny6e
 qTKw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxdgGM9kMTt2So2/ZVCvHiz8A/Osz5BzTyKtpVjihmQLKbGk2Tw7XQp9/e8ZGWKoEC1ibIRMROjA2E=@buildroot.org
X-Gm-Message-State: AFq9FYKkXYsXl+SE4VA7v0Y70ysjjlRwaYNZT+rt4P5VxusbeZurAylS
 M/5Pf5ShKAQHmU4Qo4s+rgJKhiV4XkT7kRUXTwK6nHz/Hi0l1I55LM/vz4tbV9yGZ0FTe+Gqovf
 Jf5nJ
X-Gm-Gg: AYBFou1MUvfTc0KlByAEwmqCuYq/NY5ZpI2xC4ZrBysgP2wdE391b5WeQL29IOqBcVD
 LlbKLH1R+cZUhpx9e92zJbuEhPoBQjW83YloibMImW407P5avi4DyhEXUURmj29a8ypR7dOvyWj
 YjZdJEO0j42uoNKZWUuIhkYSMMHcAOQChGIsB/lKxyCt/f5LfmEWVudI/LHaovSGNFfYoltbu37
 b5qDOvd4sf4Xl0OwR+TGPt8Qaf9MDo3bnO/8XTUnlW0nTiXj7cMLTQLbJdiIcH8QvMAv7ORU1WJ
 TsGcTCXu48MnCJd07nvg0sxzobxeTQi7Wl+YH9BlN26qRl7P09WVvr4qUt24mcEWJw5xMcipr0u
 BL7ACuMWWb4EdvJb0BpTcgHUflPmkPf9C2wBQsXCR50BIzkhE7z7v8frdDYBMkVOvel5eQN/crc
 xj7sCIi5dGxCQ9kJi/OBrnyBsrC6iCjUMxzoGNAbzP2D2uCMFe5drySPXdrkQrJLUYEQ3x0Er7J
 g==
X-Received: by 2002:a05:600c:6215:b0:49f:ff32:8044 with SMTP id
 5b1f17b1804b1-4a18e47a88fmr247424895e9.7.1791925178187; 
 Tue, 13 Oct 2026 13:59:38 -0700 (PDT)
Received: from arch ([79.132.229.115]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a19471edd5sm506074615e9.11.2026.10.13.13.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 13:59:37 -0700 (PDT)
To: Michael Ratzel <michael.ratzel@phoenixwings.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Date: Tue, 13 Oct 2026 22:59:37 +0200
Message-ID: <20261013205937.17171-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <VI1P193MB07827A8170CCBBF9ACFD6BE6E1962@VI1P193MB0782.EURP193.PROD.OUTLOOK.COM>
References: <VI1P193MB07827A8170CCBBF9ACFD6BE6E1962@VI1P193MB0782.EURP193.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Subject: Re: [Buildroot] Build host-cmake with OpenSSL?
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Michael,

In reply of:
> Hi everyone,
> 
> I recently ran into an issue where I wanted to build a 3rd party library as a
> target-package with buildroot 2026.08. The libraries build system uses the
> file(DOWNLOAD ...) CMake command with a https URL. But the host-cmake is
> built with OpenSSL support explicitly deactivated since 2017 (commit
> f87138339b17bc2b1d84c59ea176abb941413550). Therefore, the downloading fails.
> Fun fact: with buildroot 2025.02 and its older CMake version, the download
> still works.

If you want to download additional file that are required by your build you can
use the `<pkg>_EXTRA_DOWNLOADS` variable [1] and a pre-build hook to place them
at the correct location required in the build step.

I don't know if CMake `file(DOWNLOAD ...)` will not run if the file is already
present. If it still tries to download something unless there is an option to
pass to CMake to skip them you probably have to remove those CMake lines in a
patch for you Buildroot package.

[1] https://buildroot.org/downloads/manual/manual.html#generic-package-reference

> 
> Now I am not quite sure how to proceed.
> - My first approach was to plainly revert the 2017 commit. This solves my
> download problem, but I do not think this is a good way, as there was a valid
> reason OpenSSL was deactivated in the first place.
> - Patching the build system of the library. Afaik this is not a simple patch
> and has to be redone for every package. Simple and hacky things, like trying
> to tell CMake to ignore the encryption, by passing TLS_VERIFY OFF to the
> file() call, or by altering the download URL from https to https, did not
> work for me. Me next step in this direction would be to replace the
> file(DOWNLOAD ...) with a script, that downloads and decompresses the files
> with tools like wget and xz.

The `EXTRA_DOWNLOADS` variable kinda perform what you are describing here.
If the address of the assets you need to download is fixed then it will
probably work for your case.
It also makes sure it's ran during the "download" step which is important.

> - Adding some sort of configuration option to let the user decide if they
> want to build host-cmake with or without OpenSSL. I looked for a few hours on
> how to do that properly. I add a patch with a suggestion to this mail, but I
> do not think this will be the final solution. Maybe it would be even better
> to add some sort of host-openssl as a dependency of host-cmake?
> 
> I personally believe it will be beneficial to allow host-cmake to download
> from https sources in some way. What do you think is the correct way forward?
> I am willing to invest time into implementing a solution for this, but I will
> require some guidance, or even better an example of a similar solution, to be
> able to help efficiently.

I think it's best to avoid having anything downloaded during the 'build' step.
In air-gapped env all the sources needs to be cached to proceed to build the
packages and such a mechanisms that tries to download something during the
download would break this.

I hope this will help you with your issue,
Best regards,
PERALE Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
