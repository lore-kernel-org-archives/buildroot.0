From: Michael Nosthoff <buildroot@heine.tech>
Date: Sun, 30 Aug 2020 16:34:03 +0200
Subject: [Buildroot] [PATCH 1/2] package/re2: new package
In-Reply-To: <20200826233030.16bd2230@windsurf.home>
References: <20200813144549.1262366-1-buildroot@heine.tech>
 <20200813144549.1262366-2-buildroot@heine.tech>
 <20200826233030.16bd2230@windsurf.home>
Message-ID: <68c32e7f-fb83-764e-313c-d8a8263a069b@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 26.08.20 23:30, Thomas Petazzoni wrote:
> On Thu, 13 Aug 2020 16:45:48 +0200
> Michael Nosthoff via buildroot <buildroot@busybox.net> wrote:
>
>> RE2 is a fast, safe, thread-friendly alternative to backtracking
>> regular expression engines like those used in PCRE, Perl, and
>> Python. It is a C++ library.
>>
>> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
>> ---
>>   package/Config.in     |  1 +
>>   package/re2/Config.in | 12 ++++++++++++
>>   package/re2/re2.hash  |  3 +++
>>   package/re2/re2.mk    | 25 +++++++++++++++++++++++++
>>   4 files changed, 41 insertions(+)
>>   create mode 100644 package/re2/Config.in
>>   create mode 100644 package/re2/re2.hash
>>   create mode 100644 package/re2/re2.mk
> It seems like there is an issue with this package:
>
>    http://autobuild.buildroot.net/results/a98/a98d3203f68f0f929c544537244e7621e80ce0a1/build-end.log
that's not good...
>
> Apparently, only a static version of libre2 gets installed, which is
> built without -fPIC (makes sense for a static library). But then it
> gets linked into a shared library, which booms as all the code in a
> shared library must be compiled with -fPIC.
>
> Perhaps the issue is that we're not explicitly passing
> -DBUILD_SHARED_LIBS=ON to host CMake packages in package/pkg-cmake.mk ?
>
> Could you have a look into this ?


What I'm wondering: Should all host packages always be built as shared libs?


 From the CMake Documentation [1] (which is a bit unclear) I assume that 
as default

CMake will build libs as static. So it might be a coincidence that all 
existing host cmake packages

built as shared as their default.

When comparing to package/pkg-autotools.mk I see that for host packages

 ??? --enable-shared --disable-static

is always set. So it would make sense to also add

 ?? -DBUILD_SHARED_LIBS=ON


to cmake host build flags.



I'm currently on vacation with no access to a proper machine for 
building. So I would

be able to take care of this further earliest next week.


Regards,

Michael



[1] https://cmake.org/cmake/help/latest/variable/BUILD_SHARED_LIBS.html
