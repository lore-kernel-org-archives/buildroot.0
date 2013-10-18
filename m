From: sergey kostanbaev <sergey.kostanbaev@gmail.com>
Date: Fri, 18 Oct 2013 10:26:58 +0400
Subject: [Buildroot] [PATCH] Add packages sip and PyQt
In-Reply-To: <526079B7.4060502@mind.be>
References: <1382009228-25988-1-git-send-email-sergey.kostanbaev@gmail.com>
 <526079B7.4060502@mind.be>
Message-ID: <CAGtNMfMrEx0xLvNWAMVgFnS4K7-qrjp9cbSrr=hD5iYLFdWJXA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Thank you for your detailed comments and fast review.

On Fri, Oct 18, 2013 at 3:58 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>  Hi Sergey,
>
>  Thank you for your contribution! I have quite a few comments on your patch,
> though, so hopefully you can modify it and resend.
>
>
> On 17/10/13 13:27, Sergey Kostanbaev wrote:
>>
>> Add support for sip-4.15.3 and pyqt-4.9.6 to work with qt-4.8.x. Tested on
>> arm platform.
>
>
>  Two packages should come in two separate patches: the first one adding sip,
> the second one adding pyqt. Such patches normally have a subject like:
>
> sip: new package
>
>  Also, we prefix python-related packages with 'python-'. So the packages
> should be called python-sip and python-pyqt.

Ok

>
>
>>
>> Signed-off-by: Sergey Kostanbaev <sergey.kostanbaev@gmail.com>
>> ---
>>   Config.in                         |    5
>>   pyqt/Config.in                    |    6
>>   pyqt/pyqt-4.9.6-configure.patch   |  924
>> ++++++++++++++++++++++++++++++++++++
>>   pyqt/pyqt-4.9.6-full.patch        |  949
>> ++++++++++++++++++++++++++++++++++++++
>
>
>  Patches shouldn't have a version number, but should be numbered. So
>
> python-pyqt-0001-configure.patch
> python-pyqt-0002-full.patch

Ok
>
>
>>   pyqt/pyqt.mk                      |   63 ++
>>   sip/Config.in                     |    5
>>   sip/sip-4.15.3-configure.py.patch |   38 +
>>   sip/sip.mk                        |   71 ++
>>   8 files changed, 2061 insertions(+)
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index a94cb62..9c9ee19 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -157,6 +157,11 @@ source "package/qextserialport/Config.in"
>>   source "package/qjson/Config.in"
>>   source "package/qtuio/Config.in"
>>   source "package/qwt/Config.in"
>> +
>> +comment "PyQT libraries"
>
>
>  I don't think this comment is needed.
>
>
>> +source "package/sip/Config.in"
>> +source "package/pyqt/Config.in"
>> +
>>   endif
>>
>>   source "package/qt5/Config.in"
>> diff --git a/package/sip/Config.in b/package/sip/Config.in
>> new file mode 100644
>> index 0000000..bbdb943
>> --- /dev/null
>> +++ b/package/sip/Config.in
>> @@ -0,0 +1,5 @@
>> +config BR2_PACKAGE_SIP
>> +       bool "sip"
>> +       depends on BR2_PACKAGE_PYTHON
>> +       help
>> +           SIP for PyQt4
>> \ No newline at end of file
>
>
>  I don't think we really need sip on the target. sip is needed to build
> pyqt, but we're not going to build it on the target. So you also don't need
> a Config.in for it then.

Actually the target uses it. I just tried:

# ls /usr/lib/python2.7/site-packages/PyQt4/
Qt.so            QtMultimedia.so  QtTest.so        __init__.pyc
QtCore.so        QtNetwork.so     QtXml.so         uic
QtGui.so         QtSql.so         __init__.py
# ls /usr/lib/python2.7/site-packages/
PyQt4   README  sip.so
# mv /usr/lib/python2.7/site-packages/sip.so __sip__so__

# cat /root/test.py

#!/usr/bin/python
import sys
from PyQt4 import QtGui

app = QtGui.QApplication(sys.argv)

widget = QtGui.QWidget()
widget.resize(640, 400)
widget.setWindowTitle('Simple')
widget.show()
sys.exit(app.exec_())

# /root/test.py
Traceback (most recent call last):
  File "/root/test.py", line 5, in <module>
    from PyQt4 import QtGui
ImportError: No module named sip

so it uses it somehow internally. I haven't dig deep enough why it's
used on target, though it has small size (~84K on arm) compared to the
just PyQt4.QtGui library, so I left it


>
>
>> diff --git a/package/sip/sip-4.15.3-configure.py.patch
>> b/package/sip/sip-4.15.3-configure.py.patch
>> new file mode 100644
>> index 0000000..06591c0
>> --- /dev/null
>> +++ b/package/sip/sip-4.15.3-configure.py.patch
>
>
>  Patches should have a description, similar to a commit message. They should
> also have a Signed-off-by tag. See
> http://buildroot.net/downloads/manual/manual.html#_format_and_licensing_of_the_package_patches
>
>  However, this patch is probably not needed if cross-compilation is not
> needed.

Ok, but see above.

>
>
>> @@ -0,0 +1,38 @@
>> +--- a/configure.py     2013-04-24 12:41:35.382000017 +0400
>> ++++ b/configure.py     2013-04-24 13:09:30.000000000 +0400
>> +@@ -273,9 +273,9 @@
>> +         "default_mod_dir":  plat_py_site_dir,
>> +         "default_sip_dir":  opts.sipsipdir,
>> +         "py_version":       py_version,
>> +-        "py_inc_dir":       plat_py_inc_dir,
>> +-        "py_conf_inc_dir":  plat_py_conf_inc_dir,
>> +-        "py_lib_dir":       plat_py_lib_dir,
>> ++        "py_inc_dir":       opts.py_inc_dir,
>> ++        "py_conf_inc_dir":  opts.py_conf_inc_dir,
>> ++        "py_lib_dir":       opts.py_lib_dir,
>> +         "universal":        opts.universal,
>> +         "arch":             opts.arch,
>> +         "deployment_target":    opts.deployment_target
>> +@@ -399,6 +399,22 @@
>> +             "macros")
>> +     p.add_option_group(g)
>> +
>> ++    # Python configuration
>> ++    g = optparse.OptionGroup(p, title="Python include path")
>> ++    g.add_option("-i", "--py_inc_dir", action="callback",
>> ++          default=plat_py_inc_dir, type="string", metavar="DIR",
>> ++          dest="py_inc_dir", callback=store_abspath, help="where the
>> Python "
>> ++          "include directory located [default: %s]" % plat_py_inc_dir)
>> ++    g.add_option("-c", "--py_conf_inc_dir", action="callback",
>> ++          default=plat_py_conf_inc_dir, type="string", metavar="DIR",
>> ++          dest="py_conf_inc_dir", callback=store_abspath, help="where
>> the Python "
>> ++          "Configuration include directory located [default: %s]" %
>> plat_py_conf_inc_dir)
>> ++    g.add_option("-l", "--py_lib_dir", action="callback",
>> ++          default=plat_py_conf_inc_dir, type="string", metavar="DIR",
>> ++          dest="py_lib_dir", callback=store_abspath, help="where the
>> Python "
>> ++          "library located [default: %s]" % plat_py_lib_dir)
>> ++
>> ++
>> +     # Installation.
>> +     g = optparse.OptionGroup(p, title="Installation")
>> +     g.add_option("-b", "--bindir", action="callback",
>> diff --git a/package/sip/sip.mk b/package/sip/sip.mk
>> new file mode 100644
>> index 0000000..2a4254c
>> --- /dev/null
>> +++ b/package/sip/sip.mk
>> @@ -0,0 +1,71 @@
>> +#############################################################
>> +#
>> +# sip
>> +#
>> +#############################################################
>
>
>  That should be 80 #'s
>
>
>> +SIP_VERSION = 4.15.3
>> +SIP_SOURCE = sip-$(SIP_VERSION).tar.gz
>> +SIP_SITE =
>> http://sourceforge.net/projects/pyqt/files/sip/sip-$(SIP_VERSION)
>
>
>  We use the direct download links on sourceforge:
>
> http://downloads.sourceforge.net/project/pyqt/sip/sip-$(SIP_VERSION)
>
>> +
>> +################################################
>> +# HOST
>
>
>  This is not needed.
>
>
>> +
>> +HOST_SIP_DEPENDENCIES = host-python
>> +define HOST_SIP_CONFIGURE_CMDS
>> +    (cd $(@D); \
>> +       echo "Host Configuring DIR=$(PWD)"; \
>
>
>  This echo is not needed.
>
>> +       LD_LIBRARY_PATH=$(HOST_DIR)/lib $(HOST_DIR)/usr/bin/python
>> configure.py; \
>
>
>  You should also pass HOST_CONFIGURE_OPTS in the environment. And this
> already contains (a better) LD_LIBRARY_PATH definition.
Ok

>
>> +    )
>> +endef
>> +
>
> [snip target definitions which are not needed IMO]
>>
>> +$(eval $(host-autotools-package))
>
>
>  This is not an autotools package, so you shouldn't use the autotools rules.
> That does some additional things that may not apply here.
>
>
>> diff --git a/package/pyqt/Config.in b/package/pyqt/Config.in
>> new file mode 100644
>> index 0000000..4e4ff07
>> --- /dev/null
>> +++ b/package/pyqt/Config.in
>> @@ -0,0 +1,6 @@
>> +config BR2_PACKAGE_PYQT
>> +       bool "pyqt"
>> +       depends on BR2_PACKAGE_QT
>
>
>  It's already in an if BR2_PACKAGE_QT, so this is not needed.
>
>> +       depends on BR2_PACKAGE_SIP
>
>
>  This is not needed IMO. It requires the host sip, but not the target sip.
see above

>
>
>> +       help
>> +           PyQT4 for Qt Embedded 4
>
>
>  There should be an upstream URL, i.e.
> http://www.riverbankcomputing.com/software/pyqt/
>
>  Also, help text indentation should be one tab + two spaces, not four
> spaces.
>
>
>> \ No newline at end of file
>
>
>  There should be a newline at the end of the file.
>
> [snip 2 patches]
>
>  These patches are suspiciously large. They lack a description, but I guess
> they are needed for cross-compilation. Upstream says that configure-ng will
> support cross-compilation in the future [1] so I think you should probably
> start with that script. And check in upstream's mercurial repository what is
> already possible. Or perhaps even ask upstream for help.
>
> [1] http://pyqt.sourceforge.net/Docs/PyQt4/installation.html

Yes that was needed for cross-compilation and mostly for Embedded Qt
(aka QWS) . I'll check with upstream.

>
>
>  If you do need such large patches, try to split them up a little more and
> certainly give a good comment, so we can try to review them. Also, if
> possible, try to send them upstream. Upstream can give much more valuable
> comments on the patches.
>

Ok

>
>
>> diff --git a/package/pyqt/pyqt.mk b/package/pyqt/pyqt.mk
>> new file mode 100644
>> index 0000000..6c3ccfb
>> --- /dev/null
>> +++ b/package/pyqt/pyqt.mk
>> @@ -0,0 +1,63 @@
>> +#############################################################
>
>
>  80 #'s
>
>
>> +#
>> +# PyQT Open Source Edition for Qt Embedded (QWS)
>
>
>  Just
>
> # python-pyqt
>
Ok

>
>> +#
>> +#############################################################
>> +PYQT_VERSION = 4.9.6
>> +PYQT_SOURCE = PyQt-x11-gpl-$(PYQT_VERSION).tar.gz
>> +PYQT_SITE =
>> http://sourceforge.net/projects/pyqt/files/PyQt4/PyQt-$(PYQT_VERSION)
>
>
>  Use downloads.sourceforge.net
>
>
>> +
>> +################################################
>> +# TARGET
>> +
>> +PYQT_DEPENDENCIES = sip qt
>
>
>  host-sip
see above

>
>
>> +
>> +define PYQT_CONFIGURE_CMDS
>> +    echo "Construting qtdirs"
>
>
>  echo is not needed.
Yes that echos was my debug outputs. I forget to clean it up.

>
>
>> +    echo $(STAGING_DIR)/usr             > $(@D)/qtdirs.out
>> +    echo $(STAGING_DIR)/usr/include    >> $(@D)/qtdirs.out
>> +    echo $(STAGING_DIR)/usr/lib        >> $(@D)/qtdirs.out
>> +    echo $(HOST_DIR)/usr/bin           >> $(@D)/qtdirs.out
>> +    echo $(STAGING_DIR)/usr            >> $(@D)/qtdirs.out
>> +    echo $(STAGING_DIR)/usr/plugins    >> $(@D)/qtdirs.out
>> +
>> +    echo 264196                >> $(@D)/qtdirs.out
>> +    echo 8                     >> $(@D)/qtdirs.out
>> +    echo Open Source           >> $(@D)/qtdirs.out
>> +    echo shared                >> $(@D)/qtdirs.out
>> +    echo PyQt_Accessibility    >> $(@D)/qtdirs.out
>> +    echo PyQt_SessionManager   >> $(@D)/qtdirs.out
>> +    echo PyQt_qreal_double     >> $(@D)/qtdirs.out
>> +    echo PyQt_OpenSSL          >> $(@D)/qtdirs.out
>> +    echo PyQt_Shortcut         >> $(@D)/qtdirs.out
>> +    echo PyQt_ButtonGroup      >> $(@D)/qtdirs.out
>> +    echo PyQt_RawFont          >> $(@D)/qtdirs.out
>> +    echo WS_MACX               >> $(@D)/qtdirs.out
>> +    echo WS_WIN                >> $(@D)/qtdirs.out
>
>
>  This really needs some comments to explain what it does.
Ok, I'll add comments. That file qtdirs.out originally generates
running and compiling C++ programs on target (AFAIK), so we can't do
it. So I add generation of it here with the specific for Qt Embedded
(QWS). Also I found a python script that analysis directories and
generates it, but it was quite huge and it was far away from upstream,
so I did simple generation.


>
>  Also, it's nicer to keep a template in package/python-pyqt and sed-ing it
> to the build directory.
>
>
>> +
>> +    ( cd $(@D); \
>> +       echo "TARGET_DIR=$(TARGET_DIR)" \
>> +       echo "HOST_DIR=$(HOST_DIR)" \
>> +       echo "BUILD_DIR=$(BUILD_DIR)" \
>> +       echo "PyQT Configuring Target DIR=`pwd`"; \
>
>
>  That's a pretty weird echo... And anyway not needed.
Yes. That was debug.

>
>> +       PATH=$$PATH:$(HOST_DIR)/usr/bin \
>
>
>  Use TARGET_CONFIGURE_OPTS.
>
>> +       CROSS_SIPCONFIG=$(BUILD_DIR)/sip-$(SIP_VERSION)/ \
>
>
>  Hm, we don't like referring to another build dir. Is it possible to install
> whatever is needed somewhere in $(HOST_DIR) and refer to that?
I'll try

>
>
>> +
>> QMAKESPEC=$(BUILD_DIR)/qt-$(QT_VERSION)/mkspecs/qws/linux-$(QT_EMB_PLATFORM)-g++
>> \
>> +       LD_LIBRARY_PATH=$(HOST_DIR)/lib $(HOST_DIR)/usr/bin/python
>> configure.py \
>
>
>  Is LD_LIBRARY_PATH really needed?
Will try without it

>
>
>> +               -b $(TARGET_DIR)/usr/bin \
>> +               -d
>> $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
>> +               -l
>> $(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)  \
>> +               -m
>> $(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/config \
>> +               -q $(HOST_DIR)/usr/bin/qmake \
>> +               -v $(TARGET_DIR)/usr/share/sip/PyQt4 \
>> +               -w --confirm-license \
>> +    )
>> +endef
>> +
>> +define PYQT_INSTALL_TARGET_CMDS
>> +# TODO copy only needed files  DESTDIR=
>
>
>  Don't leave comments from your drafts lingering around. If there are todos,
> mention them in your commit message.
Ok

>
>
>> +    PATH="$(PATH):$(HOST_DIR)/usr/bin"  $(MAKE1) install -C $(@D)
>
>
>  Use the same environment as above.
>
>> +    touch
>> $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/PyQt4/__init__.py
>
>
>  Why is this needed?

Without this dummy file I get
# /root/test.py
Traceback (most recent call last):
  File "/root/test.py", line 5, in <module>
    from PyQt4 import QtGui
ImportError: No module named PyQt4

May be there's a solution how to avoid it but haven't figured it out

>
>> +endef
>> +
>> +$(eval $(autotools-package))
>
>
>  Again, it's not really an autotools package.
>
>
>  Regards,
>  Arnout
>
>> --
>> 1.8.3.2
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
>>
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
