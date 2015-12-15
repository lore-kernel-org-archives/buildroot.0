From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 15 Dec 2015 22:27:55 +0100
Subject: [Buildroot] [PATCH] graph-depends: optimize
	remove_transitive_deps()
In-Reply-To: <CAHXCMMKvh9k_i+g=DPFYAhLEh=+pMmK9Ev5D8mZzbJ-8ARWgdQ@mail.gmail.com>
References: <1450174901-30667-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20151215203702.GB3596@free.fr>
 <CAHXCMMKvh9k_i+g=DPFYAhLEh=+pMmK9Ev5D8mZzbJ-8ARWgdQ@mail.gmail.com>
Message-ID: <CAHXCMMJt8tAQd42oM_C578-rXvZ-74ersg6mS1mgS4Li82xcfA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 15, 2015 at 10:23 PM, Samuel Martin <s.martin49@gmail.com> wrote:
> Hi Thomas, Yann, all,
>
> On Tue, Dec 15, 2015 at 9:37 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>> Thomas, All,
>>
>> On 2015-12-15 11:21 +0100, Thomas Petazzoni spake thusly:
>>> For large configurations, the execution time of
>>> remove_transitive_deps() becomes really high, due to the number of
>>> nested loops + the is_dep() function being recursive.
>>>
>>> For an allyespackageconfig, the remove_extra_deps() function takes 334
>>> seconds to execute, and the overall time to generate the .dot file is
>>> 6 minutes and 39 seconds. Here is a timing of the different
>>> graph-depends steps and the overall execution time:
>>>
>>>   Getting dependencies:   42.5735 seconds
>>>   Turn deps into a dict:   0.0023 seconds
>>>   Remove extra deps:     334.1542 seconds
>>>   Get version:            22.4919 seconds
>>>   Generate .dot:           0.0197 seconds
>>>
>>>   real        6m39.289s
>>>   user        6m16.644s
>>>   sys 0m8.792s
>>>
>>> By adding a very simple cache for the results of is_dep(), we bring
>>> down the execution time of the "Remove extra deps" step from 334
>>> seconds to just 4 seconds, reducing the overall execution time to 1
>>> minutes and 10 seconds:
>>>
>>>   Getting dependencies:  42.9546 seconds
>>>   Turn deps into a dict:  0.0025 seconds
>>>   Remove extra deps:      4.9643 seconds
>>>   Get version:           22.1865 seconds
>>>   Generate .dot:          0.0207 seconds
>>>
>>>   real        1m10.201s
>>>   user        0m47.716s
>>>   sys 0m7.948s
>
> Impressive! :-)
>
>>
>> Wee! :-)
>>
>> Still, somme comments, see below...
>>
>> I did use the Python profiler to investigate:
>>     python -m cProfile -s cumulative support/scripts/graph-depends >foo.list
>>
>> Unfortunately, it is not possible to dump a text version to a file...  :-(
>> Or I'm too dumb for that. :-]
>>
>>> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>>> ---
>>>  support/scripts/graph-depends | 27 +++++++++++++++++++++++++++
>>>  1 file changed, 27 insertions(+)
>>>
>>> diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
>>> index 5f77038..d39306e 100755
>>> --- a/support/scripts/graph-depends
>>> +++ b/support/scripts/graph-depends
>>> @@ -237,16 +237,43 @@ for dep in dependencies:
>>>          dict_deps[dep[0]] = []
>>>      dict_deps[dep[0]].append(dep[1])
>>>
>>> +# Basic cache for the results of the is_dep() function, in order to
>>> +# optimize the execution time. The cache is a dict of dict of boolean
>>> +# values. The key to the primary dict is "pkg", and the key of the
>>> +# sub-dicts is "pkg2".
>>> +is_dep_cache = {}
>>> +
>>> +def is_dep_cache_insert(pkg, pkg2, val):
>>> +    if is_dep_cache.has_key(pkg):
>>
>>     if pkg in is_dep_cache
>>
>>> +        is_dep_cache[pkg].update({pkg2: val})
>>> +    else:
>>> +        is_dep_cache[pkg] = {pkg2: val}
>>> +
>>> +# Returns a tuple (r, val), where r is a boolean that indicates if a
>>> +# value was found in the cache or not, and val being the value found
>>> +# (only when r is True).
>>> +def is_dep_cache_lookup(pkg, pkg2):
>>> +    if is_dep_cache.has_key(pkg):
>>> +        if is_dep_cache[pkg].has_key(pkg2):
>>> +            return (True, is_dep_cache[pkg][pkg2])
>>> +    return (False, False)
>>
>> I think using exceptions is better:
>>
>>     return is_dep_cache[pkg][pkg2]
>>
>> Don't catch any exception, it'll be propagated up as usual, see below...
>
> Well, since this patch is about performance optimization, exception
> should be avoided because they are expensive [1].
>
> But in the end, the choice will also depends on the maintainability of
> one or the other option.
>

forgot the ref.:
[1] https://mail.python.org/pipermail/tutor/2003-January/019812.html

>>
>>>  # This function return True if pkg is a dependency (direct or
>>>  # transitive) of pkg2, dependencies being listed in the deps
>>>  # dictionary. Returns False otherwise.
>>>  def is_dep(pkg,pkg2,deps):
>>> +    (r, val) = is_dep_cache_lookup(pkg, pkg2)
>>> +    if r:
>>> +        return val
>>>      if pkg2 in deps:
>>>          for p in deps[pkg2]:
>>>              if pkg == p:
>>> +                is_dep_cache_insert(pkg, pkg2, True)
>>>                  return True
>>>              if is_dep(pkg,p,deps):
>>> +                is_dep_cache_insert(pkg, pkg2, True)
>>>                  return True
>>> +    is_dep_cache_insert(pkg, pkg2, False)
>>>      return False
>>
>> Here, I would have dome a bit differently:
>>
>>   - keep is_dep() untouched
>>   - rename is_dep() to is_dep_uncached()
>>   - add is_dep() as such:
>>
>>     def is_dep(pkg,pkg2,deps):
>>         try:
>>             return is_dep_cache_lookup(pkg,pkg2)
>>         except KeyError:
>>             val = is_dep_uncached(pkg, pkg2, deps)
>>             is_dep_cache_insert(pkg, pkg2, val)
>>             return val
>>
>> Not really tested, but should work I hope! ;-)
>>
>> Regards,
>> Yann E. MORIN.
>>
>>>  # This function eliminates transitive dependencies; for example, given
>>> --
>>> 2.6.4
>>>
>>
>> --
>> .-----------------.--------------------.------------------.--------------------.
>> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
>> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
>> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
>> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
>> '------------------------------^-------^------------------^--------------------'
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
> Regards,
>
> --
> Samuel



-- 
Samuel
