From: William Frost <tsmrnd0@gmail.com>
Date: Thu, 19 Jun 2014 16:36:35 +0900
Subject: [Buildroot] [Patch v3] dcmtk: new package
Message-ID: <53A29303.7050205@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

Before submitting patch v4 I will like to get some ideas about some of 
your last
recommendations. I did a lot of googling and testing before writing this 
but I
still have some doubts.

About the line:
DCMTK_CONF_ENV = ARFLAGS=cru
I think this it is related to linking statics libraries but I really 
don't know what this does. If I remove this, linking fails with the 
following error:

../../ofstd/include/dcmtk/ofstd/offile.h:679:8: note: the mangling of
  'va_list' has changed in GCC 4.4
/home/qsenn/devel/src/buildroot/contrib/cpy/output/host/usr/bin/arm-none-linux 

-gnueabi-ar  libdcmdata.a dcpixseq.o dcpxitem.o dcuid.o dcerror.o dcstack.o
dclist.o dcswap.o dctag.o dcxfer.o dcobject.o dcelem.o dcitem.o dcmetinf.o
dcdatset.o dcsequen.o dcfilefo.o dcbytstr.o dcpixel.o dcvrae.o dcvras.o
dcvrcs.o dccodec.o dcvrda.o dcvrds.o dcvrdt.o dcvris.o dcvrtm.o dcvrui.o
dcchrstr.o dcvrlo.o dcvrlt.o dcvrpn.o dcvrsh.o dcvrst.o dcvrobow.o dcvrat.o
dcvrss.o dcvrus.o dcvrsl.o dcvrul.o dcvrulup.o dcvrfl.o dcvrfd.o dcvrpobw.o
dcvrof.o dcdirrec.o dcdicdir.o dcvm.o dcrleccd.o dcrlecce.o dcrlecp.o 
dcrlerp.o
dcrledrg.o dcrleerg.o dctagkey.o dcdicent.o dcdict.o dcdictbi.o dcvr.o
dchashdi.o cmdlnarg.o dcvrut.o dctypes.o dcpcache.o dcddirif.o dcistrma.o
dcistrmb.o dcistrmf.o dcistrmz.o dcostrma.o dcostrmb.o dcostrmf.o
dcostrmz.o dcwcache.o dcpath.o vrscan.o vrscanl.o
/home/qsenn/devel/src/buildroot/contrib/cpy/output/host/usr/bin/arm-none-linux 

-gnueabi-ar: two different operation options specified
make[3]: *** [libdcmdata.a] Error 1

I will really like to explain the line:
DCMTK_CONF_ENV = ARFLAGS=cru
but my knowledge is not enough for that, I just know that I need use it. If
you can give me some ideas about this it will be great.

So, keeping:
DCMTK_CONF_ENV = ARFLAGS=cru

I tried replacing:
DCMTK_MAKE_OPT = DESTDIR=$(STAGING_DIR) install-lib
by
DCMTK_INSTALL_STAGING_OPT=DESTDIR=$(STAGING_DIR) install-lib

as you recommended, but for some reason the compilation failed. I can't
see exactly why, this is a log fragment:

/home/qsenn/devel/src/buildroot/contrib/cpy/output/host/usr/bin/arm-none-linux 

-gnueabi-g++ -O  -D_REENTRANT -D_XOPEN_SOURCE_EXTENDED
-D_XOPEN_SOURCE=500 -D_BSD_SOURCE -D_BSD_COMPAT -D_OSF_SOURCE
-D_POSIX_C_SOURCE=199506L -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os -L../libi2d
-L../libsrc -L../../ofstd/libsrc -L../../oflog/libsrc -o pdf2dcm 
pdf2dcm.o -ldcmdata
-loflog -lofstd -lz -lm -lrt -lpthread -lnsl
make[3]: Leaving directory 
`/home/qsenn/devel/src/buildroot/contrib/cpy/output/
build/dcmtk-3.6.0/dcmdata/apps'
make[2]: Leaving directory 
`/home/qsenn/devel/src/buildroot/contrib/cpy/output/
build/dcmtk-3.6.0/dcmdata'
make[1]: Leaving directory 
`/home/qsenn/devel/src/buildroot/contrib/cpy/output/
build/dcmtk-3.6.0'
make: *** 
[/home/qsenn/devel/src/buildroot/contrib/cpy/output/build/dcmtk-3.6.0
/.stamp_built] Error 2

so I tried this instead:

DCMTK_MAKE_ENV = DESTDIR=$(STAGING_DIR)
DCMTK_MAKE_OPT = libsrc-all
DCMTK_INSTALL_STAGING_OPT=DESTDIR=$(STAGING_DIR) install-lib

and it worked. But I don't know if is acceptable or not.

About including the binaries outputs in TARGET:
This package makes some static libraries which I like to use from staging
directory to link my application. So personally I don't need them on my 
root
filesystem. I don't know Buildroot policy about including statics 
libraries in
TARGET so I will follow your recommendation about this.

Best regards,
William

On 06/18/2014 03:26 PM, Thomas Petazzoni wrote:
> Dear William Frost,
>
> On Wed, 18 Jun 2014 09:05:19 +0900, William Frost wrote:
>> [PATCH] Changes v2 -> v3:  (suggested by Thomas De Schampheleire):
>>   - removed version selection option, only stable release is used
>>   - added an empty new line between the comment header and the first
>>     variable definition
>>   - fixed license file reference
>>   - reduced and cleaning DCMTK_CFLAGS and DCMTK_CXXFLAGS declarations
>>   - removed DCMTK_INSTALL_STAGING_OPT and DCMTK_INSTALL_TARGET_OPT
>>   - unconditionally use --with-zlib
>>   - removed duplicated build commands
> All this text should not go into the commit log (otherwise it remains
> forever in the git history of the project). Instead, such changelog
> information should be...
>
>> Signed-off-by: William Frost<tsmrnd0@gmail.com>
>> ---
> ... here, i.e after the "---", or in a separate cover letter e-mail
> (see the Buildroot manual for more details about this).
>
>> +++ b/package/dcmtk/Config.in
>> @@ -0,0 +1,12 @@
>> +config BR2_PACKAGE_DCMTK
>> +    bool "dcmtk"
>> +    help
>> +      DCMTK is a collection of libraries and applications implementing
>> +      large parts the DICOM standard. It includes software for 
>> examining,
>> +      constructing and converting DICOM image files, handling offline
>> +      media, sending and receiving images over a network connection, as
>> +      well as demonstrative image storage and worklist servers. 
>> DCMTK is
>> +      is written in a mixture of ANSI C and C++. It comes in complete
>> +      source code and is made available as "open source" software.
>> +
>> + http://dicom.offis.de/dcmtk.php.en
>> \ No newline at end of file
> There a missing newline at end of file, no?
>
>> diff --git a/package/dcmtk/dcmtk.mk b/package/dcmtk/dcmtk.mk
>> new file mode 100644
>> index 0000000..ae2c265
>> --- /dev/null
>> +++ b/package/dcmtk/dcmtk.mk
>> @@ -0,0 +1,23 @@
>> +################################################################################ 
>>
>> +#
>> +# dcmtk
>> +#
>> +################################################################################ 
>>
>> +
>> +DCMTK_VERSION = $(call qstrip,"3.6.0")
> Huh, why would we have this qstrip here? Why not just:
>
> DCMTK_VERSION = 3.6.0
>
>> +DCMTK_SITE =http://dicom.offis.de/download/dcmtk/dcmtk360
>> +
>> +DCMTK_LICENSE = BSD
>> +DCMTK_LICENSE_FILES = COPYRIGHT
>> +DCMTK_INSTALL_STAGING = YES
>> +
>> +DCMTK_CFLAGS = $(TARGET_CFLAGS) -O -Wall
>> +DCMTK_CXXFLAGS = $(TARGET_CXXFLAGS) -O  -Wall
> These definitions are useless. <pkg>_CFLAGS and <pkg>_CXXFLAGS are not
> used by the package infrastructure.
>
>> +DCMTK_CONF_OPT = \
>> +    --disable-rpath --with-zlib \
> One line per option:
>
> DCMTK_CONF_OPT = \
>     --disable-rpath \
>     --with-zlib
>
>> + ac_cv_my_c_rightshift_unsigned=no
> This should be in DCMTK_CONF_ENV.
>
>> +DCMTK_CONF_ENV = ARFLAGS=cru
> Maybe a short comment explaining why it's needed would be useful.
>
>> +DCMTK_MAKE_OPT = DESTDIR=$(STAGING_DIR) install-lib
> Useless spaces before the equal sign. Also, this should be:
>
> DCMTK_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install-lib
>
> Thought in this case, I wonder why we don't have a similar thing for
> the target installation.
>
> Thanks!
>
> Thomas

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140619/c51782b1/attachment-0001.html>
