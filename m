From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 12 Feb 2013 15:46:30 +0100
Subject: [Buildroot] [PATCH 2/5] Add python3 to python simlinks in
	staging
In-Reply-To: <1360678441-3199-3-git-send-email-kpa_info@yahoo.fr>
References: <1360678441-3199-1-git-send-email-kpa_info@yahoo.fr>
 <1360678441-3199-3-git-send-email-kpa_info@yahoo.fr>
Message-ID: <CAHXCMMJQesfQXa3RZV7WdK=88STK8YvsTHdm_Kjk_7dQ8KEnQQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Patrick,

2013/2/12 Patrick Gerber <kpa_info@yahoo.fr>:
> When using python3 a symlink "python" is added in staging and point to
s/staging/host directory/

> python3. This is needed to call python setup for external package. A
> second simlink is added to alias the config-3.3m directory to config
s/simlink/symlink/

>
> Signed-off-by: Patrick Gerber <kpa_info@yahoo.fr>
> ---
>  package/python3/python3.mk |    8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index 7551a7b..5974824 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -160,6 +160,14 @@ ifneq ($(BR2_PACKAGE_PYTHON),y)
>  PYTHON3_POST_INSTALL_TARGET_HOOKS += PYTHON3_INSTALL_SYMLINK
>  endif
>
> +define HOST_PYTHON3_INSTALL_SYMLINK
> +       ln -fs python3 $(HOST_DIR)/usr/bin/python
> +       ln -fs config-3.3m $(HOST_DIR)/usr/lib/python3.3/config
> +endef
> +
> +HOST_PYTHON3_POST_INSTALL_HOOKS += HOST_PYTHON3_INSTALL_SYMLINK
BTW, I'm a bit concerned about the consequencies this may have...

From my experience, having python poiting to python3 in the PATH has
some bad effect,
and some patch have been posted some time ago to fix this issue:
http://patchwork.ozlabs.org/patch/208803/

Also, I'm dubious about having python poiting to python3.
Though there is nothing really stated, there is usually a consensus:
"python" refers to the
python-2 interpreter if it exists on the system, otherwise it refers
to the python-3 one (if existing).

What worries me is that, python (i.e. python 2.6 or 2.7) is currently
a mandatory for Buildroot
(see: http://buildroot.org/downloads/manual/manual.html#requirement-mandatory),
and here,
you are overriding it with python3 in the PATH inside Buildroot.

I undersatnd that, when BR2_PACKAGE_PYTHON3_PY_ONLY is enabled, you
want to build
all modules using python3, but meanwhile some other build scripts may
use 'python' referring
to python2 and may badly failed because they will trigger python3...

I may have missed something... so, enlighten me please.


Regards,

-- 
Samuel
