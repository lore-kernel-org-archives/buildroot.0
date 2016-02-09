From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 9 Feb 2016 23:43:16 +0100
Subject: [Buildroot] [PATCH v2] valgrind: fix musl compile
In-Reply-To: <20160209233103.3b3001be@gmx.net>
References: <1455051210-20712-1-git-send-email-ps.report@gmx.net>
 <56BA5D92.2090005@mind.be> <20160209231630.2f99e37f@gmx.net>
 <20160209233103.3b3001be@gmx.net>
Message-ID: <56BA6B84.2010003@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09-02-16 23:31, Peter Seiderer wrote:
> Hello Arnout,
> 
> (one more e-mail, hit the send button too early)
> 
> On Tue, 9 Feb 2016 23:16:30 +0100, Peter Seiderer <ps.report@gmx.net> wrote:
> 
>> Hello Arnout,
>>
>> On Tue, 9 Feb 2016 22:43:46 +0100, Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>> On 09-02-16 21:53, Peter Seiderer wrote:
[snip]
>>>> +diff --git a/coregrind/vg_preloaded.c b/coregrind/vg_preloaded.c
>>>> +index 2ea7a7a..e49c832 100644
>>>> +--- a/coregrind/vg_preloaded.c
>>>> ++++ b/coregrind/vg_preloaded.c
>>>> +@@ -56,7 +56,7 @@
>>>> + void VG_NOTIFY_ON_LOAD(freeres)( void );
>>>> + void VG_NOTIFY_ON_LOAD(freeres)( void )
>>>> + {
>>>> +-#  if !defined(__UCLIBC__) \
>>>> ++#  if !defined(__UCLIBC__) && defined(__GLIBC__) \
>>>
>>>  Adding defined(__GLIBC__) effectively excludes android (bionic), doesn't it?
> 
> Not sure about this one, I think it is o.k. for the buildroot case:
> - old behavior was __UCLIBC__ or __GLIBC__ is defined (!__UCLIBC__
>   means __GLIBC__ is defined)
> - new behavior is __UCLIBC__ or __GLIBC__ or MUSL_LIBC is defined,
>   so from !__UCLIBC__ follows __GLIBC__ or MUSL_LIBC, so the need
>   to check explicit for __GLIBC__ ...
> 
> Do I miss something? Not sure about the right solution for upstream...

 I did indeed mean for upstream. And also for buildroot in the longer term,
because at some point we _will_ start supporting a fourth libc.

 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
