From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 27 Jan 2014 21:05:31 +0100
Subject: [Buildroot] [PATCH] python: fix to ensure libpython is stripped
In-Reply-To: <CAAXf6LV1vHUAEDGdCmMZ0nC-XX3x9QSZOWnAZbNS=rG=0bGnFA@mail.gmail.com>
References: <1390448438-13114-1-git-send-email-przemyslaw.wrzos@calyptech.com>
 <CAAXf6LV1vHUAEDGdCmMZ0nC-XX3x9QSZOWnAZbNS=rG=0bGnFA@mail.gmail.com>
Message-ID: <CAAXf6LU_TkFR+3rVfpcBjHHJLSBtf-oxYBp9UCLTr_rnVVwEXw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 23, 2014 at 3:06 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> On Thu, Jan 23, 2014 at 4:40 AM, Przemyslaw Wrzos
> <przemyslaw.wrzos@calyptech.com> wrote:
>> The python and python3 builds mark libpython as read-only which
>> prevents it from being stripped out correctly for the target.
>>
>> Signed-off-by: Przemyslaw Wrzos <przemyslaw.wrzos@calyptech.com>
>> ---
>>  package/python/python.mk   | 9 +++++++++
>>  package/python3/python3.mk | 9 +++++++++
>>  2 files changed, 18 insertions(+)
>>
>>  NOTE: Resubmitting as part of patchwork cleanup #6.
>>
>> diff --git a/package/python/python.mk b/package/python/python.mk
>> index 6a6aaac..69662c3 100644
>> --- a/package/python/python.mk
>> +++ b/package/python/python.mk
>> @@ -162,6 +162,15 @@ endef
>>
>>  PYTHON_POST_INSTALL_TARGET_HOOKS += PYTHON_REMOVE_USELESS_FILES
>>
>> +#
>> +# Make sure libpython gets stripped out on target
>> +#
>> +define PYTHON_ENSURE_LIBPYTHON_STRIPPED
>> +       chmod u+w $(TARGET_DIR)/usr/lib/libpython$(PYTHON_VERSION_MAJOR)*.so
>> +endef
>> +
>> +PYTHON_POST_INSTALL_TARGET_HOOKS += PYTHON_ENSURE_LIBPYTHON_STRIPPED
>> +
>>  PYTHON_AUTORECONF = YES
>>
>>  $(eval $(autotools-package))
>> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
>> index b5e9689..6cbe772 100644
>> --- a/package/python3/python3.mk
>> +++ b/package/python3/python3.mk
>> @@ -149,6 +149,15 @@ endef
>>
>>  PYTHON3_POST_INSTALL_TARGET_HOOKS += PYTHON3_REMOVE_USELESS_FILES
>>
>> +#
>> +# Make sure libpython gets stripped out on target
>> +#
>> +define PYTHON3_ENSURE_LIBPYTHON_STRIPPED
>> +       chmod u+w $(TARGET_DIR)/usr/lib/libpython$(PYTHON3_VERSION_MAJOR)*.so
>> +endef
>> +
>> +PYTHON3_POST_INSTALL_TARGET_HOOKS += PYTHON3_ENSURE_LIBPYTHON_STRIPPED
>> +
>>  PYTHON3_AUTORECONF = YES
>>
>>  define PYTHON3_INSTALL_SYMLINK
>> --
>
> Acked-by: Thomas De Schampheleire <thomas.de_schampheleire@alcatel-lucent.com>
> Tested-by: Thomas De Schampheleire <thomas.de_schampheleire@alcatel-lucent.com>
> (tested with python2 only)
>
> Note: the library will remain writable, but this doesn't look like a
> big problem to me...
>
> By the way: nice find! Saves about 4MB on Python 2!

ping on this patch?
