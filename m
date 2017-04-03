From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 3 Apr 2017 16:12:55 +0200
Subject: [Buildroot] libintl static linking issues - yet another spin
In-Reply-To: <20170403150217.788f6130@free-electrons.com>
References: <20170326235320.448e802a@free-electrons.com>
 <db756f2e-3dda-2fcc-6035-3287b88acf29@mind.be>
 <20170328222525.005b27bb@free-electrons.com>
 <66e02263-8faf-0601-e3ba-18501de7c6ef@mind.be>
 <20170403130149.6ccffe4e@free-electrons.com>
 <b2eb7b3c-1205-a1c1-fdd2-bfb1bafcfa66@mind.be>
 <20170403141147.0376b102@free-electrons.com>
 <c5d92f69-e151-293b-3b77-3b2b061d0e50@mind.be>
 <20170403150217.788f6130@free-electrons.com>
Message-ID: <6e504e73-6e5f-b921-9f86-599b73d22378@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03-04-17 15:02, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 3 Apr 2017 14:45:12 +0200, Arnout Vandecappelle wrote:
> 
>>  And I guess musl also has it in a single libc? Yeah, I don't see a libintl
>> there so I guess it's bundled.
>>
>>  If we do enable the stubs in uClibc, and a packages links with -lintl, then in
>> fact the full gettext will be used and the stubs are not even linked in
>> (statically or dynamically), correct? In that case, we could indeed enable the
>> stubs in uClibc. As a result, in static linking, any package that links with
>> gettext but forgets an explicit -lintl will use the stubs instead of the full
>> implementation. So the package still works, but without translations.
> 
> Does this actually work? Won't the linker complain about conflicting
> symbols between libintl and libc? Are weak symbols in libc also working
> in static linking scenarios?

 As usual, I haven't tested. However:

- For dynamic linking, it is never a problem if a symbol was already loaded from
another library. Any UNDEF symbol in the .so file will link with the
already-loaded symbol, and the defined symbols will not be loaded.

- For static linking, it is done per .o file. A .o file from a .a is only linked
in if any symbol in the file is currently undefined. So you can have duplicate
definitions if libc itself requests a symbol that is defined in its own
libintl.o, but not in the external libintl.o, because then both the internal and
the external libintl.o will be linked in.

 As far as I can see, the gettext calls within uClibc itself are all #define'd
away, so this problem shouldn't occur. And anyway, the external libintl also
defines all of them, so unless you link with '-lc -lintl' (which gives libc
precedence over libintl), there shouldn't be a problem.

 I repeat: this is all theoretical, I haven't tried.

> 
>>  As a side note, pretty much independent of this issue: I wonder if our
>> BR2_NEEDS_GETTEXT_IF_LOCALE approach really is the right thing to do. It
>> basically says: if a package is able to use translations, we force translations
>> (by enabling gettext). Wouldn't it be much more appropriate to remove all those
>> selects from Config.in, and instead just add to _DEPENDENCIES:
>> $(if $(BR2_PACKAGE_GETTEXT),gettext) ? That allows the user to choose whether or
>> not they want translations.
> 
> No, that's not what BR2_NEEDS_GETTEXT_IF_LOCALE says. What
> BR2_NEEDS_GETTEXT_IF_LOCALE is really what it means: the package really
> absolutely NEEDS gettext to be available if locale support is available
> in the toolchain. I.e, with locale support enabled, the package would
> *NOT* build if gettext is not available.

 So this is *only* for package that stupidly assume that if you can call iconv,
you can also call gettext? That should be extremely rare, no?

 I found at least one commit that does the wrong thing then:

commit 96e89e4a69500a99e129777439b80af7df56cb8d
Author: Romain Naour <romain.naour@openwide.fr>
Date:   Sun May 10 22:33:04 2015

    package/gnuchess: add gettext dependency

    gnuchess check for libintl library if BR2_NEEDS_GETTEXT_IF_LOCALE is set.

    checking for GNU gettext in libintl... yes
    checking whether to use NLS... yes
    checking where the gettext function comes from... external libintl
    checking how to link with libintl... -lintl

    But the dependency on gettext package is missing to ensures
    reproducible builds.


> 
> Of course, there might be incorrect uses of BR2_NEEDS_GETTEXT_IF_LOCALE
> that don't follow this rule, and they should be fixed as you suggest,
> but BR2_NEEDS_GETTEXT_IF_LOCALE remains needed for the case I explained
> above. See the documentation:
> 
> """
> Packages that need gettext only when locale support is enabled should:
> 
>     use select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE in
>     the Config.in file; 
> """

 That's not clear enough in the documentation then.

 Regards,
 Arnout

> 
> Best regards,
> 
> Thomas
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
