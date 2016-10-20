From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Oct 2016 21:40:44 +0200
Subject: [Buildroot] [PATCH RFC] package/wireshark: fix kconfig
 depndencies
In-Reply-To: <1476980905-3997-1-git-send-email-yann.morin.1998@free.fr>
References: <1476980905-3997-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20161020214044.51087b22@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 20 Oct 2016 18:28:25 +0200, Yann E. MORIN wrote:
> Commit fa6feff (wireshark: needs the qt5tools lrelease utility)
> introduced a circular dependency chain in Kconfig:
> 
>     package/qt5/qt5base/Config.in:118:error: recursive dependency detected!
>     package/qt5/qt5base/Config.in:118:      symbol BR2_PACKAGE_QT5BASE_GUI is selected by BR2_PACKAGE_QT5TOOLS_PIXELTOOL
>     package/qt5/qt5tools/Config.in:19:      symbol BR2_PACKAGE_QT5TOOLS_PIXELTOOL depends on BR2_PACKAGE_QT5TOOLS
>     package/qt5/qt5tools/Config.in:1:       symbol BR2_PACKAGE_QT5TOOLS is selected by BR2_PACKAGE_QT5BASE_WIDGETS
>     package/qt5/qt5base/Config.in:131:      symbol BR2_PACKAGE_QT5BASE_WIDGETS is selected by BR2_PACKAGE_QT5X11EXTRAS
>     package/qt5/qt5x11extras/Config.in:1:   symbol BR2_PACKAGE_QT5X11EXTRAS depends on BR2_PACKAGE_QT5BASE_XCB
>     package/qt5/qt5base/Config.in:186:      symbol BR2_PACKAGE_QT5BASE_XCB depends on BR2_PACKAGE_QT5BASE_GUI
> 
> Fix that by dropping the select on the Qt5Tools, and introduce an
> intermediate kconfig-level variable to represent the new condition, to
> simplify the .mk file.
> 
> That would make the condition for enabling/disabling the GUI to be a
> little bit more complex by adding yet another (long-ish) variable.
> 
> So we also introduce an intermediate kconfig-level variable that
> represent the condition to enable the GUI.
> 
> Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Baruch Siach <baruch@tkos.co.il>
> 
> ---
> Note: UNTESTED. It does fix the Kconfig issue, but it is otherwise not
> even build-tested. Baruch? ;-)
> ---
>  package/wireshark/Config.in    | 15 +++++++++++++--
>  package/wireshark/wireshark.mk |  4 ++--
>  2 files changed, 15 insertions(+), 4 deletions(-)

Applied to master, after fixing the typo in the commit title. Thanks a
lot for looking into this issue!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
