From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 22 Sep 2014 16:12:46 +0200
Subject: [Buildroot] [PATCH v2] swig: add symlink to /usr/bin/swig2.0
In-Reply-To: <20140922142339.5d50bdfa@free-electrons.com>
References: <1411385468-24878-1-git-send-email-jeremy.rosen@openwide.fr>
 <1411385468-24878-2-git-send-email-jeremy.rosen@openwide.fr>
 <20140922142339.5d50bdfa@free-electrons.com>
Message-ID: <CAHXCMMJh9rGvC5udxbTxBe2s1LQpCtnoAZLnGRiTF31gYRuKUg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Mon, Sep 22, 2014 at 2:23 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Mon, 22 Sep 2014 13:31:08 +0200, J?r?my Rosen wrote:
>
>> diff --git a/package/swig/swig.mk b/package/swig/swig.mk
>> index e9ef521..07f0548 100644
>> --- a/package/swig/swig.mk
>> +++ b/package/swig/swig.mk
>> @@ -4,7 +4,8 @@
>>  #
>>  ################################################################################
>>
>> -SWIG_VERSION = 2.0.12
>> +SWIG_MAJOR = 2.0
>> +SWIG_VERSION = $(SWIG_MAJOR).12
>>  SWIG_SITE = http://downloads.sourceforge.net/project/swig/swig/swig-$(SWIG_VERSION)
>>  SWIG_DEPENDENCIES = host-bison
>>  HOST_SWIG_CONF_OPT = \
>> @@ -14,4 +15,10 @@ HOST_SWIG_CONF_OPT = \
>>  SWIG_LICENSE = GPLv3+ BSD-2c BSD-3c
>>  SWIG_LICENSE_FILES = LICENSE LICENSE-GPL LICENSE-UNIVERSITIES
>>
>> +define HOST_SWIG_INSTALL_SYMLINK
>> +     ln -fs $(HOST_DIR)/usr/bin/swig $(HOST_DIR)/usr/bin/swig$(SWIG_MAJOR)
>> +endef
>> +
>> +HOST_SWIG_POST_INSTALL_HOOKS += HOST_SWIG_INSTALL_SYMLINK
>
> Samuel, can you tell us if we can explicitly tell to CMake the path to
> Swig, knowing that it is detected by CMake using find_program() ?
>

Swig package can add a program suffix to the swig program; that's what
debian does. So, a "swig2.0" program is installed on debian, whereas
it is just "swig" in Buildroot with no suffix).
When looking for swig program, CMake (via
<prefix>/share/cmake-<version>/Modules/FindSWIG.cmake) first looks for
something named "swig2.0" then "swig".
We can extend the location list where CMake will search with
CMAKE_PROGRAM_PATH, but CMake does not search in these location in
priority, it just scans all directories with the name given first,
then all with the second and so on.
So, if the host system has a swig2.0 program, it will always be found
instead of the swig one from the Buildroot host dir.

It is still possible to force the SWIG_EXECUTABLE variable through the
_CONF_OPTS, but doing this will require patching all cmake-package
using swig.

We could also adopt the same suffix as debian does, but it may not
play very well with autotools-package or handwritten
buils-system/makefiles.

We could also patch the FindSWIG.cmake file to reverse the order of
the swig program name list; but this implies carrying a patch for
CMake.

So, IMHO, the safest way of handling this is having both swig2.0 and
swig programs in the Buildroot host dir. This can easily be done at
the Buildroot level using a symlink, like this patch does.


Hope it's clear enough.

Regards,

-- 
Samuel
