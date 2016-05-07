From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 8 May 2016 00:08:30 +0200
Subject: [Buildroot] Qt5 fails to compile with gcc 6.1.0
In-Reply-To: <572DBAB9.3060607@gmail.com>
References: <572DBAB9.3060607@gmail.com>
Message-ID: <93637a3f-dd9b-c499-538b-5fbb0b65be97@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/07/16 11:51, Marco Trapanese wrote:
> Same environment of the previous email. Qt5 fails with this error:
>
>> In file included from
>> /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/include/c++/6.1.0/bits/stl_algo.h:59:0,
>>
>>                  from
>> /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/include/c++/6.1.0/algorithm:62,
>>
>>                  from ../../include/QtCore/../../src/corelib/global/qglobal.h:85,
>>                  from ../../include/QtCore/qglobal.h:1,
>>                  from accessible/qaccessible.h:34,
>>                  from accessible/qaccessible.cpp:34:
>> /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/include/c++/6.1.0/cstdlib:75:25:
>> fatal error: stdlib.h: File o directory non esistente
>>  #include_next <stdlib.h>
>
> which means: "file or directory not found".
> stdlib.h is in sysroot/usr/include:
>
>> /host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/stdlib.h
>
> It seems the same behavior reported here:
>
> https://bugs.musicpd.org/view.php?id=4524

  It's also been reported for Fedora [1]. The problem is that qt5 adds a 
completely redundant -isystem <system-include-path> to the gcc command line. I 
guess in gcc6 the include path for the standard C++ headers has changed which 
makes the #include_next <stdlib.h> fail.

  I couldn't find anything in the qt bugtracker, so we should probably report it 
there.

  Regards,
  Arnout

[1] 
https://lists.fedoraproject.org/archives/list/devel at lists.fedoraproject.org/thread/Q5SWCUUMWQ4EMS7CU2CBOZHV3WZYOOTT/




-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
