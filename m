From: James Balean <james@balean.com.au>
Date: Tue, 25 Apr 2017 22:52:19 -0500
Subject: [Buildroot] [PATCH] Restore .git directory in git package
	downloads
In-Reply-To: <20170420034025.kcbpz3nrhn3yylin@tarshish>
References: <1492574439-4617-1-git-send-email-james@balean.com.au>
 <58f7f1456cc7e_21d33f8c269493f44696f@ultri3.mail>
 <20170420034025.kcbpz3nrhn3yylin@tarshish>
Message-ID: <1493178739-21234-1-git-send-email-james@balean.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you for your comments.

On 19 April 2017 at 14:15, Baruch Siach <baruch@tkos.co.il> wrote:
> The OVERRIDE_SRCDIR mechanism is meant to cover this use case. See
> section 8.12.6 "Using Buildroot during development" in the manual[1].
> Is there anything missing for your use case?

I wasn't aware of the OVERRIDE_SRCDIR flag - thank you for this
suggestion. However, I can't help but feel that keeping the .git
directory might result in a more integrated way of enabling package
development without having to override the build process, and facilitate
the use cases mentioned by Jan and Andreas in their comments?


On 20 April 2017 at 09:22, Ricardo Martincoski <ricardo.martincoski@gmail.com> wrote:
> - it would make the tarballs for git packages not reproducible as the
> contents now depend on the state of the remote server (i.e. in some
> cases a full clone is needed; assume a tarball is generated, then a
> new commit is created in the remote server in any branch, a new full
> clone with the same reference as version would include that new commit
> and therefore the tarball is different);

Isn't it already the case that git tarballs are not reproducible? For
example, after a tarball is generated from a clone of 'master' or a tag,
Buildroot doesn't check and re-clone when changes are made to the branch
or tag on subsequent builds. Additionally, the same tarball filename is
also used for a full clone if a shallow clone fails. So tarballs can
already differ markedly between users.

> - it would make the tarballs for git packages much larger (gigabytes
> for some linux trees) as they now include the .git directory;

That's true. I don't know what people's appetite is for increasing the
size of tarballs to enable integrated development, though it is worth
noting that by default we only shallow clone with a depth of 1 rather
than full clone, so file sizes should be minimized 'in theory'.


On 20 April 2017 at 13:40, Baruch Siach <baruch@tkos.co.il> wrote:
> Interesting. I think it is worth a mention in the comment. Removing
> .git is not just an optimization as the comment implies. It is
> necessary in order to verify the generated tarball.

Not sure the tarball is verifiable without the .git directory, for the
reasons mentioned in response to Ricardo above.

--
Thanks again,
James
