From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 20 Oct 2016 20:28:55 +0200
Subject: [Buildroot] [PATCH RFC] package/wireshark: fix kconfig
	depndencies
In-Reply-To: <20161020175554.okl6cbxvpzos3m2k@tarshish>
References: <1476980905-3997-1-git-send-email-yann.morin.1998@free.fr>
 <20161020175554.okl6cbxvpzos3m2k@tarshish>
Message-ID: <20161020182855.GB3720@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2016-10-20 20:55 +0300, Baruch Siach spake thusly:
> On Thu, Oct 20, 2016 at 06:28:25PM +0200, Yann E. MORIN wrote:
> > Commit fa6feff (wireshark: needs the qt5tools lrelease utility)
> > introduced a circular dependency chain in Kconfig:
> > 
> >     package/qt5/qt5base/Config.in:118:error: recursive dependency detected!
> >     package/qt5/qt5base/Config.in:118:      symbol BR2_PACKAGE_QT5BASE_GUI is selected by BR2_PACKAGE_QT5TOOLS_PIXELTOOL
> >     package/qt5/qt5tools/Config.in:19:      symbol BR2_PACKAGE_QT5TOOLS_PIXELTOOL depends on BR2_PACKAGE_QT5TOOLS
> >     package/qt5/qt5tools/Config.in:1:       symbol BR2_PACKAGE_QT5TOOLS is selected by BR2_PACKAGE_QT5BASE_WIDGETS
> >     package/qt5/qt5base/Config.in:131:      symbol BR2_PACKAGE_QT5BASE_WIDGETS is selected by BR2_PACKAGE_QT5X11EXTRAS
> >     package/qt5/qt5x11extras/Config.in:1:   symbol BR2_PACKAGE_QT5X11EXTRAS depends on BR2_PACKAGE_QT5BASE_XCB
> >     package/qt5/qt5base/Config.in:186:      symbol BR2_PACKAGE_QT5BASE_XCB depends on BR2_PACKAGE_QT5BASE_GUI
> > 
> > Fix that by dropping the select on the Qt5Tools, and introduce an
> > intermediate kconfig-level variable to represent the new condition, to
> > simplify the .mk file.
> > 
> > That would make the condition for enabling/disabling the GUI to be a
> > little bit more complex by adding yet another (long-ish) variable.
> > 
> > So we also introduce an intermediate kconfig-level variable that
> > represent the condition to enable the GUI.
> > 
> > Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: Baruch Siach <baruch@tkos.co.il>
> > 
> > ---
> > Note: UNTESTED. It does fix the Kconfig issue, but it is otherwise not
> > even build-tested. Baruch? ;-)
> 
> Thanks for your analysis and patch.
> 
> I build tested one of the defconfigs that commit fa6feffa0def mentions. Then 
> selected BR2_PACKAGE_QT5TOOLS manually, and built wireshark again. In both 
> cases build succeeds after applying another (unrelated) patch[1]. So:
> 
> Tested-by: Baruch Siach <baruch@tkos.co.il>

Thanks for testing! :-)

My build eventually finished successfully here too, with just the
strictly minimum to enable wireshark and GUI stuff:

    BR2_arm=y
    BR2_cortex_a7=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_INIT_NONE=y
    BR2_SYSTEM_BIN_SH_NONE=y
    # BR2_PACKAGE_BUSYBOX is not set
    BR2_PACKAGE_QT5=y
    BR2_PACKAGE_QT5BASE_LICENSE_APPROVED=y
    BR2_PACKAGE_QT5BASE_GUI=y
    BR2_PACKAGE_QT5BASE_WIDGETS=y
    BR2_PACKAGE_QT5TOOLS=y
    BR2_PACKAGE_WIRESHARK=y

Then wiresharkd reports:

    The Wireshark package has been configured with the following options:
    GLib version : v2.50.1
    Build wireshark : yes (with Qt5 v5.6.2)
    Build wireshark-gtk : no
    Build tshark : yes
    Build tfshark : no
    Build capinfos : yes
    Build captype : yes
    Build editcap : yes
    Build dumpcap : yes
    Build mergecap : yes
    Build reordercap : yes
    Build text2pcap : yes
    Build randpkt : yes
    Build dftest : yes
    Build rawshark : yes
    Build androiddump : yes
    Build sshdump : no
    Build ciscodump : no
    Build randpktdump : yes
    Build echld : no

    Save files as pcap-ng by default : yes
    Install dumpcap with capabilities : no
    Install dumpcap setuid : no
    Use dumpcap group : (none)
    Use plugins : yes
    Use external capture sources : yes
    Use Lua library : no
    Build Qt RTP player : no
    Build GTK+ RTP player : no
    Build profile binaries : no
    Use pcap library : yes
    Use zlib library : yes
    Use kerberos library : no
    Use c-ares library : no (name resolution will be disabled)
    Use SMI MIB library : no
    Use GNU gcrypt library : no
    Use SSL crypto library : no
    Use GnuTLS library : no
    Use POSIX capabilities library : no
    Use GeoIP library : no
    Use libssh library : no
    Have ssh_userauth_agent : no
    Use nl library : no
    Use SBC codec library : no

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
