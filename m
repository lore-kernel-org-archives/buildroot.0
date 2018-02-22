From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Wed, 21 Feb 2018 22:55:54 -0300
Subject: [Buildroot] [PATCH next 1/5] support/scripts/pkg-stats-new:
 rewrite in Python
References: <20180219215708.75721513@windsurf.home>
Message-ID: <5a8e232ac3d9f_24263ff17c9dc73833077@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, Feb 19, 2018 at 05:57 PM, Thomas Petazzoni wrote:

[snip]
>> > +def get_pkg_infra_info(pkgpath):
>> > +    infras = list()
>> > +    with open(pkgpath, 'r') as f:
>> > +        lines = f.readlines()
>> > +        for l in lines:
>> > +            match = INFRA_RE.match(l)
>> > +            if not match:
>> > +                continue
>> > +            infra = match.group(1)
>> > +            if infra.startswith("host-"):
>> > +                infras.append(("host", infra[5:]))
>> > +            else:
>> > +                infras.append(("target", infra))
>> > +    return infras  
>> Many methods like this one could become part of the class:
>> class Package:
>>     def get_pkg_infra_info(self):
>>         infras = list()
>>         with open(self.path, 'r') as f:
>>             lines = f.readlines()
>>             for l in lines:
>>                 match = INFRA_RE.match(l)
>>                 if not match:
>>                     continue
>>                 infra = match.group(1)
>>                 if infra.startswith("host-"):
>>                     infras.append(("host", infra[5:]))
>>                 else:
>>                     infras.append(("target", infra))
>>         self.infras = infras
>> 
>> But that's a considerable effort with small gain.
>> The script can always be refactored later.
> 
> I don't entirely agree: some of those functions don't apply to one
> package object, they apply to the whole set of package objects.
> Therefore, semantically, there are not methods of the Package() class,
> as they don't manipulate just that object.
> 
> The main problem is with getting the license, license files and version
> information. Indeed, this cannot be done as a method of a single
> package, without slowing down the script significantly. Right now, we
> are doing a single "make VARS=%_LICENSE printvars" invocation, and
> parsing the output. This gives us the full list of licenses for all
> packages, in just one make invocation. If we do this once per-package,
> we pay the cost of running make + parsing time of all Buildroot
> makefiles for the 2000+ packages, which isn't reasonable. One option
> here would have to simply cache this value somewhere, and have the
> method just use the cached value. Do you have a suggestion to handle
> this in a beautiful way ?

Unfortunately no.
Let's keep it as is.

Regards,
Ricardo
