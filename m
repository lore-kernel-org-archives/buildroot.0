From: Hugues FRUCHET <hugues.fruchet@st.com>
Date: Tue, 18 Jul 2017 09:08:18 +0000
Subject: [Buildroot] [RFC v1] libv4l: build utils only on MMU (with fork
 support) platforms
In-Reply-To: <20170717200901.51814cb5@gmx.net>
References: <20170711172624.7516-1-ps.report@gmx.net>
 <70ff5d21-0466-c470-cac3-e00c524c93b0@st.com>
 <20170717200901.51814cb5@gmx.net>
Message-ID: <41bd7a05-4254-e7e4-7846-ed5e4d99d0ad@st.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On 07/17/2017 08:09 PM, Peter Seiderer wrote:
> Hello Hugues,
> 
> On Mon, 17 Jul 2017 10:07:07 +0000, Hugues FRUCHET <hugues.fruchet@st.com> wrote:
> 
>> Hi Peter,
>>
>> I have tested on STM32 platform running Cortex F family having no MMU,
>> shared libraries are disabled (no dlopen) and no fork supported on our
>> setup.
>>
>> libv4lconvert should not have been built at all, because entire lib/
>> folder build is conditional to shared library support:
>> * configure.ac
>> AM_CONDITIONAL([WITH_LIBV4L],       [test x$enable_libv4l    != xno -a
>> x$enable_shared != xno])
>> * Makefile.am
>> [...]
>> +if WITH_LIBV4L
>> +SUBDIRS += lib
>> +endif
> 
> A little bit confused, one of the patches you introduced changed it to:
> 
> - without WITH_LIBV4L: no libv4l libraries at all
> - without WITH_DYN_LIBV4L: only static libraries, no dynamic libraries
> 
> And from configure --help:
> 
>    --disable-libv4l        disable libv4l compilation
>    --disable-dyn-libv4l    disable dynamic libv4l support

This package is named "libv4l" in buildroot but repo name is "v4l-utils" 
which contains:
1) some library plugins on top of V4L kernel interface in order to 
intercept user calls and hook/convert to the appropriate kernel call.
=> so called "libv4l" and located in "lib/" folder
2) some utilities located in "utils/" folder, such as the V4L compliancy 
tool "v4l2-compliance" or the CEC compliancy tool "cec-compliance" which 
are calling either the libv4l interface (default), the libv4l interface 
but statically linked inside utilities (--disable-dyn-libv4l) or the V4L 
kernel interface directly (--disable-libv4l).
Hope that helps to better understand the options.

> 
>>
>> But checking your log I see that --enable-shared is set, so it seems
>> that you are supporting shared libraries on no-MMU platform but without
>> fork() support, is my understanding correct ?
>>
> 
> Yes...
> 
>> What you can do to fix build is to force disabling of libs inside libv4l
>> package:
>>
>> package/libv4l/libv4l.mk
>> +ifeq ($(BR2_USE_MMU),)
>> +LIBV4L_CONF_OPTS += --disable-libv4l
>> +endif
> 
> Works, but feels wrong: A package named libv4l enabled and building/installing
> nothing (except when LIBV4L_UTILS is enabled)...

Right.
The aim of the no-MMU dependency removal patchset was to enable build of 
"utils" even on no-MMU platform. This is required to build at least the 
2 mandatory compliancy tools:
- v4l-compliance: its test report is required by V4L maintainers and is 
to be attached to the cover letter of any V4L driver pushed upstream.
- cec-compliance: the same for CEC drivers.


Please note that you cannot use the libv4l plugins mechanism without 
having fork() support, see libv4lconvert/helper.c, 
v4lconvert_helper_start().
Means that only V4L utilities can be currently supported on no-MMU 
platforms.

Back to your exact build issue, the best fix on my opinion is to add a 
dependency on fork() symbol in configure.ac instead of the one proposed 
in libv4l.mk, find attached a patch proposal.


Regards,
Hugues.
> 
> Regards,
> Peter
> 
>>
>> Hoping that helps.
>>
>> Best regards,
>> Hugues.
>>
>> On 07/11/2017 07:26 PM, Peter Seiderer wrote:
>>> Fixes [1]:
>>>
>>>       CXXLD    v4l2-compliance
>>>     .../output/build/libv4l-1.12.5/lib/libv4lconvert/.libs/libv4lconvert.so: undefined reference to `fork'
>>>     collect2: error: ld returned 1 exit status
>>>
>>> [1] http://autobuild.buildroot.net/results/7e8/7e8fbd99a8c091d7bbeedd16066297682bbe29fe
>>>
>>> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>>> ---
>>> The libv4l build for noMMU platforms was enabled with commit 'package/libv4l:
>>> allow build of v4l2 utilities on noMMU platforms' (see [2]). But libv4lconvert uses
>>> fork internally, so all utils linking against fail to build. Fix this by disabling
>>> the utils on noMMU platforms (so keep building all libraries).
>>>
>>> Alternatives would be:
>>>
>>> - disable libv4l on all noMMU platforms (not only the utils), revert a part
>>>     of commit [2]
>>>
>>> - create a patch to disable only libv4lconvert (and all dependend utils)
>>>     on noMMU platforms
>>>
>>> [2] https://git.buildroot.net/buildroot/commit/?id=f837251785e9389f53d695ddb8a094707865171b
>>> ---
>>>    package/libv4l/Config.in | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/package/libv4l/Config.in b/package/libv4l/Config.in
>>> index e7f78dc70f..61c290f251 100644
>>> --- a/package/libv4l/Config.in
>>> +++ b/package/libv4l/Config.in
>>> @@ -19,6 +19,7 @@ comment "libv4l JPEG support not enabled"
>>>    
>>>    config BR2_PACKAGE_LIBV4L_UTILS
>>>    	bool "v4l-utils tools"
>>> +	depends on BR2_USE_MMU # fork(), used in libv4lconvert linked by various utils eg. v4l2-compliance
>>>    	help
>>>    	  v4l-utils is a collection of various video4linux and DVB utilities.
>>>    	  Enable this if you want to build the following tools:
>>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0010-configure.ac-disable-libv4l-if-no-fork.patch
Type: text/x-patch
Size: 1490 bytes
Desc: 0010-configure.ac-disable-libv4l-if-no-fork.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170718/a60cefe5/attachment.bin>
