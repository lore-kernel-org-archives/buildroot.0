From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed, 23 Jan 2013 09:25:49 +0100
Subject: [Buildroot] [PATCH 2/3] python3: Port python2 patches to reduce
 the interpreter size
In-Reply-To: <CAHXCMMLxr2ttXFzRfJECxRdJitBbAjM4mXyt2SpzTJV5RMQLwA@mail.gmail.com>
References: <1358517974-30956-1-git-send-email-maxime.ripard@free-electrons.com>
 <1358517974-30956-2-git-send-email-maxime.ripard@free-electrons.com>
 <CAHXCMMLxr2ttXFzRfJECxRdJitBbAjM4mXyt2SpzTJV5RMQLwA@mail.gmail.com>
Message-ID: <50FF9E8D.3020809@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel,

On 19/01/2013 15:53, Samuel Martin wrote:
> Hi Maxime, all,
> 
> 2013/1/18 Maxime Ripard <maxime.ripard@free-electrons.com>:
>> Some of the python2 patches were left behind when doing the python3
>> package. This was because the python build system can now autodetect
>> what packages can be built in the system.
>>
>> However, some of these patches are actually useful to reduce drastically
>> the size of the interpreter.
>>
>> This patch ports the relevant patches to the python3 package, and adds a
>> new patch to remove the idle3 IDE as well from the interpreter.
>>
>> Fixes #5696
>>
>> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>> ---
>>  package/python3/Config.in                          |   11 ++
>>  .../python3-3.3-012-disable-extensions.patch       |   98 +++++++++++++++++
>>  .../python3-3.3-100-optional-test-modules.patch    |  112 ++++++++++++++++++++
>>  .../python3/python3-3.3-101-optional-pydoc.patch   |   91 ++++++++++++++++
>>  .../python3/python3-3.3-102-optional-2to3.patch    |   98 +++++++++++++++++
>>  .../python3/python3-3.3-103-optional-sqlite.patch  |   64 +++++++++++
>>  package/python3/python3-3.3-104-optional-tk.patch  |   69 ++++++++++++
>>  .../python3/python3-3.3-105-optional-curses.patch  |   54 ++++++++++
>>  .../python3/python3-3.3-106-optional-expat.patch   |   85 +++++++++++++++
>>  .../python3-3.3-107-optional-codecs-cjk.patch      |   25 +++++
>>  package/python3/python3-3.3-108-optional-nis.patch |   28 +++++
>>  .../python3-3.3-109-optional-unicodedata.patch     |   25 +++++
>>  .../python3/python3-3.3-110-optional-idle.patch    |   76 +++++++++++++
>>  package/python3/python3.mk                         |   25 +++--
>>  14 files changed, 852 insertions(+), 9 deletions(-)
>>  create mode 100644 package/python3/python3-3.3-012-disable-extensions.patch
>>  create mode 100644 package/python3/python3-3.3-100-optional-test-modules.patch
>>  create mode 100644 package/python3/python3-3.3-101-optional-pydoc.patch
>>  create mode 100644 package/python3/python3-3.3-102-optional-2to3.patch
>>  create mode 100644 package/python3/python3-3.3-103-optional-sqlite.patch
>>  create mode 100644 package/python3/python3-3.3-104-optional-tk.patch
>>  create mode 100644 package/python3/python3-3.3-105-optional-curses.patch
>>  create mode 100644 package/python3/python3-3.3-106-optional-expat.patch
>>  create mode 100644 package/python3/python3-3.3-107-optional-codecs-cjk.patch
>>  create mode 100644 package/python3/python3-3.3-108-optional-nis.patch
>>  create mode 100644 package/python3/python3-3.3-109-optional-unicodedata.patch
>>  create mode 100644 package/python3/python3-3.3-110-optional-idle.patch
>>
> [...]
>> diff --git a/package/python3/python3-3.3-100-optional-test-modules.patch b/package/python3/python3-3.3-100-optional-test-modules.patch
>> new file mode 100644
>> index 0000000..bfe7be2
>> --- /dev/null
>> +++ b/package/python3/python3-3.3-100-optional-test-modules.patch
>> @@ -0,0 +1,112 @@
>> +Add an option to disable installation of test modules
>> +
>> +The Python standard distribution comes with many test modules, that
>> +are not necessarly useful on embedded targets.
>> +
>> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> +Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>> +
>> +---
>> +
>> +Add an option to disable installation of test modules
>> +
>> +The Python standard distribution comes with many test modules, that
>> +are not necessarly useful on embedded targets.
>> +
>> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> +Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>> +
>> +---
> ahem... duplicated commit message no needed ;-)

Oops :)

> This little patch:
> http://code.bulix.org/77k6za-82864
> prevents from building some 2to3 stuff when disabled:

Ah yes, sorry. Are you ok with me merging this patch with the one I
submitted?

>> diff --git a/package/python3/python3-3.3-110-optional-idle.patch b/package/python3/python3-3.3-110-optional-idle.patch
>> new file mode 100644
>> index 0000000..7489653
>> --- /dev/null
>> +++ b/package/python3/python3-3.3-110-optional-idle.patch
>> @@ -0,0 +1,76 @@
>> +---
>> + Makefile.pre.in |    8 +++++++-
>> + configure.ac    |    6 ++++++
>> + setup.py        |    4 +++-
>> + 3 files changed, 16 insertions(+), 2 deletions(-)
>> +
> No commit message nor sob line here. :-(

Erf, forgot it obviously, sorry...

Thanks!
Maxime


-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
