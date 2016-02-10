From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 10 Feb 2016 21:06:03 +0100
Subject: [Buildroot] [PATCH 1/1] protobuf: fix detection of __atomic_*()
 built-ins
In-Reply-To: <1240623306.1965860.1455129747228.JavaMail.zimbra@datacom.ind.br>
References: <1453986515-9505-1-git-send-email-casantos@datacom.ind.br>
 <1455118392-3965-1-git-send-email-casantos@datacom.ind.br>
 <20160210165037.1b02b8ee@free-electrons.com>
 <1240623306.1965860.1455129747228.JavaMail.zimbra@datacom.ind.br>
Message-ID: <56BB982B.4050706@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10-02-16 19:42, Carlos Santos wrote:
> [Thanks, Zimbra, for messing rearranging the messages in the inbox, so I answer them in the wrong order].
> 
>> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
>> To: "Carlos Santos" <casantos@datacom.ind.br>
>> Cc: buildroot at buildroot.org, "henrique marks" <henrique.marks@datacom.ind.br>
>> Sent: Wednesday, February 10, 2016 1:50:37 PM
>> Subject: Re: [PATCH 1/1] protobuf: fix detection of __atomic_*() built-ins
> 
>> Hello,
>>
>> Thanks, this looks good, with one nit, see below.
>>
>> On Wed, 10 Feb 2016 13:33:12 -0200, Carlos Santos wrote:
>>
>>> diff --git
>>> a/package/protobuf/0002-configure.ac-check-if-libatomic-is-needed.patch
>>> b/package/protobuf/0002-configure.ac-check-if-libatomic-is-needed.patch
>>> new file mode 100644
>>> index 0000000..237bc71
>>> --- /dev/null
>>> +++ b/package/protobuf/0002-configure.ac-check-if-libatomic-is-needed.patch
>>> @@ -0,0 +1,34 @@
>>> +From 0883fa19d59ece19eec30937c65fd10162ef57b0 Mon Sep 17 00:00:00 2001
>>> +From: Carlos Santos <casantos@datacom.ind.br>
>>> +Date: Wed, 10 Feb 2016 12:54:43 -0200
>>> +Subject: [PATCH] configure.ac: check if libatomic is needed
>>> +
>>> +In Buildroot, to simplify things, we've decided to simply require gcc 4.8
>>> +as soon as the architectures has at least one __atomic_*() built-in
>>> +variant that requires libatomic.
>>> +
>>> +Since protobuf most likely only uses the 1, 2 and 4-byte variants, it
>>> +*could* technically build with gcc 4.7. This is probably not a big deal,
>>> +and we can live with requiring gcc 4.8 on PowerPC to build protobuf.
>>> +
>>> +Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
>>
>> The patch description should not mention Buildroot and not mention
>> Buildroot specific choices. It should be written as if you were going
>> to submit it upstream, i.e with a proper justification as to why
>> linking with libatomic may be needed.
> 
> This patch only exists to appease Buildroot but, anyway, I can rewrite the comment.
> 
>> And in fact, I'm even going to ask you to submit this patch upstream :-)
> 
> They don't need this. Their detection of the atomic built-ins already works without additional help.

 Clearly it doesn't work, or this wouldn't be needed...

 Except if they specifically want to exclude any architecture for which they
don't have their custom atomics implementation.

 By the way, you check for atomic_4, which happens to be a special case on
microblaze: it doesn't need -latomic for atomic_4, but it does for the others.
So if they do use any other atomic operation, it would be better to check for
atomic_2 or atomic_1 (or better yet, all of them).

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
