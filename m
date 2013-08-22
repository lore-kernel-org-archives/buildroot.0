From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 23 Aug 2013 01:24:05 +0200
Subject: [Buildroot] [PATCH] python-setuptools: Add missing
 $(TARGET_DIR) to PYTHONPATH.
In-Reply-To: <1377204777-8904-1-git-send-email-markos.chandras@imgtec.com>
References: <1377204777-8904-1-git-send-email-markos.chandras@imgtec.com>
Message-ID: <52169D95.9030701@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/08/13 22:52, Markos Chandras wrote:
> The $(TARGET_DIR) variable is required when building
> python-setuptools for the target otherwise the build system detects
> the host installation which leads to permission error problems
> like these:
>
> Setuptools installation detected at /usr/lib64/python2.7/site-packages
> Renaming /usr/lib64/python2.7/site-packages/setuptools-0.9.8-py2.7.egg-info to
> /usr/lib64/python2.7/site-packages/setuptools-0.9.8-py2.7.egg-info.OLD.1377005697.88
> OSError: [Errno 13] Permission denied
>
> Moreover, remove the PYTHONPATH variable for host variant since it's
> not needed.
>
> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
> ---
>   package/python-setuptools/python-setuptools.mk | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
> index cd5ee4d..3044b4d 100644
> --- a/package/python-setuptools/python-setuptools.mk
> +++ b/package/python-setuptools/python-setuptools.mk
> @@ -20,19 +20,18 @@ endef
>
>   define PYTHON_SETUPTOOLS_BUILD_CMDS
>   	(cd $(@D); \
> -	PYTHONPATH="/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
> +	PYTHONPATH="$(TARGET_DIR))/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \

  Double ) there...


  Regards,
  Arnout

>   	$(HOST_DIR)/usr/bin/python setup.py build)
>   endef
>
>   define HOST_PYTHON_SETUPTOOLS_INSTALL_CMDS
>   	(cd $(@D); \
> -	PYTHONPATH="$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
>   	$(HOST_DIR)/usr/bin/python setup.py install --prefix=$(HOST_DIR)/usr)
>   endef
>
>   define PYTHON_SETUPTOOLS_INSTALL_TARGET_CMDS
>   	(cd $(@D); \
> -	PYTHONPATH="/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
> +	PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
>   	$(HOST_DIR)/usr/bin/python setup.py install --executable=/usr/bin/python \
>   	--single-version-externally-managed --root=/ --prefix=$(TARGET_DIR)/usr)
>   endef
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
