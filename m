From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Oct 2016 14:38:46 +0200
Subject: [Buildroot] [PATCH 1/1] openzwave: fix compilation of MinOZW
In-Reply-To: <1474988445-22639-1-git-send-email-fabrice.fontaine@orange.com>
References: <1474988445-22639-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <20161023143846.34c77ab4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 27 Sep 2016 17:00:45 +0200, Fabrice Fontaine wrote:
> LIBDIR was used in cpp/examples/MinOZW/Makefile to add dynamic
> libraries. However, as it was unset by default, the cross-compilation
> could fail if the host had a library such as libnss3.so in /.
> To fix this issue, this patch sets LIBDIR to top_buildir if it is unset
> 
> Fixes:
>   http://autobuild.buildroot.net/results/68719fdf1320a69310bada6d3c47654dacdb5898
> 
> Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>

Why is a patch needed?

Doing the following seems to be sufficient:

diff --git a/package/openzwave/openzwave.mk b/package/openzwave/openzwave.mk
index 2723086..9c50cb8 100644
--- a/package/openzwave/openzwave.mk
+++ b/package/openzwave/openzwave.mk
@@ -29,7 +29,8 @@ OPENZWAVE_MAKE_OPTS = \
        instlibdir=/usr/lib \
        pkgconfigdir=/usr/lib/pkgconfig \
        sysconfdir=/etc/openzwave \
-       DOXYGEN=
+       DOXYGEN= \
+       LIBDIR=$(@D)
 
 define OPENZWAVE_BUILD_CMDS
        $(TARGET_MAKE_ENV) $(MAKE) $(OPENZWAVE_MAKE_OPTS) -C $(@D)

If you agree with this, could you submit a patch with this solution,
preferably after adding a comment that explains why we're passing such
a strange value for LIBDIR.

Of course, please submit a bug report to the upstream project.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
