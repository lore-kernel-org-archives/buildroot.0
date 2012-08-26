From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 26 Aug 2012 23:24:53 +0200
Subject: [Buildroot] [PATCH] package/autotool infra: create missing m4
 dir
In-Reply-To: <201208211808.10782.yann.morin.1998@free.fr>
References: <1345294113-11303-1-git-send-email-yann.morin.1998@free.fr>
 <20120821113312.3bea26a0@skate> <201208211808.10782.yann.morin.1998@free.fr>
Message-ID: <503A9425.2030708@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/21/12 18:08, Yann E. MORIN wrote:
> Thomas, All,
>
> On Tuesday 21 August 2012 11:33:12 Thomas Petazzoni wrote:
>> Le Sat, 18 Aug 2012 14:48:33 +0200,
>> "Yann E. MORIN"<yann.morin.1998@free.fr>  a ?crit :
>>
>>> When a package needs to be auto-reconfigured, it may be missing the m4/
>>> sub-dir, especially when we use the package from its VCS.
[snip]
>> but it needs
>> some discussion. I find this approach a bit fragile, and I'm not sure
>> it will cover all possibilities: I've seen packages doing more funky
>> things than just creating the AC_CONFIG_MACRO_DIR directory in their
>> autogen.sh/bootstrap script. For example, calling glibtoolize or
>> intltoolize, which I'm not sure are automatically being called by
>> autoreconf (but I may be wrong).
>>
>> So, I see two alternative approaches to yours (I'm not saying those
>> alternatives are better, just mentioning them to open the discussion):
>>
>>   1. Add an explicit<pkg>_AC_CONFIG_MACRO_DIR option, which defaults to
>>      m4, and which can be overridden by the package .mk file. The
>>      autotools infrastructure then creates in the source tree a
>>      directory of this name before doing the autoreconfiguration.
>>
>>   2. Make the autoreconf command configurable. I.e, by default the
>>      autotools infrastructure does $(AUTORECONF)
>>      $$($$(PKG)_AUTORECONF_OPT), but maybe we could use a
>>      $$($$(PKG)_AUTORECONF_CMDS) instead, so that you could do 'mkdir
>>      $(@D)/m4; $(@D)/autogen.sh' if you need, etc.
>>
>> Thoughts?
>
> Well...
> 1) is pretty easy to do, but might not cover all cases, far from it, from
> what you said above. But it might be "good enough" it is catters for 90+%
> of packages.
>
> 2) should be relatively easy too, and is very versatile. OTOH, if one needs
> to run the buildroot's standard $(AUTORECONF), it can become a bit more
> complex.
>
> So, what is the current state of packages in buildroot?
>
> - 2 packages create a m4/ sub-dir:
>      $ grep -c -r -E 'mkdir .*m4' * |grep -v -E ':0$'
>      libiscsi/libiscsi.mk:1    mine, not yet upstream, missing m4/ dir
>      sysprof/sysprof.mk:1      uses POST_PATCH_HOOK
>
>    -->  so option 1) would really catter for only two packages
>
> - 3 packages declare one or more PRE_CONFIG hooks:
>      $ cd package; grep -c -r -E 'PRE_CONFIGURE_HOOKS[[:space:]]*[+:]?=' . \
>        |grep -v -E ':0$'
>      cups/cups.mk:1            calls only autoconf, standard autreconf breaks
>      libiscsi/libiscsi.mk:1    mine, not yet upstream, missing m4/ dir
>      socat/socat.mk:1          does not use automake, needs autoconf only
>
>    -->  so option 2) would really catter for only two packages
>
> I guess that's not really important to provide such a mechanism.
> Forget about my patch. ;-)

  Even so, a "smarter" autoreconf would be less fragile than what we do now -
you'd expect the package's bootstrap.sh to be more complete than just a plain
autoreconf.  For instance, I had a package once that required a Changelog file
to be present.  We could add a $(PKG)_AUTORECONF_SCRIPT variable that defines
the script.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
