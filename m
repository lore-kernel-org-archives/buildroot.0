From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 11 Oct 2018 14:39:15 +0200
Subject: [Buildroot] [PATCH 4/4] webkitgtk: explicitly set
 USE_GSTREAMER_GL build option
In-Reply-To: <20181010202425.GN2869@scaer>
References: <20181009220852.4309-1-aperez@igalia.com>
 <20181009220852.4309-5-aperez@igalia.com> <20181010212630.7f47270e@windsurf>
 <20181010202425.GN2869@scaer>
Message-ID: <40fb0474-283f-4b73-78e6-45ea99a1bb65@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/10/18 22:24, Yann E. MORIN wrote:
> On 2018-10-10 21:26 +0200, Thomas Petazzoni spake thusly:
>> Hello,
>>
>> On Wed, 10 Oct 2018 01:08:52 +0300, Adrian Perez de Castro wrote:
>>> This covers the case where GL/GLES is available (so -DENABLE_OPENGL=ON
>>> gets passed), which makes the webkitgtk build system assume GStreamer-GL
>>> is available, while actually it is not.
>>>
>>> Also, use "imply" to select the needed GStreamer-GL component, because
>>> in general it is preferred due to better performance.
>>>
>>> This fixes some autobuilder failures like the following:
>>>
>>>   http://autobuild.buildroot.net/results/187796535af53ece426641ff7d88aabada281674
>>
>> What is fixing the autobuilder issue exactly? Explicitly disabling
>> -DUSE_GSTREAMER_GL=OFF when the plugin is not available ? Or having it
>> enabled by the "imply" ?
>>
>> In the former case, then I believe we need two patches: one fixing the
>> autobuilder issue (i.e just the part in the .mk file) that we can
>> backport to older Buildroot versions as needed, and another one adding
>> the imply.
>>
>> This usage of "imply" would be the first in Buildroot. Peter, Arnout,
>> Yann, anything against it ?
> 
> I don't like it, because it makes it more complex to follow what is
> going on.

 I think this is only true because you're not used to it yet.

> 'imply' is a weak 'select', as the implied symbol can still be
> changed to 'n'.

 'imply' is syntactic sugar for 'default y if ...'. The *only* thing it changes
is the place where you put the imply. (To be exact, it is the same as 'default
...' because it propagates the m/y/n state to the default, not just y/n. But
since we don't use m, it doesn't matter.)

 For this specific case, it is pretty obvious that putting a 'default y if
BR2_PACKAGE_WEBKITGTK_MULTIMEDIA' on BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL
would be crazy. On the other hand, adding the imply in webkitgtk looks nice,
concise and clear.

 Note also that setting a default means that in the typical use case of:

defconfig
menuconfig (add some options)
build
menuconfig (enable BR2_PACKAGE_WEBKITGTK_MULTIMEDIA)

the default will *no longer* be used (because the
BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL is not a new option), so it will *not* be
enabled. Perhaps that is what you mean with "more complex to follow what is
going on"?

 Or maybe your statement is: we shouldn't use 'default y if ...' constructs and
it was a mistake to add them to BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER,
BR2_PACKAGE_IFUPDOWN_SCRIPTS, BR2_PACKAGE_LUA_32BITS,
BR2_TOOLCHAIN_EXTERNAL_HAS_SSP and BR2_TOOLCHAIN_EXTERNAL_INET_RPC?


> Where 'imply' is suefull, is with tristates, where it
> ensures that a tristate can't be 'M' when the implier is 'y'. From the
> kernel's doc:
> 
>   config FOO
>         tristate
>         imply BAZ
> 
>   config BAZ
>         tristate
>         depends on BAR
> 
>   The following values are possible:
> 
>         FOO             BAR             BAZ's default   choice for BAZ
>         ---             ---             -------------   --------------
>         n               y               n               N/m/y
>         m               y               m               M/y/n
>         y               y               y               Y/n
>         y               n               *               N
> 
> And we do not even use tristates at all in Buildroot.
> 
> And basically, from a Buildroot point of view: either we need something,
> in which case we select it (or depend on it), or it is optional, and we
> let the user decide for themselves.

 In recent years, we have been evolving from defaulting to the absolute minimum
towards defaulting to something sane (with the possibility to remove it again).
imply is going to be a huge step forward in that evolution, because it allows us
enable a lot of things that you really want automatically in a simple and
concise way.


> Optionally, if package A can optionaly use package B (or a sub-option of
> it), and we want to entice the user to select it, then we just add a
> sub-option to package A, something like "use B's feature", with proper
> select or depends. We already do such things in many places.

 No we don't. We try to limit such cases because it makes the Kconfig menus so
much bigger.


> So, no, I am absolutely not in favour of using 'imply' at all in Buildroot.

 So it will be up to our BFDL to decide.

 One thing is very clear though: the patch should be split!

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
