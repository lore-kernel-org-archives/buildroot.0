From: James Kelly <kellyj@forsbergservices.co.uk>
Date: Mon, 24 Nov 2014 10:10:48 +0000
Subject: [Buildroot] Adding new Qmake package
Message-ID: <22B0402C888FE4478287AE5975230B07EBB1@sv-exch-01.forsberg.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've tried to add a package to Buildroot that uses Qt and Boost. The package uses qmake to generate a Makefile, this part seems to be working, however I get an error when I build saying:

Could not find qmake configuration file qws/linux-arm-g++.
Error processing project file: MsgDisplay.pro

The contents of my package is laid out like this:
DummyPgm
??? main.cpp
??? MsgDisplay.pri
??? MsgDisplay.pro
??? MsgDisplay.pro.user
??? MsgHandler.cpp
??? MsgHandler.h
??? MsgServer.cpp
??? MsgServer.h
??? Tcp
?   ??? TcpAddrPort.cpp
?   ??? TcpAddrPort.h
?   ??? TcpServer.cpp
?   ??? TcpServer.h
?   ??? TcpSocket.cpp
?   ??? TcpSocket.h
??? Tools
    ??? Banner.cpp
    ??? Banner.h
    ??? IoExt.h
    ??? SeparateArgumentList.cpp
    ??? SeparateArgumentList.h
    ??? SysTypes.h

2 directories, 20 files

I have added a package directory, dummypgm, which contains Config.in and dummypgm.mk files. The contents of the files are:

Config.in:

config BR2_PACKAGE_DUMMYPGM
        bool "dummypgm"
        help
          Foo Software.

          http://www.foo.com

dummypgm.mk:

DUMMYPGM_VERSION = 0.1.0
DUMMYPGM_SOURCE = DummyPgm-$(DUMMYPGM_VERSION).tar.gz

define DUMMYPGM_CONFIGURE_CMDS
    (cd $(@D); $(QT_QMAKE)  MsgDisplay.pro)
endef

define DUMMYPGM_BUILD_CMDS
        $(MAKE) -C $(@D)
endef


$(eval $(generic-package))

Since the package is hosted locally, I've simply put the DummyPgm-0.1.0.tar.gz in the dl directory.

I've also added the following to package/Config.in:

source "package/dummypgm/Config.in"

I'm a little lost as to why this doesn't work, if anyone could help me I would be very grateful. Also, is there any way to call $(eval $(qmake-package)) or something?

Thanks,
James Kelly
Software Engineer

Forsberg Services Ltd
Richmond House
White Cross
Lancaster LA1 4XF U.K.
Tel: 01524 383320
Fax: 01524 382939
www.forsbergservices.co.uk<http://www.forsbergservices.co.uk/>

VAT No: GB 470 8895 04
Registration No:  SC104949
Registered address:  1 East Craibstone Street, Aberdeen, AB11 6YQ

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141124/9e7566d1/attachment.html>
