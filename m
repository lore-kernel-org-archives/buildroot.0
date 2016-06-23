From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 24 Jun 2016 00:22:08 +0200
Subject: [Buildroot] Allowing user to run ldconfig in post-build script
In-Reply-To: <20160616231551.6dec189b@itchy>
References: <1722059483.342813959.1466082436418.JavaMail.root@zimbra32-e6.priv.proxad.net>
 <1720572432.342833812.1466082726731.JavaMail.root@zimbra32-e6.priv.proxad.net>
 <20160616153710.12ef9233@free-electrons.com> <20160616214522.70ca9152@itchy>
 <20160616222854.6b20890a@free-electrons.com> <20160616231551.6dec189b@itchy>
Message-ID: <25334f8c-2107-6af1-1e16-a2365c5e5e05@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16-06-16 23:15, Eric Le Bihan wrote:
> Le Thu, 16 Jun 2016 22:28:54 +0200,
> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :
> 
>> On Thu, 16 Jun 2016 21:45:22 +0200, Eric Le Bihan wrote:
>>
>>>>> Not being able to run ldconfig and generate the ld.so cache has
>>>>> two drawbacks:
>>>>>
>>>>>  - it prevents the user from installing some libraries in other
>>>>> locations than /lib and /usr/lib (e.g. /opt/foo/lib). This can
>>>>> be solved with symlinks, though.      
>>>>
>>>> Does the dynamic linker uses /etc/ld.so.conf at runtime to find
>>>> other libraries, even if there is no /etc/ld.so.cache? If that's
>>>> the case, then our check for ld.so.conf being absent is somewhat
>>>> wrong, as it would be valid to have, independently of whether
>>>> ldconfig has created ld.so.cache or not.    
>>>
>>> Inspecting the glibc source code shows that:
>>>
>>>  - /etc/ld.so.conf is only read by ldconfig (see elf/ldconfig.c). 
>>>  - /etc/ld.so.cache is only read by the dynamic loader (see
>>> elf/dl-cache.c).  
>>
>> OK.
>>
>>> This is confirmed when using strace. So, IMHO, this sanity check is
>>> of no use.  
>>
>> If what you say above is true, then your conclusion is completely
>> wrong: the sanity check is *absolutely* mandatory.
>>
>> Since Buildroot does *NOT* generate ld.so.cache, and ld.so.conf is not
>> read by the dynamic loader, having a ld.so.conf in a Buildroot
>> filesystem is a mistake, as the user might thing that the dynamic
>> linker will search in the directories listed in ld.so.conf, but it is
>> not true: the dynamic linker only searches in the libraries referenced
>> in ld.so.cache, and ignores ld.so.conf.
> 
> OK. So the check is needed to get a clean target root file system,
> devoid of files which may mislead the user. However, it makes sense to
> provide a configuration entry to disable it, for the ld.so-savvy users
> who want to create the cache on their own, no?

 No, the check is there to be able to detect packages that create an ld.so.conf
(and run ldconfig) because they install libraries in non-default paths. This
will cause runtime errors, and we want to detect them at build time.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
