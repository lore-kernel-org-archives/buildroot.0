Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67897C83F34
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 19:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 106CF411D6;
	Thu, 17 Jul 2025 19:54:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jPzEuOWxjGuP; Thu, 17 Jul 2025 19:54:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41D4F411DE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41D4F411DE;
	Thu, 17 Jul 2025 19:54:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 35801DA
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 19:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C07A411DE
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 19:54:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 95Xf1c6zM5kp for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 19:54:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 30C6740FA6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30C6740FA6
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 30C6740FA6
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 19:54:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C4EF1B977AA4; Thu, 17 Jul 2025 21:54:22 +0200 (CEST)
Message-ID: <3ecb70e7-4724-4c82-81c5-5450e1b03288@rnout.be>
Date: Thu, 17 Jul 2025 21:54:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, yann.morin@orange.com
Cc: buildroot@buildroot.org
References: <bcbd271754126b79b0b42df3ca88aedf99d9a600.1751378952.git.yann.morin@orange.com>
 <20250711104439.823544-1-thomas.perale@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250711104439.823544-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1752782063; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=QblOlhUfR10leE4Pw6hzH0uwTT8Zv5sRb9VTjjT0HBg=;
 b=cCU5wCzQhOdsLNC+sQFCeEMUVFuso32QEeaXLW7ehUsrCv0juWQMvxZkD8CWcSX7osZIAa
 U/4Tew4BLpKt/aqoy6kBipoZDIhAxv6ik5UvmjmWb/hracStgAL3abRfusW8V9kjkpLyYs
 /n95keikeUVtkaP4QVKUhgsTStQfPaI9YMtfAuR8hhb9VAMMIAaZLSmliR2Ws3hoCvgm1a
 EnL7Vry29FiTRfhRTj7BfsFf8XnfKiMt/89VtExRSY9iWbXt99KF8a1WNFlyRfd2aGTMRf
 jp0PC5k53+UsAo1JkHBU/lZaSHOx4tDoBmEhAqAkjUkakBG4CkFzMO+MpK5Xhw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=cCU5wCzQ
Subject: Re: [Buildroot] [PATCH] support/testing: enable lpxelinux for
 syslinux runtime test
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/07/2025 12:44, Thomas Perale via buildroot wrote:
> In reply of:
>> The syslinux runtime test (which is in fact a build-only test) ensures
>> that syslinux does get build at least once a week (via the gitlab-CI
>> weekly pipeline). Runtime testing would need much more work, though, but
>> nothing in syslinux is currently runtime tested anyway.
>>
>> Reported-by: Julien Olivain <ju.o@free.fr>
>> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> 
> Applied to 2025.02.x & 2025.05.x. Thanks

  And reverted again, thanks!

  Regards,
  Arnout

> 
>> ---
>>   support/testing/tests/boot/test_syslinux.py | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/support/testing/tests/boot/test_syslinux.py b/support/testing/tests/boot/test_syslinux.py
>> index 41152cde7e..17fe904263 100644
>> --- a/support/testing/tests/boot/test_syslinux.py
>> +++ b/support/testing/tests/boot/test_syslinux.py
>> @@ -21,6 +21,7 @@ class TestSysLinuxBase(infra.basetest.BRTest):
>>           """
>>           BR2_TARGET_SYSLINUX=y
>>           BR2_TARGET_SYSLINUX_ISOLINUX=y
>> +        BR2_TARGET_SYSLINUX_LPXELINUX=y
>>           BR2_TARGET_SYSLINUX_PXELINUX=y
>>           BR2_TARGET_SYSLINUX_MBR=y
>>           """
>> -- 
>> 2.34.1
>>
>> ____________________________________________________________________________________________________________
>> Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
>> pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
>> a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
>> Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.
>>
>> This message and its attachments may contain confidential or privileged information that may be protected by law;
>> they should not be distributed, used or copied without authorisation.
>> If you have received this email in error, please notify the sender and delete this message and its attachments.
>> As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
>> Thank you.
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
