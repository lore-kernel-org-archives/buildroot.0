From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Aug 2015 15:16:17 +0200
Subject: [Buildroot] [PATCH 1/2] qt/qt5base: force gstreamer on configure
In-Reply-To: <1438855575-4767-1-git-send-email-corjon.j@ecagroup.com>
References: <1438855575-4767-1-git-send-email-corjon.j@ecagroup.com>
Message-ID: <20150808151617.2f10d4b3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Julien Corjon,

On Thu,  6 Aug 2015 12:06:14 +0200, Julien Corjon wrote:
> Fixes: http://autobuild.buildroot.net/results/0ee0f879e8563954c64b3940cdec39d2e6de937a/
> 
> Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
> ---
>  package/qt5/qt5base/qt5base.mk | 10 ++++++++++
>  1 file changed, 10 insertions(+)

I'm sorry, but I don't think this is really the source of the problem.
I did reproduce this build failure, and even if GStreamer is built
before Qt5 (which is the case in the build failure you're linking in
the commit log), Qt5 concludes that GStreamer is not available.

And this is because for some reason, Qt5 now seems to ignore the
PKG_CONFIG environment variable that we pass to it. I've added some
debugging messages to the packagesExist() function, and it uses just
"pkg-config" (i.e the system pkg-config, not the one built and
installed by Buildroot in $(HOST_DIR)/usr/bin).

While I think that your patch should be applied (it's good to make
optional dependencies explicit), I also think the pkg-config problem
should be investigated and fixed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
