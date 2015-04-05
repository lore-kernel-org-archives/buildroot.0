From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Sun, 5 Apr 2015 16:33:58 -0500
Subject: [Buildroot] [PATCH v2 2/2] i2c-tools: add support to build
	python extension
In-Reply-To: <20150405211001.GH4134@free.fr>
References: <1428263326-10320-1-git-send-email-ryanbarnett3@gmail.com>
 <1428263326-10320-2-git-send-email-ryanbarnett3@gmail.com>
 <20150405211001.GH4134@free.fr>
Message-ID: <CALq67GDxbZJ5j5YubsYokL0Q4i0uJBRrdHt91b5fXTaaEpucUg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann/Baruch,

On Sun, Apr 5, 2015 at 4:10 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Ryan, All,
>
> On 2015-04-05 14:48 -0500, Ryan Barnett spake thusly:
>> Add a config option to build the python bindings for i2c-tools -
>> py-smbus. The steps for building the python bindings is the same as
>> the distutil steps that are a part of the python infrastructure.
>>
>> Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
>> CC: Tjeerd Pinkert <t.j.pinkert@vu.nl>
>> CC: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
>> CC: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> CC: Baruch Siach <baruch@tkos.co.il>
>>
>> ---
>> Changes v1 -> v2:
>>  - Fixed spelling in config entry
>>  - Utilize the python infrastructure variables for environment and
>>    build/install opts (suggested by Thomas P)
>>  - Only support python2.7 since this is not compatabile with python3
>>    (suggested by Baruch)
>> ---
>>  package/i2c-tools/Config.in    | 13 +++++++++++++
>>  package/i2c-tools/i2c-tools.mk | 27 +++++++++++++++++++++++++++
>>  2 files changed, 40 insertions(+)
>>
>> diff --git a/package/i2c-tools/Config.in b/package/i2c-tools/Config.in
>> index e83dbd6..6426f30 100644
>> --- a/package/i2c-tools/Config.in
>> +++ b/package/i2c-tools/Config.in
>> @@ -8,3 +8,16 @@ config BR2_PACKAGE_I2C_TOOLS
>>         EEPROM decoding scripts, and more.
>>
>>         http://www.lm-sensors.org/wiki/I2CTools
>> +
>> +if BR2_PACKAGE_I2C_TOOLS
>> +
>> +config BR2_PACKAGE_I2C_TOOLS_PYSMBUS
>> +     bool "py-smbus"
>> +     depends on BR2_PACKAGE_PYTHON
>> +     help
>> +       Python bindings to smbus from the i2c-tools package.
>
> Well, like Baruch said, I would not add such option, and just build the
> Python binding if Python is enabled.

I kept it for this version because as I have said on IRC - I didn't
even know there were python bindings available for i2c-tools since
their wiki site makes no mention of this. However, since now more than
one person would prefer this, I will change it so the python bindings
are automatically installed.

I would like to have some sort of notification about this in the
configurator but I don't really like having a comment for this. Plus I
have spent more time on this feature than I would have liked so I will
not modify Config.in at all.

>> +I2C_TOOLS_DEPENDENCIES += python
>> +
>> +define I2C_TOOLS_BUILD_PYSMBUS
>> +     (cd $(@D)/py-smbus;  \
>> +     $(I2C_TOOLS_PYTHON_BASE_ENV) \
>> +             $(HOST_DIR)/usr/bin/python setup.py build \
>> +             $(PKG_PYTHON_DISTUTILS_BUILD_OPTS))
>> +endef
>> +I2C_TOOLS_POST_BUILD_HOOKS += I2C_TOOLS_BUILD_PYSMBUS
>
> I'd keep the define, ditch the hook, and shoehorn the macro directly
> into the build commands, since this is a generic package:
>
>     define I2C_TOOLS_BUILD_CMDS
>         $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
>         $(I2C_TOOLS_BUILD_PYSMBUS)
>     endef

OK I will do this since when you put it that way I prefer this too.
However, it isn't really clear that you are suppose to do something
like this from the manual as I debated this issue. To use hooks or not
to use hooks, that is the question... :)

>> +define I2C_TOOLS_INSTALL_PYSMBUS
>> +     (cd $(@D)/py-smbus; \
>> +     $(I2C_TOOLS_PYTHON_BASE_ENV) \
>> +             $(HOST_DIR)/usr/bin/python setup.py install \
>> +             $(PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPTS))
>> +endef
>> +I2C_TOOLS_POST_INSTALL_TARGET_HOOKS += I2C_TOOLS_INSTALL_PYSMBUS
>
> Ditto, include that directly in the install commands.
>
>> +endif
>
> I like it when there is a comment after the endif, refering to the
> corresponding ifeq:
>
>     endif  # BR2_PACKAGE_PYTHON
>
> This helps when the conditional block if more than a few lines long.
>
> Also, empty line before the endif.

Will do as I do like the readability of this too.

Thanks,
-Ryan
