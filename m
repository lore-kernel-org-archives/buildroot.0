From: Matt Flax <flatmax@flatmax.org>
Date: Sat, 20 Aug 2016 13:36:41 +1000
Subject: [Buildroot] [PATCH 2/2] package/fftw: Enable multiple precision
 installation
In-Reply-To: <20160819162003.5c6a9109@free-electrons.com>
References: <1471588192-2273-1-git-send-email-flatmax@flatmax.org>
 <20160819162003.5c6a9109@free-electrons.com>
Message-ID: <1962c82d-04d8-9dd5-0826-da1f3aff3673@flatmax.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 20/08/16 00:20, Thomas Petazzoni wrote:
> Hello,
>
> On Fri, 19 Aug 2016 16:29:52 +1000, Matt Flax wrote:
>> This commit enables fftw to be installed for multiple precisions on the
>> same system. For example if one package requires single precision and another
>> package requires double precision, then both fftw and fftwf can now be
>> slected and installed at the same time. Before this commit that wasn't
>> possible.
>>
>> The fftw site (http://www.fftw.org/fftw2_doc/fftw_6.html) states that to
>> install multiple precisions the procedure is a full clean and rebuild for
>> each desired precision. This patch achieves that by doing complete
>> builds (as required) for each of the required precisions.
>>
>> Signed-off-by: Matt Flax <flatmax@flatmax.org>
> Thanks for this patch. However, I read on the fftw web site that
> --enable-type-prefix should be used to have a library file and header
> file with different name depending on the precision being used.
>
> I don't see where you are passing this option, so from the look of it,
> your four packages would install over each other. Or is
> --enable-type-prefix the default ?
There are now 4 mk files. Each builds in a separate directory (fftw, 
fftwf, fftwl, fftwq) and installs as per the recommendations from fftw. 
All fftw packages  inherit the version, source, site, license, env, 
conf_opts, cflags from fftw.mk. By inheriting from one single set of 
macros, we can bump versions very easily.
The different precisions are added like so :
fftwf.mk : FFTWF_CONF_OPTS += --enable-single
fftwl.mk : FFTL_CONF_OPTS += --enable-long-double
fftwq.mk : FFTQ_CONF_OPTS += --enable-quad-precision

Regarding dev files, the header files are all the same - in fact from 
the fftw site, http://www.fftw.org/fftw2_doc/fftw_6.html#SEC69 it is 
recommended that they all install ontop of each other :
./configure; make; make install; make clean
./configure --ebale-single; make; make install; make clean
and so on ...

> Another concern is that one --enable-type-prefix is used, then all
> packages that use fftw will have to use the right library name and
> header name depending on the precision they want to use. Are they all
> ready for that?
>
> Could you check the different Buildroot packages in the tree that use
> FFTW, and see how they behave, and whether they need to be changed to
> accommodate your patch?
>
> There's at least alsa-lib, gnuradio, httping, imagemagick, libvips,
> liquid-dsp and pulseaudio to look at.

Actually "type-prefixes" aren't used and no changes are made to the 
names.  Double precision remains libfftw3.so.3, single precision remains 
libfftw3f.so.3 .... and so on. There is one header file used by all and 
it is constant.

Literally, this patch simply allows side by side installation, as it is 
intended to be.

thanks
Matt


>> diff --git a/package/fftw/fftw/Config.in b/package/fftw/fftw/Config.in
>> new file mode 100644
>> index 0000000..51bd5eb
>> --- /dev/null
>> +++ b/package/fftw/fftw/Config.in
>> @@ -0,0 +1,19 @@
>> +config BR2_PACKAGE_FFTW
>> +	bool "fftw"
>> +	help
>> +	  Library for computing Fast Fourier Transforms in double precision.
>> +
>> +	  This library computes Fast Fourier Transforms (FFT) in one
>> +	  or more dimensions. It is extremely fast. This package
>> +	  contains the shared library version of the fftw libraries in
>> +	  double precision.
>> +
>> +	  http://www.fftw.org
>> +
>> +config BR2_PACKAGE_FFTW_PRECISION_DOUBLE
>> +	bool "double"
>> +	select BR2_PACKAGE_FFTW_USE_SSE2 if BR2_X86_CPU_HAS_SSE2
>> +	help
>> +	  Compile fftw in double precision (the default), i.e. use 'double'
>> +	  for floating point type.
> You have those two symbols for each package, why so? They don't have
> any dependency between each other, which means that
> BR2_PACKAGE_FFTW_PRECISION_DOUBLE can be enabled without
> BR2_PACKAGE_FFTW, so BR2_PACKAGE_FFTW_PRECISION_DOUBLE can be enabled,
> but the fftw package will not be built.
>
> We should have a single option for each package.

Yep - I will have to fix this and resubmit a patch.

>
>> diff --git a/package/fftw/fftw.hash b/package/fftw/fftw/fftw.hash
>> similarity index 100%
>> rename from package/fftw/fftw.hash
>> rename to package/fftw/fftw/fftw.hash
>> diff --git a/package/fftw/fftw/fftw.mk b/package/fftw/fftw/fftw.mk
>> new file mode 100644
>> index 0000000..66a82ec
>> --- /dev/null
>> +++ b/package/fftw/fftw/fftw.mk
>> @@ -0,0 +1,9 @@
>> +################################################################################
>> +#
>> +# fftw
>> +#
>> +################################################################################
> I'd prefer to have this package be similar to the other ones, so
> package/fftw/fftw.mk be renamed to package/fftw/fftw-common.mk, and
> then here a package that looks like the other fftw* packages.
OK. However what is the best way to do this ? I notice ibr and matchbox 
have common directories ... so should we clutter the package directory 
with 5 fftw related directories ?
>
>> +$(eval $(autotools-package))
>> +
>> +
> Useless empty lines.
>
>> diff --git a/package/fftw/fftwf/Config.in b/package/fftw/fftwf/Config.in
>> new file mode 100644
>> index 0000000..7077086
>> --- /dev/null
>> +++ b/package/fftw/fftwf/Config.in
>> @@ -0,0 +1,22 @@
>> +config BR2_PACKAGE_FFTWF
>> +	bool "fftwf"
>> +	select BR2_PACKAGE_FFTW_PRECISION_SINGLE
> Ah, here we have this select. But do we really need two options?
Yep - I don't understand what you mean here though ?
>
>> diff --git a/package/fftw/fftwf/fftwf.hash b/package/fftw/fftwf/fftwf.hash
>> new file mode 100644
>> index 0000000..62b8f0f
>> --- /dev/null
>> +++ b/package/fftw/fftwf/fftwf.hash
>> @@ -0,0 +1,2 @@
>> +# From http://www.fftw.org/fftw-3.3.4.tar.gz.md5sum
>> +md5	2edab8c06b24feeb3b82bbb3ebf3e7b3	fftw-3.3.4.tar.gz
> For the hash file, you can use a symlink, like we're doing in
> package/gcc/gcc-{initial,final}.
OK
>
> I must say I'm not really thrilled by the duplication of code for those
> four packages, but I unfortunately don't have a better idea to propose.
> Let's add Arnout in Cc, he sometimes have some very creative ideas :-)
>
> Thanks!
>
> Thomas
I agree, I wasn't thrilled about having different build code replication 
in output/build, however I think that is the trade-off for simplicity !

Matt
