From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Sun, 19 May 2019 16:47:53 +0200
Subject: [Buildroot] [PATCH v2] package/python-numpy: fix occasional
 build failure with lapack
In-Reply-To: <20190518221352.0630eaa6@windsurf>
References: <eb24ad7d-6de2-085d-d3e0-9037c3d5cf81@micronovasrl.com>
 <20190515210342.126951-1-giulio.benetti@micronovasrl.com>
 <20190518221352.0630eaa6@windsurf>
Message-ID: <e0c589d1-ce45-0132-43da-db2605b81616@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas, All,

Il 18/05/2019 22:13, Thomas Petazzoni ha scritto:
> Hello,
> 
> On Wed, 15 May 2019 23:03:42 +0200
> Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:
> 
>> python-numpy build fails only if lapack is built before python-numpy
>> itself, and this doesn't always happen because lapack dependency is
>> missing in BR2_PYTHON_NUMPY_DEPENDENCIES. clapack is present
>> instead, but it's wrong since we're checking $(BR2_PACKAGE_LAPACK) not
>> $(BR2_PACKAGE_CLAPACK).
> 
> I don't follow here: in the current code, we're checking
> BR2_PACKAGE_CLAPACK and adding clapack to PYTHON_NUMPY_DEPENDENCIES,
> which is consistent.

You're right, I've done a mistake, I've substituted clapack with lapack.
So need to send a v3 with this corrected.

The problem was due to cohexistence of lapack and clapack, but they are 
both(like openblas) accelerators that can exist once(I mean or lapack, 
or clapack).
Here I was asking about inserting a menu to choose which accelerator to use:
http://lists.busybox.net/pipermail/buildroot/2019-May/250273.html

Can you take a look and answer with your opinion?

> In order to better understand the problem. Without this patch:
> 
>   - Does python-numpy builds fine when neither clapack nor lapack are
>     enabled ?

Yes it does(it works without accelerators).

>   - Does python-numpy builds fine when clapack is enabled, but not
>     lapack ?

Yes

>   - What happens when both clapack and lapack are enabled ?

Python-numpy will choose the accelerator according to this list:
https://www.numpy.org/devdocs/user/building.html#accelerated-blas-lapack-libraries

> Also, perhaps we need:
> 
> 	select BR2_PACKAGE_LAPACK_COMPLEX if BR2_PACKAGE_LAPACK
> 
> in the Config.in file, so that it's a bit easier for users: they don't
> have to know they need that specific sub-option of lapack.

If lapack selected yes, but that should come after adding a choice menu 
IMHO.

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
