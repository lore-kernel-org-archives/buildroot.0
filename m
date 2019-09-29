From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 29 Sep 2019 14:51:43 +0200
Subject: [Buildroot] [PATCH v3 2/2] package/python-scipy: new package
In-Reply-To: <874l0ztagg.fsf@geanix.com>
References: <20190924143946.101846-1-esben@geanix.com>
 <20190924143946.101846-2-esben@geanix.com>
 <59c0bc63-5a32-eff9-a8dc-42bb9f513acd@mind.be> <874l0ztagg.fsf@geanix.com>
Message-ID: <965ef753-bae5-40c7-8455-9042f56bbf81@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 26/09/2019 16:10, Esben Haabendal wrote:
> Arnout Vandecappelle <arnout@mind.be> writes:
> 
>> On 24/09/2019 16:39, Esben Haabendal wrote:
[snip]
>>> +	select BR2_PACKAGE_PYTHON_NUMPY
>>> +	select BR2_PACKAGE_OPENBLAS
>>> +	select BR2_PACKAGE_CLAPACK
>>
>>  This clapack, fortran, openblas stuff really needs some explanation in the
>> commit message. Why clapack and not lapack or the lapack bundled with openblas?
>> Why Fortran? etc.
> 
> I will try and add something.
> 
> Actually, I don't see why openblas is needed, as clapack can provide
> both blas and lapack.  Current python-numpy package uses clapack for
> both, so it makes most sense to do the same here.

 That does indeed make the most sense. It will also make it easier to do the big
lapack/blas cleanup that Romain is advocating.

 BTW, I don't think I ever commented on that. I agree with Romain that a cleanup
is needed of the handling of (c)lapack and (c)blas - possibly with 4 virtual
packages. However, I agree with Esben that it's OK to already include
python-scipy before that cleanup is done. In a way, having another example of a
use of those packages makes it easier to understand and be sure that the cleanup
is done correctly.


>>> +	help
>>> +	  The SciPy library is one of the core packages that make up the SciPy
>>> +	  stack. It provides many user-friendly and efficient numerical
>>> +	  routines such as routines for numerical integration, interpolation,
>>> +	  optimization, linear algebra and statistics.
>>> +
>>> +	  https://www.scipy.org/scipylib/
>>> +
>>> +comment "python-scipy needs a toolchain w/ fortran"
>>> +	depends on !BR2_TOOLCHAIN_HAS_FORTRAN
>>
>>  Python3 and glibc/musl dependency should be added as well, and the arch
>> dependencies should be repeated. I.e.
> 
> glibc/musl dependency makes sense.  But I don't think that python3 arch
> dependencies should cause a comment.

 Not the python3 arch dependencies, but the python3 dependency itself (i.e. the
!python2 part).

 However, apparently I'm wrong... Looking at other packages, apparently the
python3 dependency should be treated like an arch dependency...

 Arch dependencies should be included as well, but to *hide* the comment in case
they're not satisfied.

 Look at e.g. python-slob for an example.

>  As I understand it, these comments
> are meant for things that the user can easily do something about, such
> as enabling a compatible toolchain.
> 
> I will add a simple comment for glibc/musl.
> 
> Do you agree?  Are there examples of other packages adding a lot of arch
> dependencies to comment?
> 

[snip]
>>> +	Apache-2.0, MIT
>>> +PYTHON_SCIPY_LICENSE_FILES = LICENSE.txt \
>>
>>  Split the line before already, so
>>
>> PYTHON_SCIPY_LICENSE_FILES = \
>> 	LICENSE.txt \
> 
> Is this policy?  There are 23 examples of doing it that way, and 17 the
> opposite.

 By my count, the numbers are dramatically in favour of my proposal...

$ git grep '^[A-Z0-9_]* +\?= [-A-Za-z0-9_$()]* \\$' -- \*.mk | wc
     53     212    3743

$ git grep '^[A-Z0-9_]* +\?= \\$' -- \*.mk | wc
   1293    3879   72641


 The option of filling up the lines to 80 characters is a little bit more
acceptable, but personally I'm not a fan...

$ git grep '^[A-Z0-9_]* +\?= [-A-Za-z0-9_$()].*\\' -- \*.mk | wc
    252    1325   22027


> I will change it in next version, but are you sure which way is "the
> right way"?

 I'll admit that this is something where no hard rule has been written down, so
the patch should definitely be blocked by it.


>>  Also, I think it's useful to add the LICENSES_bundled.txt, because changes in
>> that file should be noticed (i.e. the hash changes).
> 
> That file is not included in this scipy release we are using.

 Ah, sorry, I was looking at the git repo instead of the tarball.


 Regards,
 Arnout

>>> +define PYTHON_SCIPY_CONFIGURE_CMDS
>>> +	-rm -f $(@D)/site.cfg
>>> +	echo "[DEFAULT]" >> $(@D)/site.cfg
>>> +	echo "library_dirs = $(STAGING_DIR)/usr/lib" >> $(@D)/site.cfg
>>> +	echo "include_dirs = $(STAGING_DIR)/usr/include" >> $(@D)/site.cfg
>>
>>  It would also be useful to comment about the site.cfg in the commit
>>  message.
> 
> I will try and add something here also.
> 
> /Esben
> 
