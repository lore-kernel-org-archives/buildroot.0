From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 16 Feb 2014 09:14:44 +0100
Subject: [Buildroot] [PATCH 0/2] vlc autobuild fixes and opencv modules
	mess?
In-Reply-To: <1392502403-19701-1-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Sat, 15 Feb 2014 23:13:21 +0100")
References: <1392502403-19701-1-git-send-email-s.martin49@gmail.com>
Message-ID: <874n3zjwy3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > All,
 > Here is a fix for some vlc autobuilder failures (caused by opencv) and
 > a cleanup for opencv.

 > That's all for the vlc fixes, now the opencv situation that I dug out
 > while I was investigating these failure, and on which I'd like to get
 > inputs from others developpers.

 > Along side this vlc fix, it appears the opencv situation is a bit
 > messy. Let me explain it.

 > OpenCV allows to enable/disable the selection of modules (a.k.a.
 > opencv libraries). These modules depend one from the others; these
 > dependencies are already handled by the build-system (CMake).

 > However, the way we handle them in Buildroot can be improved.
 > wever

 > The curreent situation:
 > For each opencv module, there is an option, so the corresponding cmake
 > config option is set accordingly:

 > OPENCV_CONF_OPT += \
 >   -DBUILD_opencv_core=$(if $(BR2_PACKAGE_OPENCV_LIB_CORE),ON,OFF) \
 >   -DBUILD_opencv_video=$(if $(BR2_PACKAGE_OPENCV_LIB_VIDEO),ON,OFF) \
 >   ...

 > The thing is that a module (e.g. video) won't be built if it is enable
 > while one of its dependencies (e.g. core) is disabled.
 > CMake behaves like this because we force (too?) many options, and
 > CMake, which is aware the dependency relations, solves them this way.

 > How can the situation be improved:
 > I see 2 ways to rework this:

 > 1) Replicate the modules' dependency relations in the Config.in.
 >   This will:
 >   - make the Config.in even more longer;
 >   - make the bump a bit less easy (need to check the dependencies);
 >   - copy in Buildroot some of the intelligence put in the package's
 >     build-system itself. :-/

I don't really think we have any way around that. If people enable a
certain opencv option in menuconfig they rightly expect it to get
enabled without having to study the opencv build system to figure out
what other options to enable.

So this is my preference.

-- 
Bye, Peter Korsgaard
