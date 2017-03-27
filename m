From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 27 Mar 2017 14:20:05 -0500
Subject: [Buildroot] [PATCH 4/4] policycoreutils: add option to build
	audit2allow
In-Reply-To: <CANQCQpYdCyNwBMkRVDAgyjMPZ3Omwvr+Y5oLJKrPFPyVcY1NAA@mail.gmail.com>
References: <20170202224505.22882-1-Adamduskett@outlook.com>
 <20170202224505.22882-4-Adamduskett@outlook.com>
 <CANQCQpYdCyNwBMkRVDAgyjMPZ3Omwvr+Y5oLJKrPFPyVcY1NAA@mail.gmail.com>
Message-ID: <CANQCQpZEtJ1is-8tYmq1=ALFhvGbJr8QaKRzr5A-n7+JNV7AtA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam,

On Mon, Mar 27, 2017 at 12:22 PM, Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
> Adam,
>
> On Thu, Feb 2, 2017 at 4:45 PM, Adam Duskett <aduskett@gmail.com> wrote:
>> This python utility scans the logs for messages logged when the system
>> denied permission for operations, and  generates  a snippet of policy
>> rules which, if loaded into policy, might have allowed  those operations
>> to succeed.  However, this utility only generates Type Enforcement (TE)
>> allow rules.
>>
>> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
>> ---
>>  package/policycoreutils/Config.in          |  8 ++++++++
>>  package/policycoreutils/policycoreutils.mk | 14 ++++++++++++++
>>  2 files changed, 22 insertions(+)
>>
>> diff --git a/package/policycoreutils/Config.in b/package/policycoreutils/Config.in
>> index 53238b4..f8c3dcf 100644
>> --- a/package/policycoreutils/Config.in
>> +++ b/package/policycoreutils/Config.in
>> @@ -45,6 +45,14 @@ config BR2_PACKAGE_POLICYCOREUTILS
>>
>>  if BR2_PACKAGE_POLICYCOREUTILS
>>
>> +config BR2_PACKAGE_POLICYCOREUTILS_AUDIT2ALLOW
>> +       bool "audit2allow utility"
>> +       select BR2_PACKAGE_SEPOLGEN
>> +       select BR2_PACKAGE_CHECKPOLICY
>> +       select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
>> +       help
>> +         Enable audit2allow to be built
>> +
>>  config BR2_PACKAGE_POLICYCOREUTILS_RESTORECOND
>>         bool "restorecond"
>>         select BR2_PACKAGE_LIBGLIB2
>> diff --git a/package/policycoreutils/policycoreutils.mk b/package/policycoreutils/policycoreutils.mk
>> index 6076bb9..2e30fd4 100644
>> --- a/package/policycoreutils/policycoreutils.mk
>> +++ b/package/policycoreutils/policycoreutils.mk
>> @@ -50,6 +50,20 @@ ifeq ($(BR2_PACKAGE_POLICYCOREUTILS_RESTORECOND),y)
>>  POLICYCOREUTILS_MAKE_DIRS += restorecond
>>  POLICYCOREUTILS_DEPENDENCIES += libglib2
>>  endif
>> +
>> +ifeq ($(BR2_PACKAGE_POLICYCOREUTILS_AUDIT2ALLOW),y)
>> +ifeq ($(BR2_PACKAGE_PYTHON3),y)
>> +POLICYCOREUTILS_DEPENDENCIES += python3
>> +POLICYCOREUTILS_MAKE_OPTS += PYLIBVER="python$(PYTHON3_VERSION_MAJOR)"
>> +else
>> +POLICYCOREUTILS_DEPENDENCIES += python
>> +POLICYCOREUTILS_MAKE_OPTS += PYLIBVER="python$(PYTHON_VERSION_MAJOR)"
>> +endif
>> +
>> +POLICYCOREUTILS_DEPENDENCIES += sepolgen checkpolicy
>> +POLICYCOREUTILS_MAKE_DIRS += audit2allow
>> +endif
>> +
>>  # We need to pass DESTDIR at build time because it's used by
>>  # policycoreutils build system to find headers and libraries.
>>  define POLICYCOREUTILS_BUILD_CMDS
>> --
>> 2.9.3
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
> Running some test builds on this and will respond once complete.
> Otherwise looks ok.
>

I did a build test but didn't have hardware available to execute.  I
did verify the audit2allow installed correctly to target and that the
python include path in that script didn't include the build path.

Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
