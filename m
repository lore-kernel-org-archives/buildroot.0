From: Will Wagner <will_wagner@carallon.com>
Date: Fri, 25 Mar 2011 16:37:29 +0000
Subject: [Buildroot] [PATCH 1/1] qt: convert to the GENTARGETS
	infrastructure
In-Reply-To: <39ac37ec67acf7886777166a098039bbab39b691.1300630739.git.thomas.petazzoni@free-electrons.com>
References: <cover.1300630739.git.thomas.petazzoni@free-electrons.com>
	<39ac37ec67acf7886777166a098039bbab39b691.1300630739.git.thomas.petazzoni@free-electrons.com>
Message-ID: <4D8CC4C9.2080104@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/03/2011 14:19, Thomas Petazzoni wrote:
> In addition to converting the qt package to the GENTARGETS
> infrastructure, this commit also does the following (related) things
> in the Qt package:
>
>   * Create a BR2_PACKAGE_QT_CONFIG_FILE option, which can be used to
>     pass a custom Qt configuration file, such as the ones found in
>     src/corelib/global/qconfig-*.h. This used to be possible, but
>     required changing qt.mk directly, which isn't really how we
>     configure things in Buildroot.
>
>   * Remove the BR2_PACKAGE_QT_EMB_PLATFORM option, the embedded
>     platform name is now computed directly in qt.mk.
>
>   * The QT_CONFIGURE variable, which hosted all ./configure options,
>     has been renamed to QT_CONFIGURE_OPTS, for consistency with what we
>     do in the AUTOTARGETS infrastructure.
>
>   * The QT_DEP_LIBS variable has been renamed to QT_DEPENDENCIES, so
>     that dependencies are properly handled by the GENTARGETS
>     infrastructures.
>
>   * The QT_QMAKE_SET macro (used to adjust the path/flags of the
>     compiler/linker) has been extended with an additional argument,
>     which allows to pass the source directory of Qt.
>
>   * All the installation procedure has been rewritten to fit within the
>     GENTARGETS mechanism.
>
> Signed-off-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>
> ---
>   package/qt/Config.in |   35 ++--
>   package/qt/qt.mk     |  623 +++++++++++++++++++++++---------------------------
>   2 files changed, 302 insertions(+), 356 deletions(-)
>
I have found three issues with this patch:

Should be:
+else ifeq ($(BR2_i386),y)
Not
+else ifeq ($(BR2_x86),y)

Should be:
ifneq ($(findstring x86,$(QT_EMB_PLATFORM)),)
Not
ifneq ($(findstring x86,$(BR2_PACKAGE_QT_EMB_PLATFORM)),)

Finally whitespace formatting is slightly inconsistent for the 
QT_DEPENDENCIES libglib2, directfb and tslib

Assuming you fixup those three minor things
Acked-by: Will Wagner <willw@carallon.com>

As a slight aside I have a number of Qt patches in my tree that I'd love 
to get merged if there was any interest.

First is to allow compiling Qt for X11 rather than embedded. This is 
involves a slight hack as Qt doesn't officially support cross compiling 
the X11 version, however I have it working well and have been in touch 
with Nokia support who say that although not officially supported it 
should work

Second is re-adding commercial support. i know we had this before and it 
was removed, however I'm stuck with some projects that have to use the 
commercial license. I have done it slightly differently to how it was 
before, it no longer needs login details to download the tarball, 
instead it just fails with an explanation if it isn't in your buildroot 
dl folder.

Other patches include Qt Declarative config option, more font config 
options.

If people are interested I'll submit patches.

Will
