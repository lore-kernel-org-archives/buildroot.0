From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 22 Jun 2016 22:57:38 +0200
Subject: [Buildroot] Patchwork cleanup week #24
In-Reply-To: <20160615220634.67eb8fa9@free-electrons.com>
References: <20160615220634.67eb8fa9@free-electrons.com>
Message-ID: <f767a47d-6908-ba5c-5884-60b572503a27@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15-06-16 22:06, Thomas Petazzoni wrote:
>  3. toolchain-wrapper: prevent use of unsupported -fstack-protector*
>     http://patchwork.ozlabs.org/patch/545315/
> 
>     This patch proposes to make the toolchain wrapper fail immediately
>     when -fstack-protector is passed to gcc, but SSP support is not
>     available. This helps with some packages that assume that compiling
>     with -fstack-protector is enough to determine if SSP support is
>     available, while in several cases, doing a link test is necessary.
> 
>     I personally don't really like this change, as I believe it's
>     adding even more sorcery to our toolchain wrapper. Instead, the
>     problematic upstream packages should be fixed. Plus, at the time,
>     we had a few packages in this situation, but nowadays, I don't
>     think we have build failures due to this.
> 
>     So, my proposal would be to reject this patch.

 I originally advocated for this patch (see
https://patchwork.ozlabs.org/patch/543115/ ). My reasoning was that it's very
hard to write a reliable test for stackprotector, because optimisations can
easily elide so much from the test that the stackprotector disappears.
Therefore, a test that works fine for the current compiler may break down with
future gcc releases.

 Also, I prefer to be able to resolve entire classes of build problems rather
than patching individual packages. The toolchain wrapper is a clear example of
this: it only exists because packages don't reliable handle CFLAGS, otherwise we
could just pass --sysroot etc. in CFLAGS.

 On the other hand, for this particular case, autobuilder errors will appear for
failing packages, so at least it's not a hidden issue.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
