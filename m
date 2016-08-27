From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 27 Aug 2016 12:21:43 +0200
Subject: [Buildroot] [PATCH] package/kmsxx: add patch to fix LTO support
In-Reply-To: <20160827092207.17b2bf79@free-electrons.com>
References: <20160826213442.19246-1-arnout@mind.be>
 <20160827092207.17b2bf79@free-electrons.com>
Message-ID: <96862041-b5ba-3b0d-4b45-3ede17f8d842@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27-08-16 09:22, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 26 Aug 2016 23:34:42 +0200, Arnout Vandecappelle
> (Essensium/Mind) wrote:
>> The LTO support in the kmsxx package uses the host gcc-ar and gcc-ranlib
>> instead of the ones from the cross-toolchain. Add a patch that tries to
>> find the right one based on CMAKE_C_COMPILER.
> 
> Thanks for this patch! One quick question though.
> 
>> +     if (HAS_LTO_FLAG)
>> +-        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -flto")
>> +-        set(CMAKE_AR gcc-ar)
>> +-        set(CMAKE_RANLIB gcc-ranlib)
>> ++        find_program(LTO_AR NAMES "${CMAKE_C_COMPILER}-ar" gcc-ar)
>> ++        find_program(LTO_RANLIB NAMES "${CMAKE_C_COMPILER}-ranlib" /usr/bin/gcc-ranlib)
> 
> Why is the last attempted value for AR "gcc-ar", and for RANLIB it's
> "/usr/bin/gcc-ranlib" ? I.e while just the program name in one case,
> and a full path in the other case.

 The /usr/bin/gcc-ranlib is obviously wrong. That was a left-over from a test to
be sure that find_program also finds it if the full path is given.

 I'll send a v2.

 Regards,
 Arnout

> 
> Thanks,
> 
> Thomas
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
