From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 5 Dec 2016 19:22:44 +0100
Subject: [Buildroot] [PATCH] berkeleydb: fix static linking issues
In-Reply-To: <20161205034615.GA8584@waldemar-brodkorb.de>
References: <20161204173924.GA1647@waldemar-brodkorb.de>
 <20161204215605.680c9070@free-electrons.com>
 <20161205034615.GA8584@waldemar-brodkorb.de>
Message-ID: <6de82523-7f1b-07d2-f901-abac9eddca3b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-12-16 04:46, Waldemar Brodkorb wrote:
> Hi Thomas,
> Thomas Petazzoni wrote,
> 
>> Hello,
>>
>> On Sun, 4 Dec 2016 18:39:24 +0100, Waldemar Brodkorb wrote:
>>> Libtool by default drops -static, so force libtool with -all-static
>>> to do static linking.
>>
>> This needs a little bit more details, because libtool is used by a
>> large fraction of our packages, we pass -static only, and it just works.
>>
>> Why do we have a different situation here? I thought this undefined
>> reference to `dl_iterate_phdr' issue was more a toolchain problem.
> 
> It is not a toolchain problem, it is more likely a change in
> toolchain behaviour with uClibc-ng >= 1.0.18.
> We can not avoid the circular dependency between libc and libgcc, so
> every static compiled package must use -static while linking.

 Perhaps add -static in the toolchain wrapper? Which might make it possible to
remove it from the libtool patch as well.


>> It's affecting a number of different packages, and is apparently a new
>> problem, so a fix at the package level looks a bit odd.
> 
> In this case it is similar to autossh a package level problem.
> 
> All the libtool packages are working out-of-the box in buildroot with
> -static, because LIBTOOL_PATCH_HOOK patches libtool to behave like
> -all-static.
> 
> In this case the hook isn't working correctly, because ltmain.sh
> isn't found:
> 
> ESC[3m>>> berkeleydb 5.3.28 Patching libtoolESC[23m
> for i in `find /home/wbx/buildroot/output/build/berkeleydb-5.3.28/build_unix -name
> ltmain.sh`; do ltmain_version=`sed -n '/^[ \t]*VERSION=/{s/^[
> \t]*VERSION=//;p;q;}' $i | sed -e 's/\([0-9]*\.[0-9]*\).*/\1/' -e
> 's/\"//'`; ltmain_patchlevel=`sed -n '/^[ \t]*VERSION=/{s/^[
> \t]*VERSION=//;p;q;}' $i | sed -e
> 's/\([0-9]*\.[0-9]*\.*\)\([0-9]*\).*/\2/' -e 's/\"//'`; if test
> ${ltmain_version} = '1.5'; then patch -i
> support/libtool/buildroot-libtool-v1.5.patch ${i}; elif test
> ${ltmain_version} = "2.2"; then patch -i
> support/libtool/buildroot-libtool-v2.2.patch ${i}; elif test
> ${ltmain_version} = "2.4"; then if test ${ltmain_patchlevel:-0} -gt
> 2; then patch -i support/libtool/buildroot-libtool-v2.4.4.patch
> ${i}; else patch -i support/libtool/buildroot-libtool-v2.4.patch
> ${i}; fi fi done
> touch
> 
> wbx at helium:~/buildroot $ find /home/wbx/buildroot/output/build/berkeleydb-5.3.28/ -name ltmain.sh                             
> /home/wbx/buildroot/output/build/berkeleydb-5.3.28/dist/ltmain.sh
> /home/wbx/buildroot/output/build/berkeleydb-5.3.28/lang/sql/jdbc/ltmain.sh
> /home/wbx/buildroot/output/build/berkeleydb-5.3.28/lang/sql/odbc/ltmain.sh
> /home/wbx/buildroot/output/build/berkeleydb-5.3.28/lang/sql/sqlite/ltmain.sh
> 
> The hook searches in
> /home/wbx/buildroot/output/build/berkeleydb-5.3.28/build_unix, but
> it seems berkeley db provides ltmain.sh in
> /home/wbx/buildroot/output/build/berkeleydb-5.3.28/dist/.

 Perhaps libtool patching should be done in $($(PKG)_DIR) instead of
$($(PKG)_SRCDIR), then we wouldn't have this issue. OTOH, only berkeleydb has
this problem. Well, gcc also but that's only a host package, and glibc also but
I guess glibc doesn't need any of the patching we do.


 Regards,
 Arnout

> 
> best regards
>  Waldemar
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
