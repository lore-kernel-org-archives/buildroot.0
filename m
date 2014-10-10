From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 10 Oct 2014 10:15:12 +0100
Subject: [Buildroot] [PATCH] kmod: add host-automake dependency
In-Reply-To: <20141010110634.2ef7a7a5@free-electrons.com>
References: <1412930455-40512-1-git-send-email-Vincent.Riera@imgtec.com>
 <20141010110634.2ef7a7a5@free-electrons.com>
Message-ID: <5437A3A0.2040600@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On 10/10/2014 10:06 AM, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
>
> On Fri, 10 Oct 2014 09:40:55 +0100, Vicente Olivert Riera wrote:
>> kmod can fail to build in systems which have old automake versions like
>> CentOS 6.5, for instance. It will cause an error like this one:
>>
>> /buildroot/output/build/kmod-18/build-aux/missing: line 81:
>> aclocal-1.14: command not found
>>
>> Adding host-automake as a dependency fixes the problem.
>>
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>> Reviewed-by: Markos Chandras <Markos.Chandras@imgtec.com>
>> ---
>>   package/kmod/kmod.mk |    4 ++--
>>   1 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
>> index 1f170dd..c0212bb 100644
>> --- a/package/kmod/kmod.mk
>> +++ b/package/kmod/kmod.mk
>> @@ -8,8 +8,8 @@ KMOD_VERSION = 18
>>   KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
>>   KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod
>>   KMOD_INSTALL_STAGING = YES
>> -KMOD_DEPENDENCIES = host-pkgconf
>> -HOST_KMOD_DEPENDENCIES = host-pkgconf
>> +KMOD_DEPENDENCIES = host-automake host-pkgconf
>> +HOST_KMOD_DEPENDENCIES = host-automake host-pkgconf
>>
>>   # license info for libkmod only, conditionally add more below
>>   KMOD_LICENSE = LGPLv2.1+
>
> This seems wrong. Why not use KMOD_AUTORECONF = YES instead?

I have tried it and it fails:

 >>> kmod 18 Autoreconfiguring
libtoolize: putting auxiliary files in AC_CONFIG_AUX_DIR, `build-aux'.
libtoolize: copying file `build-aux/ltmain.sh'
libtoolize: putting macros in AC_CONFIG_MACRO_DIR, `m4'.
libtoolize: copying file `m4/libtool.m4'
libtoolize: copying file `m4/ltoptions.m4'
libtoolize: copying file `m4/ltsugar.m4'
libtoolize: copying file `m4/ltversion.m4'
libtoolize: copying file `m4/lt~obsolete.m4'
libkmod/docs/gtk-doc.make:270: error: HAVE_GTK_DOC does not appear in 
AM_CONDITIONAL
libkmod/docs/Makefile.am:33:   'libkmod/docs/gtk-doc.make' included from 
here

And also, if the kmod-0002-add-backup-implementation-of-be32toh.patch 
modifies the configure.ac file, and there is no KMOD_AUTORECONF = YES in 
the kmod.mk file, why don't we clean that patch by removing the 
configure.ac bit?

Regards,

-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Processor IP
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
