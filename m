From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 27 Mar 2019 17:35:48 +0100
Subject: [Buildroot] [PATCHv5 1/9] support/download: reintroduce
 'source-check' target
In-Reply-To: <69fd8276-ea53-75a5-240a-a0e146cd8b62@mind.be>
References: <20190219103839.25409-1-patrickdepinguin@gmail.com>
 <20190317143215.GD14237@scaer> <20190317155719.14839925@windsurf>
 <69fd8276-ea53-75a5-240a-a0e146cd8b62@mind.be>
Message-ID: <20190327173548.7db271b5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks a lot for sharing your feedback in this discussion, it's very
useful.

On Wed, 27 Mar 2019 14:46:32 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

>  For the use case of Thomas DS, this weak semantic is perfectly fine. What it
> tries to protect against is the common mistake that you add or bump a package
> and forget to upload the source to PRIMARY_SITE. As explained by Thomas DS,
> doing a full download is eventually still needed, but takes much longer:
> source-check may take in the order of 1 minute while the full download takes 10
> minutes. That makes all the difference for immediate feedback to the developer,
> and it doesn't significantly slow down a good pipeline.
> 
>  Indeed, it does not protect against uploading the wrong tarball with the
> correct name. It also doesn't protect against forgetting to update the hash
> file. It also doesn't protect against the package failing to build. It also
> doesn't protect against bugs in the code which become only apparent at run time.
> But all of these are checked later in CI, and the source check captures an
> important (and likely) class of mistakes early on.

Interesting perspective indeed :-)

>  It is true that this is a very narrow use case. However, I think it passes two
> tests for acceptance:
> 
> * It does not make Buildroot (much) more complex.
> 
> * There is no way to do this with scripting outside of Buildroot.

True.

>  Regarding that second point: in fact there would be a way, if we would instead
> have a command to print everything that would be downloaded. That would be very
> similar to patch 1/9, but would remove the need for the other patches in the
> series. The advantage of this approach is that there could be other uses for
> printing the list of sources. But that would be back to the drawing board for
> Thomas DS, so I doubt he's enthusiastic about that option :-) Plus, we have no
> actual example of an additional use case.

We already have "make external-deps" but it only prints the file names,
not the full URL.

Does Thomas really want to check the BR2_PRIMARY_SITE or the original
Mercurial repository ? If he wants to check BR2_PRIMARY_SITE (which
contains only tarballs), then he could run "make external-deps" and
checks that the tarballs are here. But I suppose that's not what Thomas
wants: he really wants to check the upstream Mercurial repository, no?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
