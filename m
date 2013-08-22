From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 22 Aug 2013 22:37:30 +0200
Subject: [Buildroot] [PATCH] python-setuptools: Add patch to prevent
 detecting the host installation
In-Reply-To: <CAG2jQ8g7nmyF3zJAPvN_nYtBHg2FR_r4Ba7Jt=Ny10Xfkwn1kQ@mail.gmail.com>
References: <1377008739-12484-1-git-send-email-markos.chandras@imgtec.com>
 <521527EC.8000307@mind.be>
 <CAGm1_kvOgqynT=gJcxQW=xr_MQeiL8QuxiKAi88QrKADwQY1EQ@mail.gmail.com>
 <CAGm1_ktgXAkpBOQJ4JspAfWKirqQg2SdKOvYH9+on2wKKgHOFw@mail.gmail.com>
 <5215D75E.5080301@mind.be>
 <CAGm1_ksuhkORZYRNw1HPixOjBzRmk3MWgHp_yztMtHsYEyRrLw@mail.gmail.com>
 <5215F201.6090308@zacarias.com.ar> <5215F336.8050106@mind.be>
 <5215F4F6.4030701@zacarias.com.ar>
 <CAG2jQ8g7nmyF3zJAPvN_nYtBHg2FR_r4Ba7Jt=Ny10Xfkwn1kQ@mail.gmail.com>
Message-ID: <5216768A.8050903@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/08/13 22:33, Markos Chandras wrote:
> The following patch works for me
>
> --- a/package/python-setuptools/python-setuptools.mk
> +++ b/package/python-setuptools/python-setuptools.mk
> @@ -20,19 +20,18 @@ endef
>
>   define PYTHON_SETUPTOOLS_BUILD_CMDS
>          (cd $(@D); \
> -       PYTHONPATH="/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
> +       PYTHONPATH="$(TARGET_DIR))/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"
> \
>          $(HOST_DIR)/usr/bin/python setup.py build)
>   endef
>
>   define HOST_PYTHON_SETUPTOOLS_INSTALL_CMDS
>          (cd $(@D); \
> -       PYTHONPATH="$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"
> \
>          $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(HOST_DIR)/usr)
>   endef
>
>   define PYTHON_SETUPTOOLS_INSTALL_TARGET_CMDS
>          (cd $(@D); \
> -       PYTHONPATH="/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
> +       PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"
> \
>          $(HOST_DIR)/usr/bin/python setup.py install
> --executable=/usr/bin/python \
>          --single-version-externally-managed --root=/ --prefix=$(TARGET_DIR)/usr)
>
>
> Host variant is installed in
> output/host/usr/lib/python2.7/site-packages/distribute-0.6.36-py2.7.egg
> and target variant in output/target/usr/lib/python2.7/site-packages/setuptools
>
> What do you think?

  Yes, please submit as a proper patch. I'll test and ack it.

> I think the 'target variant' of setuptools can be
> removed in a subsequent patch if necessary.

  It's not really necessary though. Doesn't hurt to keep it around.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
