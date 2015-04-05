From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Sun, 5 Apr 2015 14:15:01 -0500
Subject: [Buildroot] [PATCH 1/1] i2c-tools: add support to build python
	extension
In-Reply-To: <20150405210006.12d3e201@free-electrons.com>
References: <1428259675-7116-1-git-send-email-ryanbarnett3@gmail.com>
 <20150405210006.12d3e201@free-electrons.com>
Message-ID: <CALq67GBFQP-1rWsRQkeG3oM=c42+=S8HkqZoin4z+z0gFbbWaA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Sun, Apr 5, 2015 at 2:00 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Ryan Barnett,
>
> On Sun,  5 Apr 2015 13:47:55 -0500, Ryan Barnett wrote:
>> Add a config option to build the python bindings for i2c-tools -
>> py-smbus. The steps for building the python bindings is the same as
>> the distutil steps that are a part of the python infrastructure.
>
> Yeah, it's a bit sad that we can't re-use the Python package
> infrastructure is.
>
> I think we discussed this during the Buildroot Developers Meeting,
> though I can't find any reference to this. Cc'ing Arnout.
>
> So essentially, we have two choices:
>
>  * Have separate packages for the C/C++ library and the Python
>    bindings. Like is done today for protobuf + python-protobuf. One
>    problem is how to share the VERSION / SITE / SOURCE variables. The
>    other problem is that people don't necessarily notice when bumping a
>    package version. But the plus side is that we can re-use the python
>    package infrastructure.
>
>  * Use one single package. Makes it trivial to share VERSION / SITE /
>    SOURCE, no possible omission when bumping. But the down-side is that
>    we cannot re-use the python package infra.
>
> Maybe we should take the second approach, but adjust a bit the python
> package infra to make it easier for packages not using the infra to use
> some of its variables?

I too prefer the second approach. I don't have any ideas though on how
to make it easier to take advantage of the python package infra
though. Using the variables from the pkg-python.mk will simplify
things a bit.

>> diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
>> index 0115e22..f363505 100644
>> --- a/package/i2c-tools/i2c-tools.mk
>> +++ b/package/i2c-tools/i2c-tools.mk
>> @@ -21,4 +21,37 @@ define I2C_TOOLS_INSTALL_TARGET_CMDS
>>       done
>>  endef
>>
>> +# BASE_ENV taken from PKG_PYTHON_DISTUTILS_ENV in package/pkg-python.mk
>> +I2C_TOOLS_PYTHON_BASE_ENV = PATH=$(BR_PATH) \
>> +     CC="$(TARGET_CC)" \
>> +     CFLAGS="$(TARGET_CFLAGS) -I../include" \
>> +     LDFLAGS="$(TARGET_LDFLAGS)" \
>> +     LDSHARED="$(TARGET_CROSS)gcc -shared" \
>> +     PYTHONPATH="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_PATH),$(PYTHON_PATH))" \
>> +     _python_sysroot=$(STAGING_DIR) \
>> +     _python_prefix=/usr \
>> +     _python_exec_prefix=/usr
>
> What about:
>
> I2C_TOOLS_PYTHON_BASE_ENV = \
>         $(PKG_PYTHON_DISTUTILS_ENV) \
>         CFLAGS="$(TARGET_CFLAGS) -I../include"
>
> this way we re-use a part of the Python package infra.

Agreed. Will the second definition override the definition from
PKG_PYTHON_DISTUTILS_ENV?

>
>> +# Build/install steps mirror the distutil python package type in the python package
>> +# infrastructure
>> +ifeq ($(BR2_PACKAGE_I2C_TOOLS_PYSMBUS),y)
>> +I2C_TOOLS_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON3),host-python3 python3,host-python python)
>
> I know we're doing that in pkg-python.mk, but I'm not sure why. I
> believe something like:
>
> I2C_TOOLS_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON3),python3,python)
>
> is sufficient, since pythonX depends on host-pythonX.

Agree will simplify. Should I sent a second patch to do this too in
pkg-python.mk?

>> +define I2C_TOOLS_BUILD_PYSMBUS
>> +     (cd $(@D)/py-smbus;  \
>> +     $(I2C_TOOLS_PYTHON_BASE_ENV) \
>> +             $(HOST_DIR)/usr/bin/python setup.py build \
>> +             --executable=/usr/bin/python)
>
> Maybe use PKG_PYTHON_DISTUTILS_BUILD_OPTS

Agree.

>> +endef
>> +I2C_TOOLS_POST_BUILD_HOOKS += I2C_TOOLS_BUILD_PYSMBUS
>> +
>> +define I2C_TOOLS_INSTALL_PYSMBUS
>> +     (cd $(@D)/py-smbus; \
>> +     $(I2C_TOOLS_PYTHON_BASE_ENV) \
>> +             $(HOST_DIR)/usr/bin/python setup.py install \
>> +             --prefix=$(TARGET_DIR)/usr )
>
> And PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPTS

Agree.

Will be sending a v2 here shortly.

Thanks,
-Ryan
