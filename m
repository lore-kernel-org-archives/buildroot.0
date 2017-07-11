From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Jul 2017 15:35:41 +0200
Subject: [Buildroot] [PATCH 1/2] Add BR2_CMAKE_USE_NINJA_BACKEND option
In-Reply-To: <723cceef4b58126fadeced55d5bcb326@openmailbox.org>
References: <20170106223748.2203-1-cedric.marie@openmailbox.org>
 <20170711135602.7cedcdf1@windsurf.lan>
 <723cceef4b58126fadeced55d5bcb326@openmailbox.org>
Message-ID: <20170711153541.136d2367@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 11 Jul 2017 15:25:46 +0200, C?dric Marie wrote:

> Le 2017-07-11 13:56, Thomas Petazzoni a ?crit?:
> > Do you know why a CMake package could be working with the make backend,
> > but not with the ninja backend ?  
> 
> In file CMakeLists.txt, in the root directory of the bullet package, I 
> have found:
> 
> IF("${CMAKE_GENERATOR}" MATCHES "Unix Makefiles")
> 	OPTION(INSTALL_LIBS "Set when you want to install libraries" ON)
> ELSE()
> 	IF(APPLE AND FRAMEWORK)
> 		OPTION(INSTALL_LIBS "Set when you want to install libraries" ON)
> 	ELSE()
> #by default, don't enable the 'INSTALL' option for Xcode and MSVC 
> projectfiles
> 		OPTION(INSTALL_LIBS "Set when you want to install libraries" OFF)
> 	ENDIF()
> ENDIF()
> 
> 
> I believe that's the reason :)

Indeed! I skimmed through the CMakeLists.txt file, but didn't spot this
obvious thing.

> I suppose the test was expecting to detect the type of machine, while it 
> is based on the type of backend...
> This should be fixed in "bullet" package, either by testing Ninja 
> backend as well, or changing the test (I don't know exactly what he's 
> trying to test...)

I think it's just a bug on their side. I've filed an issue
(https://github.com/bulletphysics/bullet3/issues/1225). Though with 286
open issues, I'm not sure how long it will take for this issue to be
looked at :)

But anyway, it is a very package-specific issue here, unlikely to
affect many other packages. Thanks for having investigated this!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
