From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 Feb 2020 10:05:58 +0100
Subject: [Buildroot] [PATCH 3/3] package/pkg-meson.mk: explicitly
 specify pkg-config settings
In-Reply-To: <20200219213841.3a1fb7a5@windsurf>
References: <20200205103304.2515942-1-arnout@mind.be>
 <20200205103304.2515942-3-arnout@mind.be> <20200219213841.3a1fb7a5@windsurf>
Message-ID: <96557720-64d3-67d3-537d-f30dcb69c0bf@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19/02/2020 21:38, Thomas Petazzoni wrote:
> Hello Arnout,
> 
> On Wed,  5 Feb 2020 11:33:04 +0100
> "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> wrote:
> 
>> meson is able to distinguish between host (= native) and target (=
>> cross) compilation. It will explicitly pass different options to
>> pkg-config to distinguish them. Therefore, we don't need to use the
>> pkg-config wrapper when using meson, and can instead pass the pkg-config
>> settings through the cross-compilation.conf.
>>
>> This is important because in some situations (e.g. for the Python
>> configuration), meson sets the PKG_CONFIG_LIBDIR variable to a different
>> value before calling pkg-config. Relying on our wrapper script doesn't
>> work in that case (except if the script would unconditionally set
>> PKG_CONFIG_LIBDIR, which it doesn't do at the moment).
>>
>> Add the sys_root and pkg_config_lib settings to cross-compilation.conf
>> and use pkgconf directly instead of the wrapper.
>>
>> Note that this requires us to substitute STAGING_DIR as well, with an
>> absolute path. This is not a big deal since cross-compilation.conf is
>> regenerated for every package.
>>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> Unfortunately, this breaks the build of libglib2 in static linking
> scenarios:
> 
>   http://autobuild.buildroot.net/results/35c/35ce460192581a3ce2866ef5d3cb5391afd68cc5/build-end.log
> 
> And now that I have merged the fixes for the erlang an sdbusplus
> issues, this libglib2 issue is the #1 issue hitting the autobuilders on
> master.
> 
> The problem comes from the fact that by skipping the wrapper, you are
> no longer passing the --static option to pkg-config when building
> statically.
> 
> From a quick look at build/lib/mesonbuild/dependencies/base.py in the
> Meson code base, it seems like there is some way to have it pass
> --static to pkg-config:
> 
>         if self.static:
>             libcmd.append('--static')

 self.static is set based on settings in the project, not anything that we can
control from the outside (at least from a quick look at the source).


> But it's not clear to me how that happens. Perhaps with your better
> knowledge of the Meson code base you will have an idea here ?
> 
> Of course, we don't want to unconditionally pass --static, as --static
> should be passed when using pkg-config to look up for target libraries,
> but not when looking up for host libraries, and the whole point of your
> initial patch was precisely to leave it up to meson to invoke
> pkg-config the "right" way depending on whether it was cross-compiling
> something or natively compiling.

 No it wasn't. meson only uses cross-compilation.conf for target compile. So for
native compile, it will use the pkg-config from PATH (which indeed is also wrong
because it will still give target settings). I had another patch that pointed
meson to pkgconf directly as well for native compilation. (This is all from
memory, I may be mistaken...)

 The point of that patch was to make sure that meson knows about the
PKG_CONFIG_LIBDIR that we want it to use, because otherwise it is going to set
the PKG_CONFIG_LIBDIR variable itself to a wrong value and thus bypass the
setting we do in the pkg-config wrapper.

 It is true that I completely forgot about the --static (and --keep-system-libs,
but I'm not sure why we pass *that*...).

 For the problem addressed by my original patch, I think we can in fact *still*
call the wrapper, but also set the pkg_config_libdir and sys_root meson configs.
That way, PKG_CONFIG_LIBDIR will always be set in the environment when calling
pkg-config, so that part of the wrapper gets overridden, but the rest still
applies. If the wrapper is still called, the sys_root part is probably not
needed any more either since the wrapper sets PKG_CONFIG_SYSROOT_DIR, and meson
only overrides it when sys_root is set (again, as far as I can see from a quick
scan of the source).


 Regards,
 Arnout


> 
> Could you help here ?
> 
> Thanks!
> 
> Thomas
> 
