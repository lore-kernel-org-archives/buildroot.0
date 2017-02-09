From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Thu, 09 Feb 2017 21:02:49 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-01-24
In-Reply-To: <CAHXCMMJ_bNBo+dx3N1ugJQmJQxCvc+PaWjY93oYCi1nTBQQTew@mail.gmail.com>
References: <20170125073013.D171D20CD4@mail.free-electrons.com>
 <1485378342.7516.1.camel@embedded.rocks>
 <20170125211534.dugtv6byofg3wvg5@tarshish>
 <CAHXCMM+cL0UnnfhgFTtkeC7L+jRh8s=tr-U5CTC0YZxzUBb4bA@mail.gmail.com>
 <1485722254.4549.1.camel@embedded.rocks>
 <20170129211155.f6sebtrdmsrwb2yw@tarshish>
 <1485806342.3759.3.camel@embedded.rocks>
 <20170130212025.a5mmf5kfig3kgngo@tarshish>
 <1485811370.2212.0.camel@embedded.rocks>
 <20170130212602.xmxjbkp4zzrfhuof@tarshish>
 <1486333037.12820.6.camel@embedded.rocks>
 <20170206120617.7760c340@free-electrons.com>
 <CAHXCMMKmaRC8z6-A_xucDxiAhz1-2xqPhGvogMLhW8uTO2Xw7Q@mail.gmail.com>
 <7A7D81D5-CC2B-41A5-9275-C9D7F63A5CF1@embedded.rocks>
 <CAHXCMMJ5Mp=8v-AmAY20wGz0UZ3qBoRMAQmZBFhWVApkM4dnZA@mail.gmail.com>
 <C119D098-632D-42AB-A4C7-13481318DDDC@embedded.rocks>
 <CAHXCMMJy9T9QTviUMUUqxR8j3Y866BfXQbQ7uN4xcu6BY87eig@mail.gmail.com>
 <1486424308.4950.9.camel@embedded.rocks>
 <CAHXCMMJ-HNK9mCC8_cf1Fk4CnX7NCGF9ypWBVCu2JeBa5oK8CQ@mail.gmail.com>
 <1486472439.1692.3.camel@embedded.rocks>
 <CAHXCMMJ_bNBo+dx3N1ugJQmJQxCvc+PaWjY93oYCi1nTBQQTew@mail.gmail.com>
Message-ID: <1486670569.4238.1.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, 2017-02-07 at 14:29 +0100, Samuel Martin wrote:
> On Tue, Feb 7, 2017 at 2:00 PM, J?rg Krause <joerg.krause@embedded.ro
> cks> wrote:
> > Hi Samuel,
> > 
> > On Tue, 2017-02-07 at 12:28 +0100, Samuel Martin wrote:
> > > J?rg, all,
> > > 
> > > On Tue, Feb 7, 2017 at 12:38 AM, J?rg Krause
> > > <joerg.krause@embedded.rocks> wrote:
> > > > Hi Samuel,
> > > > 
> > 
> > [snip]
> > 
> > > > 
> > > > Version 3.6.3 works, too. So, I did a git bisect. The rpath
> > > > issue
> > > > was
> > > > introduced in "Teach find_library and find_package to search
> > > > lib32
> > > > paths" [1].
> > > 
> > > Thanks for the investigation!
> > > 
> > > > 
> > > > Any ideas how to fix this?
> > > 
> > > Not so far :-/
> > 
> > Ray Donnely proposed a potential fix for this issue [1] on the
> > CMake
> > mailing list. I have not tried the patch so far.
> 
> Good to know CMake folks are already on this issue.

I had a closer look on why the rpath '/usr/lib32' is used in CMake 3.7.
This upstream commit [1] adds a property `FIND_LIBRARY_USE_LIB32_PATHS`
which is set to TRUE for the Linux platform [2]. This changes the
behavior of `find_library()`. Before the commit `/sysroot/usr/lib` was
found as library path, but now it's `/sysroot/usr/lib32`.

When determining the runtime search path, CMake compares the pathes
found by `find_library()` with a list of implicit runtime pathes. This
list contains `/sysroot/usr/lib` but not `/sysroot/usr/lib32`.

If the library path found by `find_library()` matches a search path
from the list of implicit runtime pathes it is dropped, otherwise it is
added to rpath after removing the `/sysroot` path.

As the implicit runtime search pathes does not contain
`/sysroot/usr/lib32` the rpath is set to `/usr/lib32`.

Note, that this is true not only for bctoolbox but for all CMake
packages!

The behavior of determining the runtime path is controlled by the
property `FIND_LIBRARY_USE_LIB32_PATHS`. As already mentioned, the
value is set to `TRUE` for the Linux platfrom. I tried to overwrite the
property in the toolchain file, without any luck.

Another possibility might be to add `/sysroot/usr/lib32` to the list of
implicit link directories, but using
`CMAKE_C_IMPLICIT_LINK_DIRECTORIES` in the toolchain file did not work
for me.

An approach which worked for me was to remove the `CMAKE_SYSTEM_NAME`
setting from the toolchain file. This way, I was able to set the
`FIND_LIBRARY_USE_LIB32_PATHS` property to `FALSE` and `/usr/lib32` was
not set as rpath anymore.

Samuel, do you have any idea how to set the property
`FIND_LIBRARY_USE_LIB32_PATHS` without removing `CMAKE_SYSTEM_NAME`
from the toolchain file?

Or is there any other solution?

[1] https://gitlab.kitware.com/cmake/cmake/commit/896ad251de49f167f4ce3
cbbcf9a6cce85a16681
[2] https://gitlab.kitware.com/cmake/cmake/blob/896ad251de49f167f4ce3cb
bcf9a6cce85a16681/Modules/Platform/Linux.cmake#L56

J?rg
