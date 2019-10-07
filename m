From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 7 Oct 2019 23:18:13 +0200
Subject: [Buildroot] glmark2 build failure
In-Reply-To: <20191007173640.5ec12ff1@windsurf>
References: <CAOMZO5BC0CyEpPyJxeXWYf8ZqY+K10tEQw2W5nJZ2S9viM0e4g@mail.gmail.com>
 <20191007173640.5ec12ff1@windsurf>
Message-ID: <da681b17-24d0-0a70-a584-60fce0d4bdf1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07/10/2019 17:36, Thomas Petazzoni wrote:
> Hello,
> 
> +Bernd in Cc.
> 
> On Mon, 7 Oct 2019 11:01:12 -0300
> Fabio Estevam <festevam@gmail.com> wrote:
> 
>> --prefix=/usr --libdir=/usr/lib --prefix=/usr --with-flavors=
> 
> --with-flavors is empty
> 
> I guess it's a fallout of cf66a67112cd706d2e71665e45e8f6453fd53963. Do
> you have udev enabled in your configuration ? If not that's the
> culprit. But it also means that
> cf66a67112cd706d2e71665e45e8f6453fd53963 was in fact not sufficient,
> and some additional dependencies need to be added in the Config.in file
> to prevent the package from being selected in configuration where no
> glmark2 flavor will be available.

 That logic could be simplified a lot IMO if it were moved to Config.in:


config BR2_PACKAGE_GLMARK2_FLAVOR_ANY
	bool

config BR2_PACKAGE_GLMARK2_FLAVOR_X11_GLESV2
	bool
	default y
	depends on BR2_PACKAGE_XLIB_LIBX11
	depends on BR2_PACKAGE_HAS_LIBEGL
	depends on BR2_PACKAGE_HAS_LIBGLES
	select BR2_PACKAGE_GLMARK2_FLAVOR_ANY

...


And in glmark2.mk:

GLMARK2_FLAVORS = \
	$(if $(BR2_PACKAGE_GLMARK2_FLAVOR_X11_GLESV2),x11-glesv2) \
	...



 Regards,
 Arnout
