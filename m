From: Nicola Di Lieto <nicola.dilieto@gmail.com>
Date: Tue, 30 Apr 2019 02:15:18 +0200
Subject: [Buildroot] [PATCH 1/1] New package:
 https://github.com/ndilieto/uacme
In-Reply-To: <c15eaa0b-dd79-0350-81c1-59c434049430@mind.be>
References: <20190429205511.GA18242@einstein.dilieto.eu>
 <c15eaa0b-dd79-0350-81c1-59c434049430@mind.be>
Message-ID: <20190430001518.GA21154@einstein.dilieto.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Apr 29, 2019 at 11:59:30PM +0200, Arnout Vandecappelle wrote:
> Hi Nicola,
>
> Thank you for your submission. It doesn't completely follow the Buildroot
>coding style, so I have some comments.
>
> First of all, the subject line of a new package is normally:
>
>package/uacme: new package

Ok, thanks and apologies for deviating from the recommended style.

>
> Please also add yourself to the DEVELOPERS file. This way, you'll be put in Cc
>when somebody makes modifications to the package, and you'll also get a message
>when the package fails to build in the autobuilders.
>
> You are not adding the package to package/Config.in, so it can't be selected.
>You have to choose in which menu to put it - probably the networking tools menu
>is most appropriate. Make sure things stays alphabetically ordered.
>

Yes, as you saw in my other message I realized these mistakes.

> Indentation is one tab in Config.in. Please use the 
> utils/check-package script to verify all files you add.

Will do

>> +??? depends on BR2_USE_MMU # fork()
>> +??? select BR2_PACKAGE_LIBCURL
>> +??? select BR2_PACKAGE_LIBCURL_TLS_SUPPORT
>
> You cannot select that option. Well, you can, but you shouldn't :-). It's
>supposed to indicate if any package was selected that curl can use to implement
>TLS support, so you're only supposed to depend on it, not select it.

The ACME protocol requires TLS and it won't speak normal HTTP.  If TLS 
support is not enabled, the software  will still build and link without 
issues, then fail at runtime. I tried depending at first to prevent this 
scenario but then uacme does not appear in the list of configurable 
packages at all until libcurl TLS support is enabled.

I saw several packages selecting libcurl instead of depending on it (for 
example collectd, gstreamer, libupnpp, kodi and others), so I assumed it 
would be OK to do the same and also selecting LIBCURL_TLS_SUPPORT. I see 
your point but I also fail to understand why it is allowed to select 
LIBCURL but not LIBCURL_TLS_SUPPORT. Can you elaborate please?

>
> However, since you require either gnutls or mbedtls, I think you should do
>something like:
>
>	select BR2_PACKAGE_MBEDTLS if !BR2_PACKAGE_GNUTLS
>
> Note that this type of conditional select is tricky. If some other package does
>
>	select BR2_PACKAGE_GNUTLS if !BR2_PACKAGE_MBEDTLS
>
>you can get a circular dependency. Fortunately, no other package is doing
>anything like that, so you can choose which one of those two you prefer. But
>since gnutls has additional dependencies (!static and wchar), it's better to
>prefer mbedtls.
>
>
>> +if BR2_PACKAGE_UACME
>> +
>> +choice
>> +??? prompt "SSL/TLS library to use"
>> +
>> +config BR2_PACKAGE_UACME_GNUTLS
>> +??? bool "GnuTLS"
>> +??? depends on BR2_PACKAGE_GNUTLS
>
> We generally don't give a choice for something like that, but choose something
>automatically.
>

I actually adopted the same TLS library selection mechanism that libcurl 
itself uses in its own Config.in. It seems to work quite well: the 
correct choice is automatically forced if only one of the libraries is 
available.  If none are available the comment shows up. Only when both 
libraries are available, can the user choose. I see your point but 
again, I fail to understand why it is OK for libcurl to give a choice 
and and not for others.  Also important in my opinion, libcurls' 
approach does not risk circular dependencies. Can you please let me know 
what you think?

>> +
>> +UACME_VERSION = upstream/1.0.7
>
> I don't understand what these upstream/ tags are, but v1.0.7 seems equally
>appropriate to me.
>

They are Debian's recommended DEP14 git branch layout

https://dep-team.pages.debian.net/deps/dep14/

I use it to avoid having to maintain a separate repository for debian 
packaging, and so that I can develop on master and automatically merge 
and release using debian's git-buildpackage tools, which rely on 
pristine-tar to efficiently store release tarballs using deltas.

>> +UACME_SOURCE = uacme-1.0.7.tar.gz
>> +UACME_SITE = git://github.com/ndilieto/uacme
>
> We prefer http over git to access git repositories. But for github, we prefer
>to use either an uploaded tarball (not available in this case, except if we
>would use the debian tarball) or the github helper. Thus, it would become
>something like:
>
>UACME_VERSION = 1.0.7
>UACME_SITE = $(call github,ndilieto,uacme,upstream/$(UACME_VERSION))
>

I tried $(call github...) but it fails because the actual released code 
is in the upstream/latest branch, tagged as upstream/1.0.7 which 
includes a slash.  The slash gets converted to an underscore and the 
github helper fails.  It's not OK to use v1.0.7 from master because 
uacme's build system uses the .tarball-version file to correctly 
generate the VERSION string for a proper release, and that file is only 
included in the release tags like upstream/1.0.7 (these tags are the 
actual contents of the tarball generated by 'make dist')

>
> Note that UACME_SOURCE doesn't need to be set, it is set automatically to the
>correct value (uacme-$(UACME_VERSION).tar.gz).
>

Yes I tried without but then the tar file name generated from the git 
tree ended up being uacme-upstream_1.0.7.tar.gz which I did not 
particularly like.  Of course it's not important, so I'll remove 
UACME_SOURCE as you suggest.

>> +UACME_LICENSE = GPL-3.0+
>> +UACME_LICENSE_FILES = COPYING
>> +
>> +UACME_CONF_OPTS = --disable-maintainer-mode --disable-debug
>
> I don't think these are needed, are they?
>

The configure and build system of uacme uses some logic (look at 
GNUmakefile, configure.ac, Makefile.am and build-aux/git-version-gen) to 
determine whether it needs regenerating the configure script/version tag 
and also whether to enable debug by default. That logic is only really 
useful to me, the developer.  Those two flags are effectively overriding 
the logic to positively ensure that a) no debug is enabled and b) the 
configure script is never autoreconf'd, which is important to preserve 
the release's VERSION string. See 

https://www.gnu.org/software/automake/manual/html_node/maintainer_002dmode.html

>
> Note that the preference here does not need to correspond to the Config.in. In
>other words, if the user has selected both gnutls and mbedtls, you can choose
>which of the two should be used for uacme.
>
>> +UACME_CONF_OPTS += --with-gnutls=$(STAGING_DIR)/usr
>
> Normally, --with-gnutls (without argument) should be enough. It is even
>preferred, because then pkg-config will be used and it will set LIBS correctly.
>

Yes, you're right, I'll change this.

Please, let me know what you think about the other points, so I can make 
a revised patch that complies with all requirements.

Regards
Nicola
