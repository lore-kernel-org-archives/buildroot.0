From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 30 Jul 2007 22:11:07 +0200
Subject: [Buildroot] --includedir=/usr/include
	vs	--includedir=(STAGING_DIR)/usr/include
In-Reply-To: <0707302148220.17391@somehost>
References: <0707302043450.17391@somehost>
	<20070730190231.GA5834@real.realitydiluted.com>
	<0707302103451.17391@somehost> <20070730193608.GB27993@aon.at>
	<0707302148220.17391@somehost>
Message-ID: <20070730201107.GD29064@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 30, 2007 at 09:52:51PM +0200, Cristian Ionescu-Idbohrn wrote:
>On Mon, 30 Jul 2007, Bernhard Fischer wrote:
>
>> >  --includedir=/usr/include vs --includedir=$(STAGING_DIR)/usr/include
>> >                                            ^^^^^^^^^^^^^^
>>
>> depending on the package --prefix=$(STAGING_DIR)/usr is enough
>  ^^^^^^^^^
>
>Could you please be more verbose? How does one identify which is which?

packages that use autoconf usually have:

Installation directories:
  --prefix=PREFIX         install architecture-independent files in
PREFIX
                          [/usr/local]

Fine tuning of the installation directories:
  --bindir=DIR           user executables [EPREFIX/bin]
  --sbindir=DIR          system admin executables [EPREFIX/sbin]
  --libexecdir=DIR       program executables [EPREFIX/libexec]
  --datadir=DIR          read-only architecture-independent data
[PREFIX/share]
  --sysconfdir=DIR       read-only single-machine data [PREFIX/etc]
  --sharedstatedir=DIR   modifiable architecture-independent data
[PREFIX/com]
  --localstatedir=DIR    modifiable single-machine data [PREFIX/var]
  --libdir=DIR           object code libraries [EPREFIX/lib]
  --includedir=DIR       C header files [PREFIX/include]
  --oldincludedir=DIR    C header files for non-gcc [/usr/include]
  --infodir=DIR          info documentation [PREFIX/info]
  --mandir=DIR           man documentation [PREFIX/man]


So, for packages that actually install to and use config files from
sysconfdir, these should live in $(TARGET_DIR)/etc (resp
$(STAGING_DIR)/etc) and not in $(TARGET_DIR)/usr/etc


libpcap, for example can be configured with
--prefix=/usr
and installed with
$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBPCAP_DIR) install
(assuming that it doesn't install anything into /etc).

See?

PS: Of course there is DESTDIR vs. PREFIX. Look at the respective
Makefile{.am,.in,}
