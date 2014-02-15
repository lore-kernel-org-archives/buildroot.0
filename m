From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 15 Feb 2014 23:13:21 +0100
Subject: [Buildroot] [PATCH 0/2] vlc autobuild fixes and opencv modules mess?
Message-ID: <1392502403-19701-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,


Here is a fix for some vlc autobuilder failures (caused by opencv) and
a cleanup for opencv.

That's all for the vlc fixes, now the opencv situation that I dug out
while I was investigating these failure, and on which I'd like to get
inputs from others developpers.

Along side this vlc fix, it appears the opencv situation is a bit
messy. Let me explain it.

OpenCV allows to enable/disable the selection of modules (a.k.a.
opencv libraries). These modules depend one from the others; these
dependencies are already handled by the build-system (CMake).

However, the way we handle them in Buildroot can be improved.
wever

The curreent situation:
For each opencv module, there is an option, so the corresponding cmake
config option is set accordingly:

OPENCV_CONF_OPT += \
  -DBUILD_opencv_core=$(if $(BR2_PACKAGE_OPENCV_LIB_CORE),ON,OFF) \
  -DBUILD_opencv_video=$(if $(BR2_PACKAGE_OPENCV_LIB_VIDEO),ON,OFF) \
  ...

The thing is that a module (e.g. video) won't be built if it is enable
while one of its dependencies (e.g. core) is disabled.
CMake behaves like this because we force (too?) many options, and
CMake, which is aware the dependency relations, solves them this way.

How can the situation be improved:
I see 2 ways to rework this:

1) Replicate the modules' dependency relations in the Config.in.
  This will:
  - make the Config.in even more longer;
  - make the bump a bit less easy (need to check the dependencies);
  - copy in Buildroot some of the intelligence put in the package's
    build-system itself. :-/

2) Set the CMake config option in a more permissive way:

  OPENCV_CONF_OPT += \
    $(if $(BR2_PACKAGE_OPENCV_LIB_CORE),-DBUILD_opencv_core=ON) \
    $(if $(BR2_PACKAGE_OPENCV_LIB_VIDEO),-DBUILD_opencv_video=ON) \
    ...

  This keep the intelligence in the build-system itself because if
  core is not enabled in Buildroot, its value in CMake is not forced
  by the config options on the command line. Thus the core module will
  be built if its defaults in the cmake code is ON, or if it is pulled
  by another module.
  However, this may result in bigger rootfs since most of the modules
  are enabled by default in the opencv's cmake code. :-/


So, we have 3 options, the 2 above ones, plus keeping things as they
are, relying on the Buildroot user and its knowledge of what he/she is
doing.

The more I think about this, the less I'm convinced about refactoring
this. Any input/comment/feeling is welcome.


Regards,
Samuel


Samuel Martin (2):
  vlc: explicitly disable opencv support
  opencv: always enable opencv_core module when opencv is enabled

 package/opencv/Config.in | 6 ------
 package/opencv/opencv.mk | 2 +-
 package/vlc/vlc.mk       | 3 ++-
 3 files changed, 3 insertions(+), 8 deletions(-)

--
1.8.5.4
