From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 6 Feb 2017 16:43:17 +0100
Subject: [Buildroot] [PATCH v2] gtest/gmock: bump to version 1.8.0
In-Reply-To: <34bbf827-4564-e812-5677-91bc63c95dde@mind.be>
References: <1473286853-23560-1-git-send-email-casantos@datacom.ind.br>
 <1473290219-27701-1-git-send-email-casantos@datacom.ind.br>
 <34bbf827-4564-e812-5677-91bc63c95dde@mind.be>
Message-ID: <77897237-1b37-56d0-aecd-48f66a0358c5@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Carlos, Fabrice, All,

I removed the last remaining gtest related patch [1] from patchwork since the
gtest/gmock 1.8.0 is now available.

What's the status of this patch bump?
Can you send an updated version?

Thanks!

Best regards,
Romain

[1] http://patchwork.ozlabs.org/patch/667729/

Le 11/09/2016 ? 14:09, Arnout Vandecappelle a ?crit :
>  Big patch, so lots of comments on this one...
> 
> 
> On 08-09-16 01:16, Carlos Santos wrote:
>> From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>>
>> Version 1.8.0 now includes gmock so merge gmock package inside gtest.
>>
>> In this merge:
>>  - Add gmock as a suboption of gtest (BR2_PACKAGE_GTEST_GMOCK)
>>    following advice from Arnout Vandecappelle
>>  - Make gmock a virtual package that selects BR2_PACKAGE_GTEST and
>>    BR2_PACKAGE_GTEST_GMOCK, to provide backward compatibility
> 
>  I don't think this is a good idea.
> 
> * It means we have to keep on supporting the BR2_PACKAGE_GMOCK option for some
> time. Let's say two years down the line we decide to remove it, it means we have
> to move it to legacy at that time. So long term, we gain exactly nothing.
> * The legacy approach works perfectly. The Config.in.legacy entry will make sure
> that the package remains selected. If an external package depends on gmock,
> you'll get an immediate build termination because make doesn't know how to build
> gmock. Since the user has just removed gmock from the legacy menu, it should be
> quite obvious what needs to be done.
> * This is abusing the virtual package infra for something it wasn't meant for.
> We want to avoid adding bad examples to buildroot.
> 
> 
>>  - Use cmake to install libraries and headers and add missing files
>>    (gtest.pc, gtest-config, gmock.pc) in
>>    GTEST_POST_INSTALL_STAGING_HOOKS instead of redefining
>>    GTEST_INSTALL_STAGING_CMDS
>>  - Remove patch on Python as gmock/gtest now supports python 3.0
>>    (commit 456fc2b5c4e9ebf05a5987dfe1ff0ac9ffeb53cc)
>>  - Add the correct license in HOST_GTEST_LICENSE as all python code in
>>    googlemock/scripts/generator is licensed under Apache-2.0 and not
>>    BSD-3c
>>  - Fix URL of gtest project in Config.in
>>
>> Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
>> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
>>
>> ---
>> Changes v1 -> v2
>>   - Add mirtual package for host-gmock, as pointed-out by Arnout
>>     Vandecappelle.
> 
>  Well, no, I never mentioned virtual-package, I said to add a legacy entry.
> 
>>
>> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
>> ---
>>  package/gmock/0001-force-use-python2.patch | 20 ----------
>>  package/gmock/Config.in                    | 26 +++++--------
>>  package/gmock/gmock.hash                   |  2 -
>>  package/gmock/gmock.mk                     | 60 +-----------------------------
>>  package/gtest/Config.in                    | 28 +++++++++++++-
>>  package/{gmock => gtest}/gmock.pc          |  2 +-
>>  package/gtest/gtest.hash                   |  2 +-
>>  package/gtest/gtest.mk                     | 52 +++++++++++++++++++++-----
>>  package/gtest/gtest.pc                     |  2 +-
>>  9 files changed, 84 insertions(+), 110 deletions(-)
>>  delete mode 100644 package/gmock/0001-force-use-python2.patch
>>  delete mode 100644 package/gmock/gmock.hash
>>  rename package/{gmock => gtest}/gmock.pc (93%)
> [snip]
>> diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
>> index eb30905..249971e 100644
>> --- a/package/gtest/gtest.mk
>> +++ b/package/gtest/gtest.mk
>> @@ -4,13 +4,27 @@
>>  #
>>  ################################################################################
>>  
>> -# Make sure this remains the same version as the gmock one
>> -GTEST_VERSION = release-1.7.0
>> +GTEST_VERSION = release-1.8.0
>>  GTEST_SITE = $(call github,google,googletest,$(GTEST_VERSION))
>>  GTEST_INSTALL_STAGING = YES
>>  GTEST_INSTALL_TARGET = NO
>>  GTEST_LICENSE = BSD-3c
>> -GTEST_LICENSE_FILES = LICENSE
>> +GTEST_LICENSE_FILES = googletest/LICENSE
>> +
>> +ifeq ($(BR2_PACKAGE_GTEST_GMOCK),y)
>> +GTEST_LICENSE_FILES += googlemock/LICENSE
> 
>  It has the same content, so it doesn't make sense adding it. Since it's now a
> single package, a single license file is definitely enough.
> 
>> +GTEST_DEPENDENCIES = host-gtest
>> +
>> +HOST_GTEST_LICENSE = Apache-2.0
> 
>  This is so weird that it deserves a separate comment.
> 
> # HOST_GTEST is just the generator script, which has a different license
> # than the rest of gtest. Also, the generator script is not installed on
> # target so its license doesn't need to be mentioned for the target package.
> 
>> +HOST_GTEST_LICENSE_FILES = googlemock/scripts/generator/LICENSE
>> +HOST_GTEST_DEPENDENCIES = host-python
> 
>  Is the host-python dependency still needed? If python-2.6 doesn't work, yes it
> is, but then there should be a comment. But the README file says "Python 2.3.5
> or later"...
> 
>  All this HOST_GTEST stuff should be defined unconditionally.
> 
>> +else
>> +# By default, gtest also builds gmock
>> +GTEST_SUBDIR = googletest
> 
>  Actually, the top-level CMakeLists has the options BUILD_GTEST and BUILD_GMOCK
> (the latter implies the former in a rather complicated way). It's better to use
> those rather than messing with SUBDIR.
> 
>> +endif
>> +
>> +HOST_GTEST_GMOCK_PYTHONPATH = \
>> +        $(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
>>  
>>  # While it is possible to build gtest as shared library, using this gtest shared
>>  # library requires to set some special configure option in the project using
>> @@ -21,11 +35,7 @@ GTEST_LICENSE_FILES = LICENSE
>>  # the gtest sources.
>>  GTEST_CONF_OPTS = -DBUILD_SHARED_LIBS=OFF
>>  
>> -define GTEST_INSTALL_STAGING_CMDS
>> -	$(INSTALL) -D -m 0755 $(@D)/libgtest.a $(STAGING_DIR)/usr/lib/libgtest.a
>> -	$(INSTALL) -D -m 0755 $(@D)/libgtest_main.a $(STAGING_DIR)/usr/lib/libgtest_main.a
>> -	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/gtest/
>> -	cp -rp $(@D)/include/gtest/* $(STAGING_DIR)/usr/include/gtest/
>> +define GTEST_INSTALL_MISSING_FILES
>>  	$(INSTALL) -D -m 0644 package/gtest/gtest.pc \
>>  		$(STAGING_DIR)/usr/lib/pkgconfig/gtest.pc
>>  	# Generate the gtest-config script manually, since the CMake
>> @@ -39,9 +49,33 @@ define GTEST_INSTALL_STAGING_CMDS
>>  		s%@bindir@%$(STAGING_DIR)/usr/bin%;\
>>  		s%@PTHREAD_CFLAGS@%%;\
>>  		s%@PTHREAD_LIBS@%-lpthread%;' \
>> -		$(@D)/scripts/gtest-config.in \
>> +		$(@D)/googletest/scripts/gtest-config.in \
>>  		> $(STAGING_DIR)/usr/bin/gtest-config
>>  	chmod +x $(STAGING_DIR)/usr/bin/gtest-config
>>  endef
>>  
>> +GTEST_POST_INSTALL_STAGING_HOOKS += GTEST_INSTALL_MISSING_FILES
>> +
>> +ifeq ($(BR2_PACKAGE_GTEST_GMOCK),y)
>> +define GTEST_GMOCK_INSTALL_MISSING_FILE
>> +	$(INSTALL) -D -m 0755 package/gtest/gmock.pc \
>> +		$(STAGING_DIR)/usr/lib/pkgconfig/gmock.pc
>> +endef
>> +
>> +GTEST_POST_INSTALL_STAGING_HOOKS += GTEST_GMOCK_INSTALL_MISSING_FILE
>> +
>> +define HOST_GTEST_INSTALL_CMDS
> 
>  This shouldn't be inside the GTEST_GMOCK condition.
> 
>> +	$(INSTALL) -D -m 0755 $(@D)/googlemock/scripts/generator/gmock_gen.py \
>> +		$(HOST_DIR)/usr/bin/gmock_gen.py
>> +	ln -sf gmock_gen.py $(HOST_DIR)/usr/bin/gmock_gen
>> +	cp -rp $(@D)/googlemock/scripts/generator/cpp \
>> +		$(HOST_GTEST_GMOCK_PYTHONPATH)
> 
>  This is just copied from the current implementation, so OK. However, now I look
> like it, this seems a really twisted way of installing this script. The normal
> approach would be
> 
> 	mkdir -p $(HOST_DIR)/usr/lib/gmock
> 	cp -r $(@D)/googlemock/scripts/generator/* $(HOST_DIR)/usr/lib/gmock
> 	ln -sf ../lib/gmock/gmock_gen.py $(HOST_DIR)/usr/bin/gmock_gen
> 
>  I.e. install the script itself together with the libraries it imports, and
> symlink to it from $PATH. This way, the script will find the libraries by itself
> (it extends sys.path with $0).
> 
>  That way, the script is also usable with the system's python. So, unless you
> make this change, the host-python dependency really _is_ needed, otherwise the
> gmock_gen imports won't be found when executing the script.
> 
>> +endef
>> +endif
>> +
>>  $(eval $(cmake-package))
>> +ifeq ($(BR2_PACKAGE_GTEST_GMOCK),y)
> 
>  This should _definitely_ not be in the GTEST_GMOCK condition. We never let the
> package definition itself depend on the config options.
> 
> 
>  Regards,
>  Arnout
> 
>> +# The host package does not build anything, just installs gmock_gen stuff, so
>> +# it does not need to be a host-cmake-package.
>> +$(eval $(host-generic-package))
>> +endif
>> diff --git a/package/gtest/gtest.pc b/package/gtest/gtest.pc
>> index b7a8aa4..594e79d 100644
>> --- a/package/gtest/gtest.pc
>> +++ b/package/gtest/gtest.pc
>> @@ -5,7 +5,7 @@ includedir=${prefix}/include
>>  
>>  Name: gtest
>>  Description: Google C++ Testing Framework
>> -Version: 1.7.0
>> +Version: 1.8.0
>>  Libs: -L${libdir} -lgtest
>>  Libs.private: -lpthread
>>  Cflags: -I${includedir}
>>
> 
