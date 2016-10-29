From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Oct 2016 15:39:05 +0200
Subject: [Buildroot] [PATCH v2] owfs: new package
In-Reply-To: <1456182471-20883-1-git-send-email-arnout@mind.be>
References: <1456182471-20883-1-git-send-email-arnout@mind.be>
Message-ID: <20161029153905.113d3878@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Tue, 23 Feb 2016 00:07:51 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:

> +# setup.py isn't python3 compliant
> +ifeq ($(BR2_PACKAGE_PYTHON),y)
> +OWFS_CONF_OPTS += \
> +	--enable-owpython \
> +	--with-python \
> +	--with-pythonconfig=$(STAGING_DIR)/usr/bin/python-config
> +OWFS_MAKE_ENV += \
> +	CC="$(TARGET_CC)" \
> +	PYTHONPATH="$(PYTHON_PATH)" \
> +	_python_sysroot=$(STAGING_DIR) \
> +	_python_prefix=/usr \
> +	_python_exec_prefix=/usr
> +OWFS_DEPENDENCIES += python host-swig
> +else

The Python support is broken, as it installs the Python modules is the
wrong directory:

output/host/usr/arm-buildroot-linux-gnueabi/sysroot/home/thomas/
output/host/usr/arm-buildroot-linux-gnueabi/sysroot/home/thomas/projets
output/host/usr/arm-buildroot-linux-gnueabi/sysroot/home/thomas/projets/buildroot
output/host/usr/arm-buildroot-linux-gnueabi/sysroot/home/thomas/projets/buildroot/output
output/host/usr/arm-buildroot-linux-gnueabi/sysroot/home/thomas/projets/buildroot/output/host
output/host/usr/arm-buildroot-linux-gnueabi/sysroot/home/thomas/projets/buildroot/output/host/usr
output/host/usr/arm-buildroot-linux-gnueabi/sysroot/home/thomas/projets/buildroot/output/host/usr/lib
output/host/usr/arm-buildroot-linux-gnueabi/sysroot/home/thomas/projets/buildroot/output/host/usr/lib/python2.7
output/host/usr/arm-buildroot-linux-gnueabi/sysroot/home/thomas/projets/buildroot/output/host/usr/lib/python2.7/site-packages
output/host/usr/arm-buildroot-linux-gnueabi/sysroot/home/thomas/projets/buildroot/output/host/usr/lib/python2.7/site-packages/ownet-0.3-py2.7.egg-info
output/host/usr/arm-buildroot-linux-gnueabi/sysroot/home/thomas/projets/buildroot/output/host/usr/lib/python2.7/site-packages/ownet
output/host/usr/arm-buildroot-linux-gnueabi/sysroot/home/thomas/projets/buildroot/output/host/usr/lib/python2.7/site-packages/ownet/connection.pyc
output/host/usr/arm-buildroot-linux-gnueabi/sysroot/home/thomas/projets/buildroot/output/host/usr/lib/python2.7/site-packages/ownet/__init__.py
output/host/usr/arm-buildroot-linux-gnueabi/sysroot/home/thomas/projets/buildroot/output/host/usr/lib/python2.7/site-packages/ownet/connection.py
output/host/usr/arm-buildroot-linux-gnueabi/sysroot/home/thomas/projets/buildroot/output/host/usr/lib/python2.7/site-packages/ownet/__init__.pyc
output/host/usr/arm-buildroot-linux-gnueabi/sysroot/home/thomas/projets/buildroot/output/host/usr/lib/python2.7/site-packages/ow
output/host/usr/arm-buildroot-linux-gnueabi/sysroot/home/thomas/projets/buildroot/output/host/usr/lib/python2.7/site-packages/ow/_OW.so
output/host/usr/arm-buildroot-linux-gnueabi/sysroot/home/thomas/projets/buildroot/output/host/usr/lib/python2.7/site-packages/ow/__init__.py
output/host/usr/arm-buildroot-linux-gnueabi/sysroot/home/thomas/projets/buildroot/output/host/usr/lib/python2.7/site-packages/ow/__init__.pyc
output/host/usr/arm-buildroot-linux-gnueabi/sysroot/home/thomas/projets/buildroot/output/host/usr/lib/python2.7/site-packages/ow-3.1p1-py2.7.egg-info

This causes a build failure with the recent check added by Yann:

  http://autobuild.buildroot.net/results/1fd/1fd7e3ae15a039f88fe010a1298e28a2fcb6bb0e/build-end.log

This problem is due to how PYSITEDIR is calculated in
module/swig/python/python.m4:

  PYSITEDIR=`($PYTHON -c "from distutils.sysconfig import get_python_lib; print get_python_lib(plat_specific=1)") 2>/dev/null`

Unfortunately, the logic doesn't seem to allow overriding PYSITEDIR at
configure time.

Could you have a look? If you don't care about owfs Python support, I'm
fine with a patch simply disabling it.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
