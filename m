From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 17 Jan 2017 22:56:37 +0100
Subject: [Buildroot] [PATCH] linux-headers: Account for
 LINUX_OVERRIDE_SRCDIR
In-Reply-To: <CAHQ1cqFH0aQcino8+3VLaK3f6ymZO9vFsQLMBcKi5oeeoK+c2A@mail.gmail.com>
References: <20170111195611.837-1-andrew.smirnov@gmail.com>
 <ecec3824-31cc-bcc0-ff85-bd7415cfee4e@mind.be>
 <CAHQ1cqEJ15w0WL+j0bZVWujjbR74PK-wsQgtUAKvCcGv8bPs_w@mail.gmail.com>
 <94849f83-cb05-e19c-6653-b5cadf2dbec4@mind.be>
 <CAHQ1cqFH0aQcino8+3VLaK3f6ymZO9vFsQLMBcKi5oeeoK+c2A@mail.gmail.com>
Message-ID: <fb3a95ca-947f-12ae-24f2-7fda73d6703b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13-01-17 17:19, Andrey Smirnov wrote:
> On Thu, Jan 12, 2017 at 2:18 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>
>> On 12-01-17 18:19, Andrey Smirnov wrote:
>>> On Thu, Jan 12, 2017 at 12:17 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>>>
>>>>
>>>> On 11-01-17 20:56, Andrey Smirnov wrote:
>>>>> Use the value of LINUX_OVERRIDE_SRCDIR as override directory when
>>>>> BR2_KERNEL_HEADERS_AS_KERNEL is specified.
>>>>
>>>>  Good catch! However, I'm not entirely convinced that we really want this.
>>>>
>>>>  A typical workflow would be to start from an upstream kernel, build a toolchain
>>>> and userspace with it, and then begin with hacking on the kernel to e.g. add a
>>>> driver. In that case it's rather unlikely that we really want to rebuild the
>>>> toolchain, because the headers don't change.
>>>>
>>>
>>> I agree that typical "good day" workflow would be just as you
>>> described. However, IMHO, there's also a "bad day" variant of that
>>> workflow where "hacking on the kernel" implies "hacking on kernel
>>> headers"(*cough* custom ioctls *cough*), which is also followed up by
>>> a user-space tool that uses those changes and as such has
>>> 'linux-headers' as a dependency.
>>
>>  Certainly, but in that specific case you can easily set both
>> LINUX_OVERRIDE_SRCDIR and LINUX_HEADERS_OVERRIDE_SRCDIR.
> 
> There doesn't seem to be any configuration option that requires the
> user to ever change the source of linux-headers, and this particular
> quirk doesn't seem to be described in OVERRIDE_SRCDIR section either,
> so how would I know that I need to do what you describe?
> 
> The only way that I see, which was precisely my personal experience,
> is to get my package built with incorrect version of the headers (best
> case scenario build failure, worst you go and debug "issues", that are
> really not and are just a result of a broken assumption about
> code-changes propagation) and then spend some quality time looking
> into Buildroot source and trying to understand what going on, and
> _then_ learn.
> 
> IMHO, this behavior of Buildroot is a _bug_ in either its
> documentation or source code, and I find it a bit confusing that so
> far we were discussing this as if it were a feature.

 Ack that it's a bug, but then the question is, what is the desired behaviour.
I'm still undecided (I hope some other core developers will speak up), but I
tend to prefer the current behaviour even if it is not necessarily intuitive
(though that actually depends on where you're coming from). As I in fact already
stated:


>>>>  That said, another possible scenario is that you don't configure any kernel
>>>> version but just use the OVERRIDE_SRCDIR to point to a local directory. Since we
>>>> removed the BR2_LINUX_KERNEL_CUSTOM_LOCAL, it's the only way to support that
>>>> scenario. In addition, the principle of least surprise would suggest that
>>>> BR2_KERNEL_HEADERS_AS_KERNEL would really work all the time, even if
>>>> LINUX_OVERRIDE_SRCDIR is set.

 Any additional arguments why your proposed behaviour is more desirable are
certainly welcome!


>>>>
>>>>  In short, I'm not really sure what is the best thing to do here. On thing though...
>>>>
>>>>
>>>>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>>>>> ---
>>>>>  package/linux-headers/linux-headers.mk | 1 +
>>>>>  1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
>>>>> index 0900778..197efb4 100644
>>>>> --- a/package/linux-headers/linux-headers.mk
>>>>> +++ b/package/linux-headers/linux-headers.mk
>>>>> @@ -10,6 +10,7 @@
>>>>>  ifeq ($(BR2_KERNEL_HEADERS_AS_KERNEL),y)
>>>>>
>>>>>  LINUX_HEADERS_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
>>>>> +LINUX_HEADERS_OVERRIDE_SRCDIR = $(LINUX_OVERRIDE_SRCDIR)
>>>>
>>>>  ... At least we should use ?= here so it is still possible to override each one
>>>> separately.
>>>>
>>>
>>> I am more than happy to replace '=' with '?=', but I have to ask, why
>>> would you ever want to do that? Why would you configure your build
>>> system such that kernel headers are "Same as kernel being build" and
>>> then set you kernel source and kernel header source to point at
>>> different locations?
>>
>>  Because the canonical way to work is that your BR2_LINUX_KERNEL_CUSTOM_REPO_URL
>> points to your custom repository, and you just use LINUX_OVERRIDE_SRCDIR while
>> doing the kernel development. So the application developers only use the updated
>> kernel after it's explicitly been released. The kernel developer typically
>> doesn't want to rebuild the toolchain when he switches on LINUX_OVERRIDE_SRCDIR.
>>
> 
> OK, I guess I'd argue that the kernel developer typically doesn't want
> to rebuild the toolchain when they do any minor kernel version change,
> not just when that version happened to be set to "custom", why does
> this have to be a special case?
> 
> Can't the speedup be accomplished by either "cp -r
> build/linux-headers-blah build/linux-headers-custom" or "override
> LINUX_HEADERS_OVERRIDE_SRCDIR = " without adding any special
> provisions for that?

 Both indeed work but are even more hackish and counter-intuitive. A little ?=
certainly doesn't hurt :-)


 Regards,
 Arnout

> 
> Thanks,
> Andrey
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
