From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Oct 2016 15:18:57 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/libfribidi: remove optional
 dependency to libglib
In-Reply-To: <20161029121213.25695-1-bernd.kuhls@t-online.de>
References: <20161029121213.25695-1-bernd.kuhls@t-online.de>
Message-ID: <20161029151857.79391add@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 29 Oct 2016 14:12:13 +0200, Bernd Kuhls wrote:
> Fixes vdr compile error:
> http://autobuild.buildroot.net/results/725/7252decffe29e19051eed0554786651aee216573/
> 
> Instead of fixing fribidi.pc or adding optional CFLAGS to the vdr
> package we remove the optional libglib dependency as proposed by an
> pull request.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Do we really need to take all those patches in Buildroot? Can't we just
disable the libglib optional dependency, with a comment above it:

Something like this:

-ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
-LIBFRIBIDI_DEPENDENCIES += libglib2
-else
-LIBFRIBIDI_CONF_OPTS += --with-glib=no
-endif
+# libglib2 dependency causes a build failure, and this optional
+# dependency is going to be removed usptream, see
+# https://github.com/behdad/fribidi/pull/14
+LIBFRIBIDI_CONF_OPTS += --with-glib=no

If it doesn't work for some reason and we really need the patches, then
please create one file for each commit, rather than concatenating them
in one big file. And you need to sign-off on each of them.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
