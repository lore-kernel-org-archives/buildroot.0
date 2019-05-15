From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 15 May 2019 22:50:05 +0200
Subject: [Buildroot] [PATCH] package/python-numpy: fix occasional build
 failure with lapack
In-Reply-To: <756d5d20-8f60-9635-105e-42be72c74630@micronovasrl.com>
References: <20190515144121.81041-1-giulio.benetti@micronovasrl.com>
 <20190515151244.GH2787@scaer>
 <756d5d20-8f60-9635-105e-42be72c74630@micronovasrl.com>
Message-ID: <eb24ad7d-6de2-085d-d3e0-9037c3d5cf81@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 15/05/2019 21:58, Giulio Benetti ha scritto:
> Hello Yann,
> 
> Il 15/05/2019 17:12, Yann E. MORIN ha scritto:
>> Giulio, All,
>>
>> On 2019-05-15 16:41 +0200, Giulio Benetti spake thusly:
>>> python-numpy build fails only if lapack is built before python-numpy
>>> itself, and this doesn't always happen because lapack dependency is
>>> missing in BR2_PYTHON_NUMPY_DEPENDENCIES.
>>> Then build failure is due to missing BR2_PACKAGE_LAPACK_COMPLEX that
>>> provides some functions in lapack libraries needed by python-numpy.
>>>
>>> So:
>>> - add lapack to BR2_PYTHON_NUMPY_DEPENDENCIES when
>>>     BR2_PACKAGE_LAPACK = y
>>> - substitute ifeq check "$(BR2_PACKAGE_LAPACK),y" with
>>>     "$(BR2_PACKAGE_LAPACK_COMPLEX),y" because python-numpy needs COMPLEX
>>>     functions and BR2_PACKAGE_LAPACK_COMPLEX inherits BR2_PACKAGE_LAPACK
>>>
>>> Fixes:
>>> http://autobuild.buildroot.net/results/50f/50f7f09a9f830cd7b94f8fc83c09fc3d39297d3d/
>>>
>>> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
>>> ---
>>>    package/python-numpy/python-numpy.mk | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
>>> index 28dccf8be5..a61246615a 100644
>>> --- a/package/python-numpy/python-numpy.mk
>>> +++ b/package/python-numpy/python-numpy.mk
>>> @@ -15,8 +15,8 @@ PYTHON_NUMPY_LICENSE_FILES = LICENSE.txt doc/sphinxext/LICENSE.txt \
>>>    			numpy/core/src/multiarray/dragon4.c
>>>    PYTHON_NUMPY_SETUP_TYPE = setuptools
>>>    
>>> -ifeq ($(BR2_PACKAGE_CLAPACK),y)
>>> -PYTHON_NUMPY_DEPENDENCIES += clapack
>>> +ifeq ($(BR2_PACKAGE_LAPACK_COMPLEX),y)
>>> +PYTHON_NUMPY_DEPENDENCIES += clapack lapack
>>
>> This is not correct, because tehre is no relation between lapack and
>> clapack. So, we can have lapack enabled but not clapack. Your code will
>> cause a build failure when clapack is not enabled.
> 
> Right, they should be exclusive.
> 
>> So, you probably want something like:
>>
>>       ifeq ($(BR2_PACKAGE_CLAPACK),y)
>>       PYTHON_NUMPY_DEPENDENCIES_LAPACK += clapack
>>       endif
>>       ifeq ($(BR2_PACKAGE_LAPACK_COMPLEX),y)
>>       PYTHON_NUMPY_DEPENDENCIES_LAPACK += lapack
>>       endif
>>       ifneq ($(PYTHON_NUMPY_DEPENDENCIES_LAPACK),)
>>       PYTHON_NUMPY_DEPENDENCIES += $(PYTHON_NUMPY_DEPENDENCIES_LAPACK)
>>       else
>>       PYTHON_NUMPY_ENV += BLAS=None LAPACK=None
>>       endif
>>
>> But beware of the above, it might not yet be correct: if clapack and
>> lapack (without complex) are both enabled, then you may still en up in
>> the current situation.
> 
> Right.
> 
>> So, you may need to refine it even further, with something like:
>>
>>       ifeq ($(BR2_PACKAGE_CLAPACK),y)
>>       PYTHON_NUMPY_DEPENDENCIES += clapack
>>       PYTHON_NUMPY_ENV += BLAS=clapack LAPACK=clapack
>>       else ifeq ($(BR2_PACKAGE_LAPACK_COMPLEX),y)
>>       PYTHON_NUMPY_DEPENDENCIES += lapack
>>       PYTHON_NUMPY_ENV += BLAS=lapack LAPACK=lapack
>>       else
>>       PYTHON_NUMPY_ENV += BLAS=None LAPACK=None
>>       endif
>>
>> (check what BLAS= and LAPACK= expect as values.)
>>
>> Also, is the depenency on clapack really needed? Can python-numpy really
>> use clapack?
> 
> Judging from here:
> https://www.numpy.org/devdocs/user/building.html#blas
> clapack seems to not be supported.
> But AIK clapack should be the same as lapack but written entirely in C
> instead of Fortran(later translated in C in lapack during build), so it
> should work with clapack too.
> I try to build with that and check.

I've successfully built python-numpy with these accelerators:
- lapack
- clapack(c verion of lapack(fortran))
- openblas

Speaking in IRC with Yann came out the possibility to specify LAPACK 
order with NPY_LAPACK_ORDER.

Another thing that could be done(after fixing current patch) is to add 
the choice in Config.in of which accelerator to use between these:
- lapack
- clapack
- openblas

IMHO I would like to impose LAPACK and BLAS instead of setting 
NPY_LAPACK_ORDER and NPY_BLAS_ORDER, since Buildroot is meant to be 
kinda "static" after building.

So I would:
- send a V2 patch to fix build failure using lapack only
then:
- follow with a second patch adding such choice

What about this?

Kind regards
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
