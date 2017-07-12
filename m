From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Jul 2017 18:27:53 +0200
Subject: [Buildroot] [PATCH 0/8] Fix the python cffi issue
Message-ID: <20170712162801.31131-1-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This patch series fixes the long-standing build errors reported by the
autobuilders on the following packages:

 - python-cryptography
 - python-pynacl
 - python-smbus-cffi

Those errors were caused by the host Python interpreter picking up a
target library because
$(TARGET_DIR)/usr/lib/python<version>/site-packages/ is part of the
PYTHON_PATH when the host Python interpreter is used to build/install
Python modules for the target. This is bogus, because it lets the host
Python interpreter import target libraries, which obviously is
incorrect.

Therefore, to solve this issue, PATCH 8/8 removes
$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/
from PYTHONPATH.

However, doing this uncovered issues in other Python packages:

 - A few Python packages (python-pyasn, python-pyro and
   python-u-msgpack) started to fail building. Switching them from
   distutils to setuptools fixed the issue, and since setuptools is
   preferred to setuptools, it's anyway a good change. Patches 1/8,
   2/8 and 3/8 are fixing this.

 - A few Python packages had missing dependencies on host Python
   modules, because the corresponding target Python module was
   installed, and picked up by the host Python interpreter due to our
   bogus PYTHONPATH value. Patches 4/8, 5/8, 6/8 and 7/8 are fixing
   this.

Note that we are not doing the change for Python 3 as part of this
series because:

 - The python-cffi issue does not occur with Python 3.x.

 - python3.mk defines PYTHON3_PATH as
   $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/:$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/. Both
   directories are not good to pass in PYTHONPATH, but at least the
   first one is needed to allow the host Python interpreter to find
   the sysconfigdata module, that is needed to cross-compile native
   Python modules. So the same solution as python.mk cannot be
   applied.

This patch series has been tested with a defconfig that has a large
number of Python packages enabled:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2017.05-834-gb595627.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_PYTHON=y
BR2_PACKAGE_PYTHON_ALSAAUDIO=y
BR2_PACKAGE_PYTHON_ARROW=y
BR2_PACKAGE_PYTHON_ATTRS=y
BR2_PACKAGE_PYTHON_AUTOBAHN=y
BR2_PACKAGE_PYTHON_BITSTRING=y
BR2_PACKAGE_PYTHON_BOTTLE=y
BR2_PACKAGE_PYTHON_CAN=y
BR2_PACKAGE_PYTHON_CBOR=y
BR2_PACKAGE_PYTHON_CHARDET=y
BR2_PACKAGE_PYTHON_CHEETAH=y
BR2_PACKAGE_PYTHON_CHERRYPY=y
BR2_PACKAGE_PYTHON_CONFIGOBJ=y
BR2_PACKAGE_PYTHON_CONFIGSHELL_FB=y
BR2_PACKAGE_PYTHON_CRC16=y
BR2_PACKAGE_PYTHON_CRCMOD=y
BR2_PACKAGE_PYTHON_CSSSELECT=y
BR2_PACKAGE_PYTHON_CSSUTILS=y
BR2_PACKAGE_PYTHON_DAEMON=y
BR2_PACKAGE_PYTHON_DIALOG=y
BR2_PACKAGE_PYTHON_DICTTOXML=y
BR2_PACKAGE_PYTHON_DJANGO=y
BR2_PACKAGE_PYTHON_DOCOPT=y
BR2_PACKAGE_PYTHON_DPKT=y
BR2_PACKAGE_PYTHON_ECDSA=y
BR2_PACKAGE_PYTHON_ENUM=y
BR2_PACKAGE_PYTHON_FLASK_BABEL=y
BR2_PACKAGE_PYTHON_FLASK_JSONRPC=y
BR2_PACKAGE_PYTHON_FLASK_LOGIN=y
BR2_PACKAGE_PYTHON_FLUP=y
BR2_PACKAGE_PYTHON_GOBJECT=y
BR2_PACKAGE_PYTHON_GUNICORN=y
BR2_PACKAGE_PYTHON_HTML5LIB=y
BR2_PACKAGE_PYTHON_HTTPLIB2=y
BR2_PACKAGE_PYTHON_HUMANIZE=y
BR2_PACKAGE_PYTHON_ID3=y
BR2_PACKAGE_PYTHON_INIPARSE=y
BR2_PACKAGE_PYTHON_IOWAIT=y
BR2_PACKAGE_PYTHON_IPADDR=y
BR2_PACKAGE_PYTHON_IPY=y
BR2_PACKAGE_PYTHON_IPYTHON=y
BR2_PACKAGE_PYTHON_JSON_SCHEMA_VALIDATOR=y
BR2_PACKAGE_PYTHON_KEYRING=y
BR2_PACKAGE_PYTHON_LIBCONFIG=y
BR2_PACKAGE_PYTHON_LMDB=y
BR2_PACKAGE_PYTHON_LXML=y
BR2_PACKAGE_PYTHON_MAD=y
BR2_PACKAGE_PYTHON_MARKDOWN=y
BR2_PACKAGE_PYTHON_MELD3=y
BR2_PACKAGE_PYTHON_MISTUNE=y
BR2_PACKAGE_PYTHON_MSGPACK=y
BR2_PACKAGE_PYTHON_MUTAGEN=y
BR2_PACKAGE_PYTHON_MWSCRAPE=y
BR2_PACKAGE_PYTHON_NETADDR=y
BR2_PACKAGE_PYTHON_NETIFACES=y
BR2_PACKAGE_PYTHON_NFC=y
BR2_PACKAGE_PYTHON_NUMPY=y
BR2_PACKAGE_PYTHON_PAHO_MQTT=y
BR2_PACKAGE_PYTHON_PAM=y
BR2_PACKAGE_PYTHON_PARAMIKO=y
BR2_PACKAGE_PYTHON_PILLOW=y
BR2_PACKAGE_PYTHON_POSIX_IPC=y
BR2_PACKAGE_PYTHON_PSUTIL=y
BR2_PACKAGE_PYTHON_PUDB=y
BR2_PACKAGE_PYTHON_PYCLI=y
BR2_PACKAGE_PYTHON_PYCPARSER=y
BR2_PACKAGE_PYTHON_PYELFTOOLS=y
BR2_PACKAGE_PYTHON_PYFTPDLIB=y
BR2_PACKAGE_PYTHON_PYGAME=y
BR2_PACKAGE_PYTHON_PYGAME_IMAGE=y
BR2_PACKAGE_PYTHON_PYGAME_EXAMPLES=y
BR2_PACKAGE_PYTHON_PYGAME_FONT=y
BR2_PACKAGE_PYTHON_PYGAME_MIXER=y
BR2_PACKAGE_PYTHON_PYINOTIFY=y
BR2_PACKAGE_PYTHON_PYLIBFTDI=y
BR2_PACKAGE_PYTHON_PYMYSQL=y
BR2_PACKAGE_PYTHON_PYPARTED=y
BR2_PACKAGE_PYTHON_PYPCAP=y
BR2_PACKAGE_PYTHON_PYQRCODE=y
BR2_PACKAGE_PYTHON_PYRATEMP=y
BR2_PACKAGE_PYTHON_PYRO=y
BR2_PACKAGE_PYTHON_PYROUTE2=y
BR2_PACKAGE_PYTHON_PYSENDFILE=y
BR2_PACKAGE_PYTHON_PYSMB=y
BR2_PACKAGE_PYTHON_PYSNMP_APPS=y
BR2_PACKAGE_PYTHON_PYSNMP_MIBS=y
BR2_PACKAGE_PYTHON_PYSOCKS=y
BR2_PACKAGE_PYTHON_PYTABLEWRITER=y
BR2_PACKAGE_PYTHON_PYTRIE=y
BR2_PACKAGE_PYTHON_PYUSB=y
BR2_PACKAGE_PYTHON_PYXB=y
BR2_PACKAGE_PYTHON_PYZMQ=y
BR2_PACKAGE_PYTHON_REQUESTS_TOOLBELT=y
BR2_PACKAGE_PYTHON_RPI_GPIO=y
BR2_PACKAGE_PYTHON_RTSLIB_FB=y
BR2_PACKAGE_PYTHON_SDNOTIFY=y
BR2_PACKAGE_PYTHON_SERIAL=y
BR2_PACKAGE_PYTHON_SETPROCTITLE=y
BR2_PACKAGE_PYTHON_SH=y
BR2_PACKAGE_PYTHON_SHUTILWHICH=y
BR2_PACKAGE_PYTHON_SIMPLEJSON=y
BR2_PACKAGE_PYTHON_SMBUS_CFFI=y
BR2_PACKAGE_PYTHON_SOCKETIO=y
BR2_PACKAGE_PYTHON_SORTEDCONTAINERS=y
BR2_PACKAGE_PYTHON_SPIDEV=y
BR2_PACKAGE_PYTHON_THRIFT=y
BR2_PACKAGE_PYTHON_TOMAKO=y
BR2_PACKAGE_PYTHON_TREQ=y
BR2_PACKAGE_PYTHON_U_MSGPACK=y
BR2_PACKAGE_PYTHON_UBJSON=y
BR2_PACKAGE_PYTHON_UJSON=y
BR2_PACKAGE_PYTHON_URLLIB3=y
BR2_PACKAGE_PYTHON_VERSIONTOOLS=y
BR2_PACKAGE_PYTHON_WATCHDOG=y
BR2_PACKAGE_PYTHON_WEB2PY=y
BR2_PACKAGE_PYTHON_WEBPY=y
BR2_PACKAGE_PYTHON_WHOOSH=y
BR2_PACKAGE_PYTHON_WS4PY=y
BR2_PACKAGE_PYTHON_WSACCEL=y
BR2_PACKAGE_PYTHON_XLUTILS=y
# BR2_TARGET_ROOTFS_TAR is not set

Best regards,

Thomas

Thomas Petazzoni (8):
  python-pyasn: switch to setuptools instead of distutils
  python-pyro: switch to setuptools instead of distutils
  python-u-msgpack: switch to setuptools instead of distutils
  python-versiontools: add host variant
  python-json-schema-validator: needs versiontools on the host
  python-incremental: add host variant
  python-treq: needs host-python-incremental
  python: remove target Python packages from PYTHONPATH

 package/python-incremental/python-incremental.mk                     | 1 +
 package/python-json-schema-validator/Config.in                       | 1 -
 package/python-json-schema-validator/python-json-schema-validator.mk | 2 +-
 package/python-pyasn/python-pyasn.mk                                 | 2 +-
 package/python-pyro/python-pyro.mk                                   | 2 +-
 package/python-treq/python-treq.mk                                   | 1 +
 package/python-u-msgpack/python-u-msgpack.mk                         | 2 +-
 package/python-versiontools/python-versiontools.mk                   | 1 +
 package/python/python.mk                                             | 2 +-
 9 files changed, 8 insertions(+), 6 deletions(-)

-- 
2.9.4
