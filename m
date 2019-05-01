From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 1 May 2019 12:49:53 +0200
Subject: [Buildroot] [PATCH 1/1] New package:
 https://github.com/ndilieto/uacme
In-Reply-To: <20190430001518.GA21154@einstein.dilieto.eu>
References: <20190429205511.GA18242@einstein.dilieto.eu>
 <c15eaa0b-dd79-0350-81c1-59c434049430@mind.be>
 <20190430001518.GA21154@einstein.dilieto.eu>
Message-ID: <dd0d8247-b8c7-be67-2201-031d3339bd84@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Nicola,

On 30/04/2019 02:15, Nicola Di Lieto wrote:
> On Mon, Apr 29, 2019 at 11:59:30PM +0200, Arnout Vandecappelle wrote:
[snip]
>>> +??? select BR2_PACKAGE_LIBCURL_TLS_SUPPORT
>>
>> You cannot select that option. Well, you can, but you shouldn't :-). It's
>> supposed to indicate if any package was selected that curl can use to implement
>> TLS support, so you're only supposed to depend on it, not select it.
> 
> The ACME protocol requires TLS and it won't speak normal HTTP.? If TLS support
> is not enabled, the software? will still build and link without issues, then
> fail at runtime.

 Is that really the case? You need an actual TLS library to be able to generate
the CSR, right? Obviously, you *also* need TLS support in libcurl otherwise you
won't be able to contact the ACME server. But without gnutls or mbedtls, uacme
will simply not build, AFAICS.

> I tried depending at first to prevent this scenario but then
> uacme does not appear in the list of configurable packages at all until libcurl
> TLS support is enabled.
> 
> I saw several packages selecting libcurl instead of depending on it (for example
> collectd, gstreamer, libupnpp, kodi and others), so I assumed it would be OK to
> do the same and also selecting LIBCURL_TLS_SUPPORT. I see your point but I also
> fail to understand why it is allowed to select LIBCURL but not
> LIBCURL_TLS_SUPPORT. Can you elaborate please?

 `select LIBCURL_TLS_SUPPORT` does not actually enable TLS support, it just
tells libcurl that TLS is enabled. So by doing that select without also
selecting a TLS library, you're going to pretend that TLS is available while it
is not.

 Just try with an empty configuration and only enable the uacme package. You'll
see two things:

* the uacme TLS choice has no options;

* the libcurl TLS choice is visible, but also has no options.

 Note that LIBCURL_TLS_SUPPORT doesn't do anything except to control if
libcurl's TLS choice menu is visible.


 That's why you have to do the below, instead, to actually select a TLS library.
Note that by doing this, you'll also implicitly make sure the
LIBCURL_TLS_SUPPORT is available, and that libcurl is built with some TLS library.

>> However, since you require either gnutls or mbedtls, I think you should do
>> something like:
>>
>> ????select BR2_PACKAGE_MBEDTLS if !BR2_PACKAGE_GNUTLS
>>
>> Note that this type of conditional select is tricky. If some other package does
>>
>> ????select BR2_PACKAGE_GNUTLS if !BR2_PACKAGE_MBEDTLS
>>
>> you can get a circular dependency. Fortunately, no other package is doing
>> anything like that, so you can choose which one of those two you prefer. But
>> since gnutls has additional dependencies (!static and wchar), it's better to
>> prefer mbedtls.
>>
>>
>>> +if BR2_PACKAGE_UACME
>>> +
>>> +choice
>>> +??? prompt "SSL/TLS library to use"
>>> +
>>> +config BR2_PACKAGE_UACME_GNUTLS
>>> +??? bool "GnuTLS"
>>> +??? depends on BR2_PACKAGE_GNUTLS
>>
>> We generally don't give a choice for something like that, but choose something
>> automatically.
>>
> 
> I actually adopted the same TLS library selection mechanism that libcurl itself
> uses in its own Config.in.

 That is a special case. See the commit message of b8b78e7e6a1c for the
reasoning behind this. The choice is only relevant in case the user has enabled
more than one TLS library. Is there any reason for the user to prefer that uacme
uses mbedtls rather than gnutls if both are available?

> It seems to work quite well: the correct choice is
> automatically forced if only one of the libraries is available.? If none are
> available the comment shows up.

 In your case, the choice would still come up, but without any options. Also, it
would still be possible to enable the uacme package, but it would fail to build
for lack of TLS library.

> Only when both libraries are available, can the
> user choose. I see your point but again, I fail to understand why it is OK for
> libcurl to give a choice and and not for others.? Also important in my opinion,
> libcurls' approach does not risk circular dependencies.

 In libcurl's case, the TLS library is completely optional - it can be built
without TLS. In uacme's case, the TLS library is required. Therefore, the uacme
package *must* either select or depend on a TLS library. We prefer selecting it,
because that makes life easier for the user.

> Can you please let me
> know what you think?
> 
>>> +
>>> +UACME_VERSION = upstream/1.0.7
>>
>> I don't understand what these upstream/ tags are, but v1.0.7 seems equally
>> appropriate to me.
>>
> 
> They are Debian's recommended DEP14 git branch layout
> 
> https://dep-team.pages.debian.net/deps/dep14/
> 
> I use it to avoid having to maintain a separate repository for debian packaging,
> and so that I can develop on master and automatically merge and release using
> debian's git-buildpackage tools, which rely on pristine-tar to efficiently store
> release tarballs using deltas.
> 
>>> +UACME_SOURCE = uacme-1.0.7.tar.gz
>>> +UACME_SITE = git://github.com/ndilieto/uacme
>>
>> We prefer http over git to access git repositories. But for github, we prefer
>> to use either an uploaded tarball (not available in this case, except if we
>> would use the debian tarball) or the github helper. Thus, it would become
>> something like:
>>
>> UACME_VERSION = 1.0.7
>> UACME_SITE = $(call github,ndilieto,uacme,upstream/$(UACME_VERSION))
>>
> 
> I tried $(call github...) but it fails because the actual released code is in
> the upstream/latest branch, tagged as upstream/1.0.7 which includes a slash.?
> The slash gets converted to an underscore and the github helper fails.

 It will not work if you set VERSION to upstream/1.0.7, but it *will* work if
you set version to 1.0.7 and include the upstream/ part in the github macro
call, like I did above. Trust me, I tried it :-)

>? It's not
> OK to use v1.0.7 from master because uacme's build system uses the
> .tarball-version file to correctly generate the VERSION string for a proper
> release, and that file is only included in the release tags like upstream/1.0.7
> (these tags are the actual contents of the tarball generated by 'make dist')

 Could you include this explanation either as a comment or in the commit message?

> 
>>
>> Note that UACME_SOURCE doesn't need to be set, it is set automatically to the
>> correct value (uacme-$(UACME_VERSION).tar.gz).
>>
> 
> Yes I tried without but then the tar file name generated from the git tree ended
> up being uacme-upstream_1.0.7.tar.gz which I did not particularly like.? Of
> course it's not important, so I'll remove UACME_SOURCE as you suggest.
> 
>>> +UACME_LICENSE = GPL-3.0+
>>> +UACME_LICENSE_FILES = COPYING
>>> +
>>> +UACME_CONF_OPTS = --disable-maintainer-mode --disable-debug
>>
>> I don't think these are needed, are they?
>>
> 
> The configure and build system of uacme uses some logic (look at GNUmakefile,
> configure.ac, Makefile.am and build-aux/git-version-gen) to determine whether it
> needs regenerating the configure script/version tag and also whether to enable
> debug by default.

 I understand all that. I asked because normally these options default to off so
they don't need to be given. But indeed, here they default to on. I should have
checked :-)

 Regards,
 Arnout

> That logic is only really useful to me, the developer.? Those
> two flags are effectively overriding the logic to positively ensure that a) no
> debug is enabled and b) the configure script is never autoreconf'd, which is
> important to preserve the release's VERSION string. See
> https://www.gnu.org/software/automake/manual/html_node/maintainer_002dmode.html
> 
>>
>> Note that the preference here does not need to correspond to the Config.in. In
>> other words, if the user has selected both gnutls and mbedtls, you can choose
>> which of the two should be used for uacme.
>>
>>> +UACME_CONF_OPTS += --with-gnutls=$(STAGING_DIR)/usr
>>
>> Normally, --with-gnutls (without argument) should be enough. It is even
>> preferred, because then pkg-config will be used and it will set LIBS correctly.
>>
> 
> Yes, you're right, I'll change this.
> 
> Please, let me know what you think about the other points, so I can make a
> revised patch that complies with all requirements.
> 
> Regards
> Nicola
> 
