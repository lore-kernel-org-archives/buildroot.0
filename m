From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Nov 2016 19:21:09 +0100
Subject: [Buildroot] [PATCH for-master] package/sane-backends: fix musl
 build issue
In-Reply-To: <1478900262-18239-1-git-send-email-romain.naour@gmail.com>
References: <1478900262-18239-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20161112192109.79c2ea5d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 11 Nov 2016 22:37:42 +0100, Romain Naour wrote:
> We should include config.h from sanei_backend.h in order to use the
> correct if/else HAVE_FOO.
> 
> For some reason with Glibc or uClibc there is no problem but with musl
> we have the following weird issue:
> 
> In file included from epsonds.h:41:0,
>                  from epsonds-jpeg.c:18:
> ../include/sane/sanei_backend.h:99:33: error: expected ';', identifier or '(' before 'int'
> 
> ../include/sane/sanei_backend.h:99:33: warning: useless type name in empty declaration
> 
> That's because HAVE_SIGPROCMASK is not defined although it's correctly
> detected by the configure script.
> 
> $ grep config.log
> config.log:#define HAVE_SIGPROCMASK 1
> 
> So, include config.h to avoid to redefine sigset_t.
> 
> Fixes:
> http://autobuild.buildroot.net/results/9f1/9f1f1cb727b5c5407e69172280a3dee880e55cdf
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Frank Hunleth <fhunleth@troodon-software.com>
> ---
>  .../0003-sane_backend-add-missing-config.h.patch   | 49 ++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 package/sane-backends/0003-sane_backend-add-missing-config.h.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
