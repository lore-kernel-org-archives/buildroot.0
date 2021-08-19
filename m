Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19D16C4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 17:41:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FE536109F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 17:41:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9FE536109F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=xes-inc.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 579B140001;
	Thu, 19 Aug 2021 17:41:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ym3pzHDkEo5J; Thu, 19 Aug 2021 17:41:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9EFD400C3;
	Thu, 19 Aug 2021 17:41:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ED2C11BF31A
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 17:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC33C400C3
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 17:41:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IPj5AjInpUsa for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 17:41:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE13040001
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 17:41:30 +0000 (UTC)
Received: from [10.52.16.113] (vfazio2.xes-mad.com [10.52.16.113])
 by mail.xes-mad.com (Postfix) with ESMTP id 6237B206C1;
 Thu, 19 Aug 2021 12:41:29 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
 t=1629394889; bh=WfdIog6sYrwcd5DjtT+str8yKfIVizJE24wDTwRauDs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=DWZsXZfEut9VGHjZ2DtbLQOYvNNhdqaALlz+1V8cPgKsJBNyMvigIuC1X//lHCwDr
 C6cCDFRM15yVj2pgKL43Gx2PIWhSTAZeM5+V0NK5onajQG0kOLUY1aKwHjSeOoPlrR
 DDEVl431qhwmUXEMycYMRDBAOkxQ+dSdI8xe94Lk=
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210819172154.7575-1-fontaine.fabrice@gmail.com>
From: Vincent Fazio <vfazio@xes-inc.com>
Message-ID: <73d2b237-67a4-98c2-927d-b3f8845051be@xes-inc.com>
Date: Thu, 19 Aug 2021 12:41:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210819172154.7575-1-fontaine.fabrice@gmail.com>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH 1/1] package/nvidia-driver: fix build
 without X.org drivers
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: multipart/mixed; boundary="===============2719036764644833113=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

This is a multi-part message in MIME format.
--===============2719036764644833113==
Content-Type: multipart/alternative;
 boundary="------------A5FEF0B864ED48EAD7AA22F5"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------A5FEF0B864ED48EAD7AA22F5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Sorry about that. Apparently I did make those changes in our branch but 
forgot to fold them into a v2 for the submitted patch.

The only other change I'd recommend is moving the finalize hook inside 
the same block, since it doesn't apply if the X drivers aren't being 
included. More for logic's sake than anything.

Reviewed-by: Vincent Fazio <vfazio@xes-inc.com>

On 8/19/21 12:21 PM, Fabrice Fontaine wrote:
> Fix the following build failure without BR2_PACKAGE_NVIDIA_DRIVER_XORG
> raised since commit 9cda982855315d683d4880e6bb2a129133ea7213:
>
> ln: failed to create symbolic link '/tmp/instance-0/output-1/target/usr/lib/xorg/modules/extensions/libglx.so': No such file or directory
>
> Fixes:
>   - http://autobuild.buildroot.org/results/c2e7a826c105363309f70a3fcfe28bd53efcb94a
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/nvidia-driver/nvidia-driver.mk | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
> index 7e89c1ab01..54c2aa46d8 100644
> --- a/package/nvidia-driver/nvidia-driver.mk
> +++ b/package/nvidia-driver/nvidia-driver.mk
> @@ -96,6 +96,12 @@ NVIDIA_DRIVER_LIBS += \
>   	nvidia_drv.so:xorg/modules/drivers/ \
>   	libglx.so.$(NVIDIA_DRIVER_VERSION):xorg/modules/extensions/
>   
> +# libglx needs a symlink according to the driver README. It has no SONAME
> +define NVIDIA_DRIVER_SYMLINK_LIBGLX
> +	ln -sf libglx.so.$(NVIDIA_DRIVER_VERSION) \
> +		$(TARGET_DIR)/usr/lib/xorg/modules/extensions/libglx.so
> +endef
> +
>   endif # X drivers
>   
>   ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_CUDA),y)
> @@ -187,12 +193,6 @@ define NVIDIA_DRIVER_INSTALL_STAGING_CMDS
>   	$(NVIDIA_DRIVER_INSTALL_GL_DEV)
>   endef
>   
> -# libglx needs a symlink according to the driver README. It has no SONAME
> -define NVIDIA_DRIVER_SYMLINK_LIBGLX
> -	ln -sf libglx.so.$(NVIDIA_DRIVER_VERSION) \
> -		$(TARGET_DIR)/usr/lib/xorg/modules/extensions/libglx.so
> -endef
> -
>   # For target, install libraries and X.org modules
>   define NVIDIA_DRIVER_INSTALL_TARGET_CMDS
>   	$(call NVIDIA_DRIVER_INSTALL_LIBS,$(TARGET_DIR))

-- 
Vincent Fazio
Embedded Software Engineer - ATS
Extreme Engineering Solutions, Inc
http://www.xes-inc.com


--------------A5FEF0B864ED48EAD7AA22F5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Sorry about that. Apparently I did make those changes in our
      branch but forgot to fold them into a v2 for the submitted patch.
      <br>
      <br>
      The only other change I'd recommend is moving the finalize hook
      inside the same block, since it doesn't apply if the X drivers
      aren't being included. More for logic's sake than anything.<br>
    </p>
    <p>Reviewed-by: Vincent Fazio &lt;<span class="Object" role="link"
        id="OBJ_PREFIX_DWT446_ZmEmailObjectHandler"><span class="Object"
          role="link" id="OBJ_PREFIX_DWT458_ZmEmailObjectHandler"><a class="moz-txt-link-abbreviated" href="mailto:vfazio@xes-inc.com">vfazio@xes-inc.com</a></span></span>&gt;</p>
    <div class="moz-cite-prefix">On 8/19/21 12:21 PM, Fabrice Fontaine
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20210819172154.7575-1-fontaine.fabrice@gmail.com">
      <pre class="moz-quote-pre" wrap="">Fix the following build failure without BR2_PACKAGE_NVIDIA_DRIVER_XORG
raised since commit 9cda982855315d683d4880e6bb2a129133ea7213:

ln: failed to create symbolic link '/tmp/instance-0/output-1/target/usr/lib/xorg/modules/extensions/libglx.so': No such file or directory

Fixes:
 - <a class="moz-txt-link-freetext" href="http://autobuild.buildroot.org/results/c2e7a826c105363309f70a3fcfe28bd53efcb94a">http://autobuild.buildroot.org/results/c2e7a826c105363309f70a3fcfe28bd53efcb94a</a>

Signed-off-by: Fabrice Fontaine <a class="moz-txt-link-rfc2396E" href="mailto:fontaine.fabrice@gmail.com">&lt;fontaine.fabrice@gmail.com&gt;</a>
---
 package/nvidia-driver/nvidia-driver.mk | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
index 7e89c1ab01..54c2aa46d8 100644
--- a/package/nvidia-driver/nvidia-driver.mk
+++ b/package/nvidia-driver/nvidia-driver.mk
@@ -96,6 +96,12 @@ NVIDIA_DRIVER_LIBS += \
 	nvidia_drv.so:xorg/modules/drivers/ \
 	libglx.so.$(NVIDIA_DRIVER_VERSION):xorg/modules/extensions/
 
+# libglx needs a symlink according to the driver README. It has no SONAME
+define NVIDIA_DRIVER_SYMLINK_LIBGLX
+	ln -sf libglx.so.$(NVIDIA_DRIVER_VERSION) \
+		$(TARGET_DIR)/usr/lib/xorg/modules/extensions/libglx.so
+endef
+
 endif # X drivers
 
 ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_CUDA),y)
@@ -187,12 +193,6 @@ define NVIDIA_DRIVER_INSTALL_STAGING_CMDS
 	$(NVIDIA_DRIVER_INSTALL_GL_DEV)
 endef
 
-# libglx needs a symlink according to the driver README. It has no SONAME
-define NVIDIA_DRIVER_SYMLINK_LIBGLX
-	ln -sf libglx.so.$(NVIDIA_DRIVER_VERSION) \
-		$(TARGET_DIR)/usr/lib/xorg/modules/extensions/libglx.so
-endef
-
 # For target, install libraries and X.org modules
 define NVIDIA_DRIVER_INSTALL_TARGET_CMDS
 	$(call NVIDIA_DRIVER_INSTALL_LIBS,$(TARGET_DIR))
</pre>
    </blockquote>
    <pre class="moz-signature" cols="72">-- 
Vincent Fazio
Embedded Software Engineer - ATS
Extreme Engineering Solutions, Inc
<a class="moz-txt-link-freetext" href="http://www.xes-inc.com">http://www.xes-inc.com</a></pre>
  </body>
</html>

--------------A5FEF0B864ED48EAD7AA22F5--

--===============2719036764644833113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============2719036764644833113==--
