From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 5 Apr 2018 00:28:52 +0200
Subject: [Buildroot] Per-package download folders and Git caching
In-Reply-To: <20180403204820.GF2335@scaer>
References: <20180403141703.21cd24fe@windsurf>
 <041a5a2a-3f9d-c76e-4c6d-d22ef11cad43@mind.be>
 <876058qvi4.fsf@dell.be.48ers.dk> <20180403162324.GB2335@scaer>
 <87k1top74p.fsf@dell.be.48ers.dk> <20180403174904.GE2335@scaer>
 <22d8a943-fdb2-f6ab-d81e-d9e0cc9b4df5@mind.be> <20180403204820.GF2335@scaer>
Message-ID: <c1e020fa-ddcf-380d-990e-b7ba29d8783c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03-04-18 22:48, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2018-04-03 22:44 +0200, Arnout Vandecappelle spake thusly:
>> On 03-04-18 19:49, Yann E. MORIN wrote:
>>> Peter, All,
>>>
>>> On 2018-04-03 18:49 +0200, Peter Korsgaard spake thusly:
>>>>>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>>>>  > Should we do a cp if ln fails, then?
>>>> That sounds like a sensible fallback, yes.
>>>
>>> I was about to do so, but then we're back to a situation where we have
>>> to guarantee the atomicity.
>>>
>>> This is currently possible, because the dl-wrapper now runs under flock.
>>> But we are going to optimise the locking with a more fine-grained
>>> solution soonish.
>>>
>>> To be noted: the current code is not atomic-safe either, because we do
>>> have a TOCTTOU situation...
>>>
>>> So, we'll have to again play tricks with atomicity...
>>>
>>> We can't use flock again, because the destination directory is already
>>> locked, and there is not destination file to lock to start with...
>>>
>>> So, maybe the full solution will in fact to really implement the more
>>> fine-grained solution... I'll see to it.
>>
>>  Note that for the specific case I mentioned (hardlinks may not work over samba
>> or VM shares), flock will fail as well...
> 
> Wait... So you're saying that we borked a working situation for a certain
> class of users, now? Damn... :-/
> 
> And why would flock fail on those (curious)?

 As I remember, flock(2) doesn't work on Samba (or NFS for that matter). I
couldn't find any real reference for that, however, just some unanswered SO
question [1]. And since flock(1) uses flock(2)...

 That said, Samba _does_ support fcntl(2), so I don't see why it wouldn't
support flock(2)...

 Regards,
 Arnout

[1]
https://stackoverflow.com/questions/47632116/does-cifs-byte-range-locking-work-across-multiple-linux-client-nodes-with-window

>>  Maybe we should just wait until someone complains so they can test whatever
>> solution we come up with.
> 
> In the end, yes, probably...
> 
> Regards,
> Yann E. MORIN.
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
