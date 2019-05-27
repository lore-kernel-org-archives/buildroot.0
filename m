From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 27 May 2019 23:44:16 +0200
Subject: [Buildroot] [PATCH v2 05/12] package/flare-engine: fix
 BUG_85180 build timeout
In-Reply-To: <a183161b-648b-7e13-7f06-6a6a9a973354@mind.be>
References: <20190521133932.81841-1-giulio.benetti@micronovasrl.com>
 <20190521133932.81841-6-giulio.benetti@micronovasrl.com>
 <20190524215853.4ee3ddbc@windsurf.home>
 <6fbb9a9d-b836-97dd-5bd2-f9d3dcb06a57@micronovasrl.com>
 <20190524223027.6d05ee4c@windsurf.home>
 <72277a65-f760-226c-0f65-3658b2751390@micronovasrl.com>
 <a183161b-648b-7e13-7f06-6a6a9a973354@mind.be>
Message-ID: <63837120-fdd2-b32f-89e8-e43cc53d420e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27/05/2019 23:03, Arnout Vandecappelle wrote:
> 
> 
> On 27/05/2019 19:20, Giulio Benetti wrote:
>> Hello Thomas,
>>
>> Il 24/05/2019 22:30, Thomas Petazzoni ha scritto:
>>> On Fri, 24 May 2019 22:05:12 +0200
>>> Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:
>>>
>>>>> Why does flare-engine need this, but not jasper, which is also a
>>>>> CMake-based package ?
>>>>
>>>> Because in flare-engine CMakeLists.txt there is no fallback to -O0, so
>>>> that was the only decent way to force CMake to generate Makefiles
>>>> without optimizations.
>>>
>>> Could you be more specific ? How does it work for jasper and
>>> libcpprestsdk, which are also based on CMake ?
>>
>> Yes, the problem here is that even if there's the way to append something to
>> CMAKE_CXX_FLAGS, then any other CMAKE_CXX_FLAGS_* will be appended, so if I set
>> CMAKE_CXX_FLAGS to -O0, I will obtain "-O0 -O2 -g".
>>
>> This is due to the fact that we fall into one of the cases of the next if-elseif
>> statements(in CMakeLists.txt):
>> "
>> if(CMAKE_BUILD_TYPE STREQUAL "Release")
>> ? set(CMAKE_CXX_FLAGS_RELEASE "-O2 -g0")
> 
>  Note that you could also get away without overriding CMAKE_BUILD_TYPE, and just
> setting CMAKE_CXX_FLAGS_RELEASE. Definitions passed on the command line will
> override the ones in CMakeFiles.txt (at least, I think so...).
> 
>  However, since we now still set CMAKE_BUILD_TYPE based on BR2_ENABLE_DEBUG,
> that won't work :-(

 Because of this (and because we can't wait for CMake refactoring), I've
improved the comment in the .mk file a little and also rewrote the commit log
based on what Thomas wrote for the other commits, and applied to master, thanks.

 Regards,
 Arnout


[snip]
