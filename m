From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Mon, 20 May 2019 19:49:55 +0200
Subject: [Buildroot] [PATCH v2] package/python-numpy: fix occasional
 build failure with lapack
In-Reply-To: <74098714-11ae-9897-a5fb-71db0f04c44a@micronovasrl.com>
References: <eb24ad7d-6de2-085d-d3e0-9037c3d5cf81@micronovasrl.com>
 <20190515210342.126951-1-giulio.benetti@micronovasrl.com>
 <20190518221352.0630eaa6@windsurf>
 <e0c589d1-ce45-0132-43da-db2605b81616@micronovasrl.com>
 <74098714-11ae-9897-a5fb-71db0f04c44a@micronovasrl.com>
Message-ID: <e0f46b82-02c0-7a4d-a67b-f21faa5ceda3@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adding Samuel+,

Il 20/05/2019 19:48, Giulio Benetti ha scritto:
> Hello Thomas,
> 
> Il 19/05/2019 16:47, Giulio Benetti ha scritto:
>> Hello Thomas, All,
>>
>> Il 18/05/2019 22:13, Thomas Petazzoni ha scritto:
>>> Hello,
>>>
>>> On Wed, 15 May 2019 23:03:42 +0200
>>> Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:
>>>
>>>> python-numpy build fails only if lapack is built before python-numpy
>>>> itself, and this doesn't always happen because lapack dependency is
>>>> missing in BR2_PYTHON_NUMPY_DEPENDENCIES. clapack is present
>>>> instead, but it's wrong since we're checking $(BR2_PACKAGE_LAPACK) not
>>>> $(BR2_PACKAGE_CLAPACK).
>>>
>>> I don't follow here: in the current code, we're checking
>>> BR2_PACKAGE_CLAPACK and adding clapack to PYTHON_NUMPY_DEPENDENCIES,
>>> which is consistent.
>>
>> You're right, I've done a mistake, I've substituted clapack with lapack.
>> So need to send a v3 with this corrected.
>>
>> The problem was due to cohexistence of lapack and clapack, but they 
>> are both(like openblas) accelerators that can exist once(I mean or 
>> lapack, or clapack).
>> Here I was asking about inserting a menu to choose which accelerator 
>> to use:
>> http://lists.busybox.net/pipermail/buildroot/2019-May/250273.html
>>
>> Can you take a look and answer with your opinion?
>>
>>> In order to better understand the problem. Without this patch:
>>>
>>> ? - Does python-numpy builds fine when neither clapack nor lapack are
>>> ??? enabled ?
>>
>> Yes it does(it works without accelerators).
>>
>>> ? - Does python-numpy builds fine when clapack is enabled, but not
>>> ??? lapack ?
>>
>> Yes
>>
>>> ? - What happens when both clapack and lapack are enabled ?
>>
>> Python-numpy will choose the accelerator according to this list:
>> https://www.numpy.org/devdocs/user/building.html#accelerated-blas-lapack-libraries 
> 
> 
> This ^^^^^^^^^^^^^ is wrong.
> The problem is that both lapack and clapack library names are equal:
> liblapack.so
> 
> So what happens here is that python-numpy will use clapack headers,
> then it will link with liblapack.so causing linking error.
> Because liblapack.so is from lapack(not clapack) due to alphabetical
> order when building.
> 
> Basically clapack is the c implementation of lapack, but in lapack it's
> been implemented lapacke(a c interface) that makes clapack useless at
> this point.
> 
> I see 2 options:
> - remove clapack completely because it's the same as lapacke(embedded in
> lapack)
> - make clapack and lapack exclusive selectable in their Config.in like:
>  ? (clapack Config.in)
>  ? depends on !BR2_PACKAGE_LAPACK
>  ? and:
>  ? (lapack Config.in)
>  ? depends on !BR2_PACKAGE_CLAPACK
> 
> But IMHO we should proceed with dropping clapack.
> 
>>
>>> Also, perhaps we need:
>>>
>>> ????select BR2_PACKAGE_LAPACK_COMPLEX if BR2_PACKAGE_LAPACK
> 
> This ^^^^^^^^^^ instead never built succesfully.
> It built successfully only because I was trying to build with:
> make python-numpy-dirclean python-numpy
> instead of:
> make clean all
> 
> So I had a mess of LAPACK libraries in my environment(sorry).
> 
> Best regards--
> Giulio Benetti
> CTO
> 
> MICRONOVA SRL
> Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
> Tel. 049/8931563 - Fax 049/8931346
> Cod.Fiscale - P.IVA 02663420285
> Capitale Sociale ? 26.000 i.v.
> Iscritta al Reg. Imprese di Padova N. 02663420285
> Numero R.E.A. 258642
> 
>>> in the Config.in file, so that it's a bit easier for users: they don't
>>> have to know they need that specific sub-option of lapack.
>>
>> If lapack selected yes, but that should come after adding a choice 
>> menu IMHO.
>>
>> Kind regards
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

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
