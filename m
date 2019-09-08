From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 8 Sep 2019 22:26:38 +0200
Subject: [Buildroot] Why passing TARGET_DIR/BINARIES_DIR to
 post-build/post-install scripts?
In-Reply-To: <CALFsTFVUpMVBiBU2JUKnuWpz-Mm-iFyDGpvpXKGOJSzspf9rmg@mail.gmail.com>
References: <CALFsTFVUpMVBiBU2JUKnuWpz-Mm-iFyDGpvpXKGOJSzspf9rmg@mail.gmail.com>
Message-ID: <89fc6b63-807b-3f73-a79d-5a3e3777e28c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08/09/2019 20:03, Asaf Kahlon wrote:
> Hello,
> 
> As many others, I have my post-build and post-images scripts when I
> work with Buildroot.
> I would like to know why do we pass TARGET_DIR as first parameter for
> the post-build script (same for BINARIES_DIR in post-images)? They are
> both available on both post-build and post-install environments and
> can be easily referenced by $TARGET_DIR and $BINARIES_DIR.
> Moreover, if I want to iterate through BR2_ROOTFS_POST_SCRIPT_ARGS in
> my script, I always have to cut the first argument instead of just
> using $@

 This is purely for historical reasons.

 The export of STAGING_DIR, TARGET_DIR etc. was only done in commit
2b0f455254149b, merged Jan 13, 2013. However, support for post-build scripts was
added years before, in commit eed7d8737adf merged Jul 25, 2009. So any existing
post-build script would expect $TARGET_DIR as its first argument, and we didn't
want to break that.

 Support post-image scripts was only merged later, but the $BINARIES_DIR
argument was still added for symmetry.


 We could consider to change this behaviour, since indeed it doesn't make much
sense at the moment. This is a pretty breaking change, however: any script that
relies on that first argument would break. And I see no easy way to warn the
unwary user of this. So it's not very likely that this change will happen...

 Regards,
 Arnout


> 
> I'll be more than happy to hear your thoughts regarding this issue.
> Thanks,
> Asaf.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
