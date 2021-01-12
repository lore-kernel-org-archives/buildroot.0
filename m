From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Jan 2021 09:39:22 +0100
Subject: [Buildroot] Host tar 1.32 build issues
In-Reply-To: <CAGt4E5srq1hg4T1YoKX9UUCTJ96DdnNL1XFrYvsgpWjM_KM1EA@mail.gmail.com>
References: <CAGt4E5srq1hg4T1YoKX9UUCTJ96DdnNL1XFrYvsgpWjM_KM1EA@mail.gmail.com>
Message-ID: <95c3b23f-6805-e526-8bc2-a0d48a66895c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/01/2021 00:45, Markus Mayer via buildroot wrote:
> Hi all,
> 
> I noticed that host tar is no longer locked to 1.29 and has been
> bumped to 1.32. The only problem is that the host tar build requires
> tar in CPIO format, and that 1.32 does not exist as CPIO archive on
> the official server. As per http://mirror.sergal.org/gnu/tar/, tar
> 1.31 is the latest that has a CPIO archive. 1.32 and 1.33 do not.
> 
> Naturally, that currently causes the build to fail if
> BR2_FORCE_HOST_BUILD is enabled.

 Good catch!

> I don't know if the absence of CPIO archives is temporary or
> permanent.

 AFAIU it's permanent :-(

> It might be better to use tar-latest.cpio.gz as the host
> tar version to prevent this issue from happening again in the future.
> 
> -HOST_TAR_SOURCE = tar-$(TAR_VERSION).cpio.gz
> +HOST_TAR_SOURCE = tar-latest.cpio.gz
> 
> I tried this out and, while it would be nice, it doesn't seem to be
> possible to do it this way, because the directory inside the tar-ball
> is the actual version number. It would try to use
> "build/host-tar-last/tar-last/*" which doesn't exist, and the build
> still fails.

 It should be possible to overcome this problem with:

-        mv $(@D)/tar-$(HOST_TAR_VERSION)/* $(@D)
+        mv $(@D)/tar-*/* $(@D)

(untested, of course).

 And for good measure, remove $(@D)/tar-* before extraction.


 An alternative is to download a tarball and extract it with custom extraction
commands that don't use --strip-components or --exclude or $(TAR_OPTIONS). That
way, we can extract it with any POSIX-y tar version.


 Regards,
 Arnout

> The only way I have been able to get past the problem was to
> reintroduce the host specific TAR variables that were removed and to
> hard-code them to 1.31 (rather than 1.29 as it was before).
> 
> What's your take on this?
> 
> Thanks,
> -Markus
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
