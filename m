From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Sun, 26 May 2019 12:11:55 +0200
Subject: [Buildroot] [PATCH v2] package/python-numpy: fix occasional
 build failure with lapack
In-Reply-To: <d08e9569-ab62-3cd2-e1ab-64b5c8aa85b8@mind.be>
References: <eb24ad7d-6de2-085d-d3e0-9037c3d5cf81@micronovasrl.com>
 <20190515210342.126951-1-giulio.benetti@micronovasrl.com>
 <20190518221352.0630eaa6@windsurf>
 <e0c589d1-ce45-0132-43da-db2605b81616@micronovasrl.com>
 <74098714-11ae-9897-a5fb-71db0f04c44a@micronovasrl.com>
 <e0f46b82-02c0-7a4d-a67b-f21faa5ceda3@micronovasrl.com>
 <d08e9569-ab62-3cd2-e1ab-64b5c8aa85b8@mind.be>
Message-ID: <1f64ad53-eb0b-c8a5-0034-3d748caca61f@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

readding Samuel+,

Il 26/05/2019 11:43, Arnout Vandecappelle ha scritto:
> 
> 
> On 20/05/2019 19:49, Giulio Benetti wrote:
>> Adding Samuel+,
>>
>> Il 20/05/2019 19:48, Giulio Benetti ha scritto:
>>> Hello Thomas,
>>>
>>> Il 19/05/2019 16:47, Giulio Benetti ha scritto:
>>>> Hello Thomas, All,
>>>>
>>>> Il 18/05/2019 22:13, Thomas Petazzoni ha scritto:
> [snip]
>>>>>  ? - What happens when both clapack and lapack are enabled ?
>>>>
>>>> Python-numpy will choose the accelerator according to this list:
>>>> https://www.numpy.org/devdocs/user/building.html#accelerated-blas-lapack-libraries
>>> This ^^^^^^^^^^^^^ is wrong.
>>> The problem is that both lapack and clapack library names are equal:
>>> liblapack.so
> 
>   So, you are saying that if you build both lapack and clapack, you get only one
> .so file?

Exactly and lapack during install overwrite clapacks's liblapack.so with 
its liblapack.so

> 
>>> So what happens here is that python-numpy will use clapack headers,
>>> then it will link with liblapack.so causing linking error.
>>> Because liblapack.so is from lapack(not clapack) due to alphabetical
>>> order when building.
>>>
>>> Basically clapack is the c implementation of lapack, but in lapack it's
>>> been implemented lapacke(a c interface) that makes clapack useless at
>>> this point.
>>>
>>> I see 2 options:
>>> - remove clapack completely because it's the same as lapacke(embedded in
>>> lapack)
>>> - make clapack and lapack exclusive selectable in their Config.in like:
>>>  ?? (clapack Config.in)
>>>  ?? depends on !BR2_PACKAGE_LAPACK
>>>  ?? and:
>>>  ?? (lapack Config.in)
>>>  ?? depends on !BR2_PACKAGE_CLAPACK
> 
>   We indeed have to make the mutually exclusive. There are a number of ways that
> we can do that.
> 
> A. Add a dependency (not like above because it's a circular dependency).
> 
> B. Turn it into a virtual package.
> 
> C. Turn it into a choice (in addition to making it a virtual package).
> 
>   The latter is probably the proper way. Cfr. how it was done for
> openssl/libressl and libjpeg/turbo-jpeg.

I agree with using option C. Otherwise there will always be problems 
like this.

> 
>>> But IMHO we should proceed with dropping clapack.
> 
>   Why? it is maintained, and it is a dependency of armadillo...
> 
>   I had a deeper look, and actually lapack and clapack are the same, just
> compiled differently: lapack is built with the fortran compiler, clapack is
> generated with f2c (by upstream) and built with the C compiler. AFAIU, anything
> that uses lapack should also be able to use clapack and vice versa.
> 
>   We have two packages like that: numpy and armadillo. They both seem to support
> both lapack and clapack.
> 
>   So, it seems indeed removing clapack is the appropriate thing. Except: lapack
> requires a fortran compiler, which is not always available. 

Yes, I thought about it too and this is why it makes more sense option C 
IMHO.

> So in that sense, it
> would actually be more appropriate to remove lapack...
> 
>   But maybe it would be better to normally use lapack, and only enable clapack
> when lapack isn't available (i.e. when there's no fortran compiler).

Yes that can be done. But at this point I would make it with option C.

Do I proceed that way?

PS: I always try to add to CC Samuel and everytime it gets removed, is 
there a reason?

Best regards
-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642


>   Regards,
>   Arnout
> 
>>>>> Also, perhaps we need:
>>>>>
>>>>>  ????select BR2_PACKAGE_LAPACK_COMPLEX if BR2_PACKAGE_LAPACK
>>>
>>> This ^^^^^^^^^^ instead never built succesfully.
>>> It built successfully only because I was trying to build with:
>>> make python-numpy-dirclean python-numpy
>>> instead of:
>>> make clean all
>>>
>>> So I had a mess of LAPACK libraries in my environment(sorry).
>>>
>>> Best regards--
>>> Giulio Benetti
>>> CTO
>>>
>>> MICRONOVA SRL
>>> Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
>>> Tel. 049/8931563 - Fax 049/8931346
>>> Cod.Fiscale - P.IVA 02663420285
>>> Capitale Sociale ? 26.000 i.v.
>>> Iscritta al Reg. Imprese di Padova N. 02663420285
>>> Numero R.E.A. 258642
>>>
>>>>> in the Config.in file, so that it's a bit easier for users: they don't
>>>>> have to know they need that specific sub-option of lapack.
>>>>
>>>> If lapack selected yes, but that should come after adding a choice menu IMHO.
>>>>
>>>> Kind regards
>>>
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot at busybox.net
>>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
