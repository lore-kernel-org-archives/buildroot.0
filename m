Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7194DF31E22
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 15:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F09776060E;
	Thu,  9 Apr 2026 15:22:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fGSHsLraq5UU; Thu,  9 Apr 2026 15:22:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54D25606AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775748125;
	bh=aL+b8shb6RaWHnFF7J+PGPcDRC8WRq1JPelaLCjndgA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Csk2HT7CVOj5lWnwEvJtB1NemNIXTBr3PMVAZUDzx3ZQLNumXpwrxkVy7RyBX+Qqf
	 CuM8oGkaaeTA2yR0dCbqK4gytA2LIoTdOMIfEgk/Z9E+2RmxsytysnDHjX/gO39eSj
	 MFxrU3CjRDiP8dMkp4OV+zYrsejirUYebOyP1dMr0GrVRi37YJkfiamdAilMMZnIKa
	 ti8H+HmhEVF4pLD6Q5hka6M1gBZ1Fx6/SbqLJ+cLcKbe0Ocswi+JwMLlVE6uDI5vQZ
	 Eg6WfqsxgPoc9SzFuis01yHhjfTgaq10nuSWSC/LmbAcgReHT/GCQJ/6S4ulRX38F6
	 RG5zy13mJcUlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54D25606AA;
	Thu,  9 Apr 2026 15:22:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 277761D6
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 15:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D2A9403F0
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 15:22:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tUfYJzrST7hH for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 15:22:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=flaviu.nistor@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4955B403EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4955B403EC
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4955B403EC
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 15:22:02 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-488b00ed86fso11328915e9.3
 for <buildroot@buildroot.org>; Thu, 09 Apr 2026 08:22:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775748120; x=1776352920;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gJh3ElZiQcQzOKCJ3qBtq/N1xCS5WmJM3H0Zpq4VHIc=;
 b=Wqz+UVcTTBdh6L8L3i/PRGJAjTEQnVcQQ6h4bo+hYymDHjFK5pU7f1SWdLYZsJvZvn
 sc4pdoedgYdNqSqOBtVwuyGo490a8hDevkAxcTWBQB74a1aN8LUKo4iYXVmYx/Uh6KGZ
 FcECBP3Md/M2Pp8gTQ8m1m6ebefRpv6jNdymNNdb5sl3SGIwTfOznqH7yBWRWE+3gLuJ
 vOby5eaiACDH6NobnHeZgnTlJPRcRJgeqIuJoUliWNLzjVmTNbJLe1mmTIep9aXVZMUf
 wZEBjZMPdogWetptrQcAsE/Xf8GQOfMMRECm1g5fCNu98xzb9UkvViElU/AN8QKWDKoj
 lyNA==
X-Gm-Message-State: AOJu0YwSu5Xn5ZoZ8FGxg7CqmK0q6VKdokJ4kd5vFEz3r+GHjXpszbZu
 dv+FESZkBo8w2iaeKevucKU4NWf0lYBNsp8LGTlsNx1HBxa4nP4GrSLL
X-Gm-Gg: AeBDievE82qsstpIKan9bMYptwvLwwNJLTgY6BT8KMX7wI+XFgGW8RxcpDiHma3uMqK
 OWlqtRtkymqJb7mGaJyNMeCZx+g3Y666ME9gZRIR5dVmEcSHEUop0LWGfkRIcGJ8i/oVovSgw7p
 S3sSuXgPe/FH4kbMGGyaso5JcwO2Q/cpMBjRKfazExdh9b3A08tpQLCiZhpSV+YtUWj4KGz9kg1
 dVmlJ2EVOiDBG8b7uyr5KG8+WYi0n3xHBrGnjQt+NlkPrfM3kp/VWX2wjAIXlEmxTrnvWvKwjf9
 OmBE0WuEbGn9fV3cAh9jNlApa5ZUuoE3+qszkwLeOa+/rKAN9bC31uayeAdZPMrcTY31UcHlf/Z
 sJvkSD37XextG+ii+PGMqB7cA+sCtV6YUMR9RYfX2Nc9PXR+C1ksEs3FR40inlUqGZpnTe0e+WZ
 AE+570VG/sZddmb60jSJfmetclDfKHpjySsZYKNBwLbMGxVNf/LomPTbdmeh0QqcjdY9/CC1fAa
 V6F+OBHJjubVQc=
X-Received: by 2002:a05:600d:1c:b0:487:1fb4:7e1 with SMTP id
 5b1f17b1804b1-488cd041593mr42333365e9.22.1775748119731; 
 Thu, 09 Apr 2026 08:21:59 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([93.122.248.173])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488cd096ecbsm43555775e9.2.2026.04.09.08.21.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2026 08:21:59 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: buildroot@buildroot.org,
	Flaviu Nistor <flaviu.nistor@gmail.com>
Date: Thu,  9 Apr 2026 18:21:55 +0300
Message-ID: <20260409152155.5801-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <0a191350-d411-4247-934c-a17ddbaa3562@rnout.be>
References: <0a191350-d411-4247-934c-a17ddbaa3562@rnout.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775748120; x=1776352920; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gJh3ElZiQcQzOKCJ3qBtq/N1xCS5WmJM3H0Zpq4VHIc=;
 b=bR+myTmdwT2H1avs57bCOXSS7HKmYQHZi2K6sI0EPciw2V/gnyMJ638E/5WGQlW6qZ
 qufBUgvbFuDGNTqKBD9rPdTzrk5MX9Ob4r6pFnyMhPyF9b7dw+3/R2HwZzr4TLE5xhVf
 c+eqjF9JCzhPV6u3qsvvxCN51veJpKkj8XOHpOPX8benJ13O9uk+qBinRpEUhNo651qa
 nSpeZhktRFuCk+48dAgpH5HYOxW9wkbU2o8wk8OVL8MLqzN0rFcPoasRoO/XBiPikNR3
 t7byoWYIW866EoXbglWWWy0a1RamJyJaiEQhuM78dIPWDOtTfVDWyJhZQCwultjYEbqY
 5YiA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=bR+myTmd
Subject: Re: [Buildroot] [PATCH 1/1] utils/scanpypi: workaround for pypi
 project names
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 07/04/2026 11:59, Arnout Vandecappelle wrote:
>On 27/03/2026 07:43, Flaviu Nistor wrote:
>> Add a dictionary for buildroot packages that have a different
>> name compared to the pypi project name (e.g. smmap2 -> smmap).
>> Since it is not intended to change the buildroot package name,
>> this is a workaround in order to use the scanpypi utility for
>> this packages and still get correct generated files. Current
>> packages added in the dictionary by this commit are smmap2 and
>> gitdb2.
>
>  Would it be an option, instead of having this mapping table, to parse the name 
>out of the .mk file if it exists? So if you do scanpypi smmap2, it will check if 
>package/python-smmap2/python-smmap2.mk exists, and if yes read the _SOURCE to 
>find the upstream name.
>
  Indeed that would be a better solution and less subjected to human error. I will
prepare a new version based on your suggestion and come back with a v2.

  Thank you,
  Flaviu

>  Regards,
>  Arnout
>
>> 
>> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
>> ---
>>   utils/scanpypi | 18 +++++++++++++++---
>>   1 file changed, 15 insertions(+), 3 deletions(-)
>> 
>> diff --git a/utils/scanpypi b/utils/scanpypi
>> index 61879e39d4..09899bfe0e 100755
>> --- a/utils/scanpypi
>> +++ b/utils/scanpypi
>> @@ -189,6 +189,14 @@ class BuildrootPackage():
>>       create_config_in
>>   
>>       """
>> +
>> +    # Dictionary of python package names to their actual PyPI project names
>> +    # Used when a package's buildroot name differs from its PyPI name
>> +    PYPI_NAME_MAPPINGS = {
>> +        'smmap2': 'smmap',
>> +        'gitdb2': 'gitdb',
>> +    }
>> +
>>       setup_args = {}
>>   
>>       def __init__(self, real_name, pkg_folder):
>> @@ -216,8 +224,12 @@ class BuildrootPackage():
>>           """
>>           Fetch a package's metadata from the python package index
>>           """
>> +
>> +        # Check if there's a PyPI name in the dictionary for this package
>> +        pypi_name = self.PYPI_NAME_MAPPINGS.get(self.real_name, self.real_name)
>> +
>>           self.metadata_url = 'https://pypi.org/pypi/{pkg}/json'.format(
>> -            pkg=self.real_name)
>> +            pkg=pypi_name)
>>           try:
>>               pkg_json = urllib.request.urlopen(self.metadata_url).read().decode()
>>           except urllib.error.HTTPError as error:
>> @@ -225,13 +237,13 @@ class BuildrootPackage():
>>               print('ERROR: Could not find package {pkg}.\n'
>>                     'Check syntax inside the python package index:\n'
>>                     'https://pypi.python.org/pypi/ '
>> -                  .format(pkg=self.real_name))
>> +                  .format(pkg=pypi_name))
>>               raise
>>           except urllib.error.URLError:
>>               print('ERROR: Could not find package {pkg}.\n'
>>                     'Check syntax inside the python package index:\n'
>>                     'https://pypi.python.org/pypi/ '
>> -                  .format(pkg=self.real_name))
>> +                  .format(pkg=pypi_name))
>>               raise
>>           self.metadata = json.loads(pkg_json)
>>           self.version = self.metadata['info']['version']
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
