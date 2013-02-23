From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Sat, 23 Feb 2013 22:27:54 +0200
Subject: [Buildroot] [PATCH] new package: adns
In-Reply-To: <512900E0.9080605@mind.be>
References: <1360959402-24775-1-git-send-email-stefan.froberg@petroprogram.com>
 <512900E0.9080605@mind.be>
Message-ID: <5129264A.3050807@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

23.2.2013 19:48, Arnout Vandecappelle kirjoitti:
> On 15/02/13 21:16, Stefan Fr?berg wrote:
>> GNU adns
>>
>> Advanced, easy to use, asynchronous-capable DNS client library and
>> utilities.
>
>  It's not really necessary to repeat the help text in the commit message.
>
>>
>> adns is a resolver library for C (and C++) programs, and a collection of
>> useful DNS resolver utilities.
>
>  Isn't this just repeating the above?
>

Ok

>>
>> Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
> [snip]
>> diff --git a/package/adns/adns-1.4-cnamechain.patch
>> b/package/adns/adns-1.4-cnamechain.patch
>> new file mode 100644
>> index 0000000..1eadf54
>> --- /dev/null
>> +++ b/package/adns/adns-1.4-cnamechain.patch
>> @@ -0,0 +1,1275 @@
>> +[ADNS] Re: CNAME chains
>
>  Could you start the patch with a link to the place where you found
> it, and your Signed-off-by?
>

Official Gentoo patch. Ok..

>
>  This file is redundant.
>
> [snip]
>> diff --git a/package/adns/adns-1.4-destdir.patch
>> b/package/adns/adns-1.4-destdir.patch
>> new file mode 100644
>> index 0000000..3270ed4
>> --- /dev/null
>> +++ b/package/adns/adns-1.4-destdir.patch
>> @@ -0,0 +1,54 @@
>> +Fix installation directory
>> +Upstream-Status: Pending
>
>  Is this a patch you wrote yourself or a patch from somewhere else? In
> either case, it requires your Signed-off-by.
>

From that suse page like I told previously. Ok.

[snip]

> [snip]
>
>> diff --git a/package/adns/adns-1.4-ipv6.patch
>> b/package/adns/adns-1.4-ipv6.patch
>> new file mode 100644
>> index 0000000..8d02257
>> --- /dev/null
>> +++ b/package/adns/adns-1.4-ipv6.patch
>> @@ -0,0 +1,2725 @@
>> +Add IPv6 support
>> +Upstream-Status: Pending
>
>  Ditto.
>
>  Also, this looks like a feature patch, not a cross-build patch, so we
> normally would not include it in buildroot...
>

Ok. Then these should be removed too from then current git

avahi/avahi-ipv6only.patch
avahi/avahi-optional-ipv6.patch
iproute2/iproute2-optional-ipv6.patch
libeXosip2/libeXosip2-fix-non-ipv6-build.patch
libglib2/libglib2-optional-ipv6.patch
x11vnc/x11vnc-ipv6.patch


>> +
>> +diff --git a/Makefile b/Makefile
>> +index 5ba3e19..a87bc87 100644
>> +--- a/Makefile
>> ++++ b/Makefile
>> +@@ -56,9 +56,9 @@ dist_tmp=dist_tmp/adns-$(DISTVERSION)
>> + dist:            distprep
>> +     rm -rf dist_tmp*
>> +     mkdir dist_tmp $(dist_tmp)
>> +-    find \( -name CVS -o -name dist_tmp* \) -prune -o -type d
>> -print | \
>> ++    find . \( -name CVS -o -name dist_tmp* \) -prune -o -type d
>> -print | \
>> +         sed -e 's#.*#mkdir -p $(dist_tmp)/&#' | sh
>> +-    find \( -name CVS -o -name dist_tmp* \) -prune -o -type f
>> -print | \
>> ++    find . \( -name CVS -o -name dist_tmp* \) -prune -o -type f
>> -print | \
>
>  These have nothing to do with IPv6, and anyway pointless.
>

[snip]

>
> [snip]
>
>  Rest of the patch should stay (except for it being a feature-adding
> patch).
>
>  BTW, is this patch really 4 years old? Does that imply that adns is
> in fact dead?
>

Might be, but so are many other packages in buildroot too. Latest stable
release of matchbox for example, is
from 2007.
 
Official debian patch. Can be find from here:
http://people.debian.org/~lucab/deb/adns/adns-ipv6.patch


>
>> diff --git a/package/adns/adns-1.4-rh514838.patch
>> b/package/adns/adns-1.4-rh514838.patch
>> new file mode 100644
>> index 0000000..d0da303
>> --- /dev/null
>> +++ b/package/adns/adns-1.4-rh514838.patch
>> @@ -0,0 +1,26 @@
>> +Fixes Bug 514838
>
>  A bit more explanation would be useful :-) And add your Sob.
>

Official Fedora patch. Ok

>> +
>> +Upstream-Status: Pending
>> +URL: https://bugzilla.redhat.com/show_bug.cgi?id=514838
>> +
>> +diff -up adns-1.4/src/general.c.rh514838 adns-1.4/src/general.c
>> +--- adns-1.4/src/general.c.rh514838    2006-04-08 16:36:57.000000000
>> +0200
>> ++++ adns-1.4/src/general.c    2009-08-06 13:55:06.752562767 +0200
>> +@@ -267,6 +267,8 @@ static const struct sinfo {
>> +   SINFO( nodata,              "No such
>> data"                                 )
>> + };
>> +
>> ++static const char *unknown_error_str = "unknown error code";
>> ++
>> + static int si_compar(const void *key, const void *elem) {
>> +   const adns_status *st= key;
>> +   const struct sinfo *si= elem;
>> +@@ -283,7 +285,7 @@ const char *adns_strerror(adns_status st
>> +   const struct sinfo *si;
>> +
>> +   si= findsinfo(st);
>> +-  return si->string;
>> ++  return (si == NULL) ? unknown_error_str : si->string;
>> + }
>> +
>> + const char *adns_errabbrev(adns_status st) {
>> diff --git a/package/adns/adns.mk b/package/adns/adns.mk
>> new file mode 100644
>> index 0000000..be4aefd
>> --- /dev/null
>> +++ b/package/adns/adns.mk
>> @@ -0,0 +1,15 @@
>> +#############################################################
>> +#
>> +# adns
>> +#
>> +#############################################################
>> +
>> +ADNS_VERSION = 1.4
>> +ADNS_SOURCE = adns-$(ADNS_VERSION).tar.gz
>> +ADNS_SITE = http://www.chiark.greenend.org.uk/~ian/adns/ftp/
>> +ADNS_AUTORECONF = YES
>> +ADNS_INSTALL_STAGING = YES
>> +ADNS_CONF_OPT += --enable-dynamic=elf
>
>  Shouldn't this be in an ifeq ($(BR2_PREFER_STATIC_LIB),)?
>
>> +
>> +$(eval $(autotools-package))
>> +
>
>  Redundant empty line at end of file.
>
>

Ok

Thanks!

Regards
Stefan
