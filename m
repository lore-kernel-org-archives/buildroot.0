From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 8 Oct 2018 17:54:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/dtc: fix include guards for
 older kernel/u-boot
In-Reply-To: <CANQCQpYouTTsJGm6VjpCgdZ54agG0jktaNPwB9my88g_dL_Bsw@mail.gmail.com>
References: <20181008115146.17797-1-lothar.felten@gmail.com>
 <CANQCQpYouTTsJGm6VjpCgdZ54agG0jktaNPwB9my88g_dL_Bsw@mail.gmail.com>
Message-ID: <0e0b709b-024a-9e77-a9d4-4bd58289edf0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 8/10/18 15:10, Matthew Weber wrote:
> Lothar,
> 
> 
> On Mon, Oct 8, 2018 at 6:52 AM Lothar Felten <lothar.felten@gmail.com> wrote:
>>
>> Patch dtc to accept libfdt include guards with and without leading underscore.
>> A compiler warning is added to notify the user.
>>
>> Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
>> ---
>>  ...de-guards-for-older-kernel-u-boot-sources.patch | 42 ++++++++++++++++++++++
>>  1 file changed, 42 insertions(+)
>>  create mode 100644 package/dtc/0001-Fix-include-guards-for-older-kernel-u-boot-sources.patch
>>
>> diff --git a/package/dtc/0001-Fix-include-guards-for-older-kernel-u-boot-sources.patch b/package/dtc/0001-Fix-include-guards-for-older-kernel-u-boot-sources.patch
>> new file mode 100644
>> index 0000000000..40cb0bdb2a
>> --- /dev/null
>> +++ b/package/dtc/0001-Fix-include-guards-for-older-kernel-u-boot-sources.patch
>> @@ -0,0 +1,42 @@
>> +From b1f8b84489c96465b63485b884238b61d31ca84d Mon Sep 17 00:00:00 2001
>> +From: Lothar Felten <lothar.felten@gmail.com>
>> +Date: Mon, 8 Oct 2018 13:29:44 +0200
>> +Subject: [PATCH 1/1] Fix include guards for older kernel/u-boot sources
>> +
>> +Linux kernels before 4.17 and U-Boot versions before 2018.07 use libfdt include guards with leading underscores.
>> +Those have been removed in dtc-1.4.7.
> 
> Is there an reference that could be listed to either
> 1) A upstream mailinglist/patchwork link that proposes adding this patch
> 2) If the patch below can't be upstreamed, a reference to the commit
> that is reverting this support you're adding back in and maybe a
> summary of why the backwards compatibility isn't' accepted.

 I expect that it is not acceptable for upstream because this is only needed
when you include *both* libfdt.h from dtc and the one from the local copy, which
is clearly completely bogus. It happens due to bugs in the build system of
u-boot and of the beaglebone fork of the kernel (AFAIK it doesn't happen with
any upstream kernel version).

 So "fixing" it like this is really a workaround for broken u-boot/kernel that
is only applicable to Buildroot, because we have no easy way to generically
apply patches to u-boot/kernel while we can easily do it for dtc.

 Lothar, if you agree with the above analysis, could you include that in the
commit message of 0001-Fix-include-guards-for-older-kernel-u-boot-sources.patch ?

 Also:

- please wrap the commit message of the patch itself at 72 columns as well;

- please number it properly, i.e. it should have number 2 instead of 1. Patch 1
was committed almost a month ago...

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
