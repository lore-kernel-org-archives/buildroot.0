Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF27C05027
	for <buildroot@archiver.kernel.org>; Mon, 23 Jan 2023 16:32:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A844260EE4;
	Mon, 23 Jan 2023 16:32:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A844260EE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CbI15L9URIMU; Mon, 23 Jan 2023 16:32:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF8A960ECA;
	Mon, 23 Jan 2023 16:32:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF8A960ECA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E1F131BF859
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 16:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD3DE81FDA
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 16:32:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD3DE81FDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1_iCRb7bHo0m for <buildroot@lists.busybox.net>;
 Mon, 23 Jan 2023 16:32:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DBE681EE8
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7DBE681EE8
 for <buildroot@buildroot.org>; Mon, 23 Jan 2023 16:32:16 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id x40so19020631lfu.12
 for <buildroot@buildroot.org>; Mon, 23 Jan 2023 08:32:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R5KYE6dkFtki17ImhufWLVvQbcwJx18sovhj4bPqeKs=;
 b=sC7PDd6W5Vd0rBx00jHavd2ymO6cd83pOLSzkThlTk/aQp/Ek/QlZfHOpqeM5ecTYb
 jsBmS6Y22HmwuojjfLWjFnUVvZpgRhsEeOEGManFdidRVrk1VCop+N/XvhhgtbM/cbuj
 DHlG3D2N2rcL0DUjHPQByBbgHpuOZn19wDKugatmYfa/d4zSU2gRJNE0uvfdasg7laXo
 vwk/DKd23U447DBlxTI+ntCNk5r7Wa/pJVNRdH+j2AwkYp/jU8PRL+oqVyXKfUUx9LRB
 afX8G9Jdm6aG/i3N/2j35iLWuz1WvxXya/IYsSLzAn5FoagFRR+Yocj+8y4rlE19QoAK
 F1Fg==
X-Gm-Message-State: AFqh2kqnp++tgN89uuB9431wrvuUNrLjXfaTUiScImohj21ji9hBoT7l
 jXg2dO8DHFQP3CnEVFhhj0MYsEx77n7kxxmt
X-Google-Smtp-Source: AMrXdXuePNFJU2GiD97k+e2C+Xp7gZtJYZaJtVOG7nghhcaBaaEVzHzv8fp0XBz4IP74/G+7m9Lrcw==
X-Received: by 2002:ac2:50c4:0:b0:4a4:68b8:c2e4 with SMTP id
 h4-20020ac250c4000000b004a468b8c2e4mr5842877lfm.59.1674491534019; 
 Mon, 23 Jan 2023 08:32:14 -0800 (PST)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com.
 [209.85.208.169]) by smtp.gmail.com with ESMTPSA id
 y9-20020ac24209000000b004ad5f5c2b28sm6519183lfh.119.2023.01.23.08.32.13
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 08:32:13 -0800 (PST)
Received: by mail-lj1-f169.google.com with SMTP id o7so13706018ljj.8
 for <buildroot@buildroot.org>; Mon, 23 Jan 2023 08:32:13 -0800 (PST)
X-Received: by 2002:a2e:a9a4:0:b0:287:87ef:f274 with SMTP id
 x36-20020a2ea9a4000000b0028787eff274mr1217296ljq.507.1674491533158; Mon, 23
 Jan 2023 08:32:13 -0800 (PST)
MIME-Version: 1.0
References: <20230123135253.1733981-1-thomas.devoogdt@barco.com>
 <87edrl9qnv.fsf@dell.be.48ers.dk>
In-Reply-To: <87edrl9qnv.fsf@dell.be.48ers.dk>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Mon, 23 Jan 2023 17:32:02 +0100
X-Gmail-Original-Message-ID: <CACXRmJjbD_RdN+itgb7L=2G7Ch2WTK_jyQ5hPm_TWFHY2d5JNw@mail.gmail.com>
Message-ID: <CACXRmJjbD_RdN+itgb7L=2G7Ch2WTK_jyQ5hPm_TWFHY2d5JNw@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH v2] package/fluent-bit: add new package
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>, buildroot@buildroot.org,
 Anton Danneels <anton.danneels@barco.com>,
 Grim Delcour <grim.delcour@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Op ma 23 jan. 2023 om 17:11 schreef Peter Korsgaard <peter@korsgaard.com>:
>
> >>>>> "Thomas" == Thomas Devoogdt <thomas@devoogdt.com> writes:
>
>  > Fluent Bit is a super fast, lightweight, and highly
>  > scalable logging and metrics processor and forwarder.
>
>  > Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
>
> Now we just miss the change summary ;)

Sorry about that. I'm not comfortable using git-mail. I at least won't
be sad if buildroot goes to e.g. GitHub or GitLab.
But that is no excuse.

>  > +++ b/package/fluent-bit/S99fluent-bit
>  > @@ -0,0 +1,55 @@
>  > +#!/bin/sh
>  > +#
>  > +# Starts fluent-bit.
>  > +#
>  > +NAME=fluent-bit
>  > +DAEMON=/usr/bin/$NAME
>
> check-package complains about this:
>
> http://nightly.buildroot.org/#adding-packages-start-script
>
> There are also some shellcheck warnings.

Will check.

>  > +PID_FILE="/var/run/$NAME.pid"
>  > +CONF_FILE="/etc/$NAME/$NAME.conf"
>  > +
>  > +[ -r /etc/default/$NAME ] && . /etc/default/$NAME
>  > +
>  > +start() {
>  > +    printf "Starting fluent-bit: "
>  > +    start-stop-daemon -S -q -b -m -p $PID_FILE --exec $DAEMON -- -c $CONF_FILE
>  > +    [ $? = 0 ] && echo "OK" || echo "FAIL"
>  > +}
>  > +
>  > +stop() {
>  > +    printf "Stopping fluent-bit: "
>  > +    start-stop-daemon -K -q -p $PID_FILE
>  > +    # https://docs.fluentbit.io/manual/administration/configuring-fluent-bit/yaml/configuration-file#config_section
>  > +    # The default grace time is set to 5 seconds, so use 6 seconds to have some margin.
>  > +    TIMEOUT=6
>  > +    PID=$(cat $PID_FILE 2>/dev/null)
>  > +    while kill -0 $PID 2>/dev/null; do
>  > +            [ $TIMEOUT -eq 0 ] && echo "FAIL" && return 1
>  > +            TIMEOUT=$((TIMEOUT - 1))
>  > +            sleep 1
>  > +    done
>  > +    rm -f $PID_FILE
>
> So the pidfile is not removed on timeouts. Is that on purpose?

No idea what is preferably, I see at least that it is also not removed in
https://nightly.buildroot.org/#adding-packages-start-script.

> > +++ b/package/fluent-bit/fluent-bit.mk
>  > @@ -0,0 +1,43 @@
>  > +################################################################################
>  > +#
>  > +# fluent-bit
>  > +#
>  > +################################################################################
>  > +
>  > +FLUENT_BIT_VERSION = 2.0.8
>  > +FLUENT_BIT_SITE = $(call github,fluent,fluent-bit,v$(FLUENT_BIT_VERSION))
>  > +FLUENT_BIT_LICENSE = Apache-2.0
>  > +FLUENT_BIT_LICENSE_FILES = LICENSE
>  > +FLUENT_BIT_DEPENDENCIES = host-bison host-flex libyaml libopenssl
>  > +
>  > +FLUENT_BIT_CONF_OPTS += \
>  > +    -DFLB_DEBUG=No \
>  > +    -DFLB_RELEASE=Yes \
>  > +    -DFLB_EXAMPLES=No \
>  > +    -DFLB_CHUNK_TRACE=No \
>  > +    -DFLB_BACKTRACE=No \
>  > +    -DFLB_LUAJIT=No
>  > +
>  > +# Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
>  > +# large file support.
>  > +# See https://bugzilla.redhat.com/show_bug.cgi?id=574992 for more information.
>  > +FLUENT_BIT_CONF_OPTS += \
>  > +    -DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -U_FILE_OFFSET_BITS" \
>  > +    -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -U_FILE_OFFSET_BITS"
>  > +
>  > +# Move the config files from /usr/etc/ to /etc/.
>  > +FLUENT_BIT_CONF_OPTS += \
>  > +    -DCMAKE_INSTALL_SYSCONFDIR="/etc/"
>
> Where do you see that it gets set to /usr/etc/? I just dropped this and
> ran the configure script and I ended up with the normal:
>
> grep SYSCONFDIR  build/fluent-bit-2.0.8/CMakeCache.txt
> CMAKE_INSTALL_SYSCONFDIR:PATH=etc
> //ADVANCED property for variable: CMAKE_INSTALL_SYSCONFDIR
> CMAKE_INSTALL_SYSCONFDIR-ADVANCED:INTERNAL=1
>
> And indeed, building it I don't see any references to /usr/etc:
>
> strings build/fluent-bit-2.0.8/bin/fluent-bit | grep /etc
> /etc/machine-id
> /etc/ssl/certs/ca-bundle.crt
> /etc/ssl/certs/
> /etc/hosts
> /etc/resolv.conf
> /etc/nsswitch.conf
> /etc/host.conf
> /etc/svc.conf
>
> I do see that it gets confused and ends up installing the default config
> files in usr/etc/fluent-bit. I don't right away see why this is so, but
> indeed explicitly setting it to /etc fixes that. Notice that it does
> lead to an invalid service file:
>
> https://github.com/fluent/fluent-bit/issues/6619
>
> So maybe a better fix is to just move the files in a post-install hook?

I do prefer to get it done by setting CMAKE_INSTALL_SYSCONFDIR.
But perhaps, we could wait the response on that thread?

> > +define FLUENT_BIT_POST_INSTALL_TARGET_HOOK
>  > +    cp -dpf $(@D)/lib/libminiz*.so* $(TARGET_DIR)/usr/lib/
>  > +endef
>  > +
>  > +FLUENT_BIT_POST_INSTALL_TARGET_HOOKS += FLUENT_BIT_POST_INSTALL_TARGET_HOOK
>
> Again, why not just build with -DBUILD_SHARED_LIBS=OFF?
>
> I see that the package installs a shared library in a custom
> location:
>
> target/usr/lib/fluent-bit/libfluent-bit.so
>
> What is that used for / how does it find it? I see there is a
> FLB_SHARED_LIB option to disable it.

Already changed that in V3.
https://patchwork.ozlabs.org/project/buildroot/patch/20230123151459.1899697-1-thomas.devoogdt@barco.com/

> --
> Bye, Peter Korsgaard
>

Kr,
Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
