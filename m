From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Sun, 5 Apr 2015 14:22:15 -0500
Subject: [Buildroot] [PATCH 1/1] i2c-tools: add support to build python
	extension
In-Reply-To: <20150405191324.GB2183@tarshish>
References: <1428259675-7116-1-git-send-email-ryanbarnett3@gmail.com>
 <20150405191324.GB2183@tarshish>
Message-ID: <CALq67GDTrohkUMGPYNv+iWvgZKXAfyJ9ADpc9G5RvPPMpUOmRw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch,

On Sun, Apr 5, 2015 at 2:13 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Ryan,
>
> On Sun, Apr 05, 2015 at 01:47:55PM -0500, Ryan Barnett wrote:
>> Add a config option to build the python bindings for i2c-tools -
>> py-smbus. The steps for building the python bindings is the same as
>> the distutil steps that are a part of the python infrastructure.
>>
>> Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
>> CC: Tjeerd Pinkert <t.j.pinkert@vu.nl>
>> CC: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
>> ---
>>  package/i2c-tools/Config.in    | 13 +++++++++++++
>>  package/i2c-tools/i2c-tools.mk | 33 +++++++++++++++++++++++++++++++++
>>  2 files changed, 46 insertions(+)
>>
>> diff --git a/package/i2c-tools/Config.in b/package/i2c-tools/Config.in
>> index e83dbd6..2e537cb 100644
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
>
> I don't think another config option is necessary. The size of i2c-tools python
> binding is negligible when compared to the size of python itself.

Good point. So do I still keep a comment there about py-smbus not
being enabled unless python is selected? Otherwise someone might not
know that i2c-tools has the python bindings which is why I had the
config option to begin with.

>
>> +     bool "py-smbus"
>> +     depends on BR2_PACKAGE_PYTHON
>
> This seems to indicate that only python2 is supported ...
>
> [...]
>
>> +ifeq ($(BR2_PACKAGE_I2C_TOOLS_PYSMBUS),y)
>> +I2C_TOOLS_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON3),host-python3 python3,host-python python)
>
> But this assumes that both python2 and python3 are supported. Which one is
> correct?

I believe both are support so I will need to confirm and update my
config option to support either one.


> Also, there is no need to explicitly list python host variants. Target python
> packages already depend on their corresponding host packages.

Already have implemented based off of Thomas P comments.

Thanks,
-Ryan
