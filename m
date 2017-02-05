From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 5 Feb 2017 22:27:31 +0100
Subject: [Buildroot] [PATCH 2/3] graph-depends: split off
	get_version/get_depends into pkgutil.py
In-Reply-To: <20170205211308.GA3562@free.fr>
References: <20170203205745.14488-1-patrickdepinguin@gmail.com>
 <20170203205745.14488-4-patrickdepinguin@gmail.com>
 <20170205211308.GA3562@free.fr>
Message-ID: <CAAXf6LW+NGB4HrotxM8YCuW=UHDxkvL7bf2RNycJt=souyZ27A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Feb 5, 2017 at 10:13 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Thomas DS, All,
>
> On 2017-02-03 21:57 +0100, Thomas De Schampheleire spake thusly:
> [--SNIP--]
>> +import pkgutil
>
> So, I always claimed I was not a Python expoert, but should we not do:
>
>     from okgutil import get_versions get_depends
>
> of something similar?

Both methods are technically possible, and I think this is partially a
matter of personal/project preference, and partially some general
guidelines.
When using 'import foo', any symbol used from foo needs to be
qualified explicitly, i.e. foo.one, foo.two. You could consider it as
making a namespace accessible but keeping everything inside that
namespace.

With 'from foo import one, two' you allow future usages to be done
without referring to foo anymore. I consider it as 'using namespace
foo' in C++ terminology.

One could argue about performance of one vs the other, but I think it
hardly matters (although I did never measure that).

Personally, I'm more in favor of 'import foo' and keeping explicit
references for following reasons:
1. it makes it clear inside the code where a symbol comes from -- in
general I consider 'using namespace foo' a bad thing.
2. maintainability: if more functions are added to foo and used from a
script, the list in the import statement becomes larger and larger, to
possibly ridiculous proportions.

There is one case where I do use 'from Foo import Foo' and that is
when Foo is a class that is saved in its own equally-named file
Foo.py. In this case, Foo.Foo seems a bit redundant and it makes sense
to make the class Foo directly accessible.

I found the following 100% reliable reference (ahum) about the topic:
http://stackoverflow.com/questions/710551/import-module-or-from-module-import


>
> [--SNIP--]
>> @@ -204,7 +157,7 @@ def get_all_depends(pkgs):
>>      if len(filtered_pkgs) == 0:
>>          return []
>>
>> -    depends = get_depends(filtered_pkgs, rule)
>> +    depends = pkgutil.get_depends(filtered_pkgs, rule)
>
> And then just use get_depends here?
>
>>      deps = set()
>>      for pkg in filtered_pkgs:
>> @@ -377,7 +330,7 @@ if check_only:
>>      sys.exit(0)
>>
>>  dict_deps = remove_extra_deps(dict_deps)
>> -dict_version = get_version([pkg for pkg in allpkgs
>> +dict_version = pkgutil.get_version([pkg for pkg in allpkgs
>
> Ditto?
>
>>                                  if pkg != "all" and not pkg.startswith("root")])
>>
>>  # Print the attributes of a node: label and fill-color
>> diff --git a/support/scripts/pkgutil.py b/support/scripts/pkgutil.py
>> new file mode 100644
>> index 0000000..a911123
>> --- /dev/null
>> +++ b/support/scripts/pkgutil.py
>> @@ -0,0 +1,55 @@
>> +#!/usr/bin/env python
>
> As I understand it, this file is not supposed to be standalone, but just
> a "library" of functions?
>
> So it should not need to have the sha-bang line, yes?

Yes, you are right, that line is not necessary.

>
> Otherwise, I'm not opposed to this.

Thanks!
