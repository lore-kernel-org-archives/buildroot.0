From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu, 3 Oct 2013 20:12:04 -0500
Subject: [Buildroot] [PATCH 0/5] Introduce New Package PySnmp
Message-ID: <1380849129-18517-1-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I apologies for the first patch set, I thought I tested it more
throughly than I actually did. I guess that is what I get for multi-
tasking...

The first version of this patch set has problem with cross-compiling
PyCrypto which it really didn't do. This second version fixes those
problems but because I wasn't compiling PyCrypto correctly, it lead
to more changes than I anticipated.

This updated patchset has added host compiling support for PyASN,
PySNMP, and PyCrypto because there are issues with the installing
PySNMP-Apps to target and not being able to find installed versions
of PyASN/PySNMP and PyCrypto since it uses setuptools and doesn't
search in the correct location (TARGET_DIR). The workaround for the
problem is to compile PyASN, PyCrypto and PySNMP for the target to
fake-out setuptools into thinking that packages are installed.

Note: PySNMP-Apps will install in the correct location just doesn't
search for the dependancies in the correct location.

========================================

This patchset adds support for building PySnmp. One thing that I'm not
sure on and am open to debate is the naming of the packages under
Target Packages > Interpreter languages and scripting > external python
modules in the menuconfig since the majority of the packages are named
python-<pkg_name> but pygame and pyparsing don't fall under this
category.

Menuconfig
 -> python-nfc
 -> python-protobuf
 -> pygame
 -> pyparsing
 -> python-pyro
 -> python-pyzmq

The make rules for the pygame and pyparsing packages are python-pygame
python-pyparsing.

Location of the packages in buildroot is package/python-pygame and
package/python-pyparsing.

Question I have for the packages I added is the following:

Should I follow what is currently done for pygame and pyparsing
or should I keep them how I have things done and change the name of
pygame and pyparsing in seperate patches? Whatever is chosen, I would
just like to have consistency with naming.

My vote is to change pygame and pyparsing names. But my mind can
easily be changed.

Ryan Barnett (5):
  python-pyasn: new package
  python-pycrypto: new package
  python-pysnmp: new package
  python-pysnmp-apps: new package
  python-pysnmp-mibs: new package

 package/Config.in                                |    7 ++++
 package/python-pyasn/Config.in                   |   13 +++++++
 package/python-pyasn/python-pyasn.mk             |   38 ++++++++++++++++++++++
 package/python-pycrypto/Config.in                |    8 ++++
 package/python-pycrypto/python-pycrypto.mk       |   25 ++++++++++++++
 package/python-pysnmp-apps/Config.in             |    7 ++++
 package/python-pysnmp-apps/python-pysnmp-apps.mk |   23 +++++++++++++
 package/python-pysnmp-mibs/Config.in             |    8 ++++
 package/python-pysnmp-mibs/python-pysnmp-mibs.mk |   23 +++++++++++++
 package/python-pysnmp/Config.in                  |   10 ++++++
 package/python-pysnmp/python-pysnmp.mk           |   23 +++++++++++++
 11 files changed, 185 insertions(+), 0 deletions(-)
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
