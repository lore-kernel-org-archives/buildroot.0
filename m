From: Eelco Chaudron <echaudron@xiot.nl>
Date: Thu, 25 Feb 2016 21:21:58 +0100
Subject: [Buildroot] [PATCH 1/1] New package: uwsgi
In-Reply-To: <1451577776-29708-1-git-send-email-a.cappelli@gmail.com>
References: <1451577776-29708-1-git-send-email-a.cappelli@gmail.com>
Message-ID: <0BBD31CA-6B23-476F-842F-8F704E319510@xiot.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Andrea,

I see that your patch has not yet been included in the master branch, and I was wondering if it has anything to do with the failure to compile when using uclibc?

When I add your patch I get the following build error:

[/home/echaudron/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-gcc] core/uwsgi.o
core/uwsgi.c: In function ?uwsgi_backtrace?:
core/uwsgi.c:1786:22: fatal error: execinfo.h: No such file or directory
 #include <execinfo.h>
                      ^
compilation terminated.
Makefile:4: recipe for target 'all' failed
make[2]: *** [all] Error 1

Before I try to make it work, have you (or anyone else) seen/fixed this?

//Eelco

> On 31 Dec 2015, at 17:02, Andrea Cappelli <a.cappelli@gmail.com> wrote:
> 
> 
> Signed-off-by: Andrea Cappelli <a.cappelli@gmail.com>
> ---
> package/Config.in                                  |    1 +
> ...-environment-variables-for-config-scripts.patch |   85 ++++++++++++++++++++
> package/uwsgi/Config.in                            |    6 ++
> package/uwsgi/uwsgi.mk                             |   36 +++++++++
> 4 files changed, 128 insertions(+)
> create mode 100644 package/uwsgi/0001-Added-environment-variables-for-config-scripts.patch
> create mode 100644 package/uwsgi/Config.in
> create mode 100644 package/uwsgi/uwsgi.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 9145d15..e018355 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1457,6 +1457,7 @@ endif
> 	source "package/ulogd/Config.in"
> 	source "package/ushare/Config.in"
> 	source "package/ussp-push/Config.in"
> +	source "package/uwsgi/Config.in"
> 	source "package/vde2/Config.in"
> 	source "package/vnstat/Config.in"
> 	source "package/vpnc/Config.in"
> diff --git a/package/uwsgi/0001-Added-environment-variables-for-config-scripts.patch b/package/uwsgi/0001-Added-environment-variables-for-config-scripts.patch
> new file mode 100644
> index 0000000..a5c79a5
> --- /dev/null
> +++ b/package/uwsgi/0001-Added-environment-variables-for-config-scripts.patch
> @@ -0,0 +1,85 @@
> +Added environment variables to choose right -config script during cross compilation (suggested by Thomas)
> +
> +diff --git a/uwsgiconfig.py b/uwsgiconfig.py
> +index 542d9e7..2695893 100644
> +--- a/uwsgiconfig.py
> ++++ b/uwsgiconfig.py
> +@@ -31,6 +31,9 @@ GCC = os.environ.get('CC', sysconfig.get_config_var('CC'))
> + if not GCC:
> +     GCC = 'gcc'
> + 
> ++PCRE_CONFIG = os.environ.get('PCRE_CONFIG', 'pcre-config')
> ++XML2_CONFIG = os.environ.get('XML2_CONFIG', 'xml2-config')
> ++
> + def get_preprocessor():
> +     if 'clang' in GCC:
> +         return 'clang -xc core/clang_fake.c'
> +@@ -546,6 +549,11 @@ def build_uwsgi(uc, print_only=False, gcll=None):
> +             t.join()
> + 
> +     print("*** uWSGI linking ***")
> ++    try:
> ++        if os.environ['LDFLAGS'] == '':
> ++            ldflags = []
> ++    except:
> ++        pass
> +     ldline = "%s -o %s %s %s %s" % (GCC, bin_name, ' '.join(uniq_warnings(ldflags)),
> +         ' '.join(map(add_o, gcc_list)), ' '.join(uniq_warnings(libs)))
> +     print(ldline)
> +@@ -1017,23 +1025,23 @@ class uConf(object):
> +         # re-enable after pcre fix
> +         if self.get('pcre'):
> +             if self.get('pcre') == 'auto':
> +-                pcreconf = spcall('pcre-config --libs')
> ++                pcreconf = spcall('%s --libs' % PCRE_CONFIG)
> +                 if pcreconf:
> +                     self.libs.append(pcreconf)
> +-                    pcreconf = spcall("pcre-config --cflags")
> ++                    pcreconf = spcall("%s --cflags" % PCRE_CONFIG)
> +                     self.cflags.append(pcreconf)
> +                     self.gcc_list.append('core/regexp')
> +                     self.cflags.append("-DUWSGI_PCRE")
> +                     has_pcre = True
> + 
> +             else:
> +-                pcreconf = spcall('pcre-config --libs')
> ++                pcreconf = spcall('%s --libs' % PCRE_CONFIG)
> +                 if pcreconf is None:
> +                     print("*** libpcre headers unavailable. uWSGI build is interrupted. You have to install pcre development package or disable pcre")
> +                     sys.exit(1)
> +                 else:
> +                     self.libs.append(pcreconf)
> +-                    pcreconf = spcall("pcre-config --cflags")
> ++                    pcreconf = spcall("%s --cflags" % PCRE_CONFIG)
> +                     self.cflags.append(pcreconf)
> +                     self.gcc_list.append('core/regexp')
> +                     self.cflags.append("-DUWSGI_PCRE")
> +@@ -1248,10 +1256,10 @@ class uConf(object):
> + 
> +         if self.get('xml'):
> +             if self.get('xml') == 'auto':
> +-                xmlconf = spcall('xml2-config --libs')
> ++                xmlconf = spcall('%s --libs' % XML2_CONFIG)
> +                 if xmlconf:
> +                     self.libs.append(xmlconf)
> +-                    xmlconf = spcall("xml2-config --cflags")
> ++                    xmlconf = spcall("%s --cflags" % XML2_CONFIG)
> +                     self.cflags.append(xmlconf)
> +                     self.cflags.append("-DUWSGI_XML -DUWSGI_XML_LIBXML2")
> +                     self.gcc_list.append('core/xmlconf')
> +@@ -1262,13 +1270,13 @@ class uConf(object):
> +                     self.gcc_list.append('core/xmlconf')
> +                     report['xml'] = 'expat'
> +             elif self.get('xml') == 'libxml2':
> +-                xmlconf = spcall('xml2-config --libs')
> ++                xmlconf = spcall('%s --libs' % XML2_CONFIG)
> +                 if xmlconf is None:
> +                     print("*** libxml2 headers unavailable. uWSGI build is interrupted. You have to install libxml2 development package or use libexpat or disable XML")
> +                     sys.exit(1)
> +                 else:
> +                     self.libs.append(xmlconf)
> +-                    xmlconf = spcall("xml2-config --cflags")
> ++                    xmlconf = spcall("%s --cflags" % XML2_CONFIG)
> +                     if xmlconf is None:
> +                         print("*** libxml2 headers unavailable. uWSGI build is interrupted. You have to install libxml2 development package or use libexpat or disable XML")
> +                         sys.exit(1)
> diff --git a/package/uwsgi/Config.in b/package/uwsgi/Config.in
> new file mode 100644
> index 0000000..6537d1a
> --- /dev/null
> +++ b/package/uwsgi/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_UWSGI
> +	bool "uwsgi"
> +    select BR2_PACKAGE_LIBXML2
> +	help
> +        The uWSGI project aims at developing a full stack for building hosting services.
> +        https://uwsgi-docs.readthedocs.org/en/latest/
> \ No newline at end of file
> diff --git a/package/uwsgi/uwsgi.mk b/package/uwsgi/uwsgi.mk
> new file mode 100644
> index 0000000..2d1f11a
> --- /dev/null
> +++ b/package/uwsgi/uwsgi.mk
> @@ -0,0 +1,36 @@
> +################################################################################
> +#
> +# uwsgi
> +#
> +################################################################################
> +
> +UWSGI_VERSION = 2.0.12
> +UWSGI_SOURCE = uwsgi-$(UWSGI_VERSION).tar.gz
> +UWSGI_SITE = https://pypi.python.org/packages/source/u/uWSGI
> +UWSGI_LICENSE = GPLv2
> +UWSGI_LICENSE_FILES = LICENSE
> +
> +UWSGI_DEPENDENCIES = libxml2 host-python
> +
> +UWSGI_ENV = \
> +	PATH=$(BR_PATH) \
> +	CC="$(TARGET_CC)" \
> +	CFLAGS="$(TARGET_CFLAGS)" \
> +	LDFLAGS="$(TARGET_LDFLAGS)" \
> +	LDSHARED="$(TARGET_CROSS)gcc -shared" \
> +	PYTHONPATH="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_PATH),$(PYTHON_PATH))" \
> +	_python_sysroot=$(STAGING_DIR) \
> +	_python_prefix=/usr \
> +	_python_exec_prefix=/usr \
> +	PCRE_CONFIG="$(STAGING_DIR)/usr/bin/pcre-config" \
> +	XML2_CONFIG="$(STAGING_DIR)/usr/bin/xml2-config"
> +
> +define UWSGI_BUILD_CMDS
> +	$(MAKE) $(UWSGI_ENV) -C $(@D)
> +endef
> +
> +define UWSGI_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 755 $(@D)/uwsgi  $(TARGET_DIR)/usr/bin/uwsgi
> +endef
> +
> +$(eval $(generic-package))
> -- 
> 1.7.9.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160225/8bd677ee/attachment-0001.html>
