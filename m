From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 8 Sep 2014 15:38:46 +0300
Subject: [Buildroot] [PATCH] qt4 webkit: Disable for MIPS64 n32
In-Reply-To: <540DA11A.4080705@imgtec.com>
References: <1410178635-53697-1-git-send-email-Vincent.Riera@imgtec.com>
 <20140908122335.GR2522@tarshish> <540DA11A.4080705@imgtec.com>
Message-ID: <20140908123845.GS2522@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vicente,

On Mon, Sep 08, 2014 at 01:29:14PM +0100, Vicente Olivert Riera wrote:
> On 09/08/2014 01:23 PM, Baruch Siach wrote:
> >On Mon, Sep 08, 2014 at 01:17:15PM +0100, Vicente Olivert Riera wrote:
> >>qt4 webkit fails to compile for MIPS64 n32. A bug has been reported
> >>upstream, so we disable this package until upstream fixes the problem.
> >>
> >>Upstream bug:
> >>   https://bugreports.qt-project.org/browse/QTBUG-39224
> >>
> >>Fixes:
> >>   http://autobuild.buildroot.net/results/2ab/2ab5ab179dab9e1a47092b066f97d48c75ab935b/
> >>
> >>Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> >>Reviewed-by: Markos Chandras <Markos.Chandras@imgtec.com>
> >>---
> >>  package/qt/Config.in |    3 +++
> >>  1 files changed, 3 insertions(+), 0 deletions(-)
> >>
> >>diff --git a/package/qt/Config.in b/package/qt/Config.in
> >>index da159b4..8c0fe54 100644
> >>--- a/package/qt/Config.in
> >>+++ b/package/qt/Config.in
> >>@@ -371,6 +371,9 @@ config BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
> >>
> >>  config BR2_PACKAGE_QT_WEBKIT
> >>  	bool "WebKit Module"
> >>+	# qt-4.8.6 webkit: fails to compile on MIPS64 n32 platforms
> >>+	# https://bugreports.qt-project.org/browse/QTBUG-39224
> >>+	depends on !BR2_MIPS_NABI32
> >
> >Please update the dependencies of the comment below accordingly.
> >
> >baruch
> >
> >>  	depends on BR2_PACKAGE_QT_SHARED
> >>  	depends on BR2_PACKAGE_QT_GUI_MODULE
> >>  	depends on BR2_PACKAGE_QT_NETWORK
> 
> Are you sure this is necessary? I thought that was needed only for toolchain
> dependencies.
> 
> For instance, there are packages which depend on !BR2_MIPS_NABI32 and they
> don't have a comment for that:
> 
> ecryptfs-utils/Config.in
> tinymembench/Config.in

You don't need the comment text to refer to architecture dependencies, since 
the user can't do much about them. But you do need to not show the comment 
when not applicable for the same reason. Note that the comment already depends 
on BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT for this reason.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
