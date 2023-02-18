Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66ECDC6379F
	for <buildroot@archiver.kernel.org>; Sat, 18 Feb 2023 17:00:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B76E981F42;
	Sat, 18 Feb 2023 17:00:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B76E981F42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fLX6QD6EHtnR; Sat, 18 Feb 2023 17:00:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6ECD581F8A;
	Sat, 18 Feb 2023 17:00:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6ECD581F8A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 419E51BF59C
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 17:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27E4A41854
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 17:00:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27E4A41854
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f5wto5Xp01_Q for <buildroot@lists.busybox.net>;
 Sat, 18 Feb 2023 17:00:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 205D041842
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 205D041842
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 17:00:44 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id u6so1068928oiw.11
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 09:00:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Gr6xJ0Grb8Cvw4GyagsoSUobezUYSlvSKd0L2oM2LRY=;
 b=m/Wb8qUqOj7UWhNj1lMHk6q9HMIVP5/X/4iAmhYnaiJ3Z8zJnSGevunHzOlMU/ucfj
 ++/LxLi0IBSQZm+NeN7nZubrkKXlvU/6nFlg8kTPTFcYXcFZw6U3WPq9DgAM32Zo2UGH
 OTVOul2gc/Lb3lE+ubpjo4pYqDQy04JJDp0sFjHrVtUQAl2aQwmXTFR63aSYe9XraVlh
 MCCDwp7GuFvoG2MW8gYaBsTcHTli9NzmZVSwcKh+JKyl2CBM9ZqytegNHjXUO3/omYOn
 8ZX8MN/tDGF4HVugY9efBa7rmIck384pMtH/y8N9vCQUuKUn83zxborFa5BDMP8NYwBC
 XZXA==
X-Gm-Message-State: AO0yUKWHua+nv4veofdT3vgNFDNVxsV3wericB+QljtfV5lrq0v1WN3t
 xNu1oHHpcduLR/jXD4B87TbKBrtoIpivwjoXIo0=
X-Google-Smtp-Source: AK7set8ZG9z+y1X4S1S4vYPpZoAP3sscPpQ5wRYTuVhNoRGn+KECpQ4U7v3PxwCX6EAjwEx+MmoU+EYx8Tv3Sq5mlMg=
X-Received: by 2002:a05:6808:2385:b0:367:18a6:eb14 with SMTP id
 bp5-20020a056808238500b0036718a6eb14mr877914oib.208.1676739643892; Sat, 18
 Feb 2023 09:00:43 -0800 (PST)
MIME-Version: 1.0
References: <CADYjeStG8bZEBprwqez+_3+n-HZ5pG9p8mBySxV+4FU7GM0r3g@mail.gmail.com>
 <20230218121940.7442410e@windsurf>
 <CADYjeSuzT5ueq5F5SQvib87d1HCKXLj565mW-Rm91N7Na1KrDQ@mail.gmail.com>
 <20230218141937.60c307f7@windsurf> <20230218142115.GC2718518@scaer>
 <20230218153216.GD2718518@scaer>
 <CADYjeStKgyabCLrM8QaoU3fsUZ3KChGxzYw6mr2tMmPgYBxYFw@mail.gmail.com>
In-Reply-To: <CADYjeStKgyabCLrM8QaoU3fsUZ3KChGxzYw6mr2tMmPgYBxYFw@mail.gmail.com>
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Sat, 18 Feb 2023 18:00:35 +0100
Message-ID: <CADYjeSt_z3340YvtL26u=R2u9ofosbO=RTqsYEZdoSL8AUkfYw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: multipart/mixed; boundary="000000000000db4ef305f4fc5ead"
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Gr6xJ0Grb8Cvw4GyagsoSUobezUYSlvSKd0L2oM2LRY=;
 b=QfhPMuoH/t801w+KY2F5OKMC8EZP5aOT9vls++19UePGF4GTLMCRg7y8Ddi3nbk/3V
 pdHwnMg3e8VsgLOEatBsoFlY+i5KMZLGIv2WsDGESXqGctRxItRp2wEanSbUQFNhfS0E
 awOtP6UnWSM0HGvHrmP6JuaCt7kxqeBSLTEcGrIL+a3rtL4JqamYA4lbUncsgmX22u0k
 q9dBt/PCBJjN6yB5fvj4CA73hR6WpLGUOP3LHOIkG2/c5k+CMzb1y+cSGeq1glhjepss
 SQB9VAA6gprVhEzzsPGJ7ZMbbyZqoHgxYGKfseDbjMuDb1/fcUyt9CNfU3pTJC2DHYSe
 2exA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=QfhPMuoH
Subject: Re: [Buildroot] Updating trust store using update-ca-certificates
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--000000000000db4ef305f4fc5ead
Content-Type: multipart/alternative; boundary="000000000000db4ef205f4fc5eab"

--000000000000db4ef205f4fc5eab
Content-Type: text/plain; charset="UTF-8"

Hello Yann,

I am trying to apply the patch. I am doing below steps:

1. modified the ca-certificates.mk to include changes. Also attached in
this mail. Could you please verify the changes?
2. Generated patch file using "diff -u "old_file" "new_file" > file.patch".
Placed the patch file in /buildroot/package/ca-certificates/ dir
    0002-ca-certificates-add_local_CAs.patch
    +++ ca-certificates.mk  2023-02-18 14:13:13.181814043 +0000
    @@ -20,24 +20,29 @@
            $(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/ssl/certs
            $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
DESTDIR=$(TARGET_DIR)
            rm -f $(TARGET_DIR)/usr/sbin/update-ca-certificates
    +endef

    +define CA_CERTIFICATES_GEN_BUNDLE
            # Remove any existing certificates under /etc/ssl/certs
            rm -f $(TARGET_DIR)/etc/ssl/certs/*
    +endef

            # Create symlinks to certificates under /etc/ssl/certs
            # and generate the bundle
            cd $(TARGET_DIR) ;\
    +define CA_CERTIFICATES_INSTALL_TARGET_CMDS
            for i in `find usr/share/ca-certificates -name "*.crt" |
LC_COLLATE=C sort` ; do \
                    ln -sf ../../../$$i etc/ssl/certs/`basename $${i}
.crt`.pem ;\
                    cat $$i ;\
    -       done >$(@D)/ca-certificates.crt
    +       done >$(BUILD_DIR)/ca-certificates.crt

            # Create symlinks to the certificates by their hash values
            $(HOST_DIR)/bin/c_rehash $(TARGET_DIR)/etc/ssl/certs

            # Install the certificates bundle
    -       $(INSTALL) -D -m 644 $(@D)/ca-certificates.crt \
    +       $(INSTALL) -D -m 644 $(BUILD_DIR)/ca-certificates.crt \
                    $(TARGET_DIR)/etc/ssl/certs/ca-certificates.crt
    endef
    +CA_CERTIFICATES_TARGET_FINALIZE_HOOKS += CA_CERTIFICATES_GEN_BUNDLE

 $(eval $(generic-package))

3. Trying to rebuild the package:
    make ca-certificates-dirclean
    make

But, the patch is not applied. Getting below error:
    Applying 0002-ca-certificates-add_local_CAs.patch using patch:
    can't find file to patch at input line 3
    Perhaps you used the wrong -p or --strip option?

Can you please let me know what am I doing wrong here?

Thank you.

On Sat, 18 Feb 2023 at 16:56, Sourabh Hegde <hrsourabh011@gmail.com> wrote:

> Hello Yann, All,
>
> Thanks for the update.
>
> Yes, I will try this patch and let you know.
>
> Also, we do remove update-ca-certificates on purpose from TARGET_DIR,
>> because it is not expected that we need/can regenerate the root bundle
>> on the target.
>>
>
> I am not sure if I understood this completely. I have a generic question:
> What if someone wants to update castore on the target itself. Let's say if
> the local CA is already available on the target then how can it be added to
> the trust store with update-ca-certificates? Is it not a good option to
> include "update-ca-certificates" in TARGET_DIR?
>
> On Sat, 18 Feb 2023 at 16:32, Yann E. MORIN <yann.morin.1998@free.fr>
> wrote:
>
>> Thomas, Sourabh, All,
>>
>> On 2023-02-18 15:21 +0100, Yann E. MORIN spake thusly:
>> > On 2023-02-18 14:19 +0100, Thomas Petazzoni via buildroot spake thusly:
>> > > On Sat, 18 Feb 2023 13:54:15 +0100
>> > > Sourabh Hegde <hrsourabh011@gmail.com> wrote:
>> > > > I was thinking the ca-certificates package will take care of this.
>> Maybe I
>> > > > was wrong.
>> > > > So, how should we add local CA to the trust store in the target?
>> > > I am not sure as I'm not super familiar with that aspect. If what you
>> > > need to do is to call update-ca-certificates during the build, then we
>> > > could potentially build it for the host, and run it as a post-build
>> > > script. Of course, this assumes update-ca-certificates is capable of
>> > > doing its work on a root filesystem that isn't at the root.
>>
>> No, update-ca-certificates does not know how to work out-of-tree, which
>> is the reason why we already need to handle it manually when we install
>> ca-certificates.
>>
>> Also, we do remove update-ca-certificates on purpose from TARGET_DIR,
>> because it is not expected that we need/can regenerate the root bundle
>> on the target.
>>
>> > > Do you have more details about what needs to be done? With more
>> > > details, we could probably give some more useful hints.
>> >
>> > I think we just need to split CA_CERTIFICATES_INSTALL_TARGET_CMDS in
>> two:
>> > one part to actually instll the certifcates provided by ca-certificates
>> > itself, and the rest to update the castore with all certificate, as a
>> > target-finalize hook.
>> >
>> > I.e. all that starts from "Remove any existing certificates under
>> > /etc/ssl/certs" should be moved to a target-finalize hook.
>>
>> Basically, something around those lines (totally untested):
>>
>> diff --git a/package/ca-certificates/ca-certificates.mk
>> b/package/ca-certificates/ca-certificates.mk
>> index 0b6962ab7b..cc55d39957 100644
>> --- a/package/ca-certificates/ca-certificates.mk
>> +++ b/package/ca-certificates/ca-certificates.mk
>> @@ -20,7 +20,9 @@ define CA_CERTIFICATES_INSTALL_TARGET_CMDS
>>         $(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/ssl/certs
>>         $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install DESTDIR=$(TARGET_DIR)
>>         rm -f $(TARGET_DIR)/usr/sbin/update-ca-certificates
>> +endef
>>
>> +define CA_CERTIFICATES_GEN_BUNDLE
>>         # Remove any existing certificates under /etc/ssl/certs
>>         rm -f $(TARGET_DIR)/etc/ssl/certs/*
>>
>> @@ -30,14 +32,15 @@ define CA_CERTIFICATES_INSTALL_TARGET_CMDS
>>         for i in `find usr/share/ca-certificates -name "*.crt" |
>> LC_COLLATE=C sort` ; do \
>>                 ln -sf ../../../$$i etc/ssl/certs/`basename $${i}
>> .crt`.pem ;\
>>                 cat $$i ;\
>> -       done >$(@D)/ca-certificates.crt
>> +       done >$(BUILD_DIR)/ca-certificates.crt
>>
>>         # Create symlinks to the certificates by their hash values
>>         $(HOST_DIR)/bin/c_rehash $(TARGET_DIR)/etc/ssl/certs
>>
>>         # Install the certificates bundle
>> -       $(INSTALL) -D -m 644 $(@D)/ca-certificates.crt \
>> +       $(INSTALL) -D -m 644 $(BUILD_DIR)/ca-certificates.crt \
>>                 $(TARGET_DIR)/etc/ssl/certs/ca-certificates.crt
>>  endef
>> +CA_CERTIFICATES_TARGET_FINALIZE_HOOKS += CA_CERTIFICATES_GEN_BUNDLE
>>
>>  $(eval $(generic-package))
>>
>> Sourabh, can you test and adapt that and report, please?
>>
>> Regards,
>> Yann E. MORIN.
>>
>> --
>>
>> .-----------------.--------------------.------------------.--------------------.
>> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
>> conspiracy: |
>> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>>      |
>> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There
>> is no  |
>> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>>  conspiracy.  |
>>
>> '------------------------------^-------^------------------^--------------------'
>>
>

--000000000000db4ef205f4fc5eab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Yann,<div><br></div><div>I am trying to apply the pa=
tch. I am doing below steps:</div><div><br></div><div>1. modified the <a hr=
ef=3D"http://ca-certificates.mk" target=3D"_blank">ca-certificates.mk</a> t=
o include changes. Also attached in this=C2=A0mail. Could you please verify=
 the changes?</div><div>2. Generated patch file using &quot;diff -u=C2=A0&q=
uot;old_file&quot; &quot;new_file&quot; &gt; file.patch&quot;. Placed the p=
atch file in /buildroot/package/ca-certificates/ dir<br>=C2=A0 =C2=A0=C2=A0=
0002-ca-certificates-add_local_CAs.patch<br>=C2=A0 =C2=A0 +++ <a href=3D"ht=
tp://ca-certificates.mk" target=3D"_blank">ca-certificates.mk</a> =C2=A0202=
3-02-18 14:13:13.181814043 +0000</div>=C2=A0 =C2=A0 @@ -20,24 +20,29 @@<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(INSTALL) -d -m 0755 $(TARGET_DI=
R)/etc/ssl/certs<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(TARGET_MAKE=
_ENV) $(MAKE) -C $(@D) install DESTDIR=3D$(TARGET_DIR)<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 rm -f $(TARGET_DIR)/usr/sbin/update-ca-certificate=
s<br>=C2=A0 =C2=A0 +endef<br><br>=C2=A0 =C2=A0 +define CA_CERTIFICATES_GEN_=
BUNDLE<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Remove any existing c=
ertificates under /etc/ssl/certs<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 rm -f $(TARGET_DIR)/etc/ssl/certs/*<br>=C2=A0 =C2=A0 +endef<br><br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Create symlinks to certificates un=
der /etc/ssl/certs<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # and gener=
ate the bundle<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cd $(TARGET_DIR=
) ;\<br>=C2=A0 =C2=A0 +define CA_CERTIFICATES_INSTALL_TARGET_CMDS<br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in `find usr/share/ca-certificate=
s -name &quot;*.crt&quot; | LC_COLLATE=3DC sort` ; do \<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf ../../../$$i=
 etc/ssl/certs/`basename $${i} .crt`.pem ;\<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cat $$i ;\<br>=C2=A0 =C2=A0 - =C2=
=A0 =C2=A0 =C2=A0 done &gt;$(@D)/ca-certificates.crt<br>=C2=A0 =C2=A0 + =C2=
=A0 =C2=A0 =C2=A0 done &gt;$(BUILD_DIR)/ca-certificates.crt<br><br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Create symlinks to the certificates by=
 their hash values<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(HOST_DIR)=
/bin/c_rehash $(TARGET_DIR)/etc/ssl/certs<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 # Install the certificates bundle<br>=C2=A0 =C2=A0 - =C2=
=A0 =C2=A0 =C2=A0 $(INSTALL) -D -m 644 $(@D)/ca-certificates.crt \<br>=C2=
=A0 =C2=A0 + =C2=A0 =C2=A0 =C2=A0 $(INSTALL) -D -m 644 $(BUILD_DIR)/ca-cert=
ificates.crt \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 $(TARGET_DIR)/etc/ssl/certs/ca-certificates.crt<br>=C2=A0 =C2=
=A0 endef<br>=C2=A0 =C2=A0 +CA_CERTIFICATES_TARGET_FINALIZE_HOOKS +=3D CA_C=
ERTIFICATES_GEN_BUNDLE<br><br>=C2=A0$(eval $(generic-package))<div><br></di=
v><div>3. Trying to rebuild the package:=C2=A0<br>=C2=A0 =C2=A0 make=C2=A0c=
a-certificates-dirclean</div><div>=C2=A0 =C2=A0 make</div><div><br></div><d=
iv>But, the patch is not applied. Getting below error:</div><div>=C2=A0 =C2=
=A0 Applying 0002-ca-certificates-add_local_CAs.patch using patch:<br>=C2=
=A0 =C2=A0 can&#39;t find file to patch at input line 3<br>=C2=A0 =C2=A0 Pe=
rhaps you used the wrong -p or --strip option?<br></div><div><br></div><div=
>Can you please let me know what am I doing wrong here?</div><div><br></div=
><div>Thank you.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Sat, 18 Feb 2023 at 16:56, Sourabh Hegde &lt;<a hr=
ef=3D"mailto:hrsourabh011@gmail.com" target=3D"_blank">hrsourabh011@gmail.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div dir=3D"ltr">Hello=C2=A0Yann, All,<div><br></div><div>Thanks for the =
update.</div><div><br></div><div>Yes, I will try this patch and let you kno=
w.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Al=
so, we do remove update-ca-certificates on purpose from TARGET_DIR,<br>beca=
use it is not expected that we need/can regenerate the root bundle<br>on th=
e target.<br></blockquote><div><br></div><div>I am not sure if I understood=
 this completely. I have a generic question: What if someone wants to updat=
e castore on the target itself. Let&#39;s say if the local CA is already av=
ailable on the target then how can it be added to the trust store with upda=
te-ca-certificates? Is it not a good option to include &quot;update-ca-cert=
ificates&quot; in TARGET_DIR?</div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Sat, 18 Feb 2023 at 16:32, Yann E. MO=
RIN &lt;<a href=3D"mailto:yann.morin.1998@free.fr" target=3D"_blank">yann.m=
orin.1998@free.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">Thomas, Sourabh, All,<br>
<br>
On 2023-02-18 15:21 +0100, Yann E. MORIN spake thusly:<br>
&gt; On 2023-02-18 14:19 +0100, Thomas Petazzoni via buildroot spake thusly=
:<br>
&gt; &gt; On Sat, 18 Feb 2023 13:54:15 +0100<br>
&gt; &gt; Sourabh Hegde &lt;<a href=3D"mailto:hrsourabh011@gmail.com" targe=
t=3D"_blank">hrsourabh011@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt; I was thinking the ca-certificates package will take care of=
 this. Maybe I<br>
&gt; &gt; &gt; was wrong.<br>
&gt; &gt; &gt; So, how should we add local CA to the trust store in the tar=
get?<br>
&gt; &gt; I am not sure as I&#39;m not super familiar with that aspect. If =
what you<br>
&gt; &gt; need to do is to call update-ca-certificates during the build, th=
en we<br>
&gt; &gt; could potentially build it for the host, and run it as a post-bui=
ld<br>
&gt; &gt; script. Of course, this assumes update-ca-certificates is capable=
 of<br>
&gt; &gt; doing its work on a root filesystem that isn&#39;t at the root.<b=
r>
<br>
No, update-ca-certificates does not know how to work out-of-tree, which<br>
is the reason why we already need to handle it manually when we install<br>
ca-certificates.<br>
<br>
Also, we do remove update-ca-certificates on purpose from TARGET_DIR,<br>
because it is not expected that we need/can regenerate the root bundle<br>
on the target.<br>
<br>
&gt; &gt; Do you have more details about what needs to be done? With more<b=
r>
&gt; &gt; details, we could probably give some more useful hints.<br>
&gt; <br>
&gt; I think we just need to split CA_CERTIFICATES_INSTALL_TARGET_CMDS in t=
wo:<br>
&gt; one part to actually instll the certifcates provided by ca-certificate=
s<br>
&gt; itself, and the rest to update the castore with all certificate, as a<=
br>
&gt; target-finalize hook.<br>
&gt; <br>
&gt; I.e. all that starts from &quot;Remove any existing certificates under=
<br>
&gt; /etc/ssl/certs&quot; should be moved to a target-finalize hook.<br>
<br>
Basically, something around those lines (totally untested):<br>
<br>
diff --git a/package/ca-certificates/<a href=3D"http://ca-certificates.mk" =
rel=3D"noreferrer" target=3D"_blank">ca-certificates.mk</a> b/package/ca-ce=
rtificates/<a href=3D"http://ca-certificates.mk" rel=3D"noreferrer" target=
=3D"_blank">ca-certificates.mk</a><br>
index 0b6962ab7b..cc55d39957 100644<br>
--- a/package/ca-certificates/<a href=3D"http://ca-certificates.mk" rel=3D"=
noreferrer" target=3D"_blank">ca-certificates.mk</a><br>
+++ b/package/ca-certificates/<a href=3D"http://ca-certificates.mk" rel=3D"=
noreferrer" target=3D"_blank">ca-certificates.mk</a><br>
@@ -20,7 +20,9 @@ define CA_CERTIFICATES_INSTALL_TARGET_CMDS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/ssl/cer=
ts<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install DES=
TDIR=3D$(TARGET_DIR)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f $(TARGET_DIR)/usr/sbin/update-ca-certific=
ates<br>
+endef<br>
<br>
+define CA_CERTIFICATES_GEN_BUNDLE<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Remove any existing certificates under /etc/s=
sl/certs<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f $(TARGET_DIR)/etc/ssl/certs/*<br>
<br>
@@ -30,14 +32,15 @@ define CA_CERTIFICATES_INSTALL_TARGET_CMDS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in `find usr/share/ca-certificates -name =
&quot;*.crt&quot; | LC_COLLATE=3DC sort` ; do \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf ../../../$$i=
 etc/ssl/certs/`basename $${i} .crt`.pem ;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cat $$i ;\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0done &gt;$(@D)/ca-certificates.crt<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0done &gt;$(BUILD_DIR)/ca-certificates.crt<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Create symlinks to the certificates by their =
hash values<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(HOST_DIR)/bin/c_rehash $(TARGET_DIR)/etc/ssl/=
certs<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Install the certificates bundle<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -D -m 644 $(@D)/ca-certificates.crt =
\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -D -m 644 $(BUILD_DIR)/ca-certificat=
es.crt \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(TARGET_DIR)/etc/s=
sl/certs/ca-certificates.crt<br>
=C2=A0endef<br>
+CA_CERTIFICATES_TARGET_FINALIZE_HOOKS +=3D CA_CERTIFICATES_GEN_BUNDLE<br>
<br>
=C2=A0$(eval $(generic-package))<br>
<br>
Sourabh, can you test and adapt that and report, please?<br>
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
-- <br>
.-----------------.--------------------.------------------.----------------=
----.<br>
|=C2=A0 Yann E. MORIN=C2=A0 | Real-Time Embedded | /&quot;\ ASCII RIBBON | =
Erics&#39; conspiracy: |<br>
| +33 662 376 056 | Software=C2=A0 Designer | \ / CAMPAIGN=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 ___=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
| +33 561 099 427 `------------.-------:=C2=A0 X=C2=A0 AGAINST=C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 \e/=C2=A0 There is no=C2=A0 |<br>
| <a href=3D"http://ymorin.is-a-geek.org/" rel=3D"noreferrer" target=3D"_bl=
ank">http://ymorin.is-a-geek.org/</a> | _/*\_ | / \ HTML MAIL=C2=A0 =C2=A0 =
|=C2=A0 =C2=A0v=C2=A0 =C2=A0conspiracy.=C2=A0 |<br>
&#39;------------------------------^-------^------------------^------------=
--------&#39;<br>
</blockquote></div>
</blockquote></div>

--000000000000db4ef205f4fc5eab--

--000000000000db4ef305f4fc5ead
Content-Type: application/octet-stream; name="ca-certificates.mk"
Content-Disposition: attachment; filename="ca-certificates.mk"
Content-Transfer-Encoding: base64
Content-ID: <f_lea7grmo0>
X-Attachment-Id: f_lea7grmo0

IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIwojIGNhLWNlcnRpZmljYXRlcwojCiMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjCgpDQV9DRVJUSUZJQ0FURVNfVkVSU0lPTiA9IDIwMjExMDE2CkNBX0NFUlRJ
RklDQVRFU19TT1VSQ0UgPSBjYS1jZXJ0aWZpY2F0ZXNfJChDQV9DRVJUSUZJQ0FURVNfVkVSU0lP
TikudGFyLnh6CkNBX0NFUlRJRklDQVRFU19TSVRFID0gaHR0cHM6Ly9zbmFwc2hvdC5kZWJpYW4u
b3JnL2FyY2hpdmUvZGViaWFuLzIwMjExMDIyVDE0NDkwM1ovcG9vbC9tYWluL2MvY2EtY2VydGlm
aWNhdGVzCkNBX0NFUlRJRklDQVRFU19ERVBFTkRFTkNJRVMgPSBob3N0LW9wZW5zc2wgaG9zdC1w
eXRob24zCkNBX0NFUlRJRklDQVRFU19MSUNFTlNFID0gR1BMLTIuMCsgKHNjcmlwdCksIE1QTC0y
LjAgKGRhdGEpCkNBX0NFUlRJRklDQVRFU19MSUNFTlNFX0ZJTEVTID0gZGViaWFuL2NvcHlyaWdo
dAoKZGVmaW5lIENBX0NFUlRJRklDQVRFU19CVUlMRF9DTURTCiAgICAgICAgJChUQVJHRVRfTUFL
RV9FTlYpICQoTUFLRSkgLUMgJChARCkgY2xlYW4gYWxsCmVuZGVmCgpkZWZpbmUgQ0FfQ0VSVElG
SUNBVEVTX0lOU1RBTExfVEFSR0VUX0NNRFMKICAgICAgICAkKElOU1RBTEwpIC1kIC1tIDA3NTUg
JChUQVJHRVRfRElSKS91c3Ivc2hhcmUvY2EtY2VydGlmaWNhdGVzCiAgICAgICAgJChJTlNUQUxM
KSAtZCAtbSAwNzU1ICQoVEFSR0VUX0RJUikvZXRjL3NzbC9jZXJ0cwogICAgICAgICQoVEFSR0VU
X01BS0VfRU5WKSAkKE1BS0UpIC1DICQoQEQpIGluc3RhbGwgREVTVERJUj0kKFRBUkdFVF9ESVIp
CiAgICAgICAgcm0gLWYgJChUQVJHRVRfRElSKS91c3Ivc2Jpbi91cGRhdGUtY2EtY2VydGlmaWNh
dGVzCmVuZGVmCgpkZWZpbmUgQ0FfQ0VSVElGSUNBVEVTX0dFTl9CVU5ETEUKICAgICAgICAjIFJl
bW92ZSBhbnkgZXhpc3RpbmcgY2VydGlmaWNhdGVzIHVuZGVyIC9ldGMvc3NsL2NlcnRzCiAgICAg
ICAgcm0gLWYgJChUQVJHRVRfRElSKS9ldGMvc3NsL2NlcnRzLyoKZW5kZWYKCiAgICAgICAgIyBD
cmVhdGUgc3ltbGlua3MgdG8gY2VydGlmaWNhdGVzIHVuZGVyIC9ldGMvc3NsL2NlcnRzCiAgICAg
ICAgIyBhbmQgZ2VuZXJhdGUgdGhlIGJ1bmRsZQogICAgICAgIGNkICQoVEFSR0VUX0RJUikgO1wK
ZGVmaW5lIENBX0NFUlRJRklDQVRFU19JTlNUQUxMX1RBUkdFVF9DTURTCiAgICAgICAgZm9yIGkg
aW4gYGZpbmQgdXNyL3NoYXJlL2NhLWNlcnRpZmljYXRlcyAtbmFtZSAiKi5jcnQiIHwgTENfQ09M
TEFURT1DIHNvcnRgIDsgZG8gXAogICAgICAgICAgICAgICAgbG4gLXNmIC4uLy4uLy4uLyQkaSBl
dGMvc3NsL2NlcnRzL2BiYXNlbmFtZSAkJHtpfSAuY3J0YC5wZW0gO1wKICAgICAgICAgICAgICAg
IGNhdCAkJGkgO1wKICAgICAgICBkb25lID4kKEJVSUxEX0RJUikvY2EtY2VydGlmaWNhdGVzLmNy
dAoKICAgICAgICAjIENyZWF0ZSBzeW1saW5rcyB0byB0aGUgY2VydGlmaWNhdGVzIGJ5IHRoZWly
IGhhc2ggdmFsdWVzCiAgICAgICAgJChIT1NUX0RJUikvYmluL2NfcmVoYXNoICQoVEFSR0VUX0RJ
UikvZXRjL3NzbC9jZXJ0cwoKICAgICAgICAjIEluc3RhbGwgdGhlIGNlcnRpZmljYXRlcyBidW5k
bGUKICAgICAgICAkKElOU1RBTEwpIC1EIC1tIDY0NCAkKEJVSUxEX0RJUikvY2EtY2VydGlmaWNh
dGVzLmNydCBcCiAgICAgICAgICAgICAgICAkKFRBUkdFVF9ESVIpL2V0Yy9zc2wvY2VydHMvY2Et
Y2VydGlmaWNhdGVzLmNydAplbmRlZgpDQV9DRVJUSUZJQ0FURVNfVEFSR0VUX0ZJTkFMSVpFX0hP
T0tTICs9IENBX0NFUlRJRklDQVRFU19HRU5fQlVORExFCgokKGV2YWwgJChnZW5lcmljLXBhY2th
Z2UpKQ==
--000000000000db4ef305f4fc5ead
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--000000000000db4ef305f4fc5ead--
