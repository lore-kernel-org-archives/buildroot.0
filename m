From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 26 Sep 2015 14:58:26 +0200
Subject: [Buildroot] [PATCHv5] package/openpowerlink: bump to v2.2.1
In-Reply-To: <1439569225-7199-2-git-send-email-romain.naour@openwide.fr>
References: <1439569225-7199-1-git-send-email-romain.naour@openwide.fr>
 <1439569225-7199-2-git-send-email-romain.naour@openwide.fr>
Message-ID: <56069672.4070505@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le 14/08/2015 18:20, Romain Naour a ?crit :
> This new version break the API used in the v1.x but
> this is a complete rewrite of the Powerlink EPSG DS 301
> implementation.
> 
> Add a top level CMakeLists.txt to build each openpowerlink
> component without having to package each of them in a separate
> Buildroot packages. Fixes the build system to support the top
> level CMake build.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Here is an update about patches status included in this series:

> diff --git a/package/openpowerlink/0001-FIX-install-the-stack-libraries-to-lib-subdirectory.patch b/package/openpowerlink/0001-FIX-install-the-stack-libraries-to-lib-subdirectory.patch
> new file mode 100644
> index 0000000..465aeec
> --- /dev/null
> +++ b/package/openpowerlink/0001-FIX-install-the-stack-libraries-to-lib-subdirectory.patch
> @@ -0,0 +1,133 @@
> +From 43a485a934d94879edaed0443aefe4b37e83ca1c Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@openwide.fr>
> +Date: Fri, 1 May 2015 12:19:34 +0200
> +Subject: [PATCH] [FIX] install the stack libraries to "lib" subdirectory
> +
> +Using '.' to install the stack libraries is not correct since
> +it will install them to /usr/.
> +
> +ls /usr/liboplkmnapp-kernelintf.so
> +
> +Fix this by using 'lib' instead of '.'
> +
> +The problem with the openpowerlink build system is that it expect
> +the stack directory to be a "local staging" directory which
> +contains headers and libraries. So the libraries build by the
> +stack project are installed in stack/lib by default.
> +
> +This is wrong to do that because it becomes difficult to package
> +openpowerlink for normal Linux systems.
> +
> +Buildroot like others build system expect from a packaged software
> +to install libraries and headers build/provided in a staging
> +directory.
> +
> +It seems that CMAKE_INSTALL_PREFIX is misused by the default value
> +"${CMAKE_CURRENT_SOURCE_DIR}/lib/${SYSTEM_NAME_DIR}/${SYSTEM_PROCESSOR_DIR}"
> +since it already contains the lib directory and therefore the
> +entire build system is messed up.
> +
> +It seems that the openpowerlink's build system doesn't allow/support
> +CMAKE_INSTALL_PREFIX to be set externally
> +(which is the standard approach).
> +
> +The issue has been reported [1] upstream and a build system
> +refactoring is needed to fix this properly.
> +
> +[1] http://sourceforge.net/p/openpowerlink/discussion/newbie/thread/3f13af65/#8f80/a50a/4649/f07c
> +
> +Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Not the right fix for upstream, a refactoring still needed.

> diff --git a/package/openpowerlink/0002-FIX-cmake-install-oplk-headers-files.patch b/package/openpowerlink/0002-FIX-cmake-install-oplk-headers-files.patch
> new file mode 100644
> index 0000000..1844906
> --- /dev/null
> +++ b/package/openpowerlink/0002-FIX-cmake-install-oplk-headers-files.patch
> @@ -0,0 +1,34 @@
> +From cf3f84a815fc8ed415fbc9718ec5ae3c97fbe59f Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@openwide.fr>
> +Date: Mon, 4 May 2015 11:47:05 +0200
> +Subject: [PATCH] [FIX] cmake: install oplk headers files
> +
> +In order to be able to link a third paries application
> +with openpowerlink libraries, we need to install oplk
> +headers files related to openpowerlink stack.
> +
> +Install all headers file from STACK_INCLUDE_DIR/oplk.
> +
> +Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> +---

Patch submitted upstream:
https://github.com/openPOWERLINK/openPOWERLINK_V2/pull/76

> diff --git a/package/openpowerlink/0003-FIX-cmake-use-CMAKE_CURRENT_SOURCE_DIR-instead-of-CM.patch b/package/openpowerlink/0003-FIX-cmake-use-CMAKE_CURRENT_SOURCE_DIR-instead-of-CM.patch
> new file mode 100644
> index 0000000..22a86f1
> --- /dev/null
> +++ b/package/openpowerlink/0003-FIX-cmake-use-CMAKE_CURRENT_SOURCE_DIR-instead-of-CM.patch
> @@ -0,0 +1,154 @@
> +From 4278474a8d4264c09f4f262fe01862fedd5558d0 Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@openwide.fr>
> +Date: Wed, 17 Sep 2014 13:27:44 +0200
> +Subject: [PATCH] [FIX] cmake: use CMAKE_CURRENT_SOURCE_DIR instead of
> + CMAKE_SOURCE_DIR
> +
> +The aim of this patch is to be able to call each subproject's CMakeLists.txt
> +from a top-level CMakeLists.txt.
> +
> +This will help to build automatically the epl libraries, epl driver, unittests
> +and demos.
> +
> +This patch has been submitted upstream:
> +https://github.com/openPOWERLINK/openPOWERLINK_V2/pull/57
> +
> +Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> +---

Committed upstream for openpowerlink 2.3 release:
https://github.com/openPOWERLINK/openPOWERLINK_V2/commit/14e4014f71f9a45b8754028b4f7eea7af42ae350

> diff --git a/package/openpowerlink/0004-FIX-Use-PROJECT_NAME-instead-of-CMAKE_PROJECT_NAME.patch b/package/openpowerlink/0004-FIX-Use-PROJECT_NAME-instead-of-CMAKE_PROJECT_NAME.patch
> new file mode 100644
> index 0000000..88b87c5
> --- /dev/null
> +++ b/package/openpowerlink/0004-FIX-Use-PROJECT_NAME-instead-of-CMAKE_PROJECT_NAME.patch
> @@ -0,0 +1,125 @@
> +From 092f52e873453b335a8b8d9d1c1bd3030b713175 Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@openwide.fr>
> +Date: Wed, 12 Aug 2015 10:54:32 +0200
> +Subject: [PATCH] [FIX] Use PROJECT_NAME instead of CMAKE_PROJECT_NAME
> +
> +In order to support a top level CMakeLists.txt, use the current project
> +name instead of the top level one.
> +
> +This patch has been submitted upstream:
> +https://github.com/openPOWERLINK/openPOWERLINK_V2/pull/57
> +
> +Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Committed upstream for openpowerlink 2.3 release:
https://github.com/openPOWERLINK/openPOWERLINK_V2/commit/99cd33a9dafc436c99cf88f97d6065a4252c6a9d

> diff --git a/package/openpowerlink/0005-FIX-Add-top-level-CMakeLists.txt.patch b/package/openpowerlink/0005-FIX-Add-top-level-CMakeLists.txt.patch
> new file mode 100644
> index 0000000..adcaf46
> --- /dev/null
> +++ b/package/openpowerlink/0005-FIX-Add-top-level-CMakeLists.txt.patch
> @@ -0,0 +1,170 @@
> +From 7df926088d0a794a5407d728f7546f9c2e00cf00 Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@openwide.fr>
> +Date: Wed, 12 Aug 2015 11:24:24 +0200
> +Subject: [PATCH] [FIX] Add top level CMakeLists.txt
> +
> +This CMakeLists.txt can be used to build openpowerlink
> +using a automated build system.
> +
> +Don't use FIND_LIBRARY when the stack is built from a top
> +level build (ie CFG_OPLK_LIB is ON).
> +For a top level build, CMake will automatically add a build
> +dependency on oplk libraries for building demos applications.
> +
> +This patch has been submitted upstream:
> +https://github.com/openPOWERLINK/openPOWERLINK_V2/pull/57
> +
> +Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> +---

Rejected by upstream since there are not interested by a top level
CMakeLists.txt. We have to maintain this patch over next releases, however the
two previous commits has been accepted.

Best regards,
Romain Naour
