From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jan 2014 22:07:22 +0100
Subject: [Buildroot] [PATCH 2/2] Update MySQL client package
In-Reply-To: <20140119115124.GA3387@free.fr>
References: <CA+kK6Wt+nNbrUuOp1Ymq0KzRZfG5CAZQAa+9KK6w=S0mV+D16Q@mail.gmail.com>
 <20140119115124.GA3387@free.fr>
Message-ID: <20140130220722.142e4aa1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 19 Jan 2014 12:51:24 +0100, Yann E. MORIN wrote:

> >         depends on BR2_USE_MMU
> >         depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
> > +
> > +if BR2_PACKAGE_MYSQL
> > +
> > +config BR2_PACKAGE_MYSQL_CLIENT
> > +        bool "MySQL client"
> > +
> > +config BR2_PACKAGE_MYSQL_CLIENT_SERVER
> > +       bool "MySQL server"
> > +
> > +endif
> 
> What if neither the client nor the server is selected? Does that make
> sense? If not, then always build the client (as we currently do), and
> make the server an option (as you did in your previous patch).

I would suggest:

config BR2_PACKAGE_MYSQL
	bool "mysql"
	select BR2_PACKAGE_MYSQL_CLIENT if !BR2_PACKAGE_MYSQL_SERVER

if BR2_PACKAGE_MYSQL

config BR2_PACKAGE_MYSQL_CLIENT
	bool "client"

config BR2_PACKAGE_MYSQL_SERVER
	bool "server"

endif

This way, we guarantee that at least either the client or the server
are enabled.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
