From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 7 Nov 2018 23:26:32 +0100
Subject: [Buildroot] [PATCH 2/3] graph-depends: split off
 get_version/get_depends into pkgutil.py
In-Reply-To: <20181107193903.GC4702@scaer>
References: <20170203205745.14488-1-patrickdepinguin@gmail.com>
 <20170203205745.14488-4-patrickdepinguin@gmail.com>
 <20181107180753.GA4702@scaer>
 <CAAXf6LVC==B0Rb7-ZpDh=k2VyF4UJZYaamQ0hhhZzpS6z=Syrg@mail.gmail.com>
 <20181107193903.GC4702@scaer>
Message-ID: <0bc9de12-ac88-89ad-c48b-06c75c475e16@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07/11/18 20:39, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2018-11-07 20:06 +0100, Thomas De Schampheleire spake thusly:
>> El mi?., 7 nov. 2018 a las 19:07, Yann E. MORIN
>> (<yann.morin.1998@free.fr>) escribi?:
>>> On 2017-02-03 21:57 +0100, Thomas De Schampheleire spake thusly:
>>>> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>>>>
>>>> Functions to obtain the version and dependencies of a package from Python
>>>> can be useful for several scripts. Extract this logic out of graph-depends
>>>> into pkgutil.py.
>>>
>>> Coming back to this script, because I'm rewriting the way graph-depends
>>> gets the dependency tree. When you said "useful for several scripts,"
>>> did you expect it to be useful to scripts that are not in Buildroot
>>> (e.g. user-local scripts)?
>>
>> Yes, exactly. We are using the logic from pkgutil from another python
>> script and want to avoid code duplication.
>> This particular script is not something that upstream accepts, i.e.
>> generating opkg files for specific packages (and for that, we need to
>> know the dependencies and versions of each package).
> 
> So, if you were to get a new function that would return basically the
> same, but in another format, but much quicker (~4s instead of ~45s),
> would that be something you could adapt to?
> 
> I'm changing the way the dependency tree is extracted from the Makefile
> data, and the function now has this API (function name yet to be
> bike-shedded about):

 Let me take this opportunity to bikeshed on this right away :-)

> 
>     dict_deps, dict_types = get_dependency_tree(direction)

 I like the function name! However...

> 
> where:
> 
>   - direction is either string 'forward' or 'back',

 I would make this a boolean argument:

def get_dependency_tree(backward: bool = True) -> Dict[str, Package]:

 Note however that it is trivial to populate the backward dependencies once you
have the forward ones, so I'm not sure its worth it to make the distinction.

> 
>   - dict_deps is a dictionnary, which keys are the package names, and
>     which values are lists of packages that are direct dependencies of
>     the key package (basically, what get_all_depends() currently
>     returns, but the whole dependency tree)
> 
>   - dict_types is a dictionnary, which keys are the package names, and
>     the values are string representing whtehr the packages are target or
>     host, and virtual or not, e.g.: 'target', 'target-virtual', 'host',
>     'host-virtual'.

 I would take this opportunity to create a class Package with members:

name: str                  # Package name including hsot- prefix
dependencies: Set[Package] # Forward dependencies
dependencies_backwards: Set[Package] # Backward dependencies
virtual: bool              # If true, it's a virtual package
host: bool                 # If true, it's a host package
version: str               # Package version

 The __init__ would set name, virtual, host, version. The dependencies are added
dynamically, and whenever you add one you do it in both directions.


 Regards,
 Arnout


> If needed, I could very easily make it return a three-tuple, with the
> third one being dict_versions, keyed by package names, with values the
> package version.
> 
> Would that be something that would be usable in your use case?
> 
> Regards,
> Yann E. MORIN.
> 
