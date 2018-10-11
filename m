From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 22:07:06 +0200
Subject: [Buildroot] [PATCH v3,3/8] libsemanage: bump to version 2.8
In-Reply-To: <20181011193707.20510-3-fontaine.fabrice@gmail.com>
References: <20181011193707.20510-1-fontaine.fabrice@gmail.com>
 <20181011193707.20510-3-fontaine.fabrice@gmail.com>
Message-ID: <20181011220706.01ff455d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Thu, 11 Oct 2018 21:37:02 +0200, Fabrice Fontaine wrote:

> -LIBSEMANAGE_VERSION = 2.7
> -LIBSEMANAGE_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20170804
> +LIBSEMANAGE_VERSION = 2.8
> +LIBSEMANAGE_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20180524
>  LIBSEMANAGE_LICENSE = LGPL-2.1+
>  LIBSEMANAGE_LICENSE_FILES = COPYING
>  LIBSEMANAGE_DEPENDENCIES = host-bison host-flex audit libselinux ustr bzip2
> @@ -31,6 +31,7 @@ HOST_LIBSEMANAGE_DEPENDENCIES = host-bison host-audit host-libsepol host-libseli
>  HOST_LIBSEMANAGE_MAKE_OPTS += \
>  	$(HOST_CONFIGURE_OPTS) \
>  	PREFIX=$(HOST_DIR) \
> +	SHLIBDIR=$(HOST_DIR)/lib \

So, I was surprised you had to do this for the host variant... but not
for the target variant. So I checked, and SHLIBDIR is not used at all
by libsemanage, so this change is totally unneeded.

Also, when building host-libsemanage, I got the following build failure:

test -d -L/home/thomas/projets/buildroot/output/host/lib/python2.7/ || install -m 755 -d -L/home/thomas/projets/buildroot/output/host/lib/python2.7/
install: invalid option -- 'L'

This was due to us passing:

  PYTHONLIBDIR="-L/home/thomas/projets/buildroot/output/host/lib/python2.7/"

It turns out that libsemanage 2.7 was totally ignoring PYTHONLIBDIR,
I'm not even sure why we were passing it. However, libsemanage 2.8 now
uses it (since commit
https://github.com/SELinuxProject/selinux/commit/07629c0a9f26e6e9ebb0b2847e09a461512990c9#diff-5680af432ff62be3f5227c99d8d9b7e7),
and needs it to be a path, not a linker flag.

So I've dropped the -L to make it work.

Applied after fixing those two issues.

We *really* need one (or several?) test cases in support/testing/ to
test at least the build of the SELinux stack. Perhaps one with Python
2, one with Python 3, one minimal SELinux (just what is needed on the
target) and one full (with all the host tools).

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
