Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF79CCF9F8
	for <buildroot@archiver.kernel.org>; Sun,  9 Nov 2025 21:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F45E6086B;
	Sun,  9 Nov 2025 21:04:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3-oGbBhoXO8p; Sun,  9 Nov 2025 21:04:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7296060870
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7296060870;
	Sun,  9 Nov 2025 21:04:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C5AA1CD
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 21:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42EF38131E
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 21:04:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rB9noMZd1n0U for <buildroot@buildroot.org>;
 Sun,  9 Nov 2025 21:04:13 +0000 (UTC)
Received-SPF: Pass (sender SPF authorized) identity=helo;
 client-ip=2a02:2350:5:505::1;
 helo=mailrelay-egress18.pub.mailoutpod2-cph3.one.com;
 envelope-from=ayoub.zaki@embetrix.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 47BDD8131A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47BDD8131A
Received: from mailrelay-egress18.pub.mailoutpod2-cph3.one.com
 (mailrelay-egress18.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:505::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 47BDD8131A
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 21:04:09 +0000 (UTC)
X-HalOne-ID: 9e7574ca-bdaf-11f0-8c10-4f541c8bf1cc
Received: from [IPV6:2a02:3102:8c10:1ae0:72ec:3970:1e4b:e6b3]
 (dynamic-2a02-3102-8c10-1ae0-72ec-3970-1e4b-e6b3.310.pool.telefonica.de
 [2a02:3102:8c10:1ae0:72ec:3970:1e4b:e6b3])
 by mailrelay3.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
 id 9e7574ca-bdaf-11f0-8c10-4f541c8bf1cc;
 Sun, 09 Nov 2025 21:04:04 +0000 (UTC)
Message-ID: <076df85a-3775-4854-875a-f76662318e35@embetrix.com>
Date: Sun, 9 Nov 2025 22:04:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Lance Fredrickson <lancethepants@gmail.com>, buildroot@buildroot.org
References: <1c677011-9c6e-483c-ab4f-93480d7fdd69@embetrix.com>
 <CABwKrPDNVLCLJHg7Nvxne+03RtZXXpO_H-iKquAe7hchiMf3pg@mail.gmail.com>
Content-Language: en-US
From: Ayoub Zaki <ayoub.zaki@embetrix.com>
In-Reply-To: <CABwKrPDNVLCLJHg7Nvxne+03RtZXXpO_H-iKquAe7hchiMf3pg@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1762722245; x=1763327045; 
 d=embetrix.com; s=rsa1;
 h=in-reply-to:from:references:to:subject:mime-version:date:message-id:
 content-type:from;
 bh=wyvsKMeXYb5n8aTHnjvEprb2k8z6BTD2qULBaX6x/ZI=;
 b=dFa+z/5/TtykElHiYjGCAaSaNShQ84VEGzPY6ijIjogYEXyifsWTsnfPZqD02fVQCV0D6+yj/yPFC
 Tr9Xy6YhzrIEDFu0o/Lh6O8GIuqK4GR4EKA/MJBmNI147CeJqjYz17I9rS2KD2KtxmU4jx1AsfzXor
 UursMptW2+V06gHyRAuR65BviJFhM1aeMJfpje7p0W6dUr0WkmKp//FbeOSEeaeq5AIxLbT1LzWlJC
 vqTSJKH1QkWWmlzOtXvNdcwjhkf1HVT/9RUsgqY8M2DYivIWvcd8HNH0iT8C0LFDomcVrulju7zaiN
 XuT/MI5JJR62xgE8UQ9yVMRPBY+yaSQ==
X-Mailman-Original-DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 t=1762722245; x=1763327045; 
 d=embetrix.com; s=ed1;
 h=in-reply-to:from:references:to:subject:mime-version:date:message-id:
 content-type:from;
 bh=wyvsKMeXYb5n8aTHnjvEprb2k8z6BTD2qULBaX6x/ZI=;
 b=HL2sTDOrjh2rNhKq+dor79KQvyoTRrRmFeESVbpmdB241rQKJjn1/J6Knw1guidaQcB6FlyMNtQdW
 vxYM4H7BA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=embetrix.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=embetrix.com
 header.i=@embetrix.com header.a=rsa-sha256 header.s=rsa1 header.b=dFa+z/5/; 
 dkim=pass header.d=embetrix.com header.i=@embetrix.com header.a=ed25519-sha256
 header.s=ed1 header.b=HL2sTDOr
Subject: Re: [Buildroot] override a core package from BR2_EXTERNAL
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
Content-Type: multipart/mixed; boundary="===============4295654753563165303=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============4295654753563165303==
Content-Type: multipart/alternative;
 boundary="------------Pnj3V7xVuYOxjm0LxW0tLsOx"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------Pnj3V7xVuYOxjm0LxW0tLsOx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


thanks, but this is NOT what I'm looking for, I have requirement to have 
a complete older version of a core package.

I did a  reverse patch for the package but this is ugly and look for a 
cleaner way to do it.

On 11/9/25 21:24, Lance Fredrickson wrote:
> I created a directory called package-overrides in my External package 
> directory, although you could call it whatever you want. So far I've 
> only overridden one package and even then it was just the install 
> routine and removing the install target hooks.  Using the the Makefile 
> "override" keyword you should be able to change whatever package 
> definition you want.
>
> https://github.com/tomato64/tomato64/blob/master/tomato64/package/package-overrides/mariadb-override.mk
>
> I'm not sure if there's an official or "supported" way to do this, but 
> this is just what I figured out for myself.
>
> Lance
>
>
> On Sun, Nov 9, 2025, 6:25 AM Ayoub Zaki <ayoub.zaki@embetrix.com> wrote:
>
>     Hi all,
>
>     What’s the supported way to fully override a core package from
>     BR2_EXTERNAL while keeping the same package name so that dependencies
>     from other packages still work ?
>
>
>     Mit freundlichen Grüßen / Kind regards
>
>     -- 
>     Ayoub Zaki
>     Embedded Systems Consultant
>
>     Vaihinger Straße 2/1
>     D-71634 Ludwigsburg
>
>     Mobile   : +4917662901545
>     Email    : ayoub.zaki@embetrix.com
>     Homepage : https://embetrix.com
>     VAT No.  : DE313902634
>
>     _______________________________________________
>     buildroot mailing list
>     buildroot@buildroot.org
>     https://lists.buildroot.org/mailman/listinfo/buildroot
>
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

Mit freundlichen Grüßen / Kind regards

-- 
Ayoub Zaki
Embedded Systems Consultant

Vaihinger Straße 2/1
D-71634 Ludwigsburg

Mobile   : +4917662901545
Email    :ayoub.zaki@embetrix.com
Homepage :https://embetrix.com
VAT No.  : DE313902634

--------------Pnj3V7xVuYOxjm0LxW0tLsOx
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <p>thanks, but this is NOT what I'm looking for, I have requirement
      to have a complete older version of a core package.</p>
    <p>I did a  reverse patch for the package but this is ugly and look
      for a cleaner way to do it.</p>
    <div class="moz-cite-prefix">On 11/9/25 21:24, Lance Fredrickson
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CABwKrPDNVLCLJHg7Nvxne+03RtZXXpO_H-iKquAe7hchiMf3pg@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="auto">
        <div>I created a directory called package-overrides in my
          External package directory, although you could call it
          whatever you want. So far I've only overridden one package and
          even then it was just the install routine and removing the
          install target hooks.  Using the the Makefile "override"
          keyword you should be able to change whatever package
          definition you want. 
          <div dir="auto"><br>
          </div>
          <div dir="auto"><a
href="https://github.com/tomato64/tomato64/blob/master/tomato64/package/package-overrides/mariadb-override.mk"
              moz-do-not-send="true" class="moz-txt-link-freetext">https://github.com/tomato64/tomato64/blob/master/tomato64/package/package-overrides/mariadb-override.mk</a></div>
          <div dir="auto"><br>
          </div>
          <div dir="auto">I'm not sure if there's an official or
            "supported" way to do this, but this is just what I figured
            out for myself. </div>
          <div dir="auto"><br>
          </div>
          <div dir="auto">Lance </div>
          <br>
          <br>
          <div class="gmail_quote gmail_quote_container">
            <div dir="ltr" class="gmail_attr">On Sun, Nov 9, 2025,
              6:25 AM Ayoub Zaki &lt;<a
                href="mailto:ayoub.zaki@embetrix.com"
                moz-do-not-send="true" class="moz-txt-link-freetext">ayoub.zaki@embetrix.com</a>&gt;
              wrote:<br>
            </div>
            <blockquote class="gmail_quote"
style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi
              all,<br>
              <br>
              What’s the supported way to fully override a core package
              from <br>
              BR2_EXTERNAL while keeping the same package name so that
              dependencies <br>
              from other packages still work ?<br>
              <br>
              <br>
              Mit freundlichen Grüßen / Kind regards<br>
              <br>
              -- <br>
              Ayoub Zaki<br>
              Embedded Systems Consultant<br>
              <br>
              Vaihinger Straße 2/1<br>
              D-71634 Ludwigsburg<br>
              <br>
              Mobile   : +4917662901545<br>
              Email    : <a href="mailto:ayoub.zaki@embetrix.com"
                target="_blank" rel="noreferrer" moz-do-not-send="true"
                class="moz-txt-link-freetext">ayoub.zaki@embetrix.com</a><br>
              Homepage : <a href="https://embetrix.com"
                rel="noreferrer noreferrer" target="_blank"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://embetrix.com</a><br>
              VAT No.  : DE313902634<br>
              <br>
              _______________________________________________<br>
              buildroot mailing list<br>
              <a href="mailto:buildroot@buildroot.org" target="_blank"
                rel="noreferrer" moz-do-not-send="true"
                class="moz-txt-link-freetext">buildroot@buildroot.org</a><br>
              <a
href="https://lists.buildroot.org/mailman/listinfo/buildroot"
                rel="noreferrer noreferrer" target="_blank"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://lists.buildroot.org/mailman/listinfo/buildroot</a><br>
            </blockquote>
          </div>
        </div>
      </div>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">_______________________________________________
buildroot mailing list
<a class="moz-txt-link-abbreviated" href="mailto:buildroot@buildroot.org">buildroot@buildroot.org</a>
<a class="moz-txt-link-freetext" href="https://lists.buildroot.org/mailman/listinfo/buildroot">https://lists.buildroot.org/mailman/listinfo/buildroot</a>
</pre>
    </blockquote>
    <pre class="moz-signature" cols="72">Mit freundlichen Grüßen / Kind regards

-- 
Ayoub Zaki
Embedded Systems Consultant

Vaihinger Straße 2/1
D-71634 Ludwigsburg

Mobile   : +4917662901545
Email    : <a class="moz-txt-link-abbreviated" href="mailto:ayoub.zaki@embetrix.com">ayoub.zaki@embetrix.com</a>
Homepage : <a class="moz-txt-link-freetext" href="https://embetrix.com">https://embetrix.com</a>
VAT No.  : DE313902634</pre>
  </body>
</html>

--------------Pnj3V7xVuYOxjm0LxW0tLsOx--

--===============4295654753563165303==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4295654753563165303==--
