From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Aug 2016 23:05:36 +0200
Subject: [Buildroot] [PATCH 1/2] iproute2: fix no-thread build
In-Reply-To: <1470416880-16148-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1470416880-16148-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160807230536.444ce384@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  5 Aug 2016 19:07:59 +0200, Thomas Petazzoni wrote:
> iproute2 believes that it needs to link with libpthread for its arpd
> binary, because "some db implementations require thread". Therefore, our
> iproute2.mk explicitly disables the build of arpd when thread support is
> not available.
> 
> However, the sed expression it uses no longer works. The Makefile used
> to look like:
> 
> TARGETS = foo baz baz arpd foobar
> 
> so replacing " arpd " with a space was working fine. However, the
> Makefile got changed in iproute2 to:
> 
> ifeq (... berkeleydb available ...)
>      TARGETS += arpd
> endif
> 
> i.e, with no space at the end of the line. This made our sed expression
> ineffective, causing build issues with no-thread configurations since
> arpd was no longer disabled.
> 
> To address this, instead of sed-ing the Makefile, we overwrite the
> berkeleydb detection of iproute2, by writing to the "Config" file, like
> we're doing for other aspects of the package.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/03a37a2372a4c2e438a073e015c49d9e554b86b7/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/iproute2/iproute2.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Both patches applied.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
