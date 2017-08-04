From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 4 Aug 2017 23:05:40 +0200
Subject: [Buildroot] [PATCH 00/10] libssl: new package
In-Reply-To: <20170804185521.12320-1-Adamduskett@outlook.com>
References: <20170804185521.12320-1-Adamduskett@outlook.com>
Message-ID: <d7c29c3c-8cbb-60fc-9374-c3e33417e964@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Adam,

 Wow, that's fast work!

On 04-08-17 20:55, Adam Duskett wrote:
>  - Add libssl as a new virtual package, and add OpenSSL as the only option.
>    This prevents any package from breaking.

 I briefly mentioned before but clearly didn't explain enough: this will not
fly. The problem is that we want existing configurations to keep working without
a package silently disappearing. So the following procedure should work:

1. Create a .config with BR2_PACKAGE_OPENSSL=y

2. Apply your patches (i.e., bump Buildroot)

3. make menuconfig

4. Save

-> the openssl package must still be selected.

 With your current approach, what happens is this: Kconfig reads in the old
configuration, doesn't see BR2_PACKAGE_LIBSSL=y, removes everything that depends
on BR2_PACKAGE_LIBSSL, and thereby removes BR2_PACKAGE_OPENSSL.

 It is acceptable if the user gets a warning when this happens - that's what
legacy handling does. But that will not happen here.


 One solution would be to make libssl a more traditional virtual package, i.e.
one that can't be selected by the user. A traditional virtual package doesn't
even define a Kconfig symbol (see for example package/opengl/*/Config.in).
However, here we could use the Kconfig symbol to allow packages to select
openssl-or-libressl:

config BR2_PACKAGE_LIBSSL
	bool
	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_LIBRESSL

config BR2_PACKAGE_HAS_LIBSSL
	bool

config BR2_PACKAGE_PROVIDES_LIBSSL
	string


The openssl and libressl packages don't need to be changed, except that they
need to define the value of BR2_PACKAGE_PROVIDES_LIBSSL. Note that typically
there is also nothing stopping both providers to be selected simultaneously at
the Kconfig level; instead this is checked when building. Adding mutual
conclusion at the Kconfig level invariably leads to dependency cycles.


 So that solution is not so nice for two reasons:
- it's not so clear to the user that they can choose between openssl and libressl;
- if the user selects both, they are only warned when building.


 Therefore, an alternative approach is to call the virtual package openssl, and
rename the openssl package to openssl-orig or something. That way, an existing
.config will still work because BR2_PACKAGE_OPENSSL is still a visible symbol
with no dependencies. It has the additional benefit of not requiring the huge
patch 3 (but see below).


 I'm not sure which of the two options is best. Or maybe there is still a third
solution. Maybe something is possible by making BR2_PACKAGE_OPENSSL available
even if BR2_PACKAGE_LIBSSL is not selected, and in the choice having two
auxiliary symbols instead of directly using
BR2_PACKAGE_OPENSSL/BR2_PACKAGE_LIBRESSL. But it gets hairy.


>  - Add OpenSSL as a dependency to the broken packages.

 This is really not nice: it means the user simply can't select these packages
any more unless he manually selects libssl and then openssl. The obvious
solution would be to both 'select BR2_PACKAGE_LIBSSL' and 'depends on
BR2_PACKAGE_OPENSSL' but I think that's a circular dependency for Kconfig. With
my first alternative, the solution is simple: just let them select
BR2_PACKAGE_OPENSSL.

 Also, this really should be one patch per package.


>  - Convert all other packages that don't have OpenSSL as a dependency
>    from openssl to libssl.

 Ideally we'd only want to convert packages that someone has runtime tested with
libressl. However in this case I'm willing to make an exception - libressl is
supposed to be compatible, and we already have plenty of package combinations
that received no runtime testing.

 Ideally this should also be one patch per package, but that's more than 100
patches and really boring. Personally I'm willing to accept this as a single
patch, though Thomas will probably disagree.

 With my first alternative, there is also no need to convert all packages before
adding libressl as a provider.


>  - Bump any packages that need to be updated to build against libreSSL to
>    the current version.

 These bumps can be applied independently, right?


>  - Fix any make files that would cause LibreSSL from not working.

 Again, should be one patch per package that you fix.


>  - Add fix-libressl-support.patch to any packages that need a patch to
>    compile against libressl.

 Same here.


>  - Add LibreSSL as an option to libssl.

 There we go! :-)


 I've said this before but I'll repeat it: this is complicated stuff, expect it
to take months and several iterations before it gets (fully) applied. Ideally it
should be split up into steps that can be applied incrementally, but I'm afraid
that the first patch in the series will always commit us in a certain direction,
so it will be difficult to progress gradually.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
