From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 2 Mar 2017 18:39:45 +0100
Subject: [Buildroot] [PATCH 0/5] package/cmake: re-introduce cmake-3.7
In-Reply-To: <20170302094107.0f66f2c0@free-electrons.com>
References: <cover.1488305206.git.yann.morin.1998@free.fr>
 <20170301221413.6cb8f56d@free-electrons.com>
 <20170302094107.0f66f2c0@free-electrons.com>
Message-ID: <20170302173945.GB3637@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-03-02 09:41 +0100, Thomas Petazzoni spake thusly:
> On Wed, 1 Mar 2017 22:14:13 +0100, Thomas Petazzoni wrote:
> 
> > > Thomas Petazzoni (1):
> > >       cmake: adjust dependencies added for libuv
> > > 
> > > Vicente Olivert Riera (3):
> > >       cmake: bump version to 3.7.0
> > >       cmake: bump version to 3.7.1
> > >       cmake: bump version to 3.7.2
> > > 
> > > Yann E. MORIN (1):
> > >       core/pkg-cmake: provide our own platform description  
> > 
> > All applied to master. Thanks!
> 
> Well, it seems like this introduced some issues.
> 
> Look for example at:
> 
>   http://autobuild.buildroot.net/?reason=paho-mqtt-c-v1.1.0

This package is wrong: it checks the system type to decide whether it
should link with -ldld or not:

    https://github.com/eclipse/paho.mqtt.c/blob/master/src/CMakeLists.txt#L50

This is stupid.

Instead, it should check if the lib is needed or not, and available or
mot, like any other lib, and then decide to fail or deactivate features.

> The fastd problems could also be related, but I haven't checked, see
> http://autobuild.buildroot.net/?reason=fastd-18.

Similarly broken:

    https://git.universe-factory.net/fastd/tree/cmake/config.cmake#n1
    https://git.universe-factory.net/fastd/tree/cmake/config.cmake#n14


I'll try a hack on it, by adding:

    # Impersonate the Linux system, which we really are in fact...
    set(CMAKE_SYSTEM_NAME Linux)

in Buildroot.cmake and see if that fixes the build....

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
