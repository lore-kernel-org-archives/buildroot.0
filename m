From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sat, 5 Apr 2014 16:44:06 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-03-28
In-Reply-To: <20140405144804.743b310a@skate>
References: <20140329073011.D16F2101349@stock.ovh.net>
 <20140329175452.5c711852@skate>
 <CAGm1_kuaabmOkyg60eU+PkWuwOgCQ3Kci3yX=8SXdG=jjnaeqw@mail.gmail.com>
 <20140405144804.743b310a@skate>
Message-ID: <CAGm1_kvmveF6QpT66fMfW+psigqShdzMi-_9bQthrnsA8q6mdg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Apr 5, 2014 at 2:48 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Yegor Yefremov,
>
> On Sun, 30 Mar 2014 13:59:44 +0200, Yegor Yefremov wrote:
>
>> >>        arm | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/fd8fef776e079600ae0f8ded2763cd3fca39ebee/
>> >>        arm | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/11c352d0f676fc7737ba3a35747474a93ff01d4b/
>> >>     x86_64 | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/df805da50cdfea4ccee112f8b3c65655d1e5eee8/
>> >>        arm | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/00532a8356143baa308c4f832775d8ee28e27e66/
>> >>     x86_64 | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/f90465c77540308d7807dde4308e5ebff07ec9ba/
>> >>        arm | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/497f31a2147cd7ce136ca86a4bdc033088b8272f/
>> >>        arm | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/960cd673632fb4ae598ea6b278cb9664c6dc1ad0/
>> >
>> > Yegor, can you have a look ?
>>
>> I'll do next week. I've made a quick test with the first failed
>> config. I've stripped it down to build settings and libuci, but it
>> didn't fail on Ubuntu 13.10.
>
> Any news? libuci is still generating a good number of build failures
> everyday. It would be good to fix this really soon.

Sorry for delay.

I still cannot reproduce the error. At first I've sent the patch, that
combines two patches, that were made for libubox. As one can see, it
is uci, that makes trouble, but not libubox.

Then I have diffed both lua/CMakeLists.txt files and found out, that
libubox one has LUAPATH quoted, but the one from uci not.

IF(NOT ${LUA_CHECK_RES} EQUAL 0 OR "${LUAPATH}" EQUAL "")

Could you test this?

diff --git a/lua/CMakeLists.txt b/lua/CMakeLists.txt
index e4295d7..4ba8e37 100644
--- a/lua/CMakeLists.txt
+++ b/lua/CMakeLists.txt
@@ -36,7 +36,7 @@ IF(NOT LUAPATH)
        )

        IF(BUILD_LUA)
-               IF(NOT ${LUA_CHECK_RES} EQUAL 0 OR ${LUAPATH} EQUAL "")
+               IF(NOT ${LUA_CHECK_RES} EQUAL 0 OR "${LUAPATH}" EQUAL "")
                        MESSAGE(SEND_ERROR "Lua was not found on your system")
                ENDIF()
        ENDIF()


Yegor
