From: Marcus Hoffmann <m.hoffmann@cartelsol.com>
Date: Fri, 24 Mar 2017 02:02:59 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-03-22
In-Reply-To: <20170323072835.30CE220F42@mail.free-electrons.com>
References: <20170323072835.30CE220F42@mail.free-electrons.com>
Message-ID: <d1327c7c-2434-1635-357a-627bb9f08a71@cartelsol.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On 03/23/2017 08:28 AM, Thomas Petazzoni wrote:
>          arm |                      php-7.1.3 | NOK | http://autobuild.buildroot.net/results/616eacf5cd5a570ea2b8bba60dc42b109eaf8ed9 | ORPH

I looked at this one. When checking for SQLBindCol in -lodbc it fails
because ltdl is apparently not linked.

This happens when we have BR2_STATIC_LIBS=y *and* we build with libtool.
Enabling libtool switches off the internal libtld of unixodbc.

So with the internal version of libtld the build works. But this is a
helper library for loading dynamic libraries, so umm, can this ever work?

The build failure ss reproduceable with the following defconfig:

BR2_STATIC_LIBS=y
BR2_PACKAGE_LIBTOOL=y
BR2_PACKAGE_PHP=y
BR2_PACKAGE_PHP_EXT_PDO=y
BR2_PACKAGE_PHP_EXT_PDO_UNIXODBC=y

Best wishes,
Marcus
