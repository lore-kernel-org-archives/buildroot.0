Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB657C433F5
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 08:12:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 432CB83216;
	Fri, 13 May 2022 08:12:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EXOU6L-mMjKo; Fri, 13 May 2022 08:12:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 292A082F0F;
	Fri, 13 May 2022 08:11:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9FB7A1BF332
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 08:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8362860C34
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 08:11:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=googlemail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GfG5W0naQqFg for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 08:11:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 65BAC605B3
 for <buildroot@buildroot.org>; Fri, 13 May 2022 08:11:55 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id z18so7930302iob.5
 for <buildroot@buildroot.org>; Fri, 13 May 2022 01:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QQ4Revft0EAy6s55n+35TmI0sCExoA/7UcpuEL1CmsI=;
 b=ApNEG1597hjaT2UFz7f6tG0Slu19mpPAJlyow2ciAPabUy7rLWn1bDgd2JioViQMKV
 OXJjDhUKPHcBv/RmyC12zycG67OjN3EYj0iAhCzTHlpK6qd4SdudcDsAXBDJyLAAo3WP
 vRFwTUcamfimOvXWkb8bxvXuxyeG/HK45IRHjOzGp7e0DEhdrKT6sNr37ghm1Sb41kbR
 a4MjkASAKQ8daswamG3RoKJXuB8pMB3vFWMcXk410yqOxtac7xGhkqL6kn0byXP0WV3D
 QRdtJsT+rUpa8Y/PV6KtxFucJOSZzxdLSzmSm6TWz8OAxWkF/AfNlCtEMgi31yNlnOVE
 y3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QQ4Revft0EAy6s55n+35TmI0sCExoA/7UcpuEL1CmsI=;
 b=CewW4dmtVscTt9mVSBStwqcUawfQ25iuWiWSJXBRXx/uv/ZfqO3B/Q0pFYNt2GS2wP
 ZhFUfxljw+U+t1Xuvg3PivoKs5GEF5QMiunkxVe67/TV20YgZSEniGM51obadIcKOab4
 t3W6XkooPU5QEvqXmgRkojBeRiNh1/NiadZFgnaF65F9Pxx4k+odvIf/CJqZMdQABxSQ
 Qstnlj9SLUgeSKia9tCHPOz3HnF8Fs0IWRqcfu6w0aItDWxy7iAndElJ0f4JJQItFDLY
 nhOW9/Ox1iB+f8KpPGMUo4m+rjifN4CELQJSmKI+2YOoqSmUJqhUDwFPL+jpeZ/PH81H
 AY2g==
X-Gm-Message-State: AOAM533P01AIFk+Ox3fQb7t5p6JRhIFyzp3SMLjWpHnaFYs5d00oNaNb
 u9vzNsVM5rC7WOv+4HOF719/zSzvwU7yryNzuBw0YKpd
X-Google-Smtp-Source: ABdhPJxFqIERvpc7totns0ynwNboP+3RckYxqIOQCcfR8qyeG4hp9GvnyTb+CC39tQeWK2rYCXoohTmHurejhKjClGI=
X-Received: by 2002:a6b:1547:0:b0:64c:8bd4:acba with SMTP id
 68-20020a6b1547000000b0064c8bd4acbamr1659703iov.204.1652429514346; Fri, 13
 May 2022 01:11:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220512201820.13611-1-adamg@esdemc.com>
In-Reply-To: <20220512201820.13611-1-adamg@esdemc.com>
Date: Fri, 13 May 2022 10:11:42 +0200
Message-ID: <CAGm1_kt4zJ8F-7D0b3r3wQpzKz=DiQsDH2xMuFRQ4XEwbkTOKQ@mail.gmail.com>
To: Adam Gausmann <adamg@esdemc.com>
Subject: Re: [Buildroot] [PATCH 1/1] add package/python-pyqtchart
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?Q?Manuel_V=C3=B6gele?= <develop@manuel-voegele.de>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Adam,

On Thu, May 12, 2022 at 10:18 PM Adam Gausmann <adamg@esdemc.com> wrote:
>
> Signed-off-by: Adam Gausmann <adamg@esdemc.com>
> ---
>  package/Config.in                             |  1 +
>  .../0005-configure-emit-sip-flags.patch       | 25 ++++++++++
>  package/python-pyqt5/python-pyqt5.mk          |  2 +-
>  package/python-pyqtchart/Config.in            |  8 ++++
>  .../python-pyqtchart/python-pyqtchart.hash    |  5 ++
>  package/python-pyqtchart/python-pyqtchart.mk  | 48 +++++++++++++++++++
>  6 files changed, 88 insertions(+), 1 deletion(-)
>  create mode 100644 package/python-pyqt5/0005-configure-emit-sip-flags.patch
>  create mode 100644 package/python-pyqtchart/Config.in
>  create mode 100644 package/python-pyqtchart/python-pyqtchart.hash
>  create mode 100644 package/python-pyqtchart/python-pyqtchart.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 8892134133..b21b3dc5c1 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1176,6 +1176,7 @@ menu "External python modules"
>         source "package/python-pyphen/Config.in"
>         source "package/python-pyqrcode/Config.in"
>         source "package/python-pyqt5/Config.in"
> +       source "package/python-pyqtchart/Config.in"
>         source "package/python-pyratemp/Config.in"
>         source "package/python-pyroute2/Config.in"
>         source "package/python-pysendfile/Config.in"
> diff --git a/package/python-pyqt5/0005-configure-emit-sip-flags.patch b/package/python-pyqt5/0005-configure-emit-sip-flags.patch
> new file mode 100644
> index 0000000000..ad524f1e53
> --- /dev/null
> +++ b/package/python-pyqt5/0005-configure-emit-sip-flags.patch
> @@ -0,0 +1,25 @@
> +configure.py: emit sip_flags
> +
> +Other PyQt packages (e.g. PyQtChart) obtain their sip_flags from PyQt5. The
> +default mechanism is for PyQt5 to embed it in the QtCore package and the other
> +packages will try to import PyQt5.QtCore and read it; however, because this is
> +not a host package, it cannot be imported during configuration.
> +
> +Another option is to provide those flags as a command-line option to the other
> +packages' configure.py scripts. So, this patch emits the sip_flags generated by
> +PyQt5 to a file which will be installed in staging dir for the other packages
> +to read.
> +
> +Signed-off-by: Adam Gausmann <adamg@esdemc.com>
> +
> +--- a/configure.py     2022-05-12 14:45:48.624851781 -0500
> ++++ b/configure.py     2022-05-12 14:44:24.704852510 -0500
> +@@ -1450,6 +1450,8 @@ def generate_makefiles(target_config, ve
> +
> +     # Set the SIP platform, version and feature flags.
> +     sip_flags = get_sip_flags(target_config)
> ++    with open('sip_flags', 'w+') as f:
> ++        f.write(sip_flags)
> +
> +     # Go through the modules.
> +     pyqt_modules = list(target_config.pyqt_modules)
> diff --git a/package/python-pyqt5/python-pyqt5.mk b/package/python-pyqt5/python-pyqt5.mk
> index af32f63796..2698a1e0ad 100644
> --- a/package/python-pyqt5/python-pyqt5.mk
> +++ b/package/python-pyqt5/python-pyqt5.mk
> @@ -157,7 +157,6 @@ PYTHON_PYQT5_CONF_OPTS = \
>         -w --confirm-license \
>         --no-designer-plugin \
>         --no-docstrings \
> -       --no-sip-files \
>         $(foreach module,$(PYTHON_PYQT5_MODULES),--enable=$(module))
>
>  define PYTHON_PYQT5_CONFIGURE_CMDS
> @@ -180,6 +179,7 @@ define PYTHON_PYQT5_INSTALL_TARGET_CMDS
>         $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) install
>         touch $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/PyQt5/__init__.py
>         $(RM) -rf $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/PyQt5/uic/port_v2
> +       install -D $(@D)/sip_flags $(STAGING_DIR)/usr/share/PyQt5/sip_flags
>  endef
>
>  $(eval $(generic-package))
> diff --git a/package/python-pyqtchart/Config.in b/package/python-pyqtchart/Config.in
> new file mode 100644
> index 0000000000..1731b85e0b
> --- /dev/null
> +++ b/package/python-pyqtchart/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_PYTHON_PYQTCHART
> +       bool "python-pyqtchart"
> +       depends on BR2_PACKAGE_PYTHON_PYQT5
> +       select BR2_PACKAGE_QT5CHARTS
> +       help
> +         Python bindings for Qt Charts

Full stop is missing at the end of the description.

> +
> +         http://www.riverbankcomputing.com/software/pyqt/
> diff --git a/package/python-pyqtchart/python-pyqtchart.hash b/package/python-pyqtchart/python-pyqtchart.hash
> new file mode 100644
> index 0000000000..79852741da
> --- /dev/null
> +++ b/package/python-pyqtchart/python-pyqtchart.hash
> @@ -0,0 +1,5 @@
> +# Locally-computed:
> +sha256 91c9c6857e8c8891faa3875e3714392150016f365a63cdff8bfd40b6c33ea277  PyQtChart_gpl-5.7.tar.gz
> +
> +# Hash for license file
> +sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
> diff --git a/package/python-pyqtchart/python-pyqtchart.mk b/package/python-pyqtchart/python-pyqtchart.mk
> new file mode 100644
> index 0000000000..fb22ebc997
> --- /dev/null
> +++ b/package/python-pyqtchart/python-pyqtchart.mk
> @@ -0,0 +1,48 @@
> +################################################################################
> +#
> +# python-pyqtchart
> +#
> +################################################################################
> +
> +PYTHON_PYQTCHART_VERSION = 5.7
> +PYTHON_PYQTCHART_SOURCE = PyQtChart_gpl-$(PYTHON_PYQTCHART_VERSION).tar.gz
> +PYTHON_PYQTCHART_SITE = http://downloads.sourceforge.net/project/pyqt/PyQtChart/PyQtChart-$(PYTHON_PYQTCHART_VERSION)
> +PYTHON_PYQTCHART_LICENSE = GPL-3.0
> +
> +PYTHON_PYQTCHART_DEPENDENCIES = python-pyqt5
> +
> +ifeq ($(BR2_PACKAGE_PYTHON),y)
> +PYTHON_PYQTCHART_PYTHON_DIR = python$(PYTHON_VERSION_MAJOR)
> +PYTHON_PYQTCHART_RM_PORT_BASE = port_v3
> +else ifeq ($(BR2_PACKAGE_PYTHON3),y)
> +PYTHON_PYQTCHART_PYTHON_DIR = python$(PYTHON3_VERSION_MAJOR)
> +PYTHON_PYQTCHART_RM_PORT_BASE = port_v2
> +endif

There is only the Python3 package in BR so no need to handle the Python2 case.

Regards,
Yegor

> +
> +PYTHON_PYQTCHART_CONF_OPTS = \
> +       --destdir $(TARGET_DIR)/usr/lib/$(PYTHON_PYQTCHART_PYTHON_DIR)/site-packages/PyQt5 \
> +       --qmake $(HOST_DIR)/bin/qmake \
> +       --sysroot $(STAGING_DIR)/usr \
> +       --no-docstrings \
> +       --no-sip-files \
> +       --pyqt-sip-flags "$(file <$(STAGING_DIR)/usr/share/PyQt5/sip_flags)" \
> +       --qtchart-version=2.0.1 \
> +
> +define PYTHON_PYQTCHART_CONFIGURE_CMDS
> +       (cd $(@D); \
> +               $(TARGET_MAKE_ENV) \
> +               $(TARGET_CONFIGURE_OPTS) \
> +               $(HOST_DIR)/bin/python configure.py \
> +                       $(PYTHON_PYQTCHART_CONF_OPTS) \
> +       )
> +endef
> +
> +define PYTHON_PYQTCHART_BUILD_CMDS
> +       $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
> +endef
> +
> +define PYTHON_PYQTCHART_INSTALL_TARGET_CMDS
> +       $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) install
> +endef
> +
> +$(eval $(generic-package))
> --
> 2.25.1
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
