From: Ben Boeckel <mathstuf@gmail.com>
Date: Sat, 23 Jul 2016 19:33:11 +0000 (UTC)
Subject: [Buildroot] [PATCH] cmake: bump version to 3.6.0
References: <1468490810-62781-1-git-send-email-Vincent.Riera@imgtec.com>
 <20160714135926.GA3737@free.fr>
 <a20c45fc-56f0-0e7a-eb0c-80ac07080d42@imgtec.com>
Message-ID: <nn0gpn$pjm$2@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 14 Jul, 2016 at 17:19:11 GMT, Vicente Olivert Riera wrote:
>> This is causing a lot of build failures:
>>     http://autobuild.buildroot.org/?reason=host-cmake-3.6.0

*Puts CMake developer hat on.*

When things like this happen, please file an issue. We just did 3.6.1
this week and it appears that we'll also need a 3.6.2 for some of these
issues; they could have been fixed in 3.6.1 if we had known about them
on the 14th.

>> There are various tyes of failures:
>> 
>>   - incorrect openssl used:
>> 
>>     http://autobuild.buildroot.org/results/193/193e88df98230554e304a8c550e5ded97e3a4177
>> 
>>     -- Found OpenSSL: /home/buildroot/build/instance-1/output/host/usr/xtensa-buildroot-lin
>>     ux-uclibc/sysroot/usr/lib/libssl.so;/home/buildroot/build/instance-1/output/host/usr/xt
>>     ensa-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.so (found version "1.0.2h")
>> 
>>     Clearly, this is finding the target openssl when we are building the
>>     host-cmake. That's wrong.

Indeed. Please file an issue over here:

    https://gitlab.kitware.com/cmake/cmake/issues

so that this can be tracked.

>>   - a weird error while configuring its bundled libcurl:
>> 
>>     http://autobuild.buildroot.org/results/f8c/f8c335440e3132ee7e01fadd03c4d18e0de767ba
>> 
>>     -- Check size of curl_off_t
>>     -- Check size of curl_off_t - failed
>>     -- Check size of socklen_t
>>     -- Check size of socklen_t - failed
>>     CMake Error at Utilities/cmcurl/CMakeLists.txt:1042 (message):
>>       Check for sizeof socklen_t failed, see CMakeFiles/CMakerror.log
>> 
>>     If cmake insists on having curl+ssl support (what for, for g*d's
>>     sake?) we should add a host-libcurl and make host-cmake depend on it
>>     and on host-openssl.

Because otherwise file(DOWNLOAD) cannot fetch files over HTTPS (a common
enough occurence these days). That said, I'm not sure why it's
*required* from a CMake standpoint (but it may cause "unknown protocol
https" during the build of other projects). This is probably due to
something related to the openssl issue above.

>>   - another weird build issue:
>> 
>>     http://autobuild.buildroot.org/results/89f/89fd8085da9cacf612a6aea585eb1ad6941f146b
>> 
>>     /home/buildroot/build/instance-1/output/build/host-cmake-3.6.0/Utilities/cmcurl/lib/multi.c:
>>     Assembler messages:
>>     /home/buildroot/build/instance-1/output/build/host-cmake-3.6.0/Utilities/cmcurl/lib/multi.c:761: Error: incorrect register `%rdx' used with `l' suffix
>>     /home/buildroot/build/instance-1/output/build/host-cmake-3.6.0/Utilities/cmcurl/lib/multi.c:765: Error: incorrect register `%rcx' used with `l' suffix
>>     Utilities/cmcurl/lib/CMakeFiles/cmcurl.dir/build.make:950: recipe for target 'Utilities/cmcurl/lib/CMakeFiles/cmcurl.dir/multi.c.o' failed
>> 
>>     This one looks like again like it is confusing host and target, and
>>     using the wrong compiler and/or assembler.

Please file an issue.

>>   - yet again another weird build issue:
>> 
>>     http://autobuild.buildroot.org/results/85f/85f5e9329047c9d40f7fd35c645835d83a5fcef3/
>> 
>>     /home/buildroot/autobuild/run/instance-2/output/build/host-cmake-3.6.0/Utilities/cmcurl/lib/ftp.c:
>>     Assembler messages: /home/buildroot/autobuild/run/instance-2/output/build/host-cmake-3.6.0/Utilities/cmcurl/lib/ftp.c:1167: Error: junk at end of line, first unrecognized character is `%'
>>     /home/buildroot/autobuild/run/instance-2/output/build/host-cmake-3.6.0/Utilities/cmcurl/lib/ftp.c:1167: Error: junk at end of line, first unrecognized character is `%'
>>     /home/buildroot/autobuild/run/instance-2/output/build/host-cmake-3.6.0/Utilities/cmcurl/lib/ftp.c:1258: Error: junk at end of line, first unrecognized character is `%'
>>     /home/buildroot/autobuild/run/instance-2/output/build/host-cmake-3.6.0/Utilities/cmcurl/lib/ftp.c:1258: Error: junk at end of line, first unrecognized character is `%'
>>     /home/buildroot/autobuild/run/instance-2/output/build/host-cmake-3.6.0/Utilities/cmcurl/lib/ftp.c:1258: Error: junk at end of line, first unrecognized character is `%'
>>     /home/buildroot/autobuild/run/instance-2/output/build/host-cmake-3.6.0/Utilities/cmcurl/lib/ftp.c:1258: Error: junk at end of line, first unrecognized character is `%'
>>     make[4]: *** [Utilities/cmcurl/lib/CMakeFiles/cmcurl.dir/ftp.c.o] Error 1
>>     make[4]: *** Waiting for unfinished jobs....

Looks similar to the above one? We did update curl for 3.6 I believe.

Thanks,

--Ben
