From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 20 Oct 2016 01:06:35 +0300
Subject: [Buildroot] [PATCH 3/3] wireshark: needs the qt5tools lrelease
 utility
In-Reply-To: <20161019232003.4841be63@free-electrons.com>
References: <a6f0bcffe24a338538c4da2f04091967593fa058.1476789992.git.baruch@tkos.co.il>
 <1b772d44273db8f887bbb378e5dd59053a328c3d.1476789992.git.baruch@tkos.co.il>
 <20161019232003.4841be63@free-electrons.com>
Message-ID: <20161019220635.yorzdmcvd2qyfpki@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Oct 19, 2016 at 11:20:03PM +0200, Thomas Petazzoni wrote:
> On Tue, 18 Oct 2016 14:26:32 +0300, Baruch Siach wrote:
> > Fixes:
> > http://autobuild.buildroot.net/results/0a4/0a4ccf752ed1e81e2416d33a78984b47087f68bd/
> > http://autobuild.buildroot.net/results/196/196b96e28a2cd5983a58948df4a2c3eb3bccdfa4/
> > http://autobuild.buildroot.net/results/056/056b3299ce45552fe3e7cbf5aa68b223f8fa458e/
> > 
> > Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> 
> This patch causes a recursive Kconfig dependency:
> 
> package/qt5/qt5base/Config.in:118:error: recursive dependency detected!
> package/qt5/qt5base/Config.in:118:	symbol BR2_PACKAGE_QT5BASE_GUI is selected by BR2_PACKAGE_QT5TOOLS_PIXELTOOL
> package/qt5/qt5tools/Config.in:19:	symbol BR2_PACKAGE_QT5TOOLS_PIXELTOOL depends on BR2_PACKAGE_QT5TOOLS
> package/qt5/qt5tools/Config.in:1:	symbol BR2_PACKAGE_QT5TOOLS is selected by BR2_PACKAGE_QT5BASE_WIDGETS
> package/qt5/qt5base/Config.in:131:	symbol BR2_PACKAGE_QT5BASE_WIDGETS is selected by BR2_PACKAGE_QT5X11EXTRAS
> package/qt5/qt5x11extras/Config.in:1:	symbol BR2_PACKAGE_QT5X11EXTRAS depends on BR2_PACKAGE_QT5BASE_XCB
> package/qt5/qt5base/Config.in:186:	symbol BR2_PACKAGE_QT5BASE_XCB depends on BR2_PACKAGE_QT5BASE_GUI

I actually saw this during testing, but it was not apparent to me that the 
wireshark Config.in change is the trigger. Not sure what is the correct 
solution here. Maybe remove the Config.in change, and do instead:

ifeq ($(BR2_PACKAGE_QT5BASE_WIDGETS)$(BR2_PACKAGE_QT5TOOLS),yy)
WIRESHARK_CONF_OPTS += --with-qt=5
...
else
WIRESHARK_CONF_OPTS += --with-qt=no
endif

That will make the detection of no GUI below harder.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
