From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Wed, 14 Dec 2011 11:39:05 +0100
Subject: [Buildroot] [PATCH] New package: python-dpkt
In-Reply-To: <1323858932-10219-1-git-send-email-yegorslists@googlemail.com>
References: <1323858932-10219-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <4EE87CC9.1040809@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> +PYTHON_DPKT_VERSION = 1.7
> +PYTHON_DPKT_SOURCE  = dpkt-$(PYTHON_DPKT_VERSION).tar.gz
> +PYTHON_DPKT_SITE    = http://dpkt.googlecode.com/files
> +
> +PYTHON_DPKT_DEPENDENCIES = python
> +
> +define PYTHON_DPKT_BUILD_CMDS
> +	(cd $(@D); \
> +		CC="$(TARGET_CC)"		\
> +		CFLAGS="$(TARGET_CFLAGS)" 	\
> +		LDSHARED="$(TARGET_CC) -shared" \
> +		LDFLAGS="$(TARGET_LDFLAGS)" 	\
> +	$(HOST_DIR)/usr/bin/python setup.py build_ext \
> +	--include-dirs=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR))
> +	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
> +endef
> +
> +define PYTHON_DPKT_INSTALL_TARGET_CMDS
> +	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
> +endef
> +
> +$(eval $(call GENTARGETS))
> +

I have following problem building this package:

Traceback (most recent call last):
  File "setup.py", line 4, in <module>
    import dpkt
  File "/home/YegorYefremov/projects/versioned/tests/br-queue-python/output/build/python-dpkt-1.7/dpkt/__init__.py", line 26, in <module>
    import gzip
  File "/home/YegorYefremov/projects/versioned/tests/br-queue-python/output/build/python-dpkt-1.7/dpkt/gzip.py", line 5, in <module>
    import struct, zlib
ImportError: No module named zlib

zlib is selected as core python component. Nevertheless it cannot be found. At first I tried to mimic python-serial build script, than python-mad, but they both don't require zlib.

Any idea?

Yegor
