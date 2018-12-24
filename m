From: Nikita Sobolev <nikita.sobolev@synopsys.com>
Date: Mon, 24 Dec 2018 12:46:07 +0000
Subject: [Buildroot] [PATCH] azure-iot-sdk-c: Bump to version 2018-12-13
In-Reply-To: <875zvmtu70.fsf@dell.be.48ers.dk>
References: <20181221173729.41870-1-Nikita.Sobolev@synopsys.com>
 <875zvmtu70.fsf@dell.be.48ers.dk>
Message-ID: <2dd91b90433f754e0aa9bd59f28bc68b72e35b53.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There's no problem with WIN32 variable.
Buildroot can not find CMAKE_SYSTEM_VERSION while building in Linux.
It fails with error:
-------------------->8----------------------
CMake Error at c-utility/CMakeLists.txt:267 (if):
 if given arguments:

   "WIN32" "AND" "(" "VERSION_EQUAL" "10.0.17763.0" "OR" "VERSION_GREATER" "10.0.17763.0" ")"

 Unknown arguments specified


-- Configuring incomplete, errors occurred!
-------------------->8-----------------------

   On Fri, 2018-12-21 at 23:02 +0100, Peter Korsgaard wrote:
   > > > > > > "Nikita" == Nikita Sobolev <Nikita.Sobolev@synopsys.com> writes:
> 
>  > From: NikitaSobolev <Nikita.Sobolev@synopsys.com>
>  > Bump azure-iot-sdk-c to 2018-12-13 release.
>  > Add patch, that removes Windows specified variables from
>  > azure-iot-sdk-c-2018-12-13 release. That variables cause
>  > build errors.
> 
>  > Signed-off-by: Nikita Sobolev <Nikita.Sobolev@synopsys.com>
>  > ---
>  >  ...-azure-iot-sdk-c-Delete-windows-variables.patch | 34 ++++++++++++++++++++++
>  >  package/azure-iot-sdk-c/azure-iot-sdk-c.mk         |  2 +-
>  >  2 files changed, 35 insertions(+), 1 deletion(-)
>  >  create mode 100644 package/azure-iot-sdk-c/0001-azure-iot-sdk-c-Delete-windows-variables.patch
> 
>  > diff --git
>  > a/package/azure-iot-sdk-c/0001-azure-iot-sdk-c-Delete-windows-variables.patch
>  > b/package/azure-iot-sdk-c/0001-azure-iot-sdk-c-Delete-windows-variables.patch
>  > new file mode 100644
>  > index 0000000000..e8ff53cb5a
>  > --- /dev/null
>  > +++ b/package/azure-iot-sdk-c/0001-azure-iot-sdk-c-Delete-windows-variables.patch
>  > @@ -0,0 +1,34 @@
>  > +From 6c01ef50e0c2d562388aacbb60a1506e70db2218 Mon Sep 17 00:00:00 2001
>  > +From: Nikita Sobolev <Nikita.Sobolev@synopsys.com>
>  > +Date: Thu, 20 Dec 2018 19:31:20 +0300
>  > +Subject: [PATCH] azure-iot-sdk-c: Delete windows variables
>  > +
>  > +Delete windows specified variables, that have been added
>  > +to azure-iot-sdk-c-2018-12-13 release. These variables
>  > +are not defined for Linux and cause build errors.
>  > +
>  > +Signed-off-by: Nikita Sobolev <Nikita.Sobolev@synopsys.com>
>  > +---
>  > + c-utility/CMakeLists.txt | 6 ------
>  > + 1 file changed, 6 deletions(-)
>  > +
>  > +diff --git a/c-utility/CMakeLists.txt b/c-utility/CMakeLists.txt
>  > +index 190ea87dca..464d6d1069 100644
>  > +--- a/c-utility/CMakeLists.txt
>  > ++++ b/c-utility/CMakeLists.txt
>  > +@@ -264,12 +264,6 @@ if(${use_applessl})
>  > +     include_directories(./pal/ios-osx/)
>  > + endif()
>  > + 
>  > +-if (WIN32 AND (${CMAKE_SYSTEM_VERSION} VERSION_EQUAL "10.0.17763.0"
>  > OR ${CMAKE_SYSTEM_VERSION} VERSION_GREATER "10.0.17763.0"))
>  > +-    # Windows added support for UNIX domain sockets to the OS and SDK
>  > +-    # in the Oct 2018 update (10.0.17763.0, aka RS5)
>  > +-    add_definitions(-DAF_UNIX_ON_WINDOWS)
>  > +-endif()
> 
> Can you be more specific what the issue is exactly? Given the WIN32 in
> this conditional this should never be true in the context of Buildroot,
> so the define shouldn't get added?
> 
-- 
Niktia Sobolev <sobolev@synopsys.com>
