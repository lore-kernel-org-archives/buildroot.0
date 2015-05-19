From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Tue, 19 May 2015 08:22:42 -0500
Subject: [Buildroot] [PATCH v5 03/24] setools: new package
In-Reply-To: <20150518233139.6252c732@free-electrons.com>
References: <1431553177-7280-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1431553177-7280-4-git-send-email-clayton.shotwell@rockwellcollins.com>
 <20150518233139.6252c732@free-electrons.com>
Message-ID: <CANn-YGS3C=YGwg=d8fXS-Vx7qPTXoMG=q1ywVAnt7vc5jUxX5w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Mon, May 18, 2015 at 4:31 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Clayton Shotwell,
>
> On Wed, 13 May 2015 16:39:16 -0500, Clayton Shotwell wrote:
>> From: Matt Weber <matthew.weber@rockwellcollins.com>
>>
>> Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
>> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
>>
>> ---
>> Changes v4 -> v5:
>>   - Added dependency on libsepol (Matt W.)
>>   - Removed limitation of arch it could build for  (Matt W.)
>>   - Removed depends on GLIBC (Matt W.)
>>   - Consolidated python configuration (Ryan B.)
>>   - Removed swig (patch and enabling), it's only needed for
>>     graphical apol tool (Ryan B.)
>>   - Added comment to cross compile patch about not upstreaming.
>>     The package is stable and no updates/reworking since 2013.
>>     Currently a 4.0 version is in the works but is a major
>>     build infrastructure rework when compared to 3.3.x. (Ryan B.)
>>   - Added comments noting why autoreconf and not libtool patch
>>     (Suggested by Thomas P.)
>>   - Added comments explaining why python on host but not target
>>     (Suggested by Thomas P.)
>>   - Add a dependency on not static libs because libselinux requires not
>>     static libs. (Clayton S.)
>>   - Added licene info (Clayton S.)
>>   - Added depends on C++ (Matt W.)
>>   - Removed largefile dependency (Clayton S.)
>
> Thanks a lot for this detailed changelog, very useful.

You're very welcome.


>> +comment "setools needs a toolchain w/ threads, c++, dynamic library"
>
> nit of the day: C++ in uppercase.

Will fix for v6.

>> diff --git a/package/setools/setools.mk b/package/setools/setools.mk
>> new file mode 100644
>> index 0000000..bd4de5f
>> --- /dev/null
>> +++ b/package/setools/setools.mk
>> @@ -0,0 +1,85 @@
>> +################################################################################
>> +#
>> +# setools
>> +#
>> +################################################################################
>> +
>> +SETOOLS_VERSION = 3.3.8
>> +SETOOLS_SOURCE = setools-$(SETOOLS_VERSION).tar.bz2
>> +SETOOLS_SITE = https://raw.githubusercontent.com/wiki/TresysTechnology/setools3/files/dists/setools-$(SETOOLS_VERSION)/
>> +SETOOLS_DEPENDENCIES = libselinux sqlite libxml2 bzip2
>
> Here you don't list libsepol explicitly (which is OK since libselinux
> depends on it), but in the host variant of setools, you do depend
> explicitly on host-libsepol. Pick one of the two possibilities, but
> don't mix them :)

Good catch. I will add the dependency here.

>> +SETOOLS_INSTALL_STAGING = YES
>> +SETOOLS_LICENSE = GPLv2+ LGPLv2.1+
>> +SETOOLS_LICENSE_FILES = COPYING COPYING.GPL COPYING.LGPL
>> +
>> +# Generate the configuration script
>
> That's not explaining anything, we know what autoreconf is doing. The
> question is *why*.

I will fix the comment for v6.

>> +SETOOLS_AUTORECONF = YES
>> +SETOOLS_AUTORECONF_OPTS = -i -s
>> +# Prevent patching since autoreconf sets ltmain.sh as a symlink to
>> +# to host/usr/share/libtool/build-aux/ltmain.sh
>
> Weird autoreconf is used all over the place by many packages, and it's
> not causing this problem.

I'll try removing it and see what happens. More than likely everything
will work just fine.

>> +SETOOLS_LIBTOOL_PATCH = NO
>> +
>> +# Notes: Need "disable-selinux-check" so the configure does not check to see
>> +#        if host has selinux enabled.
>> +#        No python support as only the libraries and commandline tools are
>> +#        installed on target
>> +SETOOLS_CONF_OPTS = \
>> +     --disable-debug \
>> +     --disable-gui \
>> +     --disable-bwidget-check \
>> +     --disable-selinux-check \
>> +     --disable-swig-java \
>> +     --disable-swig-python \
>> +     --disable-swig-tcl \
>> +     --with-sepol-devel="$(STAGING_DIR)/usr" \
>> +     --with-selinux-devel="$(STAGING_DIR)/usr"
>> +
>> +HOST_SETOOLS_DEPENDENCIES = host-libselinux host-libsepol host-sqlite \
>> +     host-libxml2 host-bzip2
>> +
>> +# Generate the configuration script
>> +HOST_SETOOLS_AUTORECONF = YES
>> +HOST_SETOOLS_AUTORECONF_OPTS = -i -s
>> +
>
> i.e here (see below).
>
>> +# Notes: Need "disable-selinux-check" so the configure does not check to see
>> +#        if host has selinux enabled.
>> +#        Host builds with python support to enable tools for offline target
>> +#        policy analysis
>> +HOST_SETOOLS_CONF_OPTS = \
>> +     --disable-debug \
>> +     --disable-gui \
>> +     --disable-bwidget-check \
>> +     --disable-selinux-check \
>> +     --disable-swig-java \
>> +     --disable-swig-python \
>> +     --disable-swig-tcl \
>> +     --with-sepol-devel="$(HOST_DIR)/usr" \
>> +     --with-selinux-devel="$(HOST_DIR)/usr" \
>> +     PYTHON_LDFLAGS="-L$(HOST_DIR)/usr/lib/"
>> +
>> +HOST_SETOOLS_CONF_ENV += \
>> +     am_cv_pathless_PYTHON=python \
>> +     ac_cv_path_PYTHON=$(HOST_DIR)/usr/bin/python \
>> +     am_cv_python_platform=linux2
>> +
>> +ifeq ($(BR2_PACKAGE_PYTHON3),y)
>> +HOST_SETOOLS_PYTHON_VERSION=$(PYTHON3_VERSION_MAJOR)
>> +HOST_SETOOLS_DEPENDENCIES += host-python3
>> +HOST_SETOOLS_CONF_ENV += am_cv_python_version=$(PYTHON3_VERSION)
>> +else
>> +HOST_SETOOLS_PYTHON_VERSION=$(PYTHON_VERSION_MAJOR)
>> +HOST_SETOOLS_DEPENDENCIES += host-python
>> +HOST_SETOOLS_CONF_ENV += am_cv_python_version=$(PYTHON_VERSION)
>> +endif
>
> This should be put a bit earlier.
>
>> +
>> +HOST_SETOOLS_CONF_ENV += \
>> +     am_cv_python_pythondir=$(HOST_DIR)/usr/lib/python$(HOST_SETOOLS_PYTHON_VERSION)/site-packages \
>> +     am_cv_python_pyexecdir=$(HOST_DIR)/usr/lib/python$(HOST_SETOOLS_PYTHON_VERSION)/site-packages \
>> +     am_cv_python_includes=-I$(HOST_DIR)/usr/include/python$(HOST_SETOOLS_PYTHON_VERSION)
>> +HOST_SETOOLS_CONF_OPTS += \
>> +     PYTHON_CPPFLAGS="-I$(HOST_DIR)/usr/include/python$(HOST_SETOOLS_PYTHON_VERSION)" \
>> +     PYTHON_SITE_PKG="$(HOST_DIR)/usr/lib/python$(HOST_SETOOLS_PYTHON_VERSION)/site-packages" \
>> +     PYTHON_EXTRA_LIBS="-lpthread -ldl -lutil -lpython$(HOST_SETOOLS_PYTHON_VERSION)"
>
> So that these can be squashed with the HOST_SETOOLS_CONF_ENV and
> HOST_SETOOLS_CONF_OPTS definitions. Also, I'm pretty sure we can do
> something a bit better than that.
>
> ifeq ($(BR2_PACKAGE_PYTHON3),y)
> HOST_SETOOLS_DEPENDENCIES += host-python3
> HOST_SETOOLS_PYTHON_VERSION = $(PYTHON3_VERSION_MAJOR)
> else
> HOST_SETOOLS_DEPENDENCIES += host-python
> HOST_SETOOLS_PYTHON_VERSION = $(PYTHON_VERSION_MAJOR)
> endif
>
> HOST_SETOOLS_PYTHON_SITE_PACKAGES = $(HOST_DIR)/usr/lib/python$(HOST_SETOOLS_PYTHON_VERSION)/site-packages
> HOST_SETOOLS_PYTHON_INCLUDES = $(HOST_DIR)/usr/include/python$(HOST_SETOOLS_PYTHON_VERSION)
> HOST_SETOOLS_PYTHON_LIB = -lpython$(HOST_SETOOLS_PYTHON_VERSION)
>
> And then:
>
>> +HOST_SETOOLS_CONF_OPTS = \
>> +     --disable-debug \
>> +     --disable-gui \
>> +     --disable-bwidget-check \
>> +     --disable-selinux-check \
>> +     --disable-swig-java \
>> +     --disable-swig-python \
>> +     --disable-swig-tcl \
>> +     --with-sepol-devel="$(HOST_DIR)/usr" \
>> +     --with-selinux-devel="$(HOST_DIR)/usr" \
>> +     PYTHON_LDFLAGS="-L$(HOST_DIR)/usr/lib/" \
>> +     PYTHON_CPPFLAGS="-I$(HOST_SETOOLS_PYTHON_INCLUDES)" \
>> +     PYTHON_SITE_PKG="$(HOST_SETOOLS_PYTHON_SITE_PACKAGES") \
>> +     PYTHON_EXTRA_LIBS="-lpthread -ldl -lutil $(HOST_SETOOLS_PYTHON_LIB)"
>
>> +HOST_SETOOLS_CONF_ENV += \
>> +     am_cv_pathless_PYTHON=python \
>> +     ac_cv_path_PYTHON=$(HOST_DIR)/usr/bin/python \
>> +     am_cv_python_platform=linux2
>> +     am_cv_python_version=$(HOST_SETOOLS_PYTHON_VERSION)
>> +     am_cv_python_pythondir=$(HOST_SETOOLS_PYTHON_SITE_PACKAGES)
>> +     am_cv_python_pyexecdir=$(HOST_SETOOLS_PYTHON_SITE_PACKAGES)
>> +     am_cv_python_includes=-I$(HOST_SETOOLS_PYTHON_INCLUDES)
>
> and there you are.

Thanks for cleaning up the python flags. I'll get that changed and
tested for v6.

Thanks,
Clayton

Clayton Shotwell
Senior Software Engineer, Rockwell Collins
clayton.shotwell at rockwellcollins.com
