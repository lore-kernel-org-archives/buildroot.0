From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 16 Apr 2013 08:27:08 +0200
Subject: [Buildroot] [PATCH 1/3] python-setuptools: forkbump and add
 workaround for shebang
In-Reply-To: <1365872210-20167-1-git-send-email-gustavo@zacarias.com.ar>
References: <1365872210-20167-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <516CEF3C.6070505@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi Gustavo,

  I usually don't bother reviewing your patches, but now I found something:

On 13/04/13 18:56, Gustavo Zacarias wrote:
> Switch to distribute fork since it's maintained and fixes a few issues
> while bumping to version 0.6.36.
> There's work upstream in re-merging with setuptools which is now
> supposedly maintained, see
> http://mail.python.org/pipermail/distutils-sig/2013-March/020126.html
>
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>   .../python-setuptools-add-executable.patch         | 50 ++++++++++++++++++++++
>   package/python-setuptools/python-setuptools.mk     |  8 ++--
>   2 files changed, 54 insertions(+), 4 deletions(-)
>   create mode 100644 package/python-setuptools/python-setuptools-add-executable.patch
>
> diff --git a/package/python-setuptools/python-setuptools-add-executable.patch b/package/python-setuptools/python-setuptools-add-executable.patch
> new file mode 100644
> index 0000000..a14a3ed
> --- /dev/null
> +++ b/package/python-setuptools/python-setuptools-add-executable.patch
> @@ -0,0 +1,50 @@
> +Add a new --executable option to distribute so that we can
> +force the shebang line in installed python scripts.
> +
> +Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> +
> +diff -Nura distribute-0.6.36.orig/setuptools/command/install.py distribute-0.6.36/setuptools/command/install.py
> +--- distribute-0.6.36.orig/setuptools/command/install.py	2013-04-13 09:46:23.160823598 -0300
> ++++ distribute-0.6.36/setuptools/command/install.py	2013-04-13 11:17:28.418841986 -0300
> +@@ -6,6 +6,7 @@
> +     """Use easy_install to install the package, w/dependencies"""
> +
> +     user_options = _install.user_options + [
> ++        ('executable=', 'e', "specify final destination interpreter path"),
> +         ('old-and-unmanageable', None, "Try not to use this!"),
> +         ('single-version-externally-managed', None,
> +             "used by system package builders to create 'flat' eggs"),
> +@@ -21,6 +22,7 @@
> +
> +     def initialize_options(self):
> +         _install.initialize_options(self)
> ++	self.executable = None

  Mixing tabs with spaces... Also a few other instances in the rest of 
this patch.

> +         self.old_and_unmanageable = None
> +         self.single_version_externally_managed = None
> +         self.no_compile = None  # make DISTUTILS_DEBUG work right!
> +diff -Nura distribute-0.6.36.orig/setuptools/command/install_scripts.py distribute-0.6.36/setuptools/command/install_scripts.py
> +--- distribute-0.6.36.orig/setuptools/command/install_scripts.py	2013-04-13 09:46:23.160823598 -0300
> ++++ distribute-0.6.36/setuptools/command/install_scripts.py	2013-04-13 11:24:32.305416400 -0300
> +@@ -10,6 +10,13 @@
> +     def initialize_options(self):
> +         _install_scripts.initialize_options(self)
> +         self.no_ep = False
> ++	self.executable = None
> ++
> ++    def finalize_options(self):
> ++        _install_scripts.finalize_options(self)
> ++        self.set_undefined_options('install',
> ++	    ('executable','executable')
> ++	)
> +
> +     def run(self):
> +         from setuptools.command.easy_install import get_script_args
> +@@ -31,6 +38,8 @@
> +         )
> +         bs_cmd = self.get_finalized_command('build_scripts')
> +         executable = getattr(bs_cmd,'executable',sys_executable)
> ++	if self.executable is not None:
> ++	    executable = self.executable
> +         is_wininst = getattr(
> +             self.get_finalized_command("bdist_wininst"), '_is_running', False
> +         )
> diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
> index 25fddb9..64f6ded 100644
> --- a/package/python-setuptools/python-setuptools.mk
> +++ b/package/python-setuptools/python-setuptools.mk
> @@ -4,9 +4,9 @@
>   #
>   #############################################################
>
> -PYTHON_SETUPTOOLS_VERSION = 0.6c11
> -PYTHON_SETUPTOOLS_SOURCE  = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
> -PYTHON_SETUPTOOLS_SITE    = http://pypi.python.org/packages/source/s/setuptools
> +PYTHON_SETUPTOOLS_VERSION = 0.6.36
> +PYTHON_SETUPTOOLS_SOURCE  = distribute-$(PYTHON_SETUPTOOLS_VERSION).tar.gz

  I would add a comment here, e.g.

# "distribute" is a fork of the unmaintained setuptools package. There
# are plans to re-merge it into setuptools; if this happens, we can
# switch back to http://pypi.python.org/packages/source/s/setuptools

> +PYTHON_SETUPTOOLS_SITE    = http://pypi.python.org/packages/source/d/distribute
>   PYTHON_SETUPTOOLS_DEPENDENCIES = python
>
>   define HOST_PYTHON_SETUPTOOLS_BUILD_CMDS
> @@ -24,7 +24,7 @@ endef
>
>   define PYTHON_SETUPTOOLS_INSTALL_TARGET_CMDS
>   	(cd $(@D); PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"\
> -	$(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
> +	$(HOST_DIR)/usr/bin/python setup.py install --executable=/usr/bin/python --single-version-externally-managed --root=/ --prefix=$(TARGET_DIR)/usr)

  Please split this long line. Also, maybe it's worth explaining why we 
want --single-version-externally-managed?


  Regards,
  Arnout

>   endef
>
>   $(eval $(generic-package))
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
