From: Sigalas, Antonios (Nokia - GR/Athens) <antonios.sigalas@nokia.com>
Date: Thu, 3 Aug 2017 01:08:23 +0000
Subject: [Buildroot] host cmake packages pick up wrong path for
	library/include discovery
Message-ID: <DB6PR07MB3141CF640804B6C49A5917D794B00@DB6PR07MB3141.eurprd07.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,


When a host package is configured with cmake (e.g. mariadb), the libraries and includes that are picked up by cmake are not the correct ones. The reason for this is that in the pkg-cmake.mk file the CMAKE_FIND_ROOT_PATH variables for host packages is set to HOST_DIR. While this is a reasonable choice, it happens than in buildroot the toolchain's sysroot is under the HOST_DIR path. This could cause cmake to discover the "wrong" libraries/includes during configuration time.


In order to reproduce, just run a "make libxml2 host-mariadb-configure" (so that libxml2 exists in the toolchain's sysroot when host-mariadb is configured) and look for the output concerning the discovery of the libxml2 package during host-mariadb package configuration. Although this does not cause a failure, I believe that this is an error and one that is generic to host packages that are built with cmake.


Unfortunately I have not yet been able to come up with a proposed fix as I am not aware of a cmake parameter that would cause some paths to be excluded when cmake searches for libraries/includes under the configured CMAKE_FIND_ROOT_PATH.


Best regards,

Frank
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170803/cf6c967e/attachment-0001.html>
