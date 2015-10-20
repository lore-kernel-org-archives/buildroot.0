From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 20 Oct 2015 22:43:48 +0200
Subject: [Buildroot] What is the preferred way install additional cmake
	modules?
In-Reply-To: <20151020185409.GD3738@free.fr>
References: <56267135.7050303@gmail.com> <20151020185409.GD3738@free.fr>
Message-ID: <CAHXCMMLkvFB0z-UiNgLyWjNWZCamBouyaRyyDHbXNF+OC+TG7g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Zoltan, Yann, all,

On Tue, Oct 20, 2015 at 8:54 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Zoltan, All,
>
> On 2015-10-20 18:52 +0200, Zoltan Gyarmati spake thusly:
>> i am about to add the modemmanager-qt[1] package to Buildroot, which
>> for building depends on a set of additional cmake modules also
>> provided by the KDE project, called extra-cmake-modules[2], which
>> itself also uses cmake for building and installing.
> [--SNIP--]
>>  My instinct would say that extra-cmake-modules is supposed to be a
>> host package
>
> My instinct says so, too. ;-)
>
>> (as then i wouldn't need to explicitly set
>> EXTRA_CMAKE_MODULES_INSTALL_TARGET to NO), so i tried this to define
>> as a host-cmake-package, make modemmanager-qt depending on
>> host-extra-cmake-modules, but then the cmake modules not found by the
>> modemmanager-qt build config.
>
> So:
>   - if extra-cmake-modules are in staging/ then it works
>   - if extra-cmake-modules are in host/ then it does not work
>
> But what is not found? The ECM files themselves? Can you paste the few
> lines that exhibit the error, please?

The CMake module files installed by ECM, when configuring a target package.

As explained in [1] (in the second half of the page), CMake
(find_package) looks into a series of paths to find the modules.
The prefix of these paths is sensitive to the CMAKE_SYSROOT variable,
that's why modules installed in the host/ are not found when
configuring some package for cross-compilation.

My understanding behind this behavior is that CMake does not trust too
much 3rd-party modules.
I mean CMake has no way to know:
- that modules located in <buildroot>/output/host/usr/share/ECM/cmake/
are only for the host or for target;
- that <buildroot>/output/host/usr/share/ECM/cmake/ is a collection of
modules specially written to extend to default collection;
- if a 3rd-party module would contain absolute paths to the
libraries/programs/headers/etc, so stuff not compiled for the target.

So, CMake just assumes that everything that is for the target should
be located in the sysroot. That's a safe way IMHO;

(Side note: For pkg-config, it is the same we look for *.pc in host/
for when building for the host, and in staging/ for target, the only
difference is that it does not comes with a lot of *.pc files.)

>
>> In this latter case the .cmake files gets installed under:
>> path-to-buildroot/output/host/usr/share/ECM/cmake/
>
> I would have indeed expected to see them installed there.
>
>> What is the preferred way to install this package? Install it as a
>> host-package, and specify a custom install target dir, or leave it as
>> plain cmake-package?
>
> My stance:
>   - it is a host-package

I second.
I worked on something similar a while ago, and I ended up with a hack
I'm not really proud of: line 15 in [2] (the ugly symlink).

Another way to do this more properly is using
CMAKE_FIND_ROOT_PATH_MODE_PACKAGE [3], like this [4].
But this solution does not prevent from badly written module with
absolute paths (pointing to some host binaries).
This may be caught later during the build by the poison paths
detection, but I doubt it can spot paths to the paths like
<output>/host/usr/lib/; can it?

>
> We need to understand why cmake can't find those modules.
>
> I CCed Samuel, our cmake expert, so he can shine some light on this.

Hope this help! ;-)


[1] https://cmake.org/cmake/help/v3.3/command/find_package.html?highlight=find_package
[2] https://github.com/tSed/buildroot-2/commit/2f5c52bfc8da80461d589efa97898b51ab42021b
[3] https://cmake.org/cmake/help/v3.3/variable/CMAKE_FIND_ROOT_PATH_MODE_PACKAGE.html
[4] http://code.bulix.org/h0jy9o-89332

Regards,

-- 
Samuel
