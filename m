From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 19 Apr 2015 10:36:12 -0300
Subject: [Buildroot] [PATCH v3 08/11] webkitgtk24: new package
In-Reply-To: <20150419144959.330b99b3@free-electrons.com>
References: <1429436906-15222-1-git-send-email-gustavo@zacarias.com.ar>	<1429436906-15222-9-git-send-email-gustavo@zacarias.com.ar>
 <20150419144959.330b99b3@free-electrons.com>
Message-ID: <5533AF4C.9040108@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/19/2015 09:49 AM, Thomas Petazzoni wrote:

> I'm a bit unhappy with webkitgtk24 as the name. Are the newer versions
> API incompatible? Also, is it possible to install both webkitgtk24 and
> webkitgtk26 or 28 on the same system?

Hi.
I'm not happy with the naming either, it's crappy to type/autocomplete.
But yes, multiple versions can live side-by-side and the API isn't
exactly the same.
In fact i have quite a setup with a webkitgtk26 package (in process of
going 28) but didn't send it yet because there are no applications in
buildroot that use it.
Midori can't use 2.6.x or 2.8.x, that's probably expected for a future
release (0.6.x+).
Versions 2.6.x/2.8.x can be used with epiphany (AKA web), but that would
require adding many new gnome3 packages and i'm not that fond of it (and
much less having time for it).

> Wow, so all in all, it's only available on ARM and x86/x86-64. Not a
> huge list of supported architectures. But OK.

This is just what i managed to get building and running.
A couple of mips combinations failed to build, one built but segfaulted
and i didn't test extensively because of build times.
The mips failures might be qemu's fault to be honest, at least those
that didn't run properly.
Powerpc needs some build patches, and i lack any ppc with framebuffer to
test (plus they're not a normal setup either).
I didn't try "fringe" or resource-constrained architectures.
And it's subject to available hardware to test as well, qemu is usable
but painfully slow :)
So right now it's "documentation" - these are known to work but doesn't
mean others won't.
I was hoping all of the people claiming for "i want new webkit!!!!1!!1"
would do some testing and feedback, but they're awfully silent on the
matter.

>> +comment "webkitgtk24 needs libgtk2 and a toolchain w/ C++, wchar, NPTL"
>> +	depends on BR2_PACKAGE_WEBKITGTK24_ARCH_SUPPORTS
>> +	depends on BR2_ARCH_HAS_ATOMICS
>> +	depends on !BR2_PACKAGE_LIBGTK2 || !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
>> +		|| !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
>> +	depends on BR2_USE_MMU
>> +
>> +config BR2_PACKAGE_WEBKITGTK24
>> +	bool "webkitgtk 2.4.x"
>> +	depends on BR2_INSTALL_LIBSTDCPP
>> +	depends on BR2_USE_WCHAR
>> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>> +	depends on (BR2_PACKAGE_LIBGTK2 && BR2_PACKAGE_XORG7)

> Here you require gtk2 + xorg7, but not in the comment above. Is this
> expected?

No, it's a leftover from wayland experimentation, it needs a fix.

> The libgles + libegl case looks a bit weird. Such a configuration is
> normally used *without* X.org, so why would we select some X.org
> libraries in this case?

Right now webkit 2.4.x can't build without gtk2+ and that's the reason
for it, we need xorg7 no matter what.
That's also the reason i dropped my attempts at wayland support, having
xorg7 there negates many of the benefits of such a setup.
It might be possible to patch the xorg/gtk2 needs away, it's already
done for 2.6.x+ actually, but i don't know how much i want to
patch/diverge from upstream, even though they'd probably be a few small
patches.
Most of what i'd like to see is gtk2 going away, even though gtk3
support is "experimental" it works much better than gtk2 according to my
tests, and having both in the target sucks.
The leftover mandatory gtk2 support is for binary netscape api plugins,
which outside of x86* (flash) it probably doesn't make any sense.

> Aah, that's how you solved the infinite loop.

Magic!
I've found this build-testing in an old debian chroot and worked it out
the quick way (well, not so quick for people building in such a scenario).
For webkit-gtk 2.6.x+ it's probably solved via the cmake migration.

> And why? :-)

Thin archives break the build, though i must admit i don't recall
exactly how (it was at the very start of the cleanup effort).

>> +WEBKITGTK24_CONF_OPTS = \
>> +	--enable-dependency-tracking \
> 
> Why? Yes it is in the older webkit, but do we have a reason to have it
> here?

Makefile logic doesn't parallelize well: it breaks the build usually
when building WTF (at the beginning).
It might be worth adding a comment.

Most of the build breakage is solved in the newer versions with cmake,
but midori doesn't like that.

Regards.
