Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B743DCC6B39
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 17:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 676EE81008;
	Thu, 15 Oct 2026 17:03:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J05wfy1HFdkk; Thu, 15 Oct 2026 17:03:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7B33380F7C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792083833;
	b=n/pzE2AuOz3DEulrvC4lLmCOC7CNQ0CHMMM7Y4zyG53CRSYFfTSO6oj+ot6ecqt9tk6I
	 dcCicYa10YCcGpAjUTZIufCUXirFnSLDMpjLsTisjQzcomq6xVy9BwtFCDLKc3vnTavWl
	 aXL72Pl91yAR/eGe2vwOVPBciKlqMZjg2Ge8cAXXweyKUVxKoemwl95s5BQ7Vu2gZyPtz
	 rYZx6NKeMoY6iRZW1A9/WmbV0yx7ag7PQwv5Dd9vEqQExJx31/c9sarH9n4X3URXcJca6
	 XGvaOHmsUfVkRoCcD7oi3ZPmKgqUkyrzuMhUnol0+UQLsZ8/OrCXRh5onUF/l2HKe2A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792083833;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=F6E7ZE81atBky4Ao1t4LWpJERNQT2COEpqLjuXAIIJQ=;
	b=QgAw5JLN3CINJH6lr6HzKsUx+Wvd1pDo2ykS273yG4voYpgnthQ5tqG3gAXnKfjWZ7ls
	 UYTchIJy75GrpP1Ikr2qn6Cw6bja2XdtcYF9JzEjp0MiMNitoYr519djmYY+MNAiyNENE
	 3V3iKNGBXFZD70TkN/yO5e8QrpluDRZJYpbfQbYC0EEtwLRB7PYCzCKN2+lzHSzJpRZaj
	 e4otouIHj6vGjYrKOwoseAvc/9ITI/B6EaeONC7vkFNPfxGu15gIc5VszF2EOz/yP+/Q0
	 R1Y8UNqBEh8+AxdtPqdqdcmWS23D8jEl0Z6zjDqbmyyctMmoE9TxfuIETRRIb/T4O9g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792083833;
	bh=F6E7ZE81atBky4Ao1t4LWpJERNQT2COEpqLjuXAIIJQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=WZhY6Vkv5tKl2e1dVObrftcBremrcrU7aadnTERptuGQA81+/H8IhQydLq+nFEbse
	 2yQ2Zdpctz9l4Jdgb3+L1epcZHedBe3zcEHp1QNy5cdxXUEQN2wrB4Chk2t6eld9kl
	 vrfw3APlwN4rbLOEvpqXNPFKWBVcfB50R/z/o7l0PbKYZzdoNB5VGmEkvnCEvp9ISL
	 kp4ReJTh6T3EV8wgeRvo2QhWsStG8YctS5ej0LJOWMul0ViSOHZoduuO7Iosh9VLIu
	 fhCDaehuUbu+hH7Hif6jUFvtcozr59f81jZlNlTd9wOmPt+lgQf59qqCCJgze6LtTX
	 xCk0rf5prio/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B33380F7C;
	Thu, 15 Oct 2026 17:03:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DC10235
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 17:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B80460821
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 17:03:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mrw9SVd7e1mf for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 17:03:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 57503606CB
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::433"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792083830;
 b=N9Bk1JLXDojMddKYkyAtAw03WDFP4o0JnrDYg3ZZbUM1DyV68me9pfrFyB2unw29lXtG
 Dbiown8w82XDaMFl5vRr7vzZZpwj3tHrbgaAUTftSI+nyq7P8Sw5TgRQM3WEKMlIE8X29
 0JLcUzOhjecXU7PA8PSOPq7HvFEInrJBxopiM9inoWyI8dSe5AcOwoVdRH8p/FeFEZPEB
 9s+lfNOZdvmS97FmRb/LqtsJEtmyXv4McgoYKritSYxYoYlh0I7wltITXXW97hF5JYU2Q
 dysoM/cD0ioULHTot5/FdqTyXt92S32NVSCX/8bnF1JuZ/GqYNoH3FP3Vx6SB2G7ISA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792083830;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=gfHMeFE5uAxrdU4QYLbMFtbdLzMl6PB27eUKVK6nMlM=;
 b=Zv/JwOLyCAosbbvFMQhLswAOYFIVzu/hQSdHQfSyFLpJKKwQV4YG5azPTEn9BTsmafOO
 VS2KxfHfhx56ejyjbCtStkDExNPz9MP4Ccc1yW7rQtU5TJyVZGE4eeViSJUgqLMr7lmMq
 JYB2tuSJrDhHJ0g73eq5F6cKbN8NNfJN4Iqg+9z/MXhrY0UqHjITYFFSaaqfNORsj61Jt
 Q2qojRgGiOt7jsPyTDBH00qdlVZdbaTT7o1lsyqymdf9lOX++dMus9nx+eTaV9csilN+r
 7MCQEQKEBP7rkTS8vIFn7GxTY+mWmU0vuf8fRWn4yFj3prYE5N+mdh0qO8sffJYZePg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=JJzx9q00; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::433"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=flaviu.nistor@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=JJzx9q00
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 57503606CB
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 17:03:49 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-48df0fa43c5so152336f8f.0
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 10:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792083828; x=1792688628; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=gfHMeFE5uAxrdU4QYLbMFtbdLzMl6PB27eUKVK6nMlM=;
 b=JJzx9q00bW7/StYB9zc2y5cNNMi2W0wf04uT0VahCmIhdRhm6ej7cAazlrJjIKABB+
 q8m8kMStQkBiTlQ65b8ohUzav3nzFHZtLTukfjvrBnNLhPalXRg0MrZqa/3pnLg+WhC9
 jWGGyHlmKKUMHh5g1uo8uHOt/iRQZf1ITpiLT7oQZGhj3yFAEyMPV0xmNT8ICpldw7Bu
 yn004S4gD/raEv8TGJmqdv/oOhadDywHYmuP7w/LmyA58MAgpNYOXFUFlhM7ueG2d3th
 OFGmjCAs+n6Jynyv0TSxBGfvwtG2+cnZU2f8+y6eVm41VoZ5UkiV5mn0B9r3r2lryKIi
 TEGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792083828; x=1792688628;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=gfHMeFE5uAxrdU4QYLbMFtbdLzMl6PB27eUKVK6nMlM=;
 b=qleTQnB9ui3Lv7z1qn8ZnV47IIE6D+ODBs1rIr3sFYtdJSgHZpKSkhSDzYq5TCYRX+
 6OiKorg4V6JfwF/8KtlxlaU970YLItIHQs+x5FAFP2OOivztTFtIL4C4QFP8ZCKSAkbb
 KEx8nEHsJkSVM4qctr6zybpTf+GQosM+tfXWFKymI6MfY+SInE8FD7DGcSpBWzGa8gUk
 vP9apNM/uIkt5iYY3TFf4JgtRbrkbrbnzrCFFFQo/gtbMK7iHuw1f+UlOlg8NM3MEB8f
 7tzTX09z6DVq3lIc+duGkzQtO+f2Pn0dFA4n+h+R4eF7KGzKd8Wkgvwa4UkdEGawXRNF
 fMOw==
X-Forwarded-Encrypted: i=1;
 AKwUvBx1QYmdxeV5V0CUwKe6MZrJ30TCPR8XqJAKia80R/z9WbUP3l6rjJLGBR3OpzysIowOC3+HHxYs4Ro=@buildroot.org
X-Gm-Message-State: AFq9FYIpw46XYt5r7BRBZPaQiQbnenwpJd6nwVjujR2f5bV4DGbfcrs9
 4+hx372gHNxBXSEppvFjHa8NuD612pjhr4r/FIz0TMz3Vol01o1r/0gU
X-Gm-Gg: AYBFou2PzOXiVgHB2jgIld3RKdgV0B+ZLML5wjNeg/iNMzytvKLB1r+t5SDdKdJ78gb
 X5iO/xKEfaRefZIbagqJkVcACuWUpJZCNe2O8uuFVqoV/vt4kffeaUOACgjORkn1aKbwm4bq0dV
 URteUTt6o20Xnz0PDRMiuteHWQegyTvTIZc0n1tC9h39hJx2Bm7lm35ofuI0BhzYrhp1T/26Rw+
 CQA3cf6fJibJ0NhloE4LI87Y+qnHWpcL1wRmykvTIMwrAip7hIy5TtQ3La9Fub34+yOMSyFFcfW
 1cPYqYBICmbyWhF+aPgvkXy3NExJI9+II4Lfxh7Q+5uj+K/dh92yZDEmI+cHaoPv27zQ8AQOBcR
 rXPZ6H+WDNMaVtBXppGheQzsMAHWWNf1OPut0O+vwTwM8FmGr3MNnNZiu4TvNss2ciEETI4jJ5+
 qzH6VnRnYX36drIRywxNTd4idxGyioKE4/UaPMq6bZxDsAuiPqDfDd6qvbpatAejhuvWauC7dj2
 t5WzBLpwTvcH/WS4GZpqkuopS28mGRVChaztIwa+4FmS2fQ
X-Received: by 2002:a05:6000:29d2:b0:48d:7579:1cdf with SMTP id
 ffacd0b85a97d-48dfadfab51mr979108f8f.8.1792083827796; 
 Thu, 15 Oct 2026 10:03:47 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.72.164])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0ac52d3sm19690014f8f.43.2026.10.15.10.03.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 10:03:47 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Oct 2026 20:03:44 +0300
Message-ID: <20261015170344.5094-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <87h5ios04m.fsf@dell.be.48ers.dk>
References: <87h5ios04m.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v4 RESEND 2/3] package/python-snappy: bump
 version to 0.7.2
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
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Oct 14, 2026 at 7:44 PM, Peter Korsgaard wrote:
>> On Sun, Oct 11, 2026 at 1:12 PM, Peter Korsgaard wrote:
>>>> Even if there is a 0.7.3 on Pypi, there is no 0.7.3 release
>>>> on the project homepage, hence the bump to 0.7.2.
>>> 
>>> How about contacting the author about the 0.7.3 tag?
>
>> I will try to contact. In previous situations when I send out a bump
>> it was indicated that I should use a Pypi release only if the tag is
>> released also on the repo. I think also in this case is better to have
>> the bump to 0.7.2 until 0.7.3 is released in the maintainer repo. 
>
>Sure, but we can do both, E.G. use 0.7.2 for now but also make 0.7.3
>available for the future.

For sure a bump to 0.7.3 will be made once tag available on home page.

>>> It is good that you add yourself to DEVELOPERS, but the
>>> click/rich/smmap2 additions belong in a separate commit.
>>> 
>
>> I just wanted to avoid some "noise" caused by separate patch, but yes,
>> you are right this would be the better approach. I will change this in v5.
>
>Great!
>
>>>> -PYTHON_SNAPPY_VERSION = 0.6.1
>>>> -PYTHON_SNAPPY_SITE =
>>>> https://files.pythonhosted.org/packages/98/7a/44a24bad98335b2c72e4cadcdecf79f50197d1bab9f22f863a274f104b96
>>>> +PYTHON_SNAPPY_VERSION = 0.7.2
>>>> +PYTHON_SNAPPY_SOURCE = python_snappy-$(PYTHON_SNAPPY_VERSION).tar.gz
>>>> +PYTHON_SNAPPY_SITE =
>>>> https://files.pythonhosted.org/packages/cb/52/acd87583175fa930e4385f8a6164eb5909acd683c0e62ee01d41de8195a2
>>>> PYTHON_SNAPPY_SETUP_TYPE = setuptools
>>>> PYTHON_SNAPPY_LICENSE = BSD-3-Clause
>>>> PYTHON_SNAPPY_LICENSE_FILES = LICENSE
>>>> -PYTHON_SNAPPY_DEPENDENCIES = snappy
>>>> +PYTHON_SNAPPY_DEPENDENCIES = host-python-cramjam python-cramjam
>>> 
>>> Why do we need host-python-cramjam? Please describe that in the commit message.
>
>> This is a setup_requires in the setup.py (cramjam>=2.6.0). There is a build fail without it.
>
>OK, why is this? Is something generated at build time?

There is a setup_requires dependency on cramjam>=2.6.0 (file setup.py: setup_requires = ['cramjam>=2.6.0']),
which is checked in the host Python environment when building the wheel. Without the host dependencie the build
does fail. I have added the explanation why host-python-cramjam is added in the v5 commit message. 

>-- 
>Bye, Peter Korsgaard

Thanks,
Flaviu Nistor
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
