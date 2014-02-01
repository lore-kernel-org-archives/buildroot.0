From: Marcelo Gutierrez <kuyurix@gmail.com>
Date: Sat, 1 Feb 2014 21:02:43 -0200
Subject: [Buildroot] [PATCH 2/2] Update MySQL client package
In-Reply-To: <20140130220722.142e4aa1@skate>
References: <CA+kK6Wt+nNbrUuOp1Ymq0KzRZfG5CAZQAa+9KK6w=S0mV+D16Q@mail.gmail.com>
 <20140119115124.GA3387@free.fr> <20140130220722.142e4aa1@skate>
Message-ID: <CA+kK6WsY9=VWC_hQuifT2ZnBXdaO=cvGUx1gwwFvtrT3u-ZvHA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all

This is the new Config.in file:

config BR2_PACKAGE_MYSQL
        bool "mysql"
        depends on BR2_INSTALL_LIBSTDCPP
        depends on BR2_USE_MMU # fork()
        depends on BR2_TOOLCHAIN_HAS_THREADS
        select BR2_PACKAGE_MYSQL_CLIENT  if !BR2_PACKAGE_MYSQL_SERVER
        select BR2_PACKAGE_NCURSES
        select BR2_PACKAGE_READLINE
        help
          The MySQL Open Source Database System

          http://www.mysql.com/

comment "MySQL needs a toolchain w/ C++, threads"
        depends on BR2_USE_MMU
        depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS


if BR2_PACKAGE_MYSQL_CLIENT

config BR2_PACKAGE_MYSQL_CLIENT
       bool "client"
       help
          Install the MySQL client on the target.

config BR2_PACKAGE_MYSQL_SERVER
        bool "server"
        help
          Install the MySQL server on the target.

endif


But I'm getting this issue:

$ make menuconfig
package/mysql/Config.in:1:error: recursive dependency detected!
package/mysql/Config.in:1:      symbol BR2_PACKAGE_MYSQL is selected
by BR2_PACKAGE_MYSQL_CLIENT
package/mysql/Config.in:21:     symbol BR2_PACKAGE_MYSQL_CLIENT is
selected by BR2_PACKAGE_MYSQL

Best,
Marcelo


2014-01-30 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Dear Yann E. MORIN,
>
> On Sun, 19 Jan 2014 12:51:24 +0100, Yann E. MORIN wrote:
>
>> >         depends on BR2_USE_MMU
>> >         depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
>> > +
>> > +if BR2_PACKAGE_MYSQL
>> > +
>> > +config BR2_PACKAGE_MYSQL_CLIENT
>> > +        bool "MySQL client"
>> > +
>> > +config BR2_PACKAGE_MYSQL_CLIENT_SERVER
>> > +       bool "MySQL server"
>> > +
>> > +endif
>>
>> What if neither the client nor the server is selected? Does that make
>> sense? If not, then always build the client (as we currently do), and
>> make the server an option (as you did in your previous patch).
>
> I would suggest:
>
> config BR2_PACKAGE_MYSQL
>         bool "mysql"
>         select BR2_PACKAGE_MYSQL_CLIENT if !BR2_PACKAGE_MYSQL_SERVER
>
> if BR2_PACKAGE_MYSQL
>
> config BR2_PACKAGE_MYSQL_CLIENT
>         bool "client"
>
> config BR2_PACKAGE_MYSQL_SERVER
>         bool "server"
>
> endif
>
> This way, we guarantee that at least either the client or the server
> are enabled.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
