From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 7 Apr 2016 17:39:39 +0200
Subject: [Buildroot] [PATCH v4 3/3] package/radlib: reworked autotools
 with pkg-config
In-Reply-To: <1460030625.3176.22.camel@intel.com>
References: <1459948770-2769-1-git-send-email-ray.kinsella@intel.com>
 <1459948770-2769-4-git-send-email-ray.kinsella@intel.com>
 <57058F7C.7000708@mind.be> <1460030625.3176.22.camel@intel.com>
Message-ID: <57067F3B.9060808@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/07/16 14:03, Kinsella, Ray wrote:
> On Thu, 2016-04-07 at 00:36 +0200, Arnout Vandecappelle wrote:
>> Do this in three separate patches: one that sets subdir-objects, one
>> that adds
>> pkg-config, and one that adds mysql-config.
>
> Ok then, use a hook for the rename.
>
> Might make more sense to do one patch for pkg-config with subdir
> -objects, because these are linked - which subdir objects you get
> depends on pkg-config?

  Er, subdir-objects is just an option that is needed for recent autoconf when 
you have directories without Makefile.am. Doesn't have anything to do with 
pkg-config AFAIK.

>
> And then another patch for mysql-config. So two patches?
>
>>
>>> +-AC_ARG_ENABLE(mysql,
>>> +-[  --enable-mysql                 include radlib MySQL database
>>> support],
>>
>>    Why would you remove this? An enable option is as good as a with
>> option.
>
> The original feedback I got was that the autotools implementation for
> radlib was hopelessly screwed up. I was trying to strike a balance
> between limiting changes but improving the overall flows.

  From who did you get that feedback? Thomas wrote that the Makefile.am 
contained some weird stuff, but that's a bit separate.

>
> I used with 'with' instead of 'enable' because of the semantics ...
>
> If a package _must_ be available on the platform for it available to
> choose then 'with' makes more sense than 'enable'. Radlib supports more
> than one back end so selecting a backend by indicating 'with' made more
> sense to me. 'enable' is typically for features whereas 'with', is
> typically used to indicate building 'with' a given package.

  Well, your Config.in didn't express that at least one database must be 
selected, and also your original replies to Thomas didn't say that, so I assumed 
that the databases were indeed optional. But even if they are not optional, I 
wouldn't bother changing the enable in a with.

>
> That said I am agnoistic, I am happy to revert to AC_ARG_ENABLE to
> reduce the patch.
>
[snip]
>>> +-AM_CONDITIONAL(MYSQL, test x$mysql = xtrue)
>>
>>    Keep this, there is no reason to replace it by HAVE_MYSQL.
>
> Ok - I am pretty sure I got feedback to change these conditionals to
> HAVE_, but no problem I can fix.

  I looked back at Thomas's original comments and couldn't find anything 
suggesting that.

>
>
>>> + # define include directories
>>> +-INCLUDES = \
>>> ++AM_CFLAGS = \
>>
>>    Why does this need to be changed?
>
> I will investigate ...
> The original INCLUDES was pulling in host directories.
> Not sure why the switch to AM_CFLAGS
>
>>
>>> + 		-I$(top_srcdir)/h \
>>> + 		-D_GNU_SOURCE
>>> +
>>
>>    Did you forget to add $(SQLITE3_CFLAGS) etc?
>
> nope, no special include is needed for SQLITE.

  Well, that's because in buildroot we install everything in /usr/include, so no 
-I option is needed. But you can't assume that in general, so you will need 
SQLITE3_CFLAGS for upstream.

>
>
>>    Removing the CROSSCOMPILE part should be a separate patch.
>
> ok

  Just to be clear: I mean a separate .patch file, not a separate commit in 
buildroot.git.


  Regards,
  Arnout

[snip]
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
