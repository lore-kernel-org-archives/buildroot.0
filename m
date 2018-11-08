From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 8 Nov 2018 09:01:17 +0100
Subject: [Buildroot] [PATCH 2/3] graph-depends: split off
 get_version/get_depends into pkgutil.py
In-Reply-To: <20181107224512.GF4702@scaer>
References: <20170203205745.14488-1-patrickdepinguin@gmail.com>
 <20170203205745.14488-4-patrickdepinguin@gmail.com>
 <20181107180753.GA4702@scaer>
 <CAAXf6LVC==B0Rb7-ZpDh=k2VyF4UJZYaamQ0hhhZzpS6z=Syrg@mail.gmail.com>
 <20181107193903.GC4702@scaer> <0bc9de12-ac88-89ad-c48b-06c75c475e16@mind.be>
 <20181107224512.GF4702@scaer>
Message-ID: <79d703e1-ef04-030a-cf03-3386e7f890f6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07/11/18 23:45, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2018-11-07 23:26 +0100, Arnout Vandecappelle spake thusly:
>> On 07/11/18 20:39, Yann E. MORIN wrote:
>>> I'm changing the way the dependency tree is extracted from the Makefile
>>> data, and the function now has this API (function name yet to be
>>> bike-shedded about):
>>  Let me take this opportunity to bikeshed on this right away :-)
> 
> If that were not you, then who else? ;-)
> 
>>>     dict_deps, dict_types = get_dependency_tree(direction)
>>  I like the function name! However...
> 
> Oh come on, that *is* the most important thing! ;-)
> 
>>> where:
>>>
>>>   - direction is either string 'forward' or 'back',
>>  I would make this a boolean argument:
>> def get_dependency_tree(backward: bool = True) -> Dict[str, Package]:
> 
> Just for my own understanding: what syntax is that? I was trying to write
> the protoype of the function, but in Python there is no prototype where
> you can explain the return type. Yours seems like it is what I was
> looking for. Is it described somewhere?

 Those are type annotations. They don't do anything by themselves, but they can
be used by other tools/libraries to do static type checking.

 Of course, they can't be used in Python 2.ancient so you can't actually use
them in graph-depends, but it's a good way of documenting the intention.

 For documentation, I'll refer to PEP 484 [1].

> (See how I'm trying to sidetrack you into not bikeshedding? ;-))
> 
>>  Note however that it is trivial to populate the backward dependencies once you
>> have the forward ones, so I'm not sure its worth it to make the distinction.
> 
> I was also thinking about that too.
> 
>>>   - dict_deps is a dictionnary, which keys are the package names, and
>>>     which values are lists of packages that are direct dependencies of
>>>     the key package (basically, what get_all_depends() currently
>>>     returns, but the whole dependency tree)
>>>
>>>   - dict_types is a dictionnary, which keys are the package names, and
>>>     the values are string representing whtehr the packages are target or
>>>     host, and virtual or not, e.g.: 'target', 'target-virtual', 'host',
>>>     'host-virtual'.
>>
>>  I would take this opportunity to create a class Package with members:
>>
>> name: str                  # Package name including hsot- prefix
>> dependencies: Set[Package] # Forward dependencies
>> dependencies_backwards: Set[Package] # Backward dependencies
>> virtual: bool              # If true, it's a virtual package
>> host: bool                 # If true, it's a host package
>> version: str               # Package version
> 
> Meh, I was thinking about exactly the same thing, but it is quite an
> invasive change.

 I would think that the invasive change you're about to do is the ideal occasion
to do this one :-)

> But let me bikeshed in turn: I would make your proposed
> 'host' field an enum instead,

 Python enums require an external package that we can't assume is installed. But
I suppose you didn't mean an actual enum :-P

> because we don't have only packages, but
> also rootfs. So I would have 'kind' (or 'type' if that's not reserved?)
> which could be one of 'target','host', or 'rootfs'.

 Sounds good to me. 'kind' is better than 'type' IMHO.


>>  The __init__ would set name, virtual, host, version. The dependencies are added
>> dynamically, and whenever you add one you do it in both directions.
> 
> Yep.
> 
> Dang, I'm always getting side-tracked into side topics. All I wanted was
> a faster graph-depends, and it's already there now! Sob... ;-)

 Feel free to ignore my feedback! I'll take progress over perfection any time.

 Regards,
 Arnout

[1] https://www.python.org/dev/peps/pep-0484
