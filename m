From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Feb 2016 23:17:03 +0100
Subject: [Buildroot] [PATCH 1/1] package/iputils: patch ping to link
 against libm
In-Reply-To: <1455541206-18200-1-git-send-email-martin@barkynet.com>
References: <1455541206-18200-1-git-send-email-martin@barkynet.com>
Message-ID: <20160215231703.2052c7e0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Martin,

On Mon, 15 Feb 2016 13:00:06 +0000, Martin Bark wrote:
> ping fails to compile with uClibc based toolchains with the error
> 
> undefined reference to `__finite'
> 
> Add a patch to link ping against libm to resolve the math library function
> finite().
> 
> Note, this error is not seen with glibc based toolchains because finite
> seems to be resolved in both libm and libc.
> 
> Fixes:
> http://autobuild.buildroot.net/results/08f7386f75c881bc582b338824f8ccd509b2921e/
> http://autobuild.buildroot.net/results/5aeef61fbd399dd78dc72b9e7cce978e6f1f58b4/
> 
> A pull request has been sent to fix this issue upstream, see
> https://github.com/iputils/iputils/pull/42
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>

Thanks for working on this issue. However, I am not entirely happy with
the explanation.

Indeed, if you try to build iputils against uClibc, it builds just
fine. It is apparently only when the entire build is done with
BR2_ENABLE_DEBUG=y that the build failure occurs. And your commit log
doesn't explain at all why the problem only occurs when the build is
done with debugging symbols enabled.

I've tried building iputils against uClibc, it works fine. I've tried
building iputils against uClibc with BR2_ENABLE_DEBUG=y (using a
pre-built uClibc toolchain, which isn't built with debugging symbols),
and it works fine. So it seems that it only happens when the entire
build is done with debugging symbols, including uClibc itself.

While linking with -lm might be the correct fix, I am not convinced yet
due the lack of explanation for the root of the problem.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
