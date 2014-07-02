From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 02 Jul 2014 09:49:57 +0200
Subject: [Buildroot] [PATCH 1/1] libssh2: fix library search path issues
 when zlib support enabled
In-Reply-To: <20140702092625.16c98f0d@free-electrons.com>
References: <1403878684-11934-1-git-send-email-acoffignal@geral.com>	<20140629163016.41256df2@free-electrons.com>	<f8abef86a41446e6ac7848dfa49e9842@VMSMBX02.gpi.pri>	<20140630140216.49d73fa4@free-electrons.com>	<53B1590D.9040606@geral.com>	<53B3A420.2090900@mind.be>
 <20140702092625.16c98f0d@free-electrons.com>
Message-ID: <53B3B9A5.9020803@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/07/14 09:26, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
> 
> On Wed, 02 Jul 2014 08:18:08 +0200, Arnout Vandecappelle wrote:
> 
>>  However, I see in the configure script at line 14539:
>>
>>     eval additional_libdir=\"$libdir\"
>>
>> and a bit lower, at line 14616:
>>
>>             dir="$additional_libdir"
>>                                     if test -n "$acl_shlibext"; then
>>               if test -f "$dir/$libname$shrext"; then
>>                 found_dir="$dir"
>>                 found_so="$dir/$libname$shrext"
>>
>>  Since libdir is /usr/lib, it will indeed find libz there.
>>
>>  I guess, Thomas, that on your machine, libz.so is in /usr/lib64 so configure
>> doesn't find it there.
> 
> Right, it's in /usr/lib/x86_64-linux-gnu.
> 
>>  But basically that means this configure script is truly broken, not just for
>> libz but for any use of AC_LIB_HAVE_LINKFLAGS...
>>
>>  Perhaps AUTORECONF will help?
> 
> Alexandre, can you try to add LIBSSH2_AUTORECONF = YES to libssh2.mk,
> in replacement to your fix?

 Don't bother, it won't help. This thing is defined in m4/lib-link.m4 (lines
154-155) within libssh2 itself. So we'll need to patch that file and _then_ run
autoreconf.

> 
> That being said, there are a number of packages for which we explicitly
> pass a --with-<foo>=$(STAGING_DIR), so it's not completely crazy to do
> the same for libssh2, no?

 Yes, but then it should be done for _all_ libraries used by libssh2, because it
uses this $additional_libdir failure in a lot of places.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
