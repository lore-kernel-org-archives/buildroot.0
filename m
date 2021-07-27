Return-Path: <SRS0=yDzA=MT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AEA1C4338F
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 19:53:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B54660F90
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 19:53:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7B54660F90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E194402A0;
	Tue, 27 Jul 2021 19:53:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mCR67DCRv8_J; Tue, 27 Jul 2021 19:53:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38B11402C6;
	Tue, 27 Jul 2021 19:53:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D507B1BF20B
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 19:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C380083224
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 19:53:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cv0W8oWe7pdX for <buildroot@lists.busybox.net>;
 Tue, 27 Jul 2021 19:53:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 85EC0830D7
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 19:53:22 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id go31so636057ejc.6
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 12:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Rh4RtxuvNAuJcUIKPyWMdkmjrV8T2zTEGNOyeQq+qUI=;
 b=ccDU8ZQJNzn6cV+dtrQc4wPbBTeEXHWWHYtQQajjprs5Mw0GhABR3P9FShXsdlQR+G
 MIJ9yTCpHI3hcI14Ihn04c7EqkrI+gV72dVKGyg89TKkaoZYp+ZHUr+okl5f1vecYiWR
 7RGv+DZ8Jxow1Jlx02+kGzwHgYMLqr+jmmC1wDfa0pzp0JvgDA36IHKMM+//EOX6MIDu
 i8l5bMpRD/InGcM8boaW2jc42BdI+0Gz3aohHPpC+CBJFRr7elTPfEiyJg+4JuGThMfv
 H2yrHHZnZimbVug6cuKes+cJSKbyBcuX7Ru9EuNlzzOH3XKs7+1wxQmWGM3mfz9HNyqN
 tpQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Rh4RtxuvNAuJcUIKPyWMdkmjrV8T2zTEGNOyeQq+qUI=;
 b=ui3q/+vnPTJ7zmosy4Z2oeXVKpi7v0rdCFbAsyZstbY78ypTBQ8tseZfBf4hTRX0FY
 t8qZ6ajII4jpdhJxLnpFGCBPmocNj6AknfA+9ud/UzPjyW/IDe2D2INhuetj33hpshbM
 Lry9UUdfbyiz1ccW8n3QVuThciDg8XtzxK+7AStM+kJ1yBFdSVOcy9XhT9Y4ENrxCxNs
 VroywZGPDZuRxl5ylpZ/I1CfRvrVXEkeodcJKIWkJamQvB0bXwBgD99i2fB6Ozu1zczG
 +Jnh6mx7r9d+gUbZaysEI5/IPn1Q9R/wq5qkpbNz3wRDieUG7JdwGK6sXx5uzVYjfPVd
 SlAQ==
X-Gm-Message-State: AOAM530a8IO+Q4SU4o8upo5PcO8373cF4a5UklwIvOBMraw6hkNUh5g7
 tVFlqaRg0/oS+oIlj8XM4hjiHQ==
X-Google-Smtp-Source: ABdhPJygo9DpuSF+2ZgOCzfLAj+5QFXiO7YZQhzZS5ydpQ1QGVAyoLXzdry2AFJN6zxl0JzYZMZsPQ==
X-Received: by 2002:a17:907:9f6:: with SMTP id
 ce22mr13539020ejc.223.1627415600367; 
 Tue, 27 Jul 2021 12:53:20 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id df14sm1406901edb.90.2021.07.27.12.53.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jul 2021 12:53:19 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michael Nosthoff <buildroot@heine.tech>
References: <20210726201244.43070-1-buildroot@heine.tech>
 <20210726230716.2c7079c5@windsurf>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <58f8221d-3cd0-7742-b1cc-30f7d94ba88f@mind.be>
Date: Tue, 27 Jul 2021 21:53:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210726230716.2c7079c5@windsurf>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH] package/bluez5_utils: expose more disable
 options
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Marcin Bis <marcin@bis.org.pl>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 26/07/2021 23:07, Thomas Petazzoni wrote:
> Hello,
> 
> (Yann, Arnout, Peter: question for you below.)
> 
> On Mon, 26 Jul 2021 22:12:42 +0200
> Michael Nosthoff via buildroot <buildroot@busybox.net> wrote:
> 
>> BlueZ builds a lot of Classic BT profiles by default but allows
>> to disable them. This is especially handy when only BLE is needed
>> and enabled in the kernel.
>>
>> Otherwise this yields warnings like this on bootup:
>>
>>  profiles/network/bnep.c:bnep_init() kernel lacks bnep-protocol support
>>  src/plugin.c:plugin_init() System does not support network plugin
>>
>> Also it allows to disable btmon which should not be needed on
>> production systems and is ~800KB in size.
>>
>> Expose those options but default to 'y' to no break existing
>> configurations.
>>
>> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
>> ---
>>  package/bluez5_utils/Config.in       | 36 ++++++++++++++++++++++++
>>  package/bluez5_utils/bluez5_utils.mk | 41 ++++++++++++++++++++++++++++
>>  2 files changed, 77 insertions(+)
> 
> Applied to master, thanks.
> 
> Arnout, Peter, Yann: in order to preserve backward compatibility,
> Michael has created those new options with a "default y". However,
> while it keeps backward compatibility, it also means that all new users
> will get a more bloated bluez_utils installation than is probably
> necessary. Should we break our backward compatibility rule here and
> drop the "default y" on those new options ?

 I know from experience that that's the kind of tricky changes that can make it
annoying to update Buildroot.

 Assuming you select bluez5_utils from menuconfig, having a default y is not
much of a problem in practice. However, bluez5_utils is also selected
automatically by a couple of packages [*] - in that case, the user doesn't see
the suboptions so isn't aware that they can disable them.

 So yes, there are good reasons to prefer default n. But then I think we should
think of a way to smoothen things for people who want to update buildroot. Here
are a few ideas:

- Just mention it in CHANGES.

- Extend the documentation in docs/manual/migrating.txt with this kind of
information. That would make that chapter quite a bit bigger over time, and
perhaps looking over the notes for each 3-month update is going to be quite a
bit of work.

- Write a tool that detects relevant changes. You'd run it in the newer
buildroot tree on the old .config. It would detect for example that the .config
has BR2_PACKAGE_BLUEZ5_UTILS set but BR2_PACKAGE_BLUEZ5_UTILS_MONITOR is not
mentioned at all in the .config, and write something about it. This tool could
also replace Config.in.legacy.

- Like above, but implemented directly in kconfig.

- Independent of this, a feature that I sometimes miss is a tool that tells me
which packages (and kernel and bootloader) are enabled but not selected by
another package (like an interactive defconfig, but showing everything that is
'yes' instead of everything that is default). Indeed, when you're developing,
you tend to enable a bunch of packages that you're later going to remove again.
Removing the package itself isn't much of a bother, but they often pull i
dependencies that you don't actually need. The way I solve this is that I edit
the defconfig instead of using menuconfig - not exactly user friendly. Anyway,
if such a tool existed, then it would be much more obvious that a bunch of
bluez5_utils plugins are enabled so the default y is less harmful.


 Given that all of these ideas except the first two are a lot of work, we'll
probably end up with the first two :-)


[*] BTW, did someone check if those packages that select bluez5_utils now should
be updated to select the appropriate plugin? Probably not - I imagine cwiid (for
the wiimote) for example needs the HID plugin, and the gstreamer plugin needs
A2DP and/or AVDP. Runtime dependencies, of course, so we'll never know until
someone actually complains about it.


 Regards,
 Arnout
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
