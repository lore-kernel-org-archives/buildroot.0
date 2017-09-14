From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Wed, 13 Sep 2017 18:39:51 -0700
Subject: [Buildroot] [PATCH] package/lzo: Set CMAKE_INSTALL_LIBDIR for
 host variant explicitly
In-Reply-To: <acb86c77-9bcb-2fc2-82a9-0e79a267edfc@mind.be>
References: <20170913173724.6157-1-andrew.smirnov@gmail.com>
 <CAHXCMMKe5KiGHCP4H4vBMj+kzpFOTDgE5HBWDTJHLOGpFaR9Uw@mail.gmail.com>
 <acb86c77-9bcb-2fc2-82a9-0e79a267edfc@mind.be>
Message-ID: <CAHQ1cqHfTVrYiBm6hTu=FWvpDevrKzg6wOYkE9-nevSWp4ezpQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 13, 2017 at 1:43 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> On 13-09-17 20:55, Samuel Martin wrote:
>> Hi Andrey,
>>
>> On Wed, Sep 13, 2017 at 7:37 PM, Andrey Smirnov
>> <andrew.smirnov@gmail.com> wrote:
>>> Building host-lzo on 64-bit Fedora 26 ends up with library files
>>> installed into $(HOST_DIR)/lib64 instead of $(HOST_DIR)/lib where
>>> other packages (at least host-mtd) depending on it would look for it
>>> (resulting in build failures). Fix that by specifying the directory to
>>> be lib/ explicitly.
>
>  It would be good to find out why this happens. I don't see anything in
> CMakeLists.txt that could explain this.
>
>  Does this happen with the Buildroot-built host-cmake or only when you use the
> system-installed one?
>
>  I expect this will happen with all host-cmake packages... Could you check?
>
>  Obviously, we need a more fundamental solution than this.
>

Just finished digging more into this and it doesn't matter which CMake
is being used (I tried both). As far as I can tell the reason for this
behavior is the following code in CMake itself:

https://github.com/Kitware/CMake/blob/master/Modules/GNUInstallDirs.cmake#L201

I agree that this probably affects all "host-cmake" packages. I don't
have any data to back that up (meaning I didn't try to investigate
it), but I have a hunch that situation with "host-mtd" is exacerbated
by the fact that it uses AC_CHECK_LIB instead of relying on
PKG_CHECK_MODULES to find "lzo".

>>>
>>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>>
>> Acked-by: Samuel Martin <s.martin49@gmail.com>
>
>  Nacked by me, we need a more fundamental fix.
>
>
>>
>>> ---
>>>
>>> I suspect this might not be the best solution for this problem, but it
>>> is a good starting point to discuss what might be and that's why I
>>> submitted this patch anyway.
>>
>> Indeed the infra could certainly create the symlink $(HOST_DIR)/lib64
>> -> lib (or  $(HOST_DIR)/lib32 -> lib).
>
>  That could be a solution, but I don't like it very much... OTOH we do this for
> staging/target already so why not for host.
>

I have no opinion on the matter, so I am happy to modify the patch to
do whatever you think is best.

Thanks,
Andrey Smirnov
