From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 30 Nov 2018 09:00:07 +0100
Subject: [Buildroot] [PATCH 1/1] qt5declarative: fix debug build with
 uclibc
In-Reply-To: <20181130002016.7440-1-fontaine.fabrice@gmail.com>
References: <20181130002016.7440-1-fontaine.fabrice@gmail.com>
Message-ID: <20181130090007.11a48750@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 30 Nov 2018 01:20:16 +0100, Fabrice Fontaine wrote:
> Debug build of qsgtexture fails on uclibc since version 5.11 and
> https://github.com/qt/qtdeclarative/commit/7c507eaac3f848f92f2ebdafe8ded4a064d68351:
> 
> scenegraph/util/qsgtexture.cpp:69:22: fatal error: execinfo.h: No such file or directory
>  #include <execinfo.h>
> 
> Indeed, !defined(__UCLIBC__) has been replaced by defined(__GBLIBC__) to
> fix build on musl but as a result, build fails on uclibc because uclibc
> also defines __GLIBC__ (and it does not have execinfo like musl)
> 
> This error is raised only when building in debug mode because
> CAN_BACKTRACE_EXECINFO is undefined if QT_NO_DEBUG is set
> 
> So keep defined(__GLIBC__), but put back !defined(__UCLIBC__)
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/6fce0ce5aea943e097532efbbc8d1e28f41e5866
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Thanks applied to master.

> +[Upstream status: https://github.com/qt/qtdeclarative/pull/4]

I don't think opening a pull request on Github is the right way to
contribute to Qt upstream. They have a Gerrit, and you need to submit
your contribution there, if I remember correctly. Peter Seiderer (in
Cc) can probably help in this process, either by giving you additional
details, or pushing the patch upstream for you perhaps.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
