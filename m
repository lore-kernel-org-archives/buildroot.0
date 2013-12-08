From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  8 Dec 2013 23:14:29 +0100
Subject: [Buildroot] [PATCH 00/38] Python infrastructure and package
	conversion
Message-ID: <1386540907-7242-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This set of patches add a new infrastructure for Python packages,
which support both distutils and setuptools based packages. It also
converts all the current Python packages to this infrastructure, and
adds a bunch of new Python packages that have been sitting in
patchwork for a while.

Thanks to this infrastructure, the vast majority of Python packages no
longer need to write any <something>_CMDS. All they need to do is to
explicitly say, through the <pkg>_SETUP_TYPE variable, whether the
setup.py of the package is distutils-based or setuptools-based.

When it's setuptools-based, then the infrastructure will automatically
build host-setuptools an host-distutilscross.

A short overview of the patches:

 * Patches 1 and 2 make relatively unrelated fixes to the dialog
   package, which were found while doing the Python conversion of
   python-dialog.

 * Patch 3 adds the Python infrastructure itself.

 * Patches 4 to 25 convert all the existing Python packages to use the
   new infrastructure.

 * Patches 26 to 38 add new Python packages that have been sitting on
   patchwork for some time, including some contributed by Ryan
   Barnett, who did rebase them on the Python infrastructure.

This complete set of patches is available on a Git branch at:

  http://git.free-electrons.com/users/thomas-petazzoni/buildroot/log/?h=python-pkg

I have already started working on making the infrastructure work with
Python 3 as well, and I have a bunch of patches that do this. However,
they are not completely ready yet, and since Python modules anyway
can't be used today with Python 3, merging this Python 2 only package
infrastructure is not a regression.

Of course, testing is more than welcome.

Thanks a lot!

Thomas

Ludovic Desroches (4):
  python-versiontools: new package
  python-keyring: new package
  python-simplejson: new package
  python-json-schema-validator: new package

Ryan Barnett (6):
  python-tornado: new package
  python-pyasn: new package
  python-pycrypto: new package
  python-pysnmp: new package
  python-pysnmp-apps: new package
  python-pysnmp-mibs: new package

Thomas Petazzoni (25):
  dialog: add missing comment when thread support is missing
  dialog: remove useless POST_CLEAN command
  package: introduce Python package infrastructure
  python-bottle: convert to the Python package infrastructure
  python-crc16: convert to the Python package infrastructure
  python-dpkt: convert to the Python package infrastructure
  python-id3: convert to the Python package infrastructure
  python-ipy: convert to the Python package infrastructure
  python-m2crypto: convert to the Python package infrastructure
  python-mad: convert to the Python package infrastructure
  python-meld3: convert to the Python package infrastructure
  python-nfc: convert to the Python package infrastructure
  python-protobuf: convert to the Python package infrastructure
  python-pygame: convert to the Python package infrastructure
  python-pyparsing: convert to the Python package infrastructure
  python-pyro: convert to the Python package infrastructure
  python-pyzmq: convert to the Python package infrastructure
  python-serial: convert to the Python package infrastructure
  python-setuptools: convert to the Python package infrastructure
  scons: convert to the Python package infrastructure
  python-netifaces: convert to the Python package infrastructure
  supervisor: convert to the Python package infrastructure
  python-distutilscross: convert to the Python package infrastructure
  python-thrift: convert to the Python package infrastructure
  python-dialog: convert to the Python package infrastructure

Wojciech M. Zabolotny (2):
  python-pyusb: new package
  python-msgpack: new package

Zoltan Gyarmati (1):
  python-configobj: new package

 docs/manual/adding-packages-python.txt             | 136 +++++++++++++
 docs/manual/adding-packages.txt                    |   2 +
 package/Config.in                                  |  13 ++
 package/Makefile.in                                |   1 +
 package/dialog/Config.in                           |   4 +
 package/dialog/dialog.mk                           |   5 -
 package/pkg-python.mk                              | 219 +++++++++++++++++++++
 package/python-bottle/python-bottle.mk             |  12 +-
 package/python-configobj/Config.in                 |  10 +
 package/python-configobj/python-configobj.mk       |  14 ++
 package/python-crc16/python-crc16.mk               |  25 +--
 package/python-dialog/python-dialog.mk             |  14 +-
 .../python-distutilscross/python-distutilscross.mk |  13 +-
 package/python-dpkt/python-dpkt.mk                 |  13 +-
 package/python-id3/python-id3.mk                   |  13 +-
 package/python-ipy/python-ipy.mk                   |  17 +-
 package/python-json-schema-validator/Config.in     |   8 +
 .../python-json-schema-validator.mk                |  15 ++
 package/python-keyring/Config.in                   |   8 +
 package/python-keyring/python-keyring.mk           |  19 ++
 package/python-m2crypto/python-m2crypto.mk         |  20 +-
 package/python-mad/python-mad.mk                   |  20 +-
 package/python-meld3/python-meld3.mk               |  12 +-
 package/python-msgpack/Config.in                   |  16 ++
 package/python-msgpack/python-msgpack.mk           |  15 ++
 package/python-netifaces/Config.in                 |   1 -
 package/python-netifaces/python-netifaces.mk       |  19 +-
 package/python-nfc/python-nfc.mk                   |  13 +-
 package/python-protobuf/python-protobuf.mk         |  20 +-
 package/python-pyasn/Config.in                     |  13 ++
 package/python-pyasn/python-pyasn.mk               |  19 ++
 package/python-pycrypto/Config.in                  |   9 +
 package/python-pycrypto/python-pycrypto.mk         |  35 ++++
 package/python-pygame/python-pygame.mk             |  25 +--
 package/python-pyparsing/python-pyparsing.mk       |  28 +--
 package/python-pyro/python-pyro.mk                 |   8 +-
 package/python-pysnmp-apps/Config.in               |  13 ++
 package/python-pysnmp-apps/python-pysnmp-apps.mk   |  16 ++
 package/python-pysnmp-mibs/Config.in               |  13 ++
 package/python-pysnmp-mibs/python-pysnmp-mibs.mk   |  16 ++
 package/python-pysnmp/Config.in                    |  14 ++
 package/python-pysnmp/python-pysnmp.mk             |  17 ++
 package/python-pyusb/Config.in                     |  14 ++
 package/python-pyusb/python-pyusb.mk               |  14 ++
 package/python-pyzmq/python-pyzmq.mk               |  26 +--
 package/python-serial/python-serial.mk             |  13 +-
 package/python-setuptools/python-setuptools.mk     |  28 +--
 package/python-simplejson/Config.in                |   7 +
 package/python-simplejson/python-simplejson.mk     |  14 ++
 package/python-thrift/python-thrift.mk             |  26 +--
 package/python-tornado/Config.in                   |   8 +
 package/python-tornado/python-tornado.mk           |  13 ++
 package/python-versiontools/Config.in              |   7 +
 package/python-versiontools/python-versiontools.mk |  13 ++
 package/scons/scons.mk                             |  13 +-
 package/supervisor/Config.in                       |   1 -
 package/supervisor/supervisor.mk                   |  22 +--
 57 files changed, 810 insertions(+), 332 deletions(-)
 create mode 100644 docs/manual/adding-packages-python.txt
 create mode 100644 package/pkg-python.mk
 create mode 100644 package/python-configobj/Config.in
 create mode 100644 package/python-configobj/python-configobj.mk
 create mode 100644 package/python-json-schema-validator/Config.in
 create mode 100644 package/python-json-schema-validator/python-json-schema-validator.mk
 create mode 100644 package/python-keyring/Config.in
 create mode 100644 package/python-keyring/python-keyring.mk
 create mode 100644 package/python-msgpack/Config.in
 create mode 100644 package/python-msgpack/python-msgpack.mk
 create mode 100644 package/python-pyasn/Config.in
 create mode 100644 package/python-pyasn/python-pyasn.mk
 create mode 100644 package/python-pycrypto/Config.in
 create mode 100644 package/python-pycrypto/python-pycrypto.mk
 create mode 100644 package/python-pysnmp-apps/Config.in
 create mode 100644 package/python-pysnmp-apps/python-pysnmp-apps.mk
 create mode 100644 package/python-pysnmp-mibs/Config.in
 create mode 100644 package/python-pysnmp-mibs/python-pysnmp-mibs.mk
 create mode 100644 package/python-pysnmp/Config.in
 create mode 100644 package/python-pysnmp/python-pysnmp.mk
 create mode 100644 package/python-pyusb/Config.in
 create mode 100644 package/python-pyusb/python-pyusb.mk
 create mode 100644 package/python-simplejson/Config.in
 create mode 100644 package/python-simplejson/python-simplejson.mk
 create mode 100644 package/python-tornado/Config.in
 create mode 100644 package/python-tornado/python-tornado.mk
 create mode 100644 package/python-versiontools/Config.in
 create mode 100644 package/python-versiontools/python-versiontools.mk

-- 
1.8.1.2
