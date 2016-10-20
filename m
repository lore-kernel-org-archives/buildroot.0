From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 20 Oct 2016 18:15:31 +0200
Subject: [Buildroot] [PATCH 3/3] wireshark: needs the qt5tools lrelease
 utility
In-Reply-To: <20161019220635.yorzdmcvd2qyfpki@tarshish>
References: <a6f0bcffe24a338538c4da2f04091967593fa058.1476789992.git.baruch@tkos.co.il>
 <1b772d44273db8f887bbb378e5dd59053a328c3d.1476789992.git.baruch@tkos.co.il>
 <20161019232003.4841be63@free-electrons.com>
 <20161019220635.yorzdmcvd2qyfpki@tarshish>
Message-ID: <20161020161531.GA3720@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2016-10-20 01:06 +0300, Baruch Siach spake thusly:
> On Wed, Oct 19, 2016 at 11:20:03PM +0200, Thomas Petazzoni wrote:
> > On Tue, 18 Oct 2016 14:26:32 +0300, Baruch Siach wrote:
> > > Fixes:
> > > http://autobuild.buildroot.net/results/0a4/0a4ccf752ed1e81e2416d33a78984b47087f68bd/
> > > http://autobuild.buildroot.net/results/196/196b96e28a2cd5983a58948df4a2c3eb3bccdfa4/
> > > http://autobuild.buildroot.net/results/056/056b3299ce45552fe3e7cbf5aa68b223f8fa458e/
> > > 
> > > Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> > > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > 
> > This patch causes a recursive Kconfig dependency:
> > 
> > package/qt5/qt5base/Config.in:118:error: recursive dependency detected!
> > package/qt5/qt5base/Config.in:118:	symbol BR2_PACKAGE_QT5BASE_GUI is selected by BR2_PACKAGE_QT5TOOLS_PIXELTOOL
> > package/qt5/qt5tools/Config.in:19:	symbol BR2_PACKAGE_QT5TOOLS_PIXELTOOL depends on BR2_PACKAGE_QT5TOOLS
> > package/qt5/qt5tools/Config.in:1:	symbol BR2_PACKAGE_QT5TOOLS is selected by BR2_PACKAGE_QT5BASE_WIDGETS
> > package/qt5/qt5base/Config.in:131:	symbol BR2_PACKAGE_QT5BASE_WIDGETS is selected by BR2_PACKAGE_QT5X11EXTRAS
> > package/qt5/qt5x11extras/Config.in:1:	symbol BR2_PACKAGE_QT5X11EXTRAS depends on BR2_PACKAGE_QT5BASE_XCB
> > package/qt5/qt5base/Config.in:186:	symbol BR2_PACKAGE_QT5BASE_XCB depends on BR2_PACKAGE_QT5BASE_GUI
> 
> I actually saw this during testing, but it was not apparent to me that the 
> wireshark Config.in change is the trigger. Not sure what is the correct 
> solution here. Maybe remove the Config.in change, and do instead:
> 
> ifeq ($(BR2_PACKAGE_QT5BASE_WIDGETS)$(BR2_PACKAGE_QT5TOOLS),yy)
> WIRESHARK_CONF_OPTS += --with-qt=5
> ...
> else
> WIRESHARK_CONF_OPTS += --with-qt=no
> endif

That's what we discussed with Thomas yesterday on IRC. That is an easy
and simple solution, while fixing the kconfig-level dependencies is not
trivial.

> That will make the detection of no GUI below harder.

Then you can do:

    ifeq ($(BR2_PACKAGE_QT5BASE_WIDGETS)$(BR2_PACKAGE_QT5TOOLS),yy)
    WIRESHARK_QT_GUI = y
    WIRESHARK_CONF_OPTS += --with-qt=5
    ...
    else
    WIRESHARK_CONF_OPTS += --with-qt=no
    fi

    ifeq ($(BR2_PACKAGE_LIBGTK2)$(BR2_PACKAGE_LIBGTK3)$(WIRESHARK_QT_GUI),)
    ...
    endif

But then, we could do all that in Kconfig still:

    config BR2_PACKAGE_WIRESHARK_QT
        bool
        default y
        depends on BR2_PACKAGE_QT5BASE_WIDGETS
        depends on BR2_PACKAGE_QT5TOOLS
        depends on BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS

    config BR2_PACKAGE_WIRESHARK_GUI
        bool
        default y if BR2_PACKAGE_LIBGTK2
        default y if BR2_PACKAGE_LIBGTK3
        default y if BR2_PACKAGE_WIRESHARK_QT

And then re-use that in the .mk file:

    ifeq ($(BR2_PACKAGE_WIRESHARK_QT),y)
    WIRESHARK_CONF_OPTS += --with-qt=5
    ...
    else
    WIRESHARK_CONF_OPTS += --with-qt=no
    endif

    ifeq ($(BR2_PACKAGE_WIRESHARK_GUI),)
    WIRESHARK_CONF_OPTS += --disable-wireshark
    endif

I would prefer that last solution, if at all possible. I'll send a patch
to that effect shortly.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
