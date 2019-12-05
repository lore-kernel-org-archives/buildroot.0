From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Thu, 5 Dec 2019 10:44:44 +0000
Subject: [Buildroot] [PATCH v8 1/2] package/compiler-rt: new package
In-Reply-To: <5ba4bcdf-0c34-6e59-dc50-5b8c16a390b1@codethink.co.uk>
References: <20191023214636.17284-1-matthew.weber@rockwellcollins.com>
 <CANQCQpZ8NaqR44gnCSL0L=qCAng46kJ4JzONrFMCP5AsZQjMFQ@mail.gmail.com>
 <5ba4bcdf-0c34-6e59-dc50-5b8c16a390b1@codethink.co.uk>
Message-ID: <aff0a10d-aff0-4bc5-26aa-b8a4850d72d2@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/12/2019 09:44, Thomas Preston wrote:
> On 27/10/2019 19:31, Matthew Weber wrote:
>> On Wed, Oct 23, 2019 at 4:46 PM Matt Weber
>> <matthew.weber@rockwellcollins.com> wrote:
>>> +# The installation of the target runtime libraries defaults to DESTDIR, however
>>> +# host-clang resources directory needs a link so Clang can find the runtime
>>> +# libraries in the same location they would be if built as part of the Clang
>>> +# build. The "resources" directory is loosely documented and seems to be
>>> +# assumed, as compiler-rt is usually build at the same time as Clang and not
>>> +# standalone.
>>> +define COMPILER_RT_SETUP_RUNTIME_LIBS
>>> +       mkdir -p $(HOST_DIR)/lib/clang/$(HOST_CLANG_VERSION)/lib
>>> +       ln -sf ../../../../$(GNU_TARGET_NAME)/sysroot/usr/lib/linux $(HOST_DIR)/lib/clang/$(HOST_CLANG_VERSION)/lib/linux
>>> +       ln -sf ../../../../$(GNU_TARGET_NAME)/sysroot/usr/share $(HOST_DIR)/lib/clang/$(HOST_CLANG_VERSION)/share
>>> +endef
>>> +COMPILER_RT_POST_INSTALL_STAGING_HOOKS += COMPILER_RT_SETUP_RUNTIME_LIBS
>>> +
> 
> The second of those symlinks should only go up three directories.
> 
> Also, why do you create symlinks into $(HOST_DIR) from a "target" package?
> Why not just add host-compiler-rt logic and depend on "host-compiler-rt"
> where appropriate? Then you could remove this define entirely. I'd also add:
>     
>     HOST_COMPILER_RT_CONF_OPTS = $(COMPILER_RT_CONF_OPTS)
> 
> The default target is still the same. I'm testing this at the minute.
> 

Actually scratch that, host-compiler-rt would build a compiler-rt for the
host system - which we don't want.

host-clang expects to find `lib/linux` and `share` (target) compiler-rt
files, which is what these symlinks provide.

Sorry for spam, although my other two comments still apply.

Thanks
