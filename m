From: Steve Kenton <skenton@ou.edu>
Date: Wed, 18 Mar 2015 11:10:46 -0500
Subject: [Buildroot] [PATCH v3 1/1] tovid: new package
In-Reply-To: <20150318164628.3a84b974@free-electrons.com>
References: <1426691741-3961-1-git-send-email-skenton@ou.edu>
 <20150318164628.3a84b974@free-electrons.com>
Message-ID: <5509A386.1030107@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/18/2015 10:46 AM, Thomas Petazzoni wrote:
> Dear Steve Kenton,
> 
> On Wed, 18 Mar 2015 10:15:41 -0500, Steve Kenton wrote:
> 
>> diff --git a/package/tovid/0001-manpage.patch b/package/tovid/0001-manpage.patch
>> new file mode 100644
>> index 0000000..c742b64
>> --- /dev/null
>> +++ b/package/tovid/0001-manpage.patch
>> @@ -0,0 +1,26 @@
>> +setup.py: disable documentation build
>> +
>> +Signed-off-by: Steve Kenton <skenton@ou.edu>
> 
> Why is this patch needed? Does the documentation build requires
> additional dependencies?
Yes, with an SVN checkout it is required to get txt2tags to build the man page
"To build the manpage, you will need txt2tags:
    http://txt2tags.sourceforge.net"

> 
> 
>> diff --git a/package/tovid/Config.in b/package/tovid/Config.in
>> new file mode 100644
>> index 0000000..180e6d1
>> --- /dev/null
>> +++ b/package/tovid/Config.in
>> @@ -0,0 +1,31 @@
>> +config BR2_PACKAGE_TOVID
>> +	bool "tovid"
>> +	depends on BR2_USE_MMU
>> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>> +	depends on BR2_INET_IPV6 # ffmpeg
>> +	depends on BR2_INSTALL_LIBSTDCPP
>> +	depends on BR2_USE_WCHAR
>> +	depends on BR2_LARGEFILE
>> +	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # procps_ng
> 
> Can you comment on why specifically procps_ng is needed?
pgrep and IIRC pkill
"todisc:assert_dep pgrep "You need the pgrep program to use todisc"

> 
>> +	select BR2_PACKAGE_DVDAUTHOR
>> +	select BR2_PACKAGE_DVDRW_TOOLS
>> +	select BR2_PACKAGE_FFMPEG
>> +	select BR2_PACKAGE_IMAGEMAGICK
>> +	select BR2_PACKAGE_JPEG
>> +	select BR2_PACKAGE_MJPEGTOOLS
>> +	select BR2_PACKAGE_MPLAYER
>> +	select BR2_PACKAGE_PROCPS_NG
>> +	select BR2_PACKAGE_PYTHON
>> +	select BR2_PACKAGE_SOX
> 
> Amongst those dependencies, it would be great to denote which ones are
> actual build dependencies, and which ones are only runtime dependencies.
I think python is the only build dependency - the rest are runtime
assuming we kill the man page

    # *************************************************************************
    # Required Dependencies
    # *************************************************************************
    core="grep sed md5sum mplayer mplex mpeg2enc yuvfps yuvdenoise ppmtoy4m mp2enc jpeg2yuv"

    # *************************************************************************
    # Optional Dependencies
    # *************************************************************************
    # Optional dependencies are grouped according to the functionality they
    # bring to tovid: menu creation, DVD creation, (S)VCD creation, and
    # post-processing.

    # -------------------------------------------------------------------------
    # ImageMagick components
    magick="composite convert"

    # -------------------------------------------------------------------------
    # dvdauthor compononets
    # (note: growisofs is NOT distributed with dvdauthor, but for tovid's
    # purposes, it fits in the same catagory, as it burns DVDs!)
    dvd="spumux dvdauthor growisofs"

    # -------------------------------------------------------------------------
    # vcdimager components
    # (note: cdrdao is NOT distributed with vcdimager, but for tovid's
    # purposes, it fits in the same catagory, as it burns (S)VCDs!)
    vcd="vcdxbuild cdrdao"

    # -------------------------------------------------------------------------
    # transcode components
    transcode="tcprobe tcrequant"

    # -------------------------------------------------------------------------
    # Plugin tools
    plugins="sox $NORMALIZE"

> 
> 
>> diff --git a/package/tovid/tovid.mk b/package/tovid/tovid.mk
>> new file mode 100644
>> index 0000000..9e474fb
>> --- /dev/null
>> +++ b/package/tovid/tovid.mk
>> @@ -0,0 +1,19 @@
>> +################################################################################
>> +#
>> +# tovid
>> +#
>> +################################################################################
>> +
>> +TOVID_SITE = http://tovid.googlecode.com/svn/trunk/tovid
> 
> Google Code is closing. Is there a better location for this project? Or
> is the project planning to move to some other place in the near future ?
Did not know that, will investigate.

> 
>> +TOVID_SITE_METHOD = svn
>> +TOVID_VERSION = 3534
>> +TOVID_LICENSE = GPLv2.0
> 
> Just: GPLv2
> 
>> +TOVID_LICENSE_FILES = COPYING
>> +TOVID_DEPENDENCIES += python
> 
> += should be '='.
Right

> 
>> +# Must be run in source directory to avoid "error: package directory 'libtovid' does not exist"
>> +define TOVID_INSTALL_TARGET_CMDS
>> +	bash -c "cd $(@D); ./setup.py install --root=$(TARGET_DIR) --prefix=/usr"
>> +endef
>> +
>> +$(eval $(generic-package))
> 
> Since the package uses Python distutils, could you instead try:
> 
> TOVID_SETUP_TYPE = distutils
> 
> $(eval $(python-package))
> 
> and get rid of your custom TOVID_INSTALL_TARGET_CMDS ?
OOK - monkey scratches head - will try

Steve

> 
> Thanks,
> 
> Thomas
> 
