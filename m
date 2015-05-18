From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Mon, 18 May 2015 16:30:35 -0500
Subject: [Buildroot] [PATCH v5 01/24] sepolgen: new package
In-Reply-To: <20150518231659.5973a78f@free-electrons.com>
References: <1431553177-7280-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1431553177-7280-2-git-send-email-clayton.shotwell@rockwellcollins.com>
 <20150518231659.5973a78f@free-electrons.com>
Message-ID: <CANn-YGQVO6cP=LQ9cLRrjGRD750ZR7f+30CP5hCMjfUui9J4dw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Mon, May 18, 2015 at 4:16 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Clayton Shotwell,
>
> On Wed, 13 May 2015 16:39:14 -0500, Clayton Shotwell wrote:
>
>> Changes v4 -> v5:
>>   - Fixed package name to be BR2_PACKAGE_HOST_SEPOLGEN (Suggested by
>>     Thomas P.)
>
> This contradicts...
>
>>   - No menu entry needed as host dependency aren't reflected in
>>     Config.in files (Suggested by Thomas P.)
>
> .. this, no? :-)
>

Just a little bit. Funny how things tend to change over time.... ;)

>> diff --git a/package/sepolgen/sepolgen.hash b/package/sepolgen/sepolgen.hash
>> new file mode 100644
>> index 0000000..a377c66
>> --- /dev/null
>> +++ b/package/sepolgen/sepolgen.hash
>> @@ -0,0 +1,2 @@
>> +# https://github.com/SELinuxProject/selinux/wiki/Releases
>> +sha256 8a1c6d3a78c9b6ad3555c74def555f65a62950bf21c111c585bfc382fec3a645  sepolgen-1.1.9.tar.gz
>> diff --git a/package/sepolgen/sepolgen.mk b/package/sepolgen/sepolgen.mk
>> new file mode 100644
>> index 0000000..7c95866
>> --- /dev/null
>> +++ b/package/sepolgen/sepolgen.mk
>> @@ -0,0 +1,30 @@
>> +################################################################################
>> +#
>> +# sepolgen
>> +#
>> +################################################################################
>> +
>> +SEPOLGEN_VERSION = 1.1.9
>> +SEPOLGEN_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20130423
>> +SEPOLGEN_LICENSE = GPLv2
>> +SEPOLGEN_LICENSE_FILES = COPYING
>> +
>> +ifeq ($(BR2_PACKAGE_PYTHON3),y)
>> +HOST_SEPOLGEN_DEPENDENCIES = host-python3
>> +HOST_SEPOLGEN_MAKE_CMDS = $(HOST_CONFIGURE_OPTS) \
>> +     PYTHONLIBDIR=/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
>> +else
>> +HOST_SEPOLGEN_DEPENDENCIES = host-python
>> +HOST_SEPOLGEN_MAKE_CMDS = $(HOST_CONFIGURE_OPTS) \
>> +     PYTHONLIBDIR=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
>> +endif
>> +
>> +define HOST_SEPOLGEN_BUILD_CMDS
>> +     $(MAKE) -C $(@D) $(HOST_SEPOLGEN_MAKE_CMDS) DESTDIR=$(HOST_DIR)
>> +endef
>> +
>> +define HOST_SEPOLGEN_INSTALL_CMDS
>> +     $(MAKE) -C $(@D) $(HOST_SEPOLGEN_MAKE_CMDS) DESTDIR=$(HOST_DIR) install
>> +endef
>> +
>> +$(eval $(host-generic-package))
>
> This looks good to me. Any reason not to use the latest 1.2.2 version?

Have not had time to test the latest versions. Would it be possible to
get the initial patch set merged in and then bump versions?

Thanks,
Clayton

Clayton Shotwell
Senior Software Engineer, Rockwell Collins
clayton.shotwell at rockwellcollins.com
