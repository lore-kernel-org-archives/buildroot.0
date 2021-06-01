From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 1 Jun 2021 21:31:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/pkg-meson: handle b_pie
In-Reply-To: <20210529193011.GA3858765@scaer>
References: <20210528191748.1598384-1-fontaine.fabrice@gmail.com>
 <20210529090943.GM2788252@scaer> <20210529092141.GO2788252@scaer>
 <CAPi7W81QTY2s-sraNPmB4wL3GSR4zys1cwW9D69OZWGZ0ZhWNg@mail.gmail.com>
 <20210529193011.GA3858765@scaer>
Message-ID: <38f9645e-5f54-e8b4-33b7-0f2439153b0e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29/05/2021 21:30, Yann E. MORIN wrote:
> Fabrice, All,
> 
> Meson experts, questions for you below!
> 
> On 2021-05-29 11:41 +0200, Fabrice Fontaine spake thusly:
>> Le sam. 29 mai 2021 ? 11:21, Yann E. MORIN <yann.morin.1998@free.fr> a
>> ?crit :
>>> On 2021-05-29 11:09 +0200, Yann E. MORIN spake thusly:
>>>> On 2021-05-28 21:17 +0200, Fabrice Fontaine spake thusly:
> [--SNIP--]
>>>>> diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
>>>>> index a57820d4d2..a55063d58e 100644
>>>>> --- a/package/pkg-meson.mk
>>>>> +++ b/package/pkg-meson.mk
>>>>> @@ -91,6 +91,7 @@ define $(2)_CONFIGURE_CMDS
>>>>>             --default-library=$(if
>>>>>             $(BR2_STATIC_LIBS),static,shared) \
>>>>>             --buildtype=$(if $(BR2_ENABLE_DEBUG),debug,release)
>>>>>             \
>>>>>             --cross-file=$$($$(PKG)_SRCDIR)/build/cross-compilation.conf
>>>>>             \
>>>>> +           -Db_pie=$(if
>>>>> $(BR2_TOOLCHAIN_SUPPORTS_PIE),true,false) \
>>> Given a later patch that arrived in parallel, it turns out this
>>> patch
>>> was not correct, and that we still have a bit of interrogation on
>>> that,
>>> so I've reverted it, sorry. I'll keep an eye on the discussions...
>> I think that the second version of this patch (i.e. always disabling
>> b_pie through command line) is the best option because:
>> - PIE is already enabled by the toolchain-wrapper:
>> hardening-check
>> output/build/pipewire-0.3.26/build/spa/plugins/audioconvert/benchmark-resample
>> output/build/pipewire-0.3.26/build/spa/plugins/audioconvert/benchmark-resample:
>>  Position Independent Executable: yes
> 
> OK, so PIE is indeed applied when building, good.
> 
>> - Enabling PIE in two different places is not future-proof and is not
>> done in any other infrastructures (autotools, cmake, etc.).
> 
> Yeah, that makes perfect sense.
> 
>> I think
>> this is also the reason why strip is unconditionally disabled in the
>> command line (it is already handled in Makefile.in)
> 
> Yeah, I know about strip. However, my question for the meson experts in
> the room, is: should we leave that (strip, b_pie) on the command line,
> or should we have them in the cross-compilation file?

 Well, currently we pass them in the toolchain wrapper.

 If we would put -fPIE in the cflags in the cross-compilation file, we'd hit
this message:

        if '-f' + arg.lower() in all_flags or '-f' + arg.upper() in all_flags:
            mlog.warning("Use the '{}' kwarg instead of passing '{}' manually to
{!r}".format(arg, '-f' + arg, self.name))
            return True

 But now, meson doesn't notice because we hide it in the wrapper.

 Anyway, the only effect of b_pie (or various other ways of passing the same
option) is that it adds -fPIE to the compilation flags. So I don't think it's
useful to set b_pie.


> Additionaly, the machine-files documentation [0] lists pkg_config_path
> as being part of the builtin options, so shouldn't we also push that
> into the cross-compilation file?

 Yes, that's just accidental. It was passed as a command-line option in the
weston package, and later refactored in the core package-meson in commit
5cff3a8bdfba92e9f61d0984df08f1ecd205c072 - but still keeping it as a
command-line option.


> As of today, we have two places where we push meson options: the command
> line, and the cross-compilation file. To further Fanrice's argument:
> having two places where we push options is not very consistent and
> future-proof.
> 
> Basically, that would give a patch like (@HOST_DIR@ is already replaced):
> 
>     diff --git a/package/meson/cross-compilation.conf.in b/package/meson/cross-compilation.conf.in
>     index 37b49eea3b..942f68f008 100644
>     --- a/package/meson/cross-compilation.conf.in
>     +++ b/package/meson/cross-compilation.conf.in
>     @@ -13,6 +13,9 @@ g-ir-compiler = '@STAGING_DIR@/usr/bin/g-ir-compiler'
>      g-ir-scanner = '@STAGING_DIR@/usr/bin/g-ir-scanner'
>      
>      [built-in options]
>     +b_pie = false
>     +strip = false
>     +build.pkg_config_path = '@HOST_DIR@/lib/pkgconfig'
>      c_args = [@TARGET_CFLAGS@]
>      c_link_args = [@TARGET_LDFLAGS@]
>      cpp_args = [@TARGET_CXXFLAGS@]
>     diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
>     index 1857450564..87cf0e3dd7 100644
>     --- a/package/pkg-meson.mk
>     +++ b/package/pkg-meson.mk
>     @@ -91,9 +91,6 @@ define $(2)_CONFIGURE_CMDS
>      		--default-library=$(if $(BR2_STATIC_LIBS),static,shared) \
>      		--buildtype=$(if $(BR2_ENABLE_DEBUG),debug,release) \
>      		--cross-file=$$($$(PKG)_SRCDIR)/build/cross-compilation.conf \
>     -		-Db_pie=false \
>     -		-Dstrip=false \
>     -		-Dbuild.pkg_config_path=$$(HOST_DIR)/lib/pkgconfig \
>      		$$($$(PKG)_CONF_OPTS) \
>      		$$($$(PKG)_SRCDIR) $$($$(PKG)_SRCDIR)/build
>      endef

 LGTM.


 Regards,
 Arnout

> As far as I can tell from the documentation, this really seems like this
> should be what we want to do in Buildroot, because that way, these
> settings will also be used for the SDK, or for building manually outside
> of Buildroot...
> 
> So, what's your thoughts about that?
> 
> Regards,
> Yann E. MORIN.
> 
