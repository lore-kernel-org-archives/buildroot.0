From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Thu, 4 Aug 2016 19:46:02 +0530
Subject: [Buildroot] [RFC 0/2] script to find package licenses
Message-ID: <1470320164-8241-1-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Legal information is a kind of thing that we can't automate completely.
But we want it to be correct when new package is added or version bumps.

This patch set attempts to add a script to find license information from
package source files to verify or correct legal info for buildroot packages.

Legal information may get outdated with version bumps or even may not get
correct in first place if source package does not provide any license files.
In such cases, we need to look into file header to get that information.
But it could be very difficult if there are number of source files.

find-licenses script scans package source files for known licenses to
find under which license package is released. It aggregates license
information for all source files found in a package.

For finding license, we rely on file's license header. Generally
most of packages use standard license headers which helps us to detect
license of packages.

Currently it supports notable licenses. But we can later add other
licenses based on regx.

Script outputs licenses found on standard output file-wise, directory-
wise and final aggregation of all licenses found. It also lists files
which don't have license header. Directory-wise license listing will be
useful when different components are licensed under different license.

Since final license list is just aggregation of licenses found for all
source files, we can not surely say if package is dual or
multi-licensed or different components are licensed under different
license. That's why we can't use final license list directly in our
package .mk file, but it at least helps us to find or verify license
information quickly.

e.g.

$ make ubus-find-licenses
/home/rahul.bedarkar/buildroot/support/scripts/find-licenses ubus /home/rahul.bedarkar/buildroot/output/build/ubus-259450f414d8c9ee41896e8e6d6bc57ec00e2b63/
ubus: Licenses file-wise:
output/build/ubus-259450f414d8c9ee41896e8e6d6bc57ec00e2b63/CMakeFiles/3.5.2/CompilerIdC/CMakeCCompilerId.c: []
output/build/ubus-259450f414d8c9ee41896e8e6d6bc57ec00e2b63/CMakeFiles/feature_tests.c: []
output/build/ubus-259450f414d8c9ee41896e8e6d6bc57ec00e2b63/examples/client.c: ['LGPLv2.1']
output/build/ubus-259450f414d8c9ee41896e8e6d6bc57ec00e2b63/examples/count.h: ['LGPLv2.1']
output/build/ubus-259450f414d8c9ee41896e8e6d6bc57ec00e2b63/examples/server.c: ['LGPLv2.1']
output/build/ubus-259450f414d8c9ee41896e8e6d6bc57ec00e2b63/examples/count.c: ['LGPLv2.1']
output/build/ubus-259450f414d8c9ee41896e8e6d6bc57ec00e2b63/ubus_common.h: ['LGPLv2.1']
output/build/ubus-259450f414d8c9ee41896e8e6d6bc57ec00e2b63/libubus.c: ['LGPLv2.1']
output/build/ubus-259450f414d8c9ee41896e8e6d6bc57ec00e2b63/ubusd_proto.c: ['LGPLv2.1']
output/build/ubus-259450f414d8c9ee41896e8e6d6bc57ec00e2b63/libubus.h: ['LGPLv2.1']
output/build/ubus-259450f414d8c9ee41896e8e6d6bc57ec00e2b63/libubus-io.c: ['LGPLv2.1']
output/build/ubus-259450f414d8c9ee41896e8e6d6bc57ec00e2b63/libubus-req.c: ['LGPLv2.1']
output/build/ubus-259450f414d8c9ee41896e8e6d6bc57ec00e2b63/libubus-internal.h: ['LGPLv2.1']
output/build/ubus-259450f414d8c9ee41896e8e6d6bc57ec00e2b63/ubusd_id.c: ['LGPLv2.1']
output/build/ubus-259450f414d8c9ee41896e8e6d6bc57ec00e2b63/ubusd.h: ['LGPLv2.1']
output/build/ubus-259450f414d8c9ee41896e8e6d6bc57ec00e2b63/ubusd_acl.h: ['LGPLv2.1']
output/build/ubus-259450f414d8c9ee41896e8e6d6bc57ec00e2b63/ubusd_acl.c: ['LGPLv2.1']
output/build/ubus-259450f414d8c9ee41896e8e6d6bc57ec00e2b63/ubusd.c: ['LGPLv2.1']
output/build/ubus-259450f414d8c9ee41896e8e6d6bc57ec00e2b63/ubusmsg.h: ['LGPLv2.1']
output/build/ubus-259450f414d8c9ee41896e8e6d6bc57ec00e2b63/libubus-obj.c: ['LGPLv2.1']
output/build/ubus-259450f414d8c9ee41896e8e6d6bc57ec00e2b63/ubusd_event.c: ['LGPLv2.1']
output/build/ubus-259450f414d8c9ee41896e8e6d6bc57ec00e2b63/libubus-acl.c: ['LGPLv2.1']
output/build/ubus-259450f414d8c9ee41896e8e6d6bc57ec00e2b63/ubusd_monitor.c: ['LGPLv2.1']
output/build/ubus-259450f414d8c9ee41896e8e6d6bc57ec00e2b63/libubus-sub.c: ['LGPLv2.1']
output/build/ubus-259450f414d8c9ee41896e8e6d6bc57ec00e2b63/cli.c: ['LGPLv2.1']
output/build/ubus-259450f414d8c9ee41896e8e6d6bc57ec00e2b63/ubusd_obj.c: ['LGPLv2.1']
output/build/ubus-259450f414d8c9ee41896e8e6d6bc57ec00e2b63/ubusd_obj.h: ['LGPLv2.1']
output/build/ubus-259450f414d8c9ee41896e8e6d6bc57ec00e2b63/ubusd_id.h: ['LGPLv2.1']
output/build/ubus-259450f414d8c9ee41896e8e6d6bc57ec00e2b63/lua/test.lua: []
output/build/ubus-259450f414d8c9ee41896e8e6d6bc57ec00e2b63/lua/test_client.lua: []
output/build/ubus-259450f414d8c9ee41896e8e6d6bc57ec00e2b63/lua/ubus.c: ['LGPLv2.1']
ubus: Licenses directory-wise:
output/build/ubus-259450f414d8c9ee41896e8e6d6bc57ec00e2b63/CMakeFiles/3.5.2/CompilerIdC: []
output/build/ubus-259450f414d8c9ee41896e8e6d6bc57ec00e2b63/CMakeFiles: []
output/build/ubus-259450f414d8c9ee41896e8e6d6bc57ec00e2b63/examples: ['LGPLv2.1']
output/build/ubus-259450f414d8c9ee41896e8e6d6bc57ec00e2b63: ['LGPLv2.1']
output/build/ubus-259450f414d8c9ee41896e8e6d6bc57ec00e2b63/lua: ['LGPLv2.1']
ubus: Can not find license header in following files: 4
output/build/ubus-259450f414d8c9ee41896e8e6d6bc57ec00e2b63/CMakeFiles/3.5.2/CompilerIdC/CMakeCCompilerId.c
output/build/ubus-259450f414d8c9ee41896e8e6d6bc57ec00e2b63/CMakeFiles/feature_tests.c
output/build/ubus-259450f414d8c9ee41896e8e6d6bc57ec00e2b63/lua/test.lua
output/build/ubus-259450f414d8c9ee41896e8e6d6bc57ec00e2b63/lua/test_client.lua
ubus: Surety of licenses: False
ubus: Final licenses: 1
['LGPLv2.1']



Rahul Bedarkar (2):
  scripts: add a script to find licenses of package
  new make target <PKG>-find-licenses

 Makefile                      |   1 +
 package/pkg-generic.mk        |   4 +
 support/scripts/find-licenses | 249 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 254 insertions(+)
 create mode 100755 support/scripts/find-licenses

-- 
2.6.2
