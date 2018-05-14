From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 14 May 2018 08:19:44 +0000
Subject: [Buildroot] [Bug 11016] Wrong compiler used for external user host
 packages
In-Reply-To: <bug-11016-163@https.bugs.busybox.net/>
References: <bug-11016-163@https.bugs.busybox.net/>
Message-ID: <bug-11016-163-0pYC1qE6IS@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11016

--- Comment #1 from Dr I J Ormshaw <ian_ormshaw@waters.com> ---
The CMakeLists file used with that config was:

cmake_minimum_required(VERSION 3.0.2)
project(linuxLibraries)

set(CMAKE_C_STANDARD_REQUIRED -std=gnu++14)
add_compile_options(-fPIC -Wall -Wextra -Werror)

add_subdirectory(libTime)
add_subdirectory(libLock)
add_subdirectory(libRegularExpression)
add_subdirectory(libApplication)
add_subdirectory(libStatistic)
add_subdirectory(libSocket)
add_subdirectory(libXmlDocument)
add_subdirectory(libFifo)
add_subdirectory(libHash)
add_subdirectory(libDiskEvents)

The make file:

################################################################################
#
# amstLinuxLibraries
#
################################################################################
AMSTLINUXLIBRARIES_COMMON_CXX_FLAGS = -fPIC -Wall -Wextra -Werror -std=gnu++14

AMSTLINUXLIBRARIES_VERSION           = 0.0.1
AMSTLINUXLIBRARIES_SITE              = $(BR2_EXTERNAL)/source/libraries
AMSTLINUXLIBRARIES_SITE_METHOD       = local
AMSTLINUXLIBRARIES_DEPENDENCIES      = host-amstLinuxLibraries
AMSTLINUXLIBRARIES_INSTALL_TARGET    = YES
AMSTLINUXLIBRARIES_INSTALL_STAGING   = YES
AMSTLINUXLIBRARIES_CONF_OPTS         =
-DCMAKE_CXX_FLAGS="$(AMSTLINUXLIBRARIES_COMMON_CXX_FLAGS)"
-DAMSTLINUXLIBRARIES=On
HOST_AMSTLINUXLIBRARIES_CONF_OPTS    = -DCMAKE_CXX_FLAGS="$(HOST_CPPFLAGS)
$(AMSTLINUXLIBRARIES_COMMON_CXX_FLAGS)" -DAMSTLINUXLIBRARIES=On

$(eval $(cmake-package))
$(eval $(host-cmake-package))

was origionally used with:

cmake_minimum_required(VERSION 3.0.2)
project(linuxLibraries)

add_subdirectory(libTime)
add_subdirectory(libLock)
add_subdirectory(libRegularExpression)
add_subdirectory(libApplication)
add_subdirectory(libStatistic)
add_subdirectory(libSocket)
add_subdirectory(libXmlDocument)
add_subdirectory(libFifo)
add_subdirectory(libHash)
add_subdirectory(libDiskEvents)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
