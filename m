From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 8 May 2014 22:03:15 +0200
Subject: [Buildroot] [PATCH] toolchain package: set version as 'virtual'
 instead of 'undefined'
In-Reply-To: <536B7FD0.8080002@mind.be>
References: <0533846efc9952901283.1399373479@argentina>
 <20140506140745.1b072d2c@skate>
 <3dba42f3-d595-4415-bd38-3220738fe4b6@email.android.com>
 <CAAXf6LUKatxzDZOWC4tWq28rS3m_BcYT7Zg80Ea5HDz-C0O=nQ@mail.gmail.com>
 <d2a5d78d-c512-4fad-ae86-fbb5bcc42d8f@email.android.com>
 <CAAXf6LX19u3q95iMO5sUReKPdHwiuAnup0mXFJN2_-14mqnOMw@mail.gmail.com>
 <536B40EF.7060700@mind.be>
 <CAAXf6LW8niwU+9y=erwUnrdbgj4JtP5mNKWZ+CJpAg6zS+8zUQ@mail.gmail.com>
 <536B53F9.6090906@mind.be>
 <CAAXf6LUc0UaVj5mshvk4J0tH8+7LfqbPZegLiRnn6hN_jyo6Tg@mail.gmail.com>
 <536B7FD0.8080002@mind.be>
Message-ID: <CAAXf6LVRvqZxy-J342K8ZZa=7X+vdjigJ9UircBeHpTOFSgNYQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, May 8, 2014 at 3:00 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 08/05/14 13:37, Thomas De Schampheleire wrote:
>> On Thu, May 8, 2014 at 11:52 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>> On 08/05/14 11:28, Thomas De Schampheleire wrote:
>>>> Hi Arnout,
>>>>
>>>> On Thu, May 8, 2014 at 10:31 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>>
>>> [snip]
>>>>>  I repeat my earlier statement: within a function that is supposed to be
>>>>> eval'ed, *everything* should be $$'ed except the function arguments and except
>>>>> some very specific cases.
>>>>>
>>>>
>>>> But in the case of host variables being set based on target variables
>>>> if there is no explicit host variable, as for the _VERSION, there
>>>> would be a recursive assignment as $(2) == $(3).
>>>
>>> True; if you set
>>> $(2)_VERSION = $$(subst /,_,$$($(3)_VERSION))
>>>
>>> that will expand to
>>> PKG_VERSION = $$(subst /,_,$$(PKG_VERSION))
>>>
>>> in the eval, which is indeed recursive.
>>>
>>> But that can be solved with a simple:
>>>
>>> $(2)_VERSION := $$(subst /,_,$$($(3)_VERSION))
>>>
>>> Fortunately, make is smart enough to break the recursion even if PKG_VERSION had
>>> been assigned with = before.
>>>
>>>> So statement   $(2)_VERSION = $$(subst /,_,$($(3)_VERSION))
>>>> should become   $(2)_VERSION := $$(subst /,_,$($(3)_VERSION))
>>>
>>>  No, that doesn't make a difference, because the $(MYPKG_VERSION) is still
>>> expanded too early.
>>>
>>
>> I'm pretty sure I said this before, but all these $$$$'s are making me dizzy...
>> :-D
>
>  There shouldn't be a need for 4 $$$$'s. The ones in pkg-autotools could be avoided.
>

Quick update: I implemented the suggested approach and it seems to
work. I need to do some further testing though.

One question: for some variables, two dollar signs aren't really
needed, for example HOST_DIR, TARGET_DIR, DISABLE_NLS, QUIET, etc. as
the value of these variables are fixed and independent of the actual
package.
The usage of single vs. double dollar signs is inconsistent for such variables.
Should we use single ones (as doubles aren't necessary) or should we
use double dollars to avoid confusion?

Thanks,
Thomas
