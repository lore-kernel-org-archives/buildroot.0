From: Andreas Naumann <dev@andin.de>
Date: Tue, 7 Feb 2017 09:22:23 +0100
Subject: [Buildroot] [PATCH v6 8/9] python-pyqt5: Depend directly on Qt5
 rather than its toolchain requirements
In-Reply-To: <6958a95d-a884-31f1-92cb-516fcbfcde4e@mind.be>
References: <1485849551-20469-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
 <1485849551-20469-9-git-send-email-mr.zoltan.gyarmati@gmail.com>
 <6958a95d-a884-31f1-92cb-516fcbfcde4e@mind.be>
Message-ID: <42d5f9f6-e274-7b66-325a-bd88d69d8256@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Am 03.02.2017 um 00:06 schrieb Arnout Vandecappelle:
>
>
> On 31-01-17 08:59, Zoltan Gyarmati wrote:
>> From: Naumann Andreas <ANaumann@ultratronik.de>
>>
>>  When pyqt5 is used it's obvious that qt5 needs to be selected and configured
>> by the user, hence we enforce it by making pyqt5 depending on qt5, rather than
>> selecting it and depending only on the qt5 requirements.
>
>  I'm not so sure that this really is an improvement. Andreas, can you explain
> why this is needed?

Since Qt 5.7 the toolchain needs at least C++11 support so theoretically 
we need to add that everywhere we select Qt5.
Thomas suggested that depending on rather than selecting Qt5 would 
simplify this. Maybe that fact should also go into the commit message.

regards,
Andreas

>
>  Regards,
>  Arnout
>
>>
>> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
>> Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
>> ---
>>  package/python-pyqt5/Config.in | 13 +++----------
>>  1 file changed, 3 insertions(+), 10 deletions(-)
>>
>> diff --git a/package/python-pyqt5/Config.in b/package/python-pyqt5/Config.in
>> index 4eca68a..20ac988 100644
>> --- a/package/python-pyqt5/Config.in
>> +++ b/package/python-pyqt5/Config.in
>> @@ -1,16 +1,9 @@
>> -comment "python-pyqt5 needs a toolchain w/ wchar, NPTL, C++, dynamic library"
>> -	depends on !BR2_PACKAGE_QT
>> -	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
>> -		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
>> +comment "python-pyqt5 needs Qt5"
>> +	depends on !BR2_PACKAGE_QT5
>>
>>  config BR2_PACKAGE_PYTHON_PYQT5
>>  	bool "python-pyqt5"
>> -	depends on BR2_INSTALL_LIBSTDCPP
>> -	depends on BR2_USE_WCHAR # qt5
>> -	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # qt5
>> -	depends on !BR2_STATIC_LIBS # qt5
>> -	depends on !BR2_PACKAGE_QT # qt5
>> -	select BR2_PACKAGE_QT5
>> +	depends on BR2_PACKAGE_QT5
>>  	select BR2_PACKAGE_PYTHON_SIP
>>  	help
>>  	  Python bindings for Qt 5
>>
>
