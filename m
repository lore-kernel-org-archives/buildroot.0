From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 09 May 2014 00:18:34 +0200
Subject: [Buildroot] [PATCH] toolchain package: set version as 'virtual'
 instead of 'undefined'
In-Reply-To: <CAAXf6LVRvqZxy-J342K8ZZa=7X+vdjigJ9UircBeHpTOFSgNYQ@mail.gmail.com>
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
 <CAAXf6LVRvqZxy-J342K8ZZa=7X+vdjigJ9UircBeHpTOFSgNYQ@mail.gmail.com>
Message-ID: <536C02BA.1070305@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/05/14 22:03, Thomas De Schampheleire wrote:
> On Thu, May 8, 2014 at 3:00 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 08/05/14 13:37, Thomas De Schampheleire wrote:
>>> On Thu, May 8, 2014 at 11:52 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>>> On 08/05/14 11:28, Thomas De Schampheleire wrote:
>>>>> Hi Arnout,
>>>>>
>>>>> On Thu, May 8, 2014 at 10:31 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>>>
>>>> [snip]
>>>>>>  I repeat my earlier statement: within a function that is supposed to be
>>>>>> eval'ed, *everything* should be $$'ed except the function arguments and except
>>>>>> some very specific cases.
>>>>>>
>>>>>
>>>>> But in the case of host variables being set based on target variables
>>>>> if there is no explicit host variable, as for the _VERSION, there
>>>>> would be a recursive assignment as $(2) == $(3).
>>>>
>>>> True; if you set
>>>> $(2)_VERSION = $$(subst /,_,$$($(3)_VERSION))
>>>>
>>>> that will expand to
>>>> PKG_VERSION = $$(subst /,_,$$(PKG_VERSION))
>>>>
>>>> in the eval, which is indeed recursive.
>>>>
>>>> But that can be solved with a simple:
>>>>
>>>> $(2)_VERSION := $$(subst /,_,$$($(3)_VERSION))
>>>>
>>>> Fortunately, make is smart enough to break the recursion even if PKG_VERSION had
>>>> been assigned with = before.
>>>>
>>>>> So statement   $(2)_VERSION = $$(subst /,_,$($(3)_VERSION))
>>>>> should become   $(2)_VERSION := $$(subst /,_,$($(3)_VERSION))
>>>>
>>>>  No, that doesn't make a difference, because the $(MYPKG_VERSION) is still
>>>> expanded too early.
>>>>
>>>
>>> I'm pretty sure I said this before, but all these $$$$'s are making me dizzy...
>>> :-D
>>
>>  There shouldn't be a need for 4 $$$$'s. The ones in pkg-autotools could be avoided.
>>
> 
> Quick update: I implemented the suggested approach and it seems to
> work. I need to do some further testing though.

 While you're at it, can you change the inner-virtual-package macro back to
$(2)_VERSION = virtual
(and remove the HOST_$(3)_VERSION)? The reason that it was needed originally is
exactly the missing $$ that you're fixing now.


> One question: for some variables, two dollar signs aren't really
> needed, for example HOST_DIR, TARGET_DIR, DISABLE_NLS, QUIET, etc. as
> the value of these variables are fixed and independent of the actual
> package.
> The usage of single vs. double dollar signs is inconsistent for such variables.
> Should we use single ones (as doubles aren't necessary) or should we
> use double dollars to avoid confusion?

 We should *always* use $$. I think I've said this before :-)

 The reasoning is: the number of situations where $$ is wrong is very, very
limited. By putting $$ by default, we avoid that someone _thinks_ that it's not
necessary, and years later it turns out that it was necessary. If you need an
example of such a situation: _VERSION :-)

 I've taken a look at the single-$ occurences in inner-generic-package, and
there are just a few that I think should not be changed:

- The $(pkgdir) calls that are used to calculate KCONFIG_VAR _may_ need single-$
(though I really think they don't).

- The arguments of generic-package itself _can_ be double-$$'ed, but it makes
parsing the makefile 4 times slower.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
