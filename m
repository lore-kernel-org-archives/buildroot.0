From: Victor Huesca <victor.huesca@bootlin.com>
Date: Thu, 20 Jun 2019 14:42:19 +0200
Subject: [Buildroot] [PATCH 3/4] package: remove non-conventional
 prefix/suffix from github-fetched packages
In-Reply-To: <f5b97179-ad16-36fc-d1fc-401c81e695e8@mind.be>
References: <20190612064209.23619-1-victor.huesca@bootlin.com>
 <20190612064209.23619-4-victor.huesca@bootlin.com>
 <f5b97179-ad16-36fc-d1fc-401c81e695e8@mind.be>
Message-ID: <15a55608-5960-cd35-9462-fa584e6754a8@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 19/06/2019 23:30, Arnout Vandecappelle wrote:
> 
> 
> On 12/06/2019 08:42, Victor Huesca wrote:
>> On Github, a large number of projects name their tag
>> <some-prefix>-0.3-<some-suffix> (i.e release-3.0, poco-0.1-release,
>> etc.). In fact majority of the cased adressed in this commit concerns
>> prefixes.
>>
>> In most packages, we encode those prefix/suffix in the <pkg>_VERSION
>> variable.
>>
>> The problem with this approach is that when used in conjunction with
>> release-monitoring.org, it doesn't work very well, because
>> release-monitoring.org has the concept of "version prefix/suffix" and
>> using that they drop the prefix/suffix to really get the version. For
>> example on https://release-monitoring.org/project/5418/ the latest
>> release of "poco" is "1.8.1", not "poco-1.8.1-release".
>>
>> Therefore, a number of packages in Buildroot have a version that
>> doesn't match with release-monitoring.org.
>>
>> Since really the version number of 1.8.1, is makes sense to update our
>> packages to drop these prefixes/suffixes.
>>
>> This commit addreses the case of github-fetched packages with
>> non-conventional prefixes/suffixes.
>>
>> Note that these changes modify the name of the files stored in DL_DIR,
>> which means that this will force a re-download of those package source
>> code for all users, and requires a change to their .hash file.
> 
>  Hah, here you do have the paragraph I asked for in my review of the previous
> patch! Excellent!
> 
>>
>> Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
>> ---
>>  package/emlog/emlog.hash                     | 2 +-
>>  package/emlog/emlog.mk                       | 4 ++--
>>  package/gtest/gtest.hash                     | 2 +-
>>  package/gtest/gtest.mk                       | 4 ++--
>>  package/intel-microcode/intel-microcode.hash | 2 +-
>>  package/intel-microcode/intel-microcode.mk   | 4 ++--
>>  package/iputils/iputils.hash                 | 2 +-
>>  package/iputils/iputils.mk                   | 4 ++--
>>  package/jasper/jasper.hash                   | 2 +-
>>  package/jasper/jasper.mk                     | 4 ++--
>>  package/libnfs/libnfs.hash                   | 2 +-
>>  package/libnfs/libnfs.mk                     | 4 ++--
>>  package/libusbgx/libusbgx.hash               | 2 +-
>>  package/libusbgx/libusbgx.mk                 | 4 ++--
>>  package/lua-cqueues/lua-cqueues.hash         | 2 +-
>>  package/lua-cqueues/lua-cqueues.mk           | 4 ++--
>>  package/motion/motion.hash                   | 2 +-
>>  package/motion/motion.mk                     | 4 ++--
>>  package/openjdk/openjdk.hash                 | 2 +-
>>  package/openjdk/openjdk.mk                   | 4 ++--
>>  package/poco/poco.hash                       | 2 +-
>>  package/poco/poco.mk                         | 4 ++--
>>  package/ptpd2/ptpd2.hash                     | 2 +-
>>  package/ptpd2/ptpd2.mk                       | 4 ++--
>>  package/python-web2py/python-web2py.hash     | 2 +-
>>  package/python-web2py/python-web2py.mk       | 4 ++--
>>  package/python-webpy/python-webpy.hash       | 2 +-
>>  package/python-webpy/python-webpy.mk         | 4 ++--
>>  package/xinetd/xinetd.hash                   | 2 +-
>>  package/xinetd/xinetd.mk                     | 4 ++--
>>  30 files changed, 45 insertions(+), 45 deletions(-)
>>
>> diff --git a/package/emlog/emlog.hash b/package/emlog/emlog.hash
>> index 9d81d47ec2..ba0a201acb 100644
>> --- a/package/emlog/emlog.hash
>> +++ b/package/emlog/emlog.hash
>> @@ -1,2 +1,2 @@
>>  # Locally calculated
>> -sha256 9f791a00c86215306597b761ef5c5ad267efee5f01efbe23cfcc04e583aa402d  emlog-emlog-0.60.tar.gz
>> +sha256 9f791a00c86215306597b761ef5c5ad267efee5f01efbe23cfcc04e583aa402d  emlog-0.60.tar.gz
>> diff --git a/package/emlog/emlog.mk b/package/emlog/emlog.mk
>> index e0926e6cbd..42e3c9dd7b 100644
>> --- a/package/emlog/emlog.mk
>> +++ b/package/emlog/emlog.mk
>> @@ -4,8 +4,8 @@
>>  #
>>  ################################################################################
>>  
>> -EMLOG_VERSION = emlog-0.60
> 
>  This is an example of a risky one, because there are some packages on
> release-monitoring that do have such a prefix. But emlog doesn't, so OK.

I am the one that added the entry on release-monitoring. But as Thomas
mentioned, release-monitoring has an option to remove constant prefix
the from version and this is what most packages with do.
Here, emlog is the package name, so this prefix is clearly not relevant
and should not be included as part of the version, that's why did not
include this suffix in release-monitoring.


>> -EMLOG_SITE = $(call github,nicupavel,emlog,$(EMLOG_VERSION))
>> +EMLOG_VERSION = 0.60
>> +EMLOG_SITE = $(call github,nicupavel,emlog,emlog-$(EMLOG_VERSION))
>>  EMLOG_LICENSE = GPL-2.0
>>  EMLOG_LICENSE_FILES = COPYING
>>  
>> diff --git a/package/gtest/gtest.hash b/package/gtest/gtest.hash
>> index 0a8d8ba096..aa42570eb2 100644
>> --- a/package/gtest/gtest.hash
>> +++ b/package/gtest/gtest.hash
>> @@ -1,3 +1,3 @@
>>  # Locally computed:
>> -sha256	58a6f4277ca2bc8565222b3bbd58a177609e9c488e8a72649359ba51450db7d8	gtest-release-1.8.0.tar.gz
>> +sha256	58a6f4277ca2bc8565222b3bbd58a177609e9c488e8a72649359ba51450db7d8	gtest-1.8.0.tar.gz
>>  sha256	9702de7e4117a8e2b20dafab11ffda58c198aede066406496bef670d40a22138	googletest/LICENSE
>> diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
>> index b62ceb3270..f26098bad7 100644
>> --- a/package/gtest/gtest.mk
>> +++ b/package/gtest/gtest.mk
>> @@ -4,8 +4,8 @@
>>  #
>>  ################################################################################
>>  
>> -GTEST_VERSION = release-1.8.0
>> -GTEST_SITE = $(call github,google,googletest,$(GTEST_VERSION))
>> +GTEST_VERSION = 1.8.0
>> +GTEST_SITE = $(call github,google,googletest,release-$(GTEST_VERSION))
> 
>  gtest doesn't appear on release-monitoring, but that's because a mapping gtest
> -> googletest is missing. Could you add it?

Done.

>>  GTEST_INSTALL_STAGING = YES
>>  GTEST_INSTALL_TARGET = NO
>>  GTEST_LICENSE = BSD-3-Clause
>> diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
>> index 257cc85c41..bb474ad2bb 100644
>> --- a/package/intel-microcode/intel-microcode.hash
>> +++ b/package/intel-microcode/intel-microcode.hash
>> @@ -1,3 +1,3 @@
>>  # Locally computed
>> -sha256 9e67903a5b62b51f5e031b59a8046d3dff226834d79899799943803481a55d20  intel-microcode-microcode-20190514a.tar.gz
>> +sha256 9e67903a5b62b51f5e031b59a8046d3dff226834d79899799943803481a55d20  intel-microcode-20190514a.tar.gz
>>  sha256 1f8bf63fc2b1b486c507b98ff7d283c7eb58c7945746b94188a310d6787cbee5  license
>> diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
>> index dacb619a14..1279a1d364 100644
>> --- a/package/intel-microcode/intel-microcode.mk
>> +++ b/package/intel-microcode/intel-microcode.mk
>> @@ -4,8 +4,8 @@
>>  #
>>  ################################################################################
>>  
>> -INTEL_MICROCODE_VERSION = microcode-20190514a
>> -INTEL_MICROCODE_SITE = $(call github,intel,Intel-Linux-Processor-Microcode-Data-Files,$(INTEL_MICROCODE_VERSION))
>> +INTEL_MICROCODE_VERSION = 20190514a
>> +INTEL_MICROCODE_SITE = $(call github,intel,Intel-Linux-Processor-Microcode-Data-Files,microcode-$(INTEL_MICROCODE_VERSION))
> 
>  This might be a nice one to add to release-monitoring.

Idem

>>  INTEL_MICROCODE_LICENSE = PROPRIETARY
>>  INTEL_MICROCODE_LICENSE_FILES = license
>>  INTEL_MICROCODE_REDISTRIBUTE = NO
> [snip]
> 
>> diff --git a/package/libusbgx/libusbgx.mk b/package/libusbgx/libusbgx.mk
>> index e7c082f9f3..516ad25970 100644
>> --- a/package/libusbgx/libusbgx.mk
>> +++ b/package/libusbgx/libusbgx.mk
>> @@ -4,8 +4,8 @@
>>  #
>>  ################################################################################
>>  
>> -LIBUSBGX_VERSION = libusbgx-v0.2.0
>> -LIBUSBGX_SITE = $(call github,libusbgx,libusbgx,$(LIBUSBGX_VERSION))
>> +LIBUSBGX_VERSION = 0.2.0
>> +LIBUSBGX_SITE = $(call github,libusbgx,libusbgx,libusbgx-v$(LIBUSBGX_VERSION))
> 
>  Missing on release-monitoring.

Unfortunately many packages doesn't have an entry on release-monitoring.
But this one does have one now :)

>>  LIBUSBGX_LICENSE = GPL-2.0+ (examples), LGPL-2.1+ (library)
>>  LIBUSBGX_LICENSE_FILES = COPYING COPYING.LGPL
>>  LIBUSBGX_DEPENDENCIES = host-pkgconf libconfig
>> diff --git a/package/lua-cqueues/lua-cqueues.hash b/package/lua-cqueues/lua-cqueues.hash
>> index 9fd664d69a..7824c08f9b 100644
>> --- a/package/lua-cqueues/lua-cqueues.hash
>> +++ b/package/lua-cqueues/lua-cqueues.hash
>> @@ -1,2 +1,2 @@
>>  # Locally calculated
>> -sha256 ae51b713bdf966215b87244e03ac60b5a12beb82d15dfb02755a000cfb2df905  lua-cqueues-rel-20161215.tar.gz
>> +sha256 ae51b713bdf966215b87244e03ac60b5a12beb82d15dfb02755a000cfb2df905  lua-cqueues-20161215.tar.gz
>> diff --git a/package/lua-cqueues/lua-cqueues.mk b/package/lua-cqueues/lua-cqueues.mk
>> index 4f31c3277f..5cd30ce8dc 100644
>> --- a/package/lua-cqueues/lua-cqueues.mk
>> +++ b/package/lua-cqueues/lua-cqueues.mk
>> @@ -4,8 +4,8 @@
>>  #
>>  ################################################################################
>>  
>> -LUA_CQUEUES_VERSION = rel-20161215
>> -LUA_CQUEUES_SITE = $(call github,wahern,cqueues,$(LUA_CQUEUES_VERSION))
>> +LUA_CQUEUES_VERSION = 20161215
>> +LUA_CQUEUES_SITE = $(call github,wahern,cqueues,rel-$(LUA_CQUEUES_VERSION))
> 
>  Missing mapping on github. Or maybe we should update pkg-stats to guess without
> the lua- prefix.

We don't want to introduce a complicated logic in pkg-stats when a
simple mapping in release-monitoring suffice.


>>  LUA_CQUEUES_LICENSE = MIT
>>  LUA_CQUEUES_LICENSE_FILES = LICENSE
>>  LUA_CQUEUES_DEPENDENCIES = luainterpreter openssl host-m4
>> diff --git a/package/motion/motion.hash b/package/motion/motion.hash
>> index 679defa3d3..4ce70f8640 100644
>> --- a/package/motion/motion.hash
>> +++ b/package/motion/motion.hash
>> @@ -1,3 +1,3 @@
>>  # Locally computed:
>> -sha256	d97ec6ae766adfd478b6f7f9cc0da5f2fe21faa9366d98664be255714c1cf81d	motion-release-4.2.1.tar.gz
>> +sha256	d97ec6ae766adfd478b6f7f9cc0da5f2fe21faa9366d98664be255714c1cf81d	motion-4.2.1.tar.gz
>>  sha256	91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad	COPYING
>> diff --git a/package/motion/motion.mk b/package/motion/motion.mk
>> index 6dfc5a5619..eb7f75e3fb 100644
>> --- a/package/motion/motion.mk
>> +++ b/package/motion/motion.mk
>> @@ -4,8 +4,8 @@
>>  #
>>  ################################################################################
>>  
>> -MOTION_VERSION = release-4.2.1
>> -MOTION_SITE = $(call github,Motion-Project,motion,$(MOTION_VERSION))
>> +MOTION_VERSION = 4.2.1
>> +MOTION_SITE = $(call github,Motion-Project,motion,release-$(MOTION_VERSION))
> 
>  Missing on release-monitoring.
One less to add.

> 
>>  MOTION_LICENSE = GPL-2.0
>>  MOTION_LICENSE_FILES = COPYING
>>  MOTION_DEPENDENCIES = host-pkgconf jpeg libmicrohttpd $(TARGET_NLS_DEPENDENCIES)
>> diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
>> index 91d0f1dbce..e94d4d6d44 100644
>> --- a/package/openjdk/openjdk.hash
>> +++ b/package/openjdk/openjdk.hash
>> @@ -1,3 +1,3 @@
>>  # Locally computed
>> -sha256 de278328668bdaf35d50d0319d15d64d195ddd8a0de9c6fde3a6c9ca10135a92  openjdk-jdk-12+33.tar.gz
>> +sha256 de278328668bdaf35d50d0319d15d64d195ddd8a0de9c6fde3a6c9ca10135a92  openjdk-12+33.tar.gz
>>  sha256 4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
>> diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
>> index 91a00870c5..e6e834cde9 100644
>> --- a/package/openjdk/openjdk.mk
>> +++ b/package/openjdk/openjdk.mk
>> @@ -6,8 +6,8 @@
>>  
>>  OPENJDK_VERSION_MAJOR = 12
>>  OPENJDK_VERSION_MINOR = 33
>> -OPENJDK_VERSION = jdk-$(OPENJDK_VERSION_MAJOR)+$(OPENJDK_VERSION_MINOR)
>> -OPENJDK_SITE = $(call github,AdoptOpenJDK,openjdk-jdk12u,$(OPENJDK_VERSION))
>> +OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR)+$(OPENJDK_VERSION_MINOR)
>> +OPENJDK_SITE = $(call github,AdoptOpenJDK,openjdk-jdk12u,jdk-$(OPENJDK_VERSION))
> 
>  release-monitoring only has openjdk-1.8.0, and calls it java-1.8.0-openjdk.
> 
>  This is an annoying one, because upstream will create a completely new package
> for every major release. It kind of makes sense, it's a bit like python2/python3
> (well, slightly less bad, but not by much). So maybe our package is not
> correctly named.
> 
>  Anyway, the release-monitoring versions for java-1.8.0-openjdk are called 8u212
> and similar. So that's annoying...

Why not simply add entries on release-monitoring for all version of
openjdk? There are two options:
- Add one entry with all version of openjdk (retrived from
http://jdk.java.net/archive/), the downside is that there is only the
latest minor/revision of each version and only since version 9...
- Add multiple entry, one for each major version, this could be easely
done via the github mirror.

I could add the entries on next week if this solution looks good to
everyone.

> 
>>  OPENJDK_LICENSE = GPL-2.0+ with exception
>>  OPENJDK_LICENSE_FILES = LICENSE
> [snip]
> 
>> diff --git a/package/ptpd2/ptpd2.hash b/package/ptpd2/ptpd2.hash
>> index af1f78a5a8..0a7379a1d8 100644
>> --- a/package/ptpd2/ptpd2.hash
>> +++ b/package/ptpd2/ptpd2.hash
>> @@ -1,2 +1,2 @@
>>  # Locally computed:
>> -sha256	267ad61d09d97069acec5d4878dceda20d0ddbebd27557d80230847848cee6c2	ptpd2-ptpd-2.3.1.tar.gz
>> +sha256	267ad61d09d97069acec5d4878dceda20d0ddbebd27557d80230847848cee6c2	ptpd2-2.3.1.tar.gz
>> diff --git a/package/ptpd2/ptpd2.mk b/package/ptpd2/ptpd2.mk
>> index c0c414ae83..f4a70760ad 100644
>> --- a/package/ptpd2/ptpd2.mk
>> +++ b/package/ptpd2/ptpd2.mk
>> @@ -4,8 +4,8 @@
>>  #
>>  ################################################################################
>>  
>> -PTPD2_VERSION = ptpd-2.3.1
>> -PTPD2_SITE = $(call github,ptpd,ptpd,$(PTPD2_VERSION))
>> +PTPD2_VERSION = 2.3.1
>> +PTPD2_SITE = $(call github,ptpd,ptpd,ptpd-$(PTPD2_VERSION))
> 
>  Needs mapping on release-monitoring.org.

Done.

>>  PTPD2_DEPENDENCIES = libpcap
>>  PTPD2_CONF_OPTS = --with-pcap-config=$(STAGING_DIR)/usr/bin/pcap-config
>>  # configure not shipped
>> diff --git a/package/python-web2py/python-web2py.hash b/package/python-web2py/python-web2py.hash
>> index 9a1df0c2a1..57ac02c2a9 100644
>> --- a/package/python-web2py/python-web2py.hash
>> +++ b/package/python-web2py/python-web2py.hash
>> @@ -1,3 +1,3 @@
>>  # sha256 locally computed
>> -sha256 8205a7a08595ca1a41919750a8dc4e431258966cb46c8021564b25003cf90863  python-web2py-R-2.17.2.tar.gz
>> +sha256 8205a7a08595ca1a41919750a8dc4e431258966cb46c8021564b25003cf90863  python-web2py-2.17.2.tar.gz
>>  sha256 2aae96826184a492bc799add49aed7b29036e7aba2d2294fb65053bd30fe55fe  LICENSE
>> diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
>> index 922b267b8b..0b86fb148e 100644
>> --- a/package/python-web2py/python-web2py.mk
>> +++ b/package/python-web2py/python-web2py.mk
>> @@ -4,8 +4,8 @@
>>  #
>>  ################################################################################
>>  
>> -PYTHON_WEB2PY_VERSION = R-2.17.2
>> -PYTHON_WEB2PY_SITE = $(call github,web2py,web2py,$(PYTHON_WEB2PY_VERSION))
>> +PYTHON_WEB2PY_VERSION = 2.17.2
>> +PYTHON_WEB2PY_SITE = $(call github,web2py,web2py,R-$(PYTHON_WEB2PY_VERSION))
> 
>  Missing on release-monitoring.

Same.

>>  PYTHON_WEB2PY_LICENSE = LGPL-3.0
>>  PYTHON_WEB2PY_LICENSE_FILES = LICENSE
>>  PYTHON_WEB2PY_DEPENDENCIES = $(if $(BR2_PACKAGE_PYTHON3),host-python3 python3,host-python python) \
>> diff --git a/package/python-webpy/python-webpy.hash b/package/python-webpy/python-webpy.hash
>> index 70981e0cb4..8ac6827538 100644
>> --- a/package/python-webpy/python-webpy.hash
>> +++ b/package/python-webpy/python-webpy.hash
>> @@ -1,4 +1,4 @@
>>  # Locally computed
>> -sha256  f074241a0b839408a0b9840ade1198e16fbd6aa6393a48a0e84f73b545baab9a  python-webpy-webpy-0.39.tar.gz
>> +sha256  f074241a0b839408a0b9840ade1198e16fbd6aa6393a48a0e84f73b545baab9a  python-webpy-0.39.tar.gz
>>  sha256  3826fd531a9b904841f5e3560fcda7e93f2ab8d11ef124ec65e10625efa26c34  LICENSE.txt
>>  sha256  7347fd17bfd33c4093c31dc77076733e1e0150ce8c13296c56dc042bbecede84  web/wsgiserver/LICENSE.txt
>> diff --git a/package/python-webpy/python-webpy.mk b/package/python-webpy/python-webpy.mk
>> index 192ba5727f..86812a04cb 100644
>> --- a/package/python-webpy/python-webpy.mk
>> +++ b/package/python-webpy/python-webpy.mk
>> @@ -4,8 +4,8 @@
>>  #
>>  ################################################################################
>>  
>> -PYTHON_WEBPY_VERSION = webpy-0.39
>> -PYTHON_WEBPY_SITE = $(call github,webpy,webpy,$(PYTHON_WEBPY_VERSION))
>> +PYTHON_WEBPY_VERSION = 0.39
>> +PYTHON_WEBPY_SITE = $(call github,webpy,webpy,webpy-$(PYTHON_WEBPY_VERSION))
> 
>  web.py on release-monitoring.

Ditto.

>>  PYTHON_WEBPY_SETUP_TYPE = setuptools
>>  PYTHON_WEBPY_LICENSE = Public Domain, CherryPy License
>>  PYTHON_WEBPY_LICENSE_FILES = LICENSE.txt web/wsgiserver/LICENSE.txt
> 
> 
>  All the rest is OK on release-monitoring, so I applied this patch (unchanged!)
> to master, thanks.

Great!


Victor,
Best regards

-- 
Victor Huesca, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
