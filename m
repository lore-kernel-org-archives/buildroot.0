From: James Knight <james.knight@rockwellcollins.com>
Date: Tue, 2 Feb 2016 17:48:36 -0500
Subject: [Buildroot] [RFC 1/1] e2fsprogs: support findfs
In-Reply-To: <56B12655.8000105@mind.be>
References: <1454446924-10368-1-git-send-email-james.knight@rockwellcollins.com>
 <56B12655.8000105@mind.be>
Message-ID: <CALe+oY8=d5fYnyfehm57hAHjHn-eKRWVLGDCumY+Xrp-C7849w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

Thanks for the comments.

On Tue, Feb 2, 2016 at 4:57 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> ...
>> An alternative to this approach would be to remove any e2fsprogs's
>> findfs references from Buildroot and add the findfs utility to
>> util-linux (since the package provides a findfs utility as well).
>
>  Ideally, both should be done :-)

I thought this should be done as well. I initially made changes that
would include util-linux's findfs and you can toggle between both.
However, after I implemented a chunk of the work, I saw e2fsprog's
dependency (at least in the Config.in) for util-linux/libblkid. Since
util-linux build's libblkid, e2fsprog should never attempt to build
the library itself (thus, cannot never support findfs). Hence why
maybe findfs should be removed from Buildroot's e2fsprog package
(unless I'm missing something).

>  The patch is missing a commit message.
>
>  Did you send it upstream?

Did not provide a commit message or send anything upstream. Just
looking for input first before making a complete package (if any will
be made).

>> +diff -Naur a/configure.in b/configure.in
>> +--- a/configure.in   2016-02-02 15:03:02.440059366 -0500
>> ++++ b/configure.in   2016-02-02 15:03:38.265404484 -0500
>> +@@ -533,6 +533,7 @@
>> +             [AC_MSG_ERROR([external blkid library not found])], -luuid)
>> +     BLKID_CMT=#
>> +     PROFILED_LIBBLKID=$LIBBLKID
>> ++    AC_DEFINE(CONFIG_BUILD_FINDFS, 1)
>
>  Hm, it would be weird if this were allowed... If you add this,
> CONFIG_BUILD_FINDFS will be defined if --disable-libblkid was given. if
> --enable-libblkid was given, and if nothing is given. So the whole point of the
> option is moot. That doesn't sound right...
>
>  Can you check that with upstream, or consult their logs when the option was
> introduced?

It doesn't; I completely agree. I feel there should be an option in there that:

 1) Builds without libblkid with a limited subset.
 2) Builds with an externally provided libblkid with blkid-related features.
 3) Builds its "private" libblkid library with blkid-related features.

I'm no master at autoconf work, but how I viewed its current
configuration file is that option 1 (partially) and 3 are only
available. Although looking throughout the source code, I see a bunch
of code requiring blkid-support. Maybe there is some magic that its
internal implementation of findfs requires its internal variant of
blkid-related code (although forcing to build with this patch, it
seems to just work (limited testing)). I try to find more via old
commit logs.

That all being said, I don't necessarily like the patch. It's
modifying the package to get a non-Busybox findfs to work in
Buildroot. I'd prefer making the alternative change to using
util-linux's findfs and removing e2fsprog's findfs (which seemed to
work in my limited testing). Just doing a shout out before I submit a
patch request for something that might not be ideal (maybe I should
have submitted an RFC for the alternative approach first).
