From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 22 Feb 2015 22:46:59 +0100
Subject: [Buildroot] [PATCH 1/2] package/thrift: fix build failure on
 bfin
In-Reply-To: <20150222222748.64849cf0@free-electrons.com>
References: <1424640307-26144-1-git-send-email-romain.naour@openwide.fr>
 <20150222222748.64849cf0@free-electrons.com>
Message-ID: <54EA4E53.6050401@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 22/02/2015 22:27, Thomas Petazzoni a ?crit :
> Dear Romain Naour,
> 
> On Sun, 22 Feb 2015 22:25:06 +0100, Romain Naour wrote:
>> Libtool append the sysroot path (lt_sysroot) with the libdir value found in
>> the libstdc++.la file only with bfin toolchain.
> 
> And to you know why ?

Not really...

I found a sed expression in ltmain.sh which seems to set libdir with libdir from libstdc++.la
"eval libdir=`$SED -n -e 's/^libdir=\(.*\)$/\1/p' $func_resolve_sysroot_result`"

Then the sysroot is appended right after that:
func_append newdependency_libs " ${lt_sysroot:+=}$libdir/$name"

So I tried to find from where the sed expression come from.
And I found lt_aix_libpath_sed in configure which is use to set lt_cv_aix_libpath__CXX.

"lt_cv_aix_libpath__CXX=`dump -H conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`"

So I added lt_cv_aix_libpath__CXX in THRIFT_CONF_OPTS.

In not sure if we need to do that for other architecture/toolchain.

I hope this will further investigation.

Best regards,
Romain
> 
> Thanks!
> 
> Thomas
> 
