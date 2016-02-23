From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 24 Feb 2016 00:55:41 +0100
Subject: [Buildroot] [PATCH] linux: don't add to toolchain dependency
In-Reply-To: <20160222131901.3baa956e@free-electrons.com>
References: <1456141244-624-1-git-send-email-gustavo@zacarias.com.ar>
 <20160222131901.3baa956e@free-electrons.com>
Message-ID: <56CCF17D.2030508@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/22/16 13:19, Thomas Petazzoni wrote:
> Gustavo,
> 
> Cc'ing Yann.
> 
> On Mon, 22 Feb 2016 08:40:44 -0300, Gustavo Zacarias wrote:
> 
>> diff --git a/linux/linux.mk b/linux/linux.mk
>> index 7e20255..dc1c79e 100644
>> --- a/linux/linux.mk
>> +++ b/linux/linux.mk
>> @@ -8,6 +8,9 @@ LINUX_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
>>  LINUX_LICENSE = GPLv2
>>  LINUX_LICENSE_FILES = COPYING
>>  
>> +# Used when BR2_KERNEL_HEADERS_AS_KERNEL=y
>> +LINUX_ADD_TOOLCHAIN_DEPENDENCY = NO
> 
> This is annoying, because we *do* need the toolchain dependency to
> build the Linux kernel. I think we would rather need to do:
> 
> LINUX_HEADERS_PATCH_DEPENDENCIES = linux-patch

 Well, _PATCH_DEPENDENCIES already does that:

# Order-only dependency
$$($(2)_TARGET_PATCH):  | $$(patsubst %,%-patch,$$($(2)_FINAL_PATCH_DEPENDENCIES))


 The problem identified by Gustavo doesn't happen in a normal build, it's only
when you do make source. That's because for source we use:

$(1)-all-source:        $(1)-source
$(1)-all-source:        $$(foreach
p,$$($(2)_FINAL_ALL_DEPENDENCIES),$$(p)-all-source)


 I have to think a bit more about possible solutions. But the good thing is that
it's less important: a normal build will still work without warning, and make
source will also still work and have all the packages, it just has a warning
that is not so nice. So if it doesn't get fixed for 2016.02 it's no disaster.


 Regards,
 Arnout

> 
> Though I'm not sure how great it is to have a non-package listed in the
> <pkg>_DEPENDENCIES variable. Surely it might break graph-depends and
> other similar tooling.
> 
> Thomas
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
