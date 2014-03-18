From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 18 Mar 2014 10:55:55 +0000
Subject: [Buildroot] [PATCH] libtool: revert a commit which
 re-introduced an already fixed problem
In-Reply-To: <532823A9.9010603@imgtec.com>
References: <1395078022-37381-1-git-send-email-Vincent.Riera@imgtec.com>
 <87txaw4gwt.fsf@dell.be.48ers.dk> <5327F9E1.1020301@mind.be>
 <532823A9.9010603@imgtec.com>
Message-ID: <5328263B.7090904@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/18/2014 10:44 AM, Vicente Olivert Riera wrote:
> On 03/18/2014 07:46 AM, Arnout Vandecappelle wrote:
>> On 03/17/14 23:08, Peter Korsgaard wrote:
>>>>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>>>>>>>> writes:
>>>
>>>   > The commit ed73d1d2e3703290e74bb076bc6dd0417aa3ba21 modified the
>>> changes
>>>   > made by the commit 4268d3967e2d691c151d6b5629e4051deb077b9a. The
>>> problem
>>>   > that was fixed by the former commit is present again due to those
>>>   > modifications. This patch reverts those modifications to have that
>>>   > problem fixed again.
>>>
>>>   > Fixes:
>>>   >
>>> http://autobuild.buildroot.net/results/b86/b86a83c6549004f226e7255242e54ef4e50c5ec3/
>>>
>>>
>>> So this basically just reverts Arnouts fix for old automake versions? Do
>>> we understand why it doesn't work? Can we come up with a solution that
>>> both fixes the n64 issue and old automake?
>>
>>   I indeed never tested if the issue of 4268d39 was still fixed. I just
>> understood from the commit message that it is only relevant for the
>> libtool.m4 that is installed in the host dir, so I made use of that.
>>
>>   It should be rather easy to get this right then: a patch that fixes up
>> configure directly, rather than libtool.m4.
>
> Hello Arnout,
>
> how do you suggest to do it? Requiring an older automake would not be
> possible because of this:
>
> dnl These are bootstrap requirements! Once built, libtool may work with
> dnl much older releases of autoconf and automake.  See release notes.
> dnl 1.11 is needed for color-tests, 1.11.1 fixes a security issue.
> AM_INIT_AUTOMAKE([1.11.1 gnu subdir-objects dist-xz color-tests
> parallel-tests])

I mean, it should work if you change the 1.11.1 by 1.11, but you would 
be ignoring that security issue. Is that worth to make it working on 
such old systems like Fedora 10? If Fedora 10 still has automake-1.11 is 
because there are no updates (at least security updates) for it, and 
Fedora Project does not provide support for Fedora 10 any more.
Is it worth to modify the behaviour of an upstream patch 
(http://git.buildroot.net/buildroot/commit/?id=4268d3967e2d691c151d6b5629e4051deb077b9a) 
and raise the autobuild failures again just to make it working on such 
old systems which still have automake-1.11?

>>   Regards,
>>   Arnout
>>
>>>
>>>
>>>   > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>>>   > ---
>>>   >  ...patch => libtool-0001-mips64-n64-linking.patch} |    0
>>>   >  package/libtool/libtool.mk                         |   13
>>> -------------
>>>   >  2 files changed, 0 insertions(+), 13 deletions(-)
>>>   >  rename
>>> package/libtool/{libtool-mips64-n64-linking.post-install-patch =>
>>> libtool-0001-mips64-n64-linking.patch} (100%)
>>>
>>>   > diff --git
>>> a/package/libtool/libtool-mips64-n64-linking.post-install-patch
>>> b/package/libtool/libtool-0001-mips64-n64-linking.patch
>>>   > similarity index 100%
>>>   > rename from
>>> package/libtool/libtool-mips64-n64-linking.post-install-patch
>>>   > rename to package/libtool/libtool-0001-mips64-n64-linking.patch
>>>   > diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
>>>   > index 603f1f1..2f6ea7c 100644
>>>   > --- a/package/libtool/libtool.mk
>>>   > +++ b/package/libtool/libtool.mk
>>>   > @@ -13,19 +13,6 @@ LIBTOOL_LICENSE_FILES = COPYING
>>>
>>>   >  HOST_LIBTOOL_LIBTOOL_PATCH = NO
>>>
>>>   > -# libtool-mips64-n64-linking.post-install-patch is an upstream
>>> patch that
>>>   > -# fixes MIPS64 n64 link failures. However, because the patch
>>> touches an m4
>>>   > -# file, applying it triggers a run of autoconf, automake, etc.
>>> This sometimes
>>>   > -# leads to build failures due to incompatible system autotools.
>>> We cannot
>>>   > -# simply set HOST_LIBTOOL_AUTORECONF = YES because that would
>>> create a
>>>   > -# circular dependency on host-libtool. Therefore, just apply the
>>> patch
>>>   > -# directly on the installed file.
>>>   > -define HOST_LIBTOOL_FIXUP_LIBTOOL_M4
>>>   > -    patch $(HOST_DIR)/usr/share/aclocal/libtool.m4 < \
>>>   > -
>>> package/libtool/libtool-mips64-n64-linking.post-install-patch
>>>   > -endef
>>>   > -HOST_LIBTOOL_POST_INSTALL_HOOKS += HOST_LIBTOOL_FIXUP_LIBTOOL_M4
>>>   > -
>>>   >  $(eval $(autotools-package))
>>>   >  $(eval $(host-autotools-package))
>>>
>>>   > --
>>>   > 1.7.1
>>>
>>>   > _______________________________________________
>>>   > buildroot mailing list
>>>   > buildroot at busybox.net
>>>   > http://lists.busybox.net/mailman/listinfo/buildroot
>>>
>>>
>>
>>
>
>


-- 
Vincent
