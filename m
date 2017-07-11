From: =?UTF-8?Q?C=C3=A9dric_Marie?= <cedric.marie@openmailbox.org>
Date: Tue, 11 Jul 2017 15:25:46 +0200
Subject: [Buildroot]
 =?utf-8?q?=5BPATCH_1/2=5D_Add_BR2=5FCMAKE=5FUSE=5FNIN?=
 =?utf-8?q?JA=5FBACKEND_option?=
In-Reply-To: <20170711135602.7cedcdf1@windsurf.lan>
References: <20170106223748.2203-1-cedric.marie@openmailbox.org>
 <20170711135602.7cedcdf1@windsurf.lan>
Message-ID: <723cceef4b58126fadeced55d5bcb326@openmailbox.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 2017-07-11 13:56, Thomas Petazzoni a ?crit?:
> Do you know why a CMake package could be working with the make backend,
> but not with the ninja backend ?

In file CMakeLists.txt, in the root directory of the bullet package, I 
have found:

IF("${CMAKE_GENERATOR}" MATCHES "Unix Makefiles")
	OPTION(INSTALL_LIBS "Set when you want to install libraries" ON)
ELSE()
	IF(APPLE AND FRAMEWORK)
		OPTION(INSTALL_LIBS "Set when you want to install libraries" ON)
	ELSE()
#by default, don't enable the 'INSTALL' option for Xcode and MSVC 
projectfiles
		OPTION(INSTALL_LIBS "Set when you want to install libraries" OFF)
	ENDIF()
ENDIF()


I believe that's the reason :)

I suppose the test was expecting to detect the type of machine, while it 
is based on the type of backend...
This should be fixed in "bullet" package, either by testing Ninja 
backend as well, or changing the test (I don't know exactly what he's 
trying to test...)

Regards,

-- 
C?dric
