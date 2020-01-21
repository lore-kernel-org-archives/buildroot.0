From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Tue, 21 Jan 2020 13:20:44 -0600
Subject: [Buildroot] [PATCH 1/1] perl: Add option to enable threads
In-Reply-To: <CAB0FRstBsKSNsbZA=YYBGUxY1mUKai7bxDFcTqWWWPzni==wjA@mail.gmail.com>
References: <20200121140951.180608-1-clayton.shotwell@rockwellcollins.com>
 <CAB0FRstBsKSNsbZA=YYBGUxY1mUKai7bxDFcTqWWWPzni==wjA@mail.gmail.com>
Message-ID: <CANn-YGTH8p6Byq=iCsOFdABg71FbQ4rHvjYFgaFJTUz+cjBHsg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois,

On Tue, Jan 21, 2020 at 11:52 AM Fran?ois Perrad
<francois.perrad@gadz.org> wrote:
>
>
>
> Le mar. 21 janv. 2020 ? 15:31, Clayton Shotwell <clayton.shotwell@rockwellcollins.com> a ?crit :
>>
>> From: Hector Kesari <hector.kesari@rockwellcollins.com>
>>
>> Add config option for PERL to enable threads usage.
>>
>> Signed-off-by: Hector Kesari <hector.kesari@rockwellcollins.com>
>> Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
>> ---
>>  package/perl/Config.in | 9 +++++++++
>>  package/perl/perl.mk   | 4 ++++
>>  2 files changed, 13 insertions(+)
>>
>> diff --git a/package/perl/Config.in b/package/perl/Config.in
>> index 32a3fd2ee9..7bd644a85d 100644
>> --- a/package/perl/Config.in
>> +++ b/package/perl/Config.in
>> @@ -24,4 +24,13 @@ config BR2_PACKAGE_PERL_MODULES
>>           Leave empty for all modules (as far as the external libraries
>>           are available).
>>
>> +config BR2_PACKAGE_PERL_ENABLE_THREADS
>> +       bool "Support for Threads in PERL"
>
>
> The correct spelling is "Perl", not "PERL".

Agreed. I will get that corrected in the next version.

>
>>
>> +       depends on BR2_TOOLCHAIN_HAS_THREADS
>> +       help
>> +         Enable use of threads in PERL scripts
>
>
> Same, the correct spelling is "Perl".

Agreed. I will get that corrected in the next version.

>
>>
>> +
>> +comment "Perl threads need toolchain w/ threads"
>> +       depends on !BR2_TOOLCHAIN_HAS_THREADS
>> +
>
>
> WARNING: The use of interpreter-based threads in perl is officially discouraged.
> see https://perldoc.perl.org/threads.html#WARNING
>
> So, I think that this warning must appear in the help of this new option.

Agreed. I can add that verbiage. We are porting some legacy code and
are attempting to not make any changes.

>
> Fran?ois
>
>>
>>  endif
>> diff --git a/package/perl/perl.mk b/package/perl/perl.mk
>> index 0ab81ddb34..e0bbf9cfd4 100644
>> --- a/package/perl/perl.mk
>> +++ b/package/perl/perl.mk
>> @@ -62,6 +62,10 @@ ifeq ($(shell expr $(PERL_VERSION_MAJOR) % 2), 1)
>>  PERL_CONF_OPTS += -Dusedevel
>>  endif
>>
>> +ifeq ($(BR2_PACKAGE_PERL_ENABLE_THREADS),y)
>> +PERL_CONF_OPTS += -Dusethreads
>> +endif
>> +
>>  ifeq ($(BR2_STATIC_LIBS),y)
>>  PERL_CONF_OPTS += --all-static --no-dynaloader
>>  endif
>> --
>> 2.23.0
>>

Thank you,
Clayton
