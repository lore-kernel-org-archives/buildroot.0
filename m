From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 15 May 2019 13:49:35 +0200
Subject: [Buildroot] Npm install fails if package ships precompiled
 binaries
In-Reply-To: <CAH7nf8mdxiq2962Lch1xrkhpHms1nhoL+jXQNo22rYu6JPhttQ@mail.gmail.com>
References: <CAH7nf8mdxiq2962Lch1xrkhpHms1nhoL+jXQNo22rYu6JPhttQ@mail.gmail.com>
Message-ID: <442f0048-d81d-8172-3efa-44cb80b34ac0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15/05/2019 12:51, Stefano Guandalini wrote:
> Hi,
> ?
> I'm building an image for raspberrypi3 containing nodejs and the "stf" npm package.
> The npm install phase completes correctly but then the check step introduced by
> this commit:
> https://git.busybox.net/buildroot/commit/?id=bbb7f6c16cd5ff04ec9b78713f42ea53a940529f
> stops the build with errors like:
> ERROR: architecture for
> "/usr/lib/node_modules/stf/vendor/minirev/arm64-v8a/minirev" is "AArch64",
> should be "ARM"

 Are you building for ARM 32-bit on an ARMv8 CPU? Apparently, npm misinterprets
this incorrectly as a 64-bit ARM and downloads the 64-bit version instead of the
32-bit version. This wouldn't work at runtime.

 It's also possible, though, that
output/target/usr/lib/node_modules/stf/vendor/minirev contains both the 32-bit
and the 64-bit variants. In that case, it would still work, and we should
probably do something about that check.


> I temporarily solved the issue commenting out the check, provided that I know
> stf is the only package I'm installing, but I thing there could be a safer way
> to perform this step.

 So, does this actually work at runtime? It's possible that the minirev package
isn't actually used by stf (npm tends to pull in loads of dependencies that are
never used), so you'd need to test minirev by itself.

 Regards,
 Arnout
