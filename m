From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 14 Sep 2019 19:27:28 +0200
Subject: [Buildroot] [PATCH v4 2/5] autobuild-run: initial
 implementation of get_reproducibility_failure_reason()
In-Reply-To: <CABM+sgr=8VsKDqJbfNzrRvzPx+hz2Ke-AK57LhQ0da9hyXjc8A@mail.gmail.com>
References: <20190820145231.15507-1-itsatharva@gmail.com>
 <20190820145231.15507-2-itsatharva@gmail.com>
 <c73a2826-6935-169b-fe2a-836848b225e3@mind.be>
 <CABM+sgr=8VsKDqJbfNzrRvzPx+hz2Ke-AK57LhQ0da9hyXjc8A@mail.gmail.com>
Message-ID: <7d168bb8-b7b0-a80d-f193-ebfe514cc1b4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/09/2019 14:47, Atharva Lele wrote:
> On Sun, Sep 8, 2019 at 10:36 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>  Hi Atharva,
>>
>>  I'm very sorry that I'm so late reviewing this...
>>
>> On 20/08/2019 16:52, Atharva Lele wrote:
[snip]
>>> +            def cleanup(l):
>>> +                # Takes a list and removes data which is redundant (source2) or data
>>> +                # that might take up too much space (like huge diffs).
>>> +                if "unified_diff" in l:
>>> +                    l.pop("unified_diff")
>>
>>  Condition can be avoided with
>>
>>  l.pop("unified_diff", None)
>>
>> (or maybe that's only python3? I'm not used to legacy python any more :-)
>>
> 
> That is valid for dictionaries, even in python2. However, we are
> passing a list element to cleanup() and list.pop() only takes in 1
> argument i.e. the index.

 Err, but if it is a list, it would give us a TypeError, because list.pop()
takes an index as argument, not a value...

[snip]
>>  This cleanup has nothing to do with getting the failure reason. I think it
>> would be better to do it in a separate function (and a separate patch). Also,
>> I'm not really happy yet with this diff cleanup, because we loose all context
>> information. So maybe, for now, it's better to just use the --max-report-size
>> option.
>>
> 
> You're right, until we find a way to save context its better to use
> --max-report-size. What about the issue that it truncates diff output?

 I've never seen how exactly it truncates. If you have a really large diff, do
you just get - lines? Or is it slightly more intelligent and do you get both -
and + lines?

 Regardless, I don't think the current solution is that much better, so for now
I'd keep using the max-report-size option.



 Regards,
 Arnout

[snip]
