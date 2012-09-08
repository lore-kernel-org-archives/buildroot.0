From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Sat, 8 Sep 2012 10:22:21 -0300
Subject: [Buildroot] [PATCH] python-protobuf: Add support for Python
 implementation of Google's Protocol Buffers
In-Reply-To: <504992FD.4080702@visionsystems.de>
References: <20120906205831.GA12993@localhost.comm5.com.br>
 <504992FD.4080702@visionsystems.de>
Message-ID: <CAExDhvaYvvRka=SccB-_dBQHFZpQ_vFun35kA6sxjKcggZSFQA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ops, will resend. Thanks for pointing out

On Fri, Sep 7, 2012 at 3:23 AM, Yegor Yefremov
<yegor_sub1@visionsystems.de> wrote:
> Am 06.09.2012 22:58, schrieb Thiago A. Correa:
>> python-protobuf: Add support for Python implementation of Google's Protocol Buffers
>>
>> Signed-off-by: Thiago A. Correa <thiago.correa@gmail.com>
>> ---
>>  package/python-protobuf/Config.in          |   11 +++++++++++
>>  package/python-protobuf/python-protobuf.mk |   28 ++++++++++++++++++++++++++++
>>  2 files changed, 39 insertions(+), 0 deletions(-)
>>  create mode 100644 package/python-protobuf/Config.in
>>  create mode 100644 package/python-protobuf/python-protobuf.mk
>>
>> diff --git a/package/python-protobuf/Config.in b/package/python-protobuf/Config.in
>> new file mode 100644
>> index 0000000..d2bf70d
>> --- /dev/null
>> +++ b/package/python-protobuf/Config.in
>> @@ -0,0 +1,11 @@
>> +config BR2_PACKAGE_PYTHON_PROTOBUF
>> +     bool "python-protobuf"
>> +     depends on BR2_PACKAGE_PYTHON
>> +     select BR2_PACKAGE_PYTHON_SETUPTOOLS
>> +     help
>> +       Python implementation of the Google Protocol Buffers.
>> +
>> +       Protocol buffers are Google's language-neutral, platform-neutral,
>> +       extensible mechanism for serializing structured data.
>> +
>> +       http://code.google.com/p/protobuf/
>> diff --git a/package/python-protobuf/python-protobuf.mk b/package/python-protobuf/python-protobuf.mk
>> new file mode 100644
>> index 0000000..d632e00
>> --- /dev/null
>> +++ b/package/python-protobuf/python-protobuf.mk
>> @@ -0,0 +1,28 @@
>> +#############################################################
>> +#
>> +# python-protobuf
>> +#
>> +#############################################################
>> +
>> +PYTHON_PROTOBUF_VERSION = $(PROTOBUF_VERSION)
>> +PYTHON_PROTOBUF_SOURCE  = $(PROTOBUF_SOURCE)
>> +PYTHON_PROTOBUF_SITE    = $(PROTOBUF_SITE)
>> +PYTHON_PROTOBUF_LICENSE = BSD-3c
>> +PYTHON_PROTOBUF_LICENSE_FILES = COPYING.txt
>> +
>> +PYTHON_PROTOBUF_DEPENDENCIES = python host-python-setuptools host-python-distutilscross host-protobuf
>> +
>> +define PYTHON_PROTOBUF_BUILD_CMDS
>> +     (cd $(@D)/python; \
>> +             PYTHONXCPREFIX="$(STAGING_DIR)/usr/" \
>> +             LDFLAGS="-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib" \
>> +             PATH=$(HOST_PATH) \
>> +     $(HOST_DIR)/usr/bin/python setup.py build -x)
>> +endef
>> +
>> +define PYTHON_PROTOBUF_INSTALL_TARGET_CMDS
>> +     (cd $(@D)/python; PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
>> +     $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
>> +endef
>> +
>> +$(eval $(generic-package))
>>
>
> I'm missing package/Config.in, where python-protobuf can be activated.
>
> Best regards,
> Yegor
