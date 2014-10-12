From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Oct 2014 18:26:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/pkg-generic.mk: add --delete to
 rsync
In-Reply-To: <1412932487-25373-1-git-send-email-alvaro.gamez@hazent.com>
References: <1412932487-25373-1-git-send-email-alvaro.gamez@hazent.com>
Message-ID: <20141012182600.5382ad4a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alvaro G. M,

On Fri, 10 Oct 2014 11:14:47 +0200, Alvaro G. M wrote:
> When a source overriden package is built and then its source code is modified
> and rebuilt with make package-rebuild, it is needed for the build directory
> to contain exactly the same source that is in the original directory,
> so rsync must not only copy missing files, but also remove those that existed
> previously but now don't.
> 
> Signed-off-by: Alvaro G. M <alvaro.gamez@hazent.com>
> ---
>  package/pkg-generic.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

The fact that adding --delete would delete all object/generated files
makes this patch really not usable, as it basically kills completely
the entire purpose of OVERRIDE_SRCDIR + make <foo>-rebuild. We think
that the small advantage brought by this patch is largely outweighed by
the major inconvenience it causes. The build system of most packages is
reasonable, and will not take into account random source files hanging
around. If the build system of your package is so broken that it builds
random files by just building *.c or *.cpp, then it's really the build
system that should be fixed.

Since there is no way to distinguish the files to remove from the files
to keep, we prefer to keep them all, in order to keep its usefulness to
'make <foo>-rebuild'.

As a consequence, we've marked the patch as Rejected in our patch
tracking system.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
