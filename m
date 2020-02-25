From: Vadim Kochan <vadim4j@gmail.com>
Date: Tue, 25 Feb 2020 17:53:20 +0200
Subject: [Buildroot] [PATCH v3 0/2] add frr package
Message-ID: <20200225155322.8440-1-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

FRR is free software that implements and manages various IPv4 and IPv6
routing protocols. It runs on nearly all distributions of Linux and BSD
as well as Solaris and supports all modern CPU architectures.

FRR currently supports the following protocols:

    BGP
    OSPFv2
    OSPFv3
    RIPv1
    RIPv2
    RIPng
    IS-IS
    PIM-SM/MSDP
    LDP
    BFD
    Babel
    PBR
    OpenFabric
    VRRP
    EIGRP (alpha)
    NHRP (alpha)

FRR package requires LYD_PRIV option to be enabled in
libyang package, so enabled it in separate patch if
frr is selected.

Disabled some options for frr package like:

    - POSIX capabilities
    - RPKi

v3:
    1) Remove hook with bootsrap running, autoreconf handles everything

    2) Remove _SOURCE var, it is auto-generated

    3) Remove --disable-exampledir which causes install config samples
       into "$(TARGET_DIR)no" folder, but remove them from $(TARGET_DIR)/etc/frr
       in POST_INSTALL hook.

    4) Enable LYD_PRIV option for libyang by default because there is no
       size difference with or without this option.

v2:
    1) fixed TAB indent on multiline var assignment

    2) fixed ABC ordering

    3) add missing 'depends on' from selected libs by frr

    4) directly call /usr/sbin/frrinit.sh S50frr init script
       w/o start-stop-daemon tool, frr cares of daemons stopping/
       running.

    5) Removed not-needed empty daemons *.conf files installation,
       it was taken from building instructions in frr docs, but
       really it is not required.

    6) Use 0644 mask for conf files.

    7) Enable LYD_PRIV option for libyang only if frr selected.

    8) Drop patch with rtrlib package which is needed only for
       RPKi support which is disabled by default.

    9) Add AUTORECONF for bootstrap invocation.

    10) Get rid of manual binaries target invocation. After frr.mk
        cleanup it starts to work.

    11) Install var/log/frr and /var/run/frr at runtime from init.

Vadim Kochan (2):
  package/libyang: enable LYD_PRIV option for frr package
  package/frr: new package

 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/frr/Config.in      | 25 ++++++++++++++
 package/frr/S50frr         | 46 +++++++++++++++++++++++++
 package/frr/frr.hash       |  2 ++
 package/frr/frr.mk         | 69 ++++++++++++++++++++++++++++++++++++++
 package/libyang/libyang.mk |  3 +-
 7 files changed, 146 insertions(+), 1 deletion(-)
 create mode 100644 package/frr/Config.in
 create mode 100644 package/frr/S50frr
 create mode 100644 package/frr/frr.hash
 create mode 100644 package/frr/frr.mk

-- 
2.17.1
