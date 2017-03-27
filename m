From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 27 Mar 2017 14:13:41 -0500
Subject: [Buildroot] [PATCH 2/4] checkpolicy: allow compiling for target
In-Reply-To: <CANQCQpbWU=mO7bGjKaNP=MCpfbMo5wvEFoA8FeKWxCY6Rv8v5A@mail.gmail.com>
References: <20170202224505.22882-1-Adamduskett@outlook.com>
 <20170202224505.22882-2-Adamduskett@outlook.com>
 <CANQCQpbWU=mO7bGjKaNP=MCpfbMo5wvEFoA8FeKWxCY6Rv8v5A@mail.gmail.com>
Message-ID: <CANQCQpZQtwN-LUmWrYKh_fZchMKUa+k3pVuctyAwJM5iE0Fv1w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam,

On Mon, Mar 27, 2017 at 12:04 PM, Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
> Adam,
>
> On Thu, Feb 2, 2017 at 4:45 PM, Adam Duskett <aduskett@gmail.com> wrote:
>> checkpolicy is currently a host-only package, however it is a dependency
>> of audit2allow.  This patch allows for checkpolicy to be compiled for the
>> target.
>>
>> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
>> ---
>>  package/Config.in                  |  1 +
>>  package/checkpolicy/Config.in      | 11 +++++++++++
>>  package/checkpolicy/checkpolicy.mk | 23 +++++++++++++++++++++++
>>  3 files changed, 35 insertions(+)
>>  create mode 100644 package/checkpolicy/Config.in
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index 9fedc23..90d9273 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -1706,6 +1706,7 @@ menu "Real-Time"
>>  endmenu
>>
>>  menu "Security"
>> +       source "package/checkpolicy/Config.in"
>>         source "package/policycoreutils/Config.in"
>>         source "package/sepolgen/Config.in"
>>         source "package/setools/Config.in"
>> diff --git a/package/checkpolicy/Config.in b/package/checkpolicy/Config.in
>> new file mode 100644
>> index 0000000..894ce39
>> --- /dev/null
>> +++ b/package/checkpolicy/Config.in
>> @@ -0,0 +1,11 @@
>> +config BR2_PACKAGE_CHECKPOLICY
>> +       bool "checkpolicy"
>> +       select BR2_PACKAGE_FLEX
>> +       help
>> +         checkpolicy is the SELinux policy compiler. It uses libsepol
>> +         to generate the binary policy. checkpolicy uses the static
>> +         libsepol since it deals with low level details of the policy
>> +         that have not been encapsulated/abstracted by a proper
>> +         shared library interface.
>> +
>> +         http://selinuxproject.org/page/Main_Page
>> diff --git a/package/checkpolicy/checkpolicy.mk b/package/checkpolicy/checkpolicy.mk
>> index 8328b39..7af5edf 100644
>> --- a/package/checkpolicy/checkpolicy.mk
>> +++ b/package/checkpolicy/checkpolicy.mk
>> @@ -8,6 +8,28 @@ CHECKPOLICY_VERSION = 2.6
>>  CHECKPOLICY_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20161014
>>  CHECKPOLICY_LICENSE = GPLv2
>>  CHECKPOLICY_LICENSE_FILES = COPYING
>> +LIBSELINUX_INSTALL_STAGING = YES
>
> I'd suggest moving the staging install to the libselinux package and
> have it selectively set if Checkpolicy's target package is enabled.
>

I did a build test but didn't have hardware available to execute.  I
did however verify the checkpolicy app's arch and location in the
target folder were correct.

Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
