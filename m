From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 21 Aug 2013 00:29:13 +0200
Subject: [Buildroot] [RFC] Unification of package comments on wchar,
 largefile, c++ support, thread, ... support
In-Reply-To: <CAAXf6LV7wB6_RsufRWD6s7-viuYheasMHJWqDAGtu6BmPpZBdw@mail.gmail.com>
References: <CAAXf6LV7wB6_RsufRWD6s7-viuYheasMHJWqDAGtu6BmPpZBdw@mail.gmail.com>
Message-ID: <5213EDB9.9090704@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/08/13 17:00, Thomas De Schampheleire wrote:
> Hi,
>
> When a package needs any of wchar/largefile/C++/thread support in the
> toolchain, this is handled with a comment in Config.in shown when this
> condition is not met.
>
> However, the text of these comments is currently not unified, some
> examples: (grep -A1 comment package/*/Config.in)
>
> package/acl/Config.in:comment "acl requires a toolchain with LARGEFILE support"
> package/acl/Config.in-  depends on !BR2_LARGEFILE
> --
> package/aircrack-ng/Config.in:comment "aircrack-ng needs a toolchain
> with largefile and threads support"
> package/aircrack-ng/Config.in-  depends on !BR2_LARGEFILE ||
> !BR2_TOOLCHAIN_HAS_THREADS
> --
> package/alsa-lib/Config.in:comment "alsa-lib needs threads support in toolchain"
> package/alsa-lib/Config.in-     depends on !BR2_TOOLCHAIN_HAS_THREADS
> --
> package/alsamixergui/Config.in:comment "alsamixergui requires a
> toolchain with C++ and threads support enabled"
> package/alsamixergui/Config.in- depends on (!BR2_INSTALL_LIBSTDCPP ||
> !BR2_TOOLCHAIN_HAS_THREADS) && BR2_PACKAGE_XORG7
> --
> package/atk/Config.in:comment "atk requires a toolchain with WCHAR support"
> package/atk/Config.in-  depends on !BR2_USE_WCHAR
> --
> package/attr/Config.in:comment "attr requires a toolchain with
> LARGEFILE support"
> package/attr/Config.in- depends on !BR2_LARGEFILE
> --
> package/audiofile/Config.in:comment "audiofile requires a toolchain
> with C++ support enabled"
> package/audiofile/Config.in-    depends on !BR2_INSTALL_LIBSTDCPP
> --
> package/avahi/Config.in:comment "avahi requires a toolchain with thread support"
> package/avahi/Config.in-        depends on !BR2_TOOLCHAIN_HAS_THREADS
> --
> package/axel/Config.in:comment "axel needs a toolchain with thread support"
> package/axel/Config.in- depends on !BR2_TOOLCHAIN_HAS_THREADS
>
>
> As you can see, in just the first few hits of my grep commands, there
> are many differences:
>
> - requires vs needs
> - LARGEFILE vs largefile (capitalization)
> - 'a toolchain with ... support' vs '... support in toolchain'
> - thread vs threads
> - '... support' vs '... support enabled'
> - 'and' vs '+' vs '&' when multiple features are needed (not shown in
> the above examples)
>
>
> I would like to agree on one common text, and adapt all packages
> accordingly. The exact wording can be discussed, the main goal is the
> unification. Here is a proposal:
>
> foo requires a toolchain with feat support
> foo requires a toolchain with featA and featB support
> foo requires a toolchain with featA, featB and featC support
>
> where the features would be written as: WCHAR, LARGEFILE, IPV6, RPC,
> C++, thread.
>
>
> What is your opinion on:
> a. the concept of this unification
> b. the wording proposed above

  Yes and yes.

  One problem: it has to fit 70 characters.

libfoobarfrobniz requies a toolchain with WCHAR, LARGEFILE, IPV6 and C++ 
support

doesn't fit... But I guess we can make an exception for these rare occasions.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
