Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 494F3C00140
	for <buildroot@archiver.kernel.org>; Sun, 31 Jul 2022 14:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D1D5740CF2;
	Sun, 31 Jul 2022 14:37:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1D5740CF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7SdScmVjlcCG; Sun, 31 Jul 2022 14:37:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03F6E40275;
	Sun, 31 Jul 2022 14:37:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03F6E40275
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B5B7E1BF2CB
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 14:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 907D982974
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 14:37:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 907D982974
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8JpqnAtleLGT for <buildroot@lists.busybox.net>;
 Sun, 31 Jul 2022 14:37:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7B7881C2F
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com
 [IPv6:2607:f8b0:4864:20::92b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C7B7881C2F
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 14:37:18 +0000 (UTC)
Received: by mail-ua1-x92b.google.com with SMTP id s18so1015388uac.10
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 07:37:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:subject:references
 :message-id:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=UsLaUmw975UsgQj+BEq66FGNEThPHbq7vrYpy3IEJ44=;
 b=vta7aGrTFYk7V5HMVBwr7WxeoVdkm/H1KyJftnQsrjSvHSdbdAycklu/nU0oNhC9ju
 Lney16T5gfeLMtSWKyuU3Ti4HcR+i9+yCfaIEW6KM2fQm50s+DVKdo3vIvc1ZEm6R+pb
 ftHwr1bH4v6o3t265pF/g+Bvn4Y19r+yDTvDCUzuuUi8Pg9SILI2eddtOZD8YLA3IouH
 TuAXR93N+pCjFN2k3xh4dj83QbI0wCYZmUK/rKaYaPszfb7S8i+ue+PRsvhgx2bvOJMT
 LDlXHYQYkYu9UIgI3BsrKlVzQkGevHraIVsYp5Y3gMozw73U2ajfxcTk0Qv9sfFvXms+
 KnhQ==
X-Gm-Message-State: ACgBeo1STtC10BULHFOS/yqYj/Rg9+ijs1a7M+awdZUqCnrLHtmEFbfO
 asOYx0r6kB22a4SLnVbOTIM=
X-Google-Smtp-Source: AA6agR5461Z0MlCOzLQtZQ2AY17ce89/qEdQjVLbXJ0riUXOKaqZH4rZY7pl0i+hPgtmiGvqdE9NHQ==
X-Received: by 2002:ab0:2150:0:b0:384:ba63:69f9 with SMTP id
 t16-20020ab02150000000b00384ba6369f9mr4733559ual.100.1659278237667; 
 Sun, 31 Jul 2022 07:37:17 -0700 (PDT)
Received: from gmail.com ([191.187.223.18]) by smtp.gmail.com with ESMTPSA id
 x82-20020a1f3155000000b003743e7c87c5sm4315725vkx.5.2022.07.31.07.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jul 2022 07:37:16 -0700 (PDT)
Date: Sun, 31 Jul 2022 11:37:15 -0300
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: romain.naour@smile.fr
Message-ID: <62e6939b97dd4_bff73b04129@xultri.mail>
References: <ba33b6d8-53e0-e3e0-4b37-de13643bc9a1@smile.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="--==_mimepart_62e6939a1a03_bff73b040f0"; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:subject:references
 :message-id:cc:to:from:date:from:to:cc;
 bh=UsLaUmw975UsgQj+BEq66FGNEThPHbq7vrYpy3IEJ44=;
 b=AQYYj9/af3ix6K9ieKxnR+SVOucwi4VED64tfV2XH1218FtwFV6OozVppa0PPc2hZL
 I2UhW3rRWxusowxO+vYfwTcWuiQrMsFaqDKzUHc80tzWydz8wTf0mHZ7ZV2UiDZrjvde
 HEqe3RsKeuZELbxhU8zFizGMNRSqtYGzNpsoBDj90U11/smYOb8AhtyVdh0qjjr6CONd
 AZBCsWvtJuW1+DED5wbmmu4x9JS/26lPafRxYyY4bLXG1NOuPgz2rK3ah5Zwed4DdTeV
 AY/864TNkk/XOkZ1NC5hZxjsM0tHQGQMdzLHuUdDda7qcMweMpUL35gDQVOzRFp6WG/w
 6ruQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=AQYYj9/a
Subject: Re: [Buildroot] [PATCH 08/16] docs/manual: check-package before
 submitting patch
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
Cc: thomas.de_schampheleire@nokia.com, buildroot@buildroot.org
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


----==_mimepart_62e6939a1a03_bff73b040f0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,=0D
=0D
On Wed, Jul 27, 2022 at 10:22 AM, Romain Naour wrote:=0D
=0D
> Le 24/07/2022 =C3=A0 07:49, Ricardo Martincoski a =C3=A9crit=C2=A0:=0D
>> Add 'make check-package' to the default workflow of submitting patches=
,=0D
>> just after the rebase and before using format-patch.=0D
>> =0D
>> Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>=0D
>> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>=0D
>> ---=0D
>>  docs/manual/contribute.txt | 6 ++++++=0D
>>  1 file changed, 6 insertions(+)=0D
>> =0D
>> diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt=0D=

>> index e588c69be6..c5652af7a0 100644=0D
>> --- a/docs/manual/contribute.txt=0D
>> +++ b/docs/manual/contribute.txt=0D
>> @@ -294,6 +294,12 @@ $ git fetch --all --tags=0D
>>  $ git rebase origin/master=0D
>>  ---------------------=0D
>>  =0D
>> +Now run some basic checks for the changes you committed:=0D
> =0D
> "some basic checks" may be not really meaningful for newcomers.=0D
=0D
Indeed.=0D
=0D
> =0D
> I would add a small description of what check-package really does.=0D
=0D
Maybe:=0D
Now check the coding style for the changes you committed:=0D
=0D
Notice that the hyperlink to the section that describes what it does is r=
ight=0D
above the added text.=0D
=0D
282 Buildroot provides a handy tool to check for common coding style=0D
283 mistakes on files you created or modified, called +check-package+ (se=
e=0D
284 xref:check-package[] for more information).=0D
285=0D
286 =3D=3D=3D=3D Preparing a patch series=0D
287=0D
288 Starting from the changes committed in your local git view, _rebase_=0D=

289 your development branch on top of the upstream tree before generating=
=0D
290 a patch set. To do so, run:=0D
291=0D
292 ---------------------=0D
293 $ git fetch --all --tags=0D
294 $ git rebase origin/master=0D
295 ---------------------=0D
296 =0D
297 Now check the coding style for the changes you committed:=0D
298 =0D
299 ---------------------=0D
300 $ make check-package=0D
301 ---------------------=0D
302 =0D
303 Now, you are ready to generate then submit your patch set.=0D
=0D
=0D
Regards,=0D
Ricardo=

----==_mimepart_62e6939a1a03_bff73b040f0
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

----==_mimepart_62e6939a1a03_bff73b040f0--
