From: Hugues FRUCHET <hugues.fruchet@st.com>
Date: Tue, 25 Jul 2017 07:54:21 +0000
Subject: [Buildroot] [RFC v1] libv4l: build utils only on MMU (with fork
 support) platforms
In-Reply-To: <20170724195123.463603b8@gmx.net>
References: <20170711172624.7516-1-ps.report@gmx.net>
 <70ff5d21-0466-c470-cac3-e00c524c93b0@st.com>
 <20170717200901.51814cb5@gmx.net>
 <41bd7a05-4254-e7e4-7846-ed5e4d99d0ad@st.com>
 <20170722233627.4b8091bd@gmx.net>
 <62b07a98-ef76-b3cc-1ce0-227ceeb06519@st.com>
 <20170724193822.3630bc8c@gmx.net> <20170724195123.463603b8@gmx.net>
Message-ID: <42f99b3e-62da-ab70-9ef7-91dd1bd0ffe6@st.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On 07/24/2017 07:51 PM, Peter Seiderer wrote:
> Hello Hugues,
> 
> On Mon, 24 Jul 2017 19:38:22 +0200, Peter Seiderer <ps.report@gmx.net> wrote:
> 
>> Hello Hugues,
>>
>> On Mon, 24 Jul 2017 08:08:45 +0000, Hugues FRUCHET <hugues.fruchet@st.com> wrote:
>>
>>> Hi Peter,
>>>
>>> Sorry, typo in patch, this one should work as expected.
>>>
>>> Best regards,
>>> Hugues.
>>>
>>
>> Yes, the new version of the patch works:
>>
>> 	$ make libv4l
>> [...]
>> Applying 0010-configure.ac-disable-libv4l-if-no-fork.patch using patch:
>> [...]
>> compile time options summary
>> ============================
>>
>>      Host OS                    : linux-uclibc
>>      X11                        : no
>>      GL                         : no
>>      glu                        : no
>>      libjpeg                    :
>>      libudev                    : no
>>      pthread                    : yes
>>      fork                       : no
>>      QT version                 : none
>>      ALSA support               : no
>>
>>      build dynamic libs         : yes
>>      build static libs          : no
>>
>>      gconv                      : no
>>
>>      libv4l                     : no
>>      dynamic libv4l             : yes
>>      v4l_plugins                : yes
>>      v4l_wrappers               : yes
>>      libdvbv5                   : no
>>      dvbv5-daemon               : no
>>      v4lutils                   : yes
>>      qv4l2                      : no
>>      v4l2-ctl uses libv4l       : yes
>>      v4l2-compliance uses libv4l: yes
>> [...]
>>
>> 	$ ls -ltr target/usr/bin/
>> [...]
>> -rwxr-xr-x 1 seiderer users 259172 Jul 24 19:29 decode_tm6000
>> -rwxr-xr-x 1 seiderer users  13988 Jul 24 19:29 ivtv-ctl
>> -rwxr-xr-x 1 seiderer users 198868 Jul 24 19:29 ir-ctl
>> -rwxr-xr-x 1 seiderer users  12240 Jul 24 19:29 cx18-ctl
>> -rwxr-xr-x 1 seiderer users 215068 Jul 24 19:29 ir-keytable
>> -rwxr-xr-x 1 seiderer users  53452 Jul 24 19:29 media-ctl
>> -rwxr-xr-x 1 seiderer users 206532 Jul 24 19:29 v4l2-compliance
>> -rwxr-xr-x 1 seiderer users 265676 Jul 24 19:29 v4l2-ctl
>> -rwxr-xr-x 1 seiderer users 188496 Jul 24 19:29 v4l2-sysfs-path
>> -rwxr-xr-x 1 seiderer users 154228 Jul 24 19:29 cec-ctl
>> -rwxr-xr-x 1 seiderer users 122344 Jul 24 19:29 cec-compliance
>> -rwxr-xr-x 1 seiderer users  69860 Jul 24 19:29 cec-follower

That is OK, you have the compliancy tools.

>>
>> 	$ ls -ltr target/usr/lib
>> drwxr-xr-x 3 seiderer users    4096 Jul 11 19:06 libv4l
>> -rwxr-xr-x 1 seiderer users   39408 Jul 11 19:06 libv4l2.so.0.0.0
>> -rwxr-xr-x 1 seiderer users   17032 Jul 11 19:06 libv4l1.so.0.0.0
>> -rwxr-xr-x 1 seiderer users  105432 Jul 11 19:06 libv4lconvert.so.0.0.0
>> -rwxr-xr-x 1 seiderer users   18384 Jul 11 19:06 libv4l2rds.so.0.0.0
>>
> 
> Ups, mind the timestamps, libraries are from a previous build...with your
> patch no libraries are build/installed...

That is also intentional, no libv4l if no fork() & dlopen().

Please note that before the commit "package/libv4l: build of v4l2 
utilities on noMMU", nothing was built at all (utilities and libraries) 
on no-MMU platforms due to dependency on BR2_USE_MMU.

> 
> Regards,
> Peter
> 
>> Thanks for your efforts...
>>
>> Regards,
>> Peter
>>

Thanks for testing, I will push the fix now.

BR,
Hugues.
