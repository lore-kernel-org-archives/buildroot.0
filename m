From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 03 May 2015 12:39:14 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150503105009.2b42c375@free-electrons.com>
References: <20150502063016.3950D100FB0@stock.ovh.net>
 <20150503105009.2b42c375@free-electrons.com>
Message-ID: <5545FAD2.3050409@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,all

Le 03/05/2015 10:50, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Sat,  2 May 2015 08:30:16 +0200 (CEST), Thomas Petazzoni wrote:
>>      powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/df8f87a34f59f81aa288c72673a80757f00ea6a2/
> 
> Weird C++ issue.

This issue appears since boost-log has been added (BR2_PACKAGE_BOOST_LOG=y).
May be an issue specific to uClibc 0.9.33 ?
Needs to test with uClibc-snapshot and uClibc-ng.

> 
>>          arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/d44753dfe7e2aaa9fd803b4a69db65728f8301a8/
>>          arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/ac3391023b13f405ef633688f714a10c22dc2db2/
> 
> The dynamic linking issue.

There is two proposal to fixes this issue:
http://patchwork.ozlabs.org/patch/460494/
http://patchwork.ozlabs.org/patch/449686/

Also, it's not a issue specific to the arc toolchain:
http://autobuild.buildroot.net/results/deb/deb284ccaeac9c2de409adccf41ee888577621b7/

> 
>>         i686 |                 numactl-2.0.10 | NOK | http://autobuild.buildroot.net/results/619339810617212a667fe72278ec727ee992ffbf/
> 
> Don't know:
> 
> checking for thread local storage (TLS) class... __thread
> ./configure: line 12681: syntax error near unexpected token `fi'
> ./configure: line 12681: `fi'

Weird because this package is autoreconfed... but wait.
If you look to the build-time.log, you'll see that host-autoconf-archive has
been installed before numactl.
host-autoconf-archive can suppressed several m4 macro bundled with a package.
Needs to test with and without host-autoconf-archive.

Best regards,
Romain
