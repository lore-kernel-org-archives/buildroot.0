From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 7 Nov 2017 21:42:31 +0100
Subject: [Buildroot] [PATCH v2 2/2] security hardening: add RELFO,
 FORTIFY options
In-Reply-To: <20171107193127.GX1829@waldemar-brodkorb.de>
References: <1508936397-33651-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1508936397-33651-2-git-send-email-matthew.weber@rockwellcollins.com>
 <e29b21b0-6c5f-ef3b-4123-9e8782639f43@mind.be>
 <CANQCQpZ4kVabQPuCNjazZdMB_O-jUxoOFzALR=CKZh5x36pwKQ@mail.gmail.com>
 <CANQCQpZekGq2j7d0KJ=gaJSKUe8YBHm-G8QLyTiMJmsdv7r02A@mail.gmail.com>
 <00a38063-e166-6ba4-6927-b90285ce031e@mind.be>
 <20171107193127.GX1829@waldemar-brodkorb.de>
Message-ID: <a299aee3-6f93-b07e-a659-12ea9a2395bc@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07-11-17 20:31, Waldemar Brodkorb wrote:
> Hi Arnout,
> Arnout Vandecappelle wrote,
> 
>>>>> Do you know how these behave in uClibc and musl? Waldemar, any idea?
>>>>> Obviously
>>>>> the gcc part will still be activated, which covers about half of the
>>>>> functionality.
>>>>>
>>>>
>>>> Checking on the answer, but we ran through the complete test-pkg build list.
>>>> I'll see which were skipped. We didn't see specific failures.
>>>>
>>>
>>> The set of test packages I used ended up forcing a glibc only test-pkg
>>> build.  I'll rerun with a basic busybox scenario.
>>
>>  It will build, that's for sure. My question is: will it actually do anything
>> useful? The effect of fortify is shared a bit between GCC and glibc. E.g.
>> 'memset' has a GCC implementation (used when it can be inlined) and a glibc
>> implementation (used when it's too big or unpredictable). As far as I can see,
>> neither uClibc nor musl have support for FORTIFY. So only the GCC part will take
>> effect. But I think that that is so little that it's hardly worth it.
> 
> I can confirm uClibc-ng does not support FORTIFY security
> mechanisms.
> There is some old unused code since
> 82098ab9b853c33ee8ade61c9510b295cc696de1, but I am considering
> removing it, because it is unused and incomplete.

 So I did a little bit more research [1], and it looks like a significant part
of the FORTIFY support comes from gcc. However, the gcc support is only
activated if the appropriate header is included that replaces memcpy with
__builtin___memcpy_chk etc.

 In addition, GCC's check will call __fortify_fail if the check fails. So you
can easily find out if it's supported: does the libc define __fortify_fail or
not? Neither uClibc nor musl does.

 In short, the fortify options should depend on glibc.

 Regards,
 Arnout

[1] https://access.redhat.com/blogs/766093/posts/1976213
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
