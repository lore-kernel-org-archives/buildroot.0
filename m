From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Fri, 1 May 2020 09:20:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/pkg-meson: use pkgconf to find
 host libraries.
In-Reply-To: <CADvTj4qPu97L0h+okgWgKxf6dtWKQUpv_AwSgO+QW79aavZhXw@mail.gmail.com>
References: <20200130084734.20100-1-nicolas.cavallari@green-communications.fr>
 <b3e489a7-0c62-aed2-c896-f41c9a10d757@mind.be>
 <CADvTj4qPu97L0h+okgWgKxf6dtWKQUpv_AwSgO+QW79aavZhXw@mail.gmail.com>
Message-ID: <725af016-a8a9-01d3-63c4-14557827f907@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30/04/2020 22:37, James Hilliard wrote:
> On Sun, Feb 2, 2020 at 2:47 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>  Hi Nicolas,
>>
>>  Looks good to me, but...
>>
>> On 30/01/2020 09:47, Nicolas Cavallari wrote:
>>> meson makes a distinction between 'native' (i.e. host) dependencies
>>> and 'host' (i.e. target) dependencies and can use a different pkg-config
>>> binary for each case.
>>>
>>> Currently, pkg-meson only pass the target pkg-config and meson
>>> automatically guesses the host pkg-config by searching PATH, which finds
>>> host/bin/pkg-config, which is the target pkg-config wrapper script.
>>>
>>> As a result, meson uses the target pkg-config to find host dependencies,
>>> with possibly incorrect results.
>>>
>>> This patch causes meson to use host/bin/pkgconf directly to find host
>>> dependencies, using the apparently recommended method[1] of
>>> specifing the PKG_CONFIG environment variable.  pkgconf does not know
>>> about the target sysroot, so only finds host dependencies.
>>
>>  In HOST_MAKE_ENV we also set
>>
>> PKG_CONFIG_LIBDIR="$(HOST_DIR)/lib/pkgconfig:$(HOST_DIR)/share/pkgconfig"
>>
>> Don't we still need that to make sure it will indeed find our own .pc files? Or
>> is that anyway the default for pkgconf due to our --prefix in the configure step?
> Meson provides a command line flag to correctly set the pkg-config
> libdir path for
> only dependencies with native: true, this would not do that correctly from my
> understanding as the PKG_CONFIG_LIBDIR would need to be scoped to
> dependencies with native: true.
> See my patch here fixing this:
> https://patchwork.ozlabs.org/project/buildroot/patch/20200428122213.63826-1-james.hilliard1 at gmail.com/

This patch is quite old. A v2 version was posted a while ago. And then
Arnout committed its own fix after bumping meson to a version with more
options, then the v2 (which used a host pkg-config wrapper) was
rejected. Things were different when this patch was posted. So this is
quite the necropost.

IIRC, to find the pkg-config/configuration to use, meson does, in order:
1. For native dependencies, search the cross-file or command line, but
only options for the host machine. Back then, the cross file options
were limited, IIRC.
2. For target dependencies, search the cross-file or command line, but
only options for the target.
3. use the PKG_CONFIG env variable
4. search 'pkg-config' in PATH

Before my patch, buildroot set the target pkgconfig to
usr/bin/pkg-config in the cross file and didn't use any host option. So
it would work for target dependencies, but for native dependencies,
there wasn't
any option so meson would fall back to searching PATH and find
usr/bin/pkg-config that way, which is obviously incorrect.

My patch merely set PKG_CONFIG to pkgconf, which is already correctly
configured to find host packages. the v2 version would set PKG_CONFIG to
a host-pkg-config wrapper, which didn't do much more than the raw
pkgconf, except replicate the HOST_MAKE_ENV options that probably were
already the default.

Then i slapped a MY_PRIVATE_PACKAGE_CONF_OPTS =
--build.pkg-config-path=$(HOST_DIR)/lib/pkgconfig/ in my private package
as a crude workaround (this sets a PKG_CONFIG_PATH to use with the
target pkg-config wrapper !) and mostly forgot about the issue.

Meanwhile, Arnout changed things and i assumed that it should have fixed
it. I didn't try removing my hack in my private package.  apparently the
cross-file now uses pkgconf and sets pkg-config options by itself.
Looking at the patch, i don't understand how that fixes things for
native dependencies.

Meanwhile, didn't meson gained an option to specify the native
pkg-config to use in the cross-file ?
