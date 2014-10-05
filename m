From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 5 Oct 2014 14:31:40 +0200
Subject: [Buildroot] [PATCH 00 of 15] packages: rename FOO_BAR_OPT into
	FOO_BAR_OPTS
In-Reply-To: <20141005091735.GD4220@free.fr>
References: <patchbomb.1411846357@localhost>
 <20141004190749.2a9c9e31@free-electrons.com>
 <20141005091735.GD4220@free.fr>
Message-ID: <CAAXf6LWxeJ-ROTEHQOWRz6M=LO-+Rbnu4actatHd9pwkACgzKQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, Thomas,

On Sun, Oct 5, 2014 at 11:17 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Thomas2, All,
>
> On 2014-10-04 19:07 +0200, Thomas Petazzoni spake thusly:
>> On Sat, 27 Sep 2014 21:32:37 +0200, Thomas De Schampheleire wrote:
>> >   .mk files: remove alignment of line continuation characters
>> >   .mk files: remove alignment of assignments
>>
>> On those ones, I must say I'm not sure. Do we really have a coding
>> style for line continuation characters? In some cases, I found the
>> original code (i.e before your patch) to actually be nicer than after
>> your change.
>
> Well, I do like alignment of \, because it is easier to see the lines
> are a single block.
>
> But I prefer consistency.
>
>> For the alignment of assignments, I generally agree, but:
>>
>>  1/ I believe there should be exceptions to the rules. Especially
>>  inside the package infrastructure themselves, aligning = signs is
>>  sometimes good for readability
>>
>>  2/ Your regex doesn't handle cases such as:
>>
>> FOO         ?=
>> BAR         ?= $(SOMETHING)
>>
>>     The second assignment gets changed, but not the first one.
>>
>> So on those last two patches, I'd like to have more community feedback.
>
> Being consistent is nice. However, I find a bulk clean-up is very
> complex to do:
>
>   - as you found, some assignments were not cleaned-up; it is difficult
>     to find a pattern that matches all cases, and has no false-positives;

In this case I think it's not that hard. The issue pointed to by
Thomas is indeed an oversight, but one that can be fixed quite easily.

>
>   - it is difficult to review, because of the sheer amount of changes in
>     a single patch.
>
> So I would prefer we fix offenders whenever there is another patch being
> done for it. For example, when a version is bumped, a preliminary patch
> would introduce the cleanup (with the first two changes possibly being
> conflated in a single patch if it is easy to review):
>
>     foo: remove backslash alignment
>     foo: remove assignments alignment
>     foo: bump version
>
> This is something very easy to do, and review.

You mentioned above that reviewing a bulk change in one patch is
difficult. I understand, but rather I'd call it 'boring' and
'time-intensive' rather than 'difficult' because the changes are
trivial.

Regarding your suggested alternative, doing the same changes but split
per package and 'when the time is right' (i.e. someone needs to make a
change to that same package), my opinion is:

a. making the change 'when the time is right' has as disadvantages that:
   - not every developer will notice this issue and does do the alignment fixes
   - it causes a long timeframe of inconsistency: some packages have
alignment, some don't, and given that many people copy/paste from
other examples it leaks the 'wrong' behavior to new developments.
   Review is a solution to both issues, but it is easy to miss some
things (for the first one especially since the change in the package
may not touch any of the misaligned lines).

b. the split-patch approach could also be done in bulk, i.e. I could
just as easily do a bulk replacement now and make patches per package.
Of course it would be many patches (138 for the assignment alignment,
58 for the line continuation) at once which all need to be reviewed.
However, since they're split per package it is more easy to review at
several moments (spread over a few days for example) and to spread the
effort over several developers.

In summary, I tend to prefer a bulk change (in one or multiple
patches, I don't mind) to have consistency in one go. The same
approach was taken for the Config.in comments I once changed
(toolchain options etc.)

Best regards,
Thomas
